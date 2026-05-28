<?php
namespace Cart;
class Cart {
	private $data = array();

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->session = $registry->get('session');
		$this->db = $registry->get('db');
		$this->tax = $registry->get('tax');
		$this->weight = $registry->get('weight');

		// Remove all the expired carts with no customer ID
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE (api_id > '0' OR customer_id = '0') AND date_added < DATE_SUB(NOW(), INTERVAL 1 HOUR)");

		if ($this->customer->getId()) {
			// We want to change the session ID on all the old items in the customers cart
			$this->db->query("UPDATE " . DB_PREFIX . "cart SET session_id = '" . $this->db->escape($this->session->getId()) . "' WHERE api_id = '0' AND customer_id = '" . (int)$this->customer->getId() . "'");

			// Once the customer is logged in we want to update the customers cart
			$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE api_id = '0' AND customer_id = '0' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

			foreach ($cart_query->rows as $cart) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart['cart_id'] . "'");

				// The advantage of using $this->add is that it will check if the products already exist and increaser the quantity if necessary.
				$this->add($cart['product_id'], $cart['quantity'], json_decode($cart['option']), $cart['recurring_id'], $cart['shipping_price'], $cart['shipping_info'], $cart['addon'], $cart['addon_pro']);
			}
		}
	}

	public function getProducts() {
		if ($this->data) {
			return $this->data;
		}

		$product_data = array();

		$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

		if (!$cart_query->rows) {
			$this->data = $product_data;
			return $this->data;
		}

		// --- Pass 1: filter expired items and collect valid carts ---
		$valid_carts = array();
		date_default_timezone_set('Asia/Kolkata');
		$today = date("Y-m-d H:i:s");

		foreach ($cart_query->rows as $cart) {
			$shipInfo = json_decode($cart['shipping_info'], true);
			if (isset($shipInfo['product_expiry_time']) && !empty($shipInfo['product_expiry_time'])) {
				if ($today > $shipInfo['product_expiry_time']) {
					$this->remove($cart['cart_id']);
					continue;
				}
			}
			if ($cart['quantity'] > 0) {
				$valid_carts[] = $cart;
			}
		}

		if (empty($valid_carts)) {
			$this->data = $product_data;
			return $this->data;
		}

		// --- Collect unique product IDs ---
		$product_ids = array_unique(array_map('intval', array_column($valid_carts, 'product_id')));
		$ids_str = implode(',', $product_ids);

		// --- Batch query: product info ---
		$products_map = array();
		$products_batch = $this->db->query("SELECT p.*, pd.name FROM " . DB_PREFIX . "product_to_store p2s LEFT JOIN " . DB_PREFIX . "product p ON (p2s.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p2s.product_id IN (" . $ids_str . ") AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");
		foreach ($products_batch->rows as $row) {
			$products_map[$row['product_id']] = $row;
		}

		// --- Batch query: product specials ---
		$specials_map = array();
		$specials_batch = $this->db->query("SELECT product_id, price FROM " . DB_PREFIX . "product_special WHERE product_id IN (" . $ids_str . ") AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC");
		foreach ($specials_batch->rows as $row) {
			if (!isset($specials_map[$row['product_id']])) {
				$specials_map[$row['product_id']] = $row['price'];
			}
		}

		// --- Batch query: product discounts (fetch all valid, apply per product qty in PHP) ---
		$discounts_map = array();
		$discounts_batch = $this->db->query("SELECT product_id, price, quantity FROM " . DB_PREFIX . "product_discount WHERE product_id IN (" . $ids_str . ") AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC");
		foreach ($discounts_batch->rows as $row) {
			if (!isset($discounts_map[$row['product_id']])) {
				$discounts_map[$row['product_id']] = array();
			}
			$discounts_map[$row['product_id']][] = $row;
		}

		// --- Compute discount quantities per product ---
		$discount_qty_map = array();
		foreach ($valid_carts as $cart) {
			$pid = $cart['product_id'];
			$discount_qty_map[$pid] = ($discount_qty_map[$pid] ?? 0) + $cart['quantity'];
		}

		// --- Batch query: product rewards ---
		$rewards_map = array();
		$rewards_batch = $this->db->query("SELECT product_id, points FROM " . DB_PREFIX . "product_reward WHERE product_id IN (" . $ids_str . ") AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");
		foreach ($rewards_batch->rows as $row) {
			$rewards_map[$row['product_id']] = $row['points'];
		}

		// --- Batch query: product downloads ---
		$downloads_map = array();
		$downloads_batch = $this->db->query("SELECT p2d.product_id, d.download_id, dd.name, d.filename, d.mask FROM " . DB_PREFIX . "product_to_download p2d LEFT JOIN " . DB_PREFIX . "download d ON (p2d.download_id = d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON (d.download_id = dd.download_id) WHERE p2d.product_id IN (" . $ids_str . ") AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		foreach ($downloads_batch->rows as $row) {
			$downloads_map[$row['product_id']][] = array(
				'download_id' => $row['download_id'],
				'name'        => $row['name'],
				'filename'    => $row['filename'],
				'mask'        => $row['mask']
			);
		}

		// --- Collect all product_option_ids across all cart items ---
		$all_option_ids = array();
		$all_option_value_ids = array();
		foreach ($valid_carts as $cart) {
			$decoded = json_decode($cart['option']);
			if (!$decoded) continue;
			foreach ($decoded as $product_option_id => $value) {
				$all_option_ids[] = (int)$product_option_id;
				if (is_array($value)) {
					foreach ($value as $v) {
						$all_option_value_ids[] = (int)$v;
					}
				} elseif (is_numeric($value)) {
					$all_option_value_ids[] = (int)$value;
				}
			}
		}
		$all_option_ids = array_unique($all_option_ids);
		$all_option_value_ids = array_unique($all_option_value_ids);

		// --- Batch query: option info ---
		$options_map = array();
		if (!empty($all_option_ids)) {
			$options_batch = $this->db->query("SELECT po.product_option_id, po.product_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id IN (" . implode(',', $all_option_ids) . ") AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
			foreach ($options_batch->rows as $row) {
				$options_map[$row['product_option_id']] = $row;
			}
		}

		// --- Batch query: option values ---
		$option_values_map = array();
		if (!empty($all_option_value_ids)) {
			$ov_batch = $this->db->query("SELECT pov.product_option_value_id, pov.product_option_id, pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id IN (" . implode(',', $all_option_value_ids) . ") AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
			foreach ($ov_batch->rows as $row) {
				$option_values_map[$row['product_option_value_id']] = $row;
			}
		}

		// --- Pass 2: build product data using batched results ---
		foreach ($valid_carts as $cart) {
			if (!isset($products_map[$cart['product_id']])) {
				$this->remove($cart['cart_id']);
				continue;
			}

			$product_row = $products_map[$cart['product_id']];
			$stock = true;

			// --- Process options ---
			$option_price  = 0;
			$option_points = 0;
			$option_weight = 0;
			$option_data   = array();

			$decoded_options = json_decode($cart['option']);
			if ($decoded_options) {
				foreach ($decoded_options as $product_option_id => $value) {
					if (!isset($options_map[$product_option_id])) continue;

					$option_row = $options_map[$product_option_id];

					if ($option_row['type'] == 'select' || $option_row['type'] == 'radio') {
						$pov_id = (int)$value;
						if (!isset($option_values_map[$pov_id])) continue;
						$ov_row = $option_values_map[$pov_id];

						if ($ov_row['price_prefix'] == '+') {
							$option_price += $ov_row['price'];
						} elseif ($ov_row['price_prefix'] == '-') {
							$option_price -= $ov_row['price'];
						}
						if ($ov_row['points_prefix'] == '+') {
							$option_points += $ov_row['points'];
						} elseif ($ov_row['points_prefix'] == '-') {
							$option_points -= $ov_row['points'];
						}
						if ($ov_row['weight_prefix'] == '+') {
							$option_weight += $ov_row['weight'];
						} elseif ($ov_row['weight_prefix'] == '-') {
							$option_weight -= $ov_row['weight'];
						}
						if ($ov_row['subtract'] && (!$ov_row['quantity'] || ($ov_row['quantity'] < $cart['quantity']))) {
							$stock = false;
						}
						$option_data[] = array(
							'product_option_id'       => $product_option_id,
							'product_option_value_id' => $pov_id,
							'option_id'               => $option_row['option_id'],
							'option_value_id'         => $ov_row['option_value_id'],
							'name'                    => $option_row['name'],
							'value'                   => $ov_row['name'],
							'type'                    => $option_row['type'],
							'quantity'                => $ov_row['quantity'],
							'subtract'                => $ov_row['subtract'],
							'price'                   => $ov_row['price'],
							'price_prefix'            => $ov_row['price_prefix'],
							'points'                  => $ov_row['points'],
							'points_prefix'           => $ov_row['points_prefix'],
							'weight'                  => $ov_row['weight'],
							'weight_prefix'           => $ov_row['weight_prefix']
						);

					} elseif ($option_row['type'] == 'checkbox' && is_array($value)) {
						foreach ($value as $product_option_value_id) {
							$pov_id = (int)$product_option_value_id;
							if (!isset($option_values_map[$pov_id])) continue;
							$ov_row = $option_values_map[$pov_id];

							if ($ov_row['price_prefix'] == '+') {
								$option_price += $ov_row['price'];
							} elseif ($ov_row['price_prefix'] == '-') {
								$option_price -= $ov_row['price'];
							}
							if ($ov_row['points_prefix'] == '+') {
								$option_points += $ov_row['points'];
							} elseif ($ov_row['points_prefix'] == '-') {
								$option_points -= $ov_row['points'];
							}
							if ($ov_row['weight_prefix'] == '+') {
								$option_weight += $ov_row['weight'];
							} elseif ($ov_row['weight_prefix'] == '-') {
								$option_weight -= $ov_row['weight'];
							}
							if ($ov_row['subtract'] && (!$ov_row['quantity'] || ($ov_row['quantity'] < $cart['quantity']))) {
								$stock = false;
							}
							$option_data[] = array(
								'product_option_id'       => $product_option_id,
								'product_option_value_id' => $pov_id,
								'option_id'               => $option_row['option_id'],
								'option_value_id'         => $ov_row['option_value_id'],
								'name'                    => $option_row['name'],
								'value'                   => $ov_row['name'],
								'type'                    => $option_row['type'],
								'quantity'                => $ov_row['quantity'],
								'subtract'                => $ov_row['subtract'],
								'price'                   => $ov_row['price'],
								'price_prefix'            => $ov_row['price_prefix'],
								'points'                  => $ov_row['points'],
								'points_prefix'           => $ov_row['points_prefix'],
								'weight'                  => $ov_row['weight'],
								'weight_prefix'           => $ov_row['weight_prefix']
							);
						}

					} elseif (in_array($option_row['type'], array('text', 'number', 'textarea', 'file', 'date', 'datetime', 'time'))) {
						$option_data[] = array(
							'product_option_id'       => $product_option_id,
							'product_option_value_id' => '',
							'option_id'               => $option_row['option_id'],
							'option_value_id'         => '',
							'name'                    => $option_row['name'],
							'value'                   => $value,
							'type'                    => $option_row['type'],
							'quantity'                => '',
							'subtract'                => '',
							'price'                   => '',
							'price_prefix'            => '',
							'points'                  => '',
							'points_prefix'           => '',
							'weight'                  => '',
							'weight_prefix'           => ''
						);
					}
				}
			}

			// --- Resolve price: discount → special → base ---
			$price = $product_row['price'];
			$pid   = $cart['product_id'];

			// Find best discount for this product's accumulated quantity
			if (isset($discounts_map[$pid])) {
				$qty = $discount_qty_map[$pid] ?? $cart['quantity'];
				foreach ($discounts_map[$pid] as $disc) {
					if ($disc['quantity'] <= $qty) {
						$price = $disc['price'];
						break;
					}
				}
			}

			if (isset($specials_map[$pid])) {
				$price = $specials_map[$pid];
			}

			// --- Reward points ---
			$reward = $rewards_map[$pid] ?? 0;

			// --- Downloads ---
			$download_data = $downloads_map[$pid] ?? array();

			// --- Stock check ---
			if (!$product_row['quantity'] || ($product_row['quantity'] < $cart['quantity'])) {
				$stock = false;
			}

			// --- Recurring (still per-item; recurring_id is unique per cart row) ---
			$recurring = false;
			if ($cart['recurring_id']) {
				$recurring_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring r LEFT JOIN " . DB_PREFIX . "product_recurring pr ON (r.recurring_id = pr.recurring_id) LEFT JOIN " . DB_PREFIX . "recurring_description rd ON (r.recurring_id = rd.recurring_id) WHERE r.recurring_id = '" . (int)$cart['recurring_id'] . "' AND pr.product_id = '" . (int)$pid . "' AND rd.language_id = " . (int)$this->config->get('config_language_id') . " AND r.status = 1 AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");
				if ($recurring_query->num_rows) {
					$recurring = array(
						'recurring_id'    => $cart['recurring_id'],
						'name'            => $recurring_query->row['name'],
						'frequency'       => $recurring_query->row['frequency'],
						'price'           => $recurring_query->row['price'],
						'cycle'           => $recurring_query->row['cycle'],
						'duration'        => $recurring_query->row['duration'],
						'trial'           => $recurring_query->row['trial_status'],
						'trial_frequency' => $recurring_query->row['trial_frequency'],
						'trial_price'     => $recurring_query->row['trial_price'],
						'trial_cycle'     => $recurring_query->row['trial_cycle'],
						'trial_duration'  => $recurring_query->row['trial_duration']
					);
				}
			}

			$product_data[] = array(
				'cart_id'         => $cart['cart_id'],
				'product_id'      => $product_row['product_id'],
				'name'            => $product_row['name'],
				'model'           => $product_row['model'],
				'shipping'        => $product_row['shipping'],
				'image'           => $product_row['image'],
				'option'          => $option_data,
				'download'        => $download_data,
				'quantity'        => $cart['quantity'],
				'minimum'         => $product_row['minimum'],
				'subtract'        => $product_row['subtract'],
				'stock'           => $stock,
				'price'           => ($price + $option_price + $cart['shipping_price']),
				'total'           => ($price + $option_price + $cart['shipping_price']) * $cart['quantity'],
				'reward'          => $reward * $cart['quantity'],
				'points'          => ($product_row['points'] ? ($product_row['points'] + $option_points) * $cart['quantity'] : 0),
				'tax_class_id'    => $product_row['tax_class_id'],
				'weight'          => ($product_row['weight'] + $option_weight) * $cart['quantity'],
				'weight_class_id' => $product_row['weight_class_id'],
				'length'          => $product_row['length'],
				'width'           => $product_row['width'],
				'height'          => $product_row['height'],
				'length_class_id' => $product_row['length_class_id'],
				'shipping_info'   => $cart['shipping_info'],
				'shipping_price'  => $cart['shipping_price'],
				'recurring'       => $recurring
			);
		}

		$this->data = $product_data;
		return $this->data;
	}

	public function add($product_id, $quantity = 1, $option = array(), $recurring_id = 0, $shippingPrice, $shipping_info, $addon, $mainPro) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "'");

		if (!$query->row['total']) {
			$this->db->query("INSERT " . DB_PREFIX . "cart SET api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "', customer_id = '" . (int)$this->customer->getId() . "', session_id = '" . $this->db->escape($this->session->getId()) . "', product_id = '" . (int)$product_id . "', shipping_price = '" . (int)$shippingPrice . "', shipping_info = '" . $shipping_info . "', addon = '" . $addon . "', addon_pro = '" . $mainPro . "', recurring_id = '" . (int)$recurring_id . "', `option` = '" . $this->db->escape(json_encode($option)) . "', quantity = '" . (int)$quantity . "', date_added = NOW()");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = (quantity + " . (int)$quantity . "), shipping_price = '" . (int)$shippingPrice . "', shipping_info = '" . $shipping_info . "', addon = '" . $addon . "', addon_pro = '" . $mainPro . "' WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "'");
		}

		$this->data = array();
	}

	public function update($cart_id, $quantity) {
		$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = '" . (int)$quantity . "' WHERE cart_id = '" . (int)$cart_id . "' AND api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

		$this->data = array();
	}

	public function remove($cart_id) {
		$rslt = $this->db->query("SELECT * FROM `oc_cart` WHERE cart_id = '".$cart_id."'");
		if(isset($rslt->row['addon']) && $rslt->row['addon'] ==  0){
			$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE addon_pro = '".$rslt->row['product_id']."' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
			$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart_id . "' AND api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
		} else {
			$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart_id . "' AND api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
		}

		foreach ($_SESSION['proData'] as $key => $val) {
			if($val['proId'] == $rslt->row['product_id']){
				unset($_SESSION['proData'][$key]);
			}
		}

		$this->data = array();
	}

	public function clear() {
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

		$this->data = array();
	}

	public function getRecurringProducts() {
		$product_data = array();

		foreach ($this->getProducts() as $value) {
			if ($value['recurring']) {
				$product_data[] = $value;
			}
		}

		return $product_data;
	}

	public function getWeight() {
		$weight = 0;

		foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
				$weight += $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('config_weight_class_id'));
			}
		}

		return $weight;
	}

	public function getSubTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $product['total'];
		}

		return $total;
	}

	public function getTaxes() {
		$tax_data = array();

		foreach ($this->getProducts() as $product) {
			if ($product['tax_class_id']) {
				$tax_rates = $this->tax->getRates($product['price'], $product['tax_class_id']);

				foreach ($tax_rates as $tax_rate) {
					if (!isset($tax_data[$tax_rate['tax_rate_id']])) {
						$tax_data[$tax_rate['tax_rate_id']] = ($tax_rate['amount'] * $product['quantity']);
					} else {
						$tax_data[$tax_rate['tax_rate_id']] += ($tax_rate['amount'] * $product['quantity']);
					}
				}
			}
		}

		return $tax_data;
	}

	public function getTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {

			$total += $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
		}

		return $total;
	}

	public function countProducts() {
		$product_total = 0;

		$products = $this->getProducts();

		foreach ($products as $product) {
			$product_total += $product['quantity'];
		}

		return $product_total;
	}

	public function hasProducts() {
		return count($this->getProducts());
	}

	public function hasRecurringProducts() {
		return count($this->getRecurringProducts());
	}

	public function hasStock() {
		foreach ($this->getProducts() as $product) {
			if (!$product['stock']) {
				return false;
			}
		}

		return true;
	}

	public function hasShipping() {
		foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
				return true;
			}
		}

		return false;
	}

	public function hasDownload() {
		foreach ($this->getProducts() as $product) {
			if ($product['download']) {
				return true;
			}
		}

		return false;
	}
}
