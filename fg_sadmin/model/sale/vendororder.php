<?php
class ModelSaleVendororder extends Model {
	public function deleteOrder($order_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_product` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_option` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_voucher` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_history` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE `or`, ort FROM `" . DB_PREFIX . "order_recurring` `or`, `" . DB_PREFIX . "order_recurring_transaction` `ort` WHERE order_id = '" . (int)$order_id . "' AND ort.order_recurring_id = `or`.order_recurring_id");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "affiliate_transaction` WHERE order_id = '" . (int)$order_id . "'");

		// Delete voucher data as well
		$this->db->query("DELETE FROM `" . DB_PREFIX . "voucher` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "voucher_history` WHERE order_id = '" . (int)$order_id . "'");
	}	

	public function addOrderHistory($order_id, $order_status_id, $comment = '', $notify = false, $override = false, $boy_id){
		if($order_status_id == 5){
			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '" . (int)$order_status_id . "', boy_id = '" . (int)$boy_id . "', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");
			$this->db->query("INSERT " . DB_PREFIX . "order_boy SET boy_id = '" . $boy_id . "', order_id = '" . (int)$order_id . "', created_by = '".$this->user->getId()."', created_at = NOW()");		
		} else {
			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '" . (int)$order_status_id . "', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" . (int)$order_id . "', order_status_id = '" . (int)$order_status_id . "', notify = '" . (int)$notify . "', created_by = '".$this->user->getId()."', comment = '" . $this->db->escape($comment) . "', date_added = NOW()");
	}

	public function addOrderDeliveryBoy($order_id, $comment, $boy_id){
		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET boy_id = '" . (int)$boy_id . "', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("INSERT " . DB_PREFIX . "order_boy SET boy_id = '" . $boy_id . "', order_id = '" . (int)$order_id . "', created_by = '".$this->user->getId()."', created_at = NOW()");
		$this->db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" . (int)$order_id . "', order_status_id = '6', notify = '1', created_by = '".$this->user->getId()."', comment = '" . $this->db->escape($comment) . "', date_added = NOW()");
	}
	
	public function getOrder($order_id) {
		$order_query = $this->db->query("SELECT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM " . DB_PREFIX . "customer c WHERE c.customer_id = o.customer_id) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS order_status FROM `" . DB_PREFIX . "order` o WHERE o.order_id = '" . (int)$order_id . "'");

		if ($order_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['payment_country_id'] . "'");

			if ($country_query->num_rows) {
				$payment_iso_code_2 = $country_query->row['iso_code_2'];
				$payment_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$payment_iso_code_2 = '';
				$payment_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['payment_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$payment_zone_code = $zone_query->row['code'];
			} else {
				$payment_zone_code = '';
			}

			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['shipping_country_id'] . "'");

			if ($country_query->num_rows) {
				$shipping_iso_code_2 = $country_query->row['iso_code_2'];
				$shipping_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$shipping_iso_code_2 = '';
				$shipping_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['shipping_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$shipping_zone_code = $zone_query->row['code'];
			} else {
				$shipping_zone_code = '';
			}

			$reward = 0;

			$order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

			foreach ($order_product_query->rows as $product) {
				$reward += $product['reward'];
			}
			
			if ($order_query->row['affiliate_id']) {
				$affiliate_id = $order_query->row['affiliate_id'];
			} else {
				$affiliate_id = 0;
			}

			$this->load->model('marketing/affiliate');

			$affiliate_info = $this->model_marketing_affiliate->getAffiliate($affiliate_id);

			if ($affiliate_info) {
				$affiliate_firstname = $affiliate_info['firstname'];
				$affiliate_lastname = $affiliate_info['lastname'];
			} else {
				$affiliate_firstname = '';
				$affiliate_lastname = '';
			}

			$this->load->model('localisation/language');

			$language_info = $this->model_localisation_language->getLanguage($order_query->row['language_id']);

			if ($language_info) {
				$language_code = $language_info['code'];
			} else {
				$language_code = $this->config->get('config_language');
			}

			$added_by['name'] = '';
			$added_by['email'] = '';
			if($order_query->row['added_by'] > 0){
				$by = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '" . $order_query->row['added_by'] . "'")->row;
				$added_by['name'] = $by['firstname'];
				$added_by['email'] = $by['email'];
				$added_by['phone'] = $by['lastname'];
			}

			return array(
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_id'                => $order_query->row['store_id'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],
				'customer_id'             => $order_query->row['customer_id'],
				'customer'                => $order_query->row['customer'],
				'customer_group_id'       => $order_query->row['customer_group_id'],
				'mr_mrs'          	      => $order_query->row['mr_mrs'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'email'                   => $order_query->row['email'],
				'telephone'               => $order_query->row['telephone'],
				'fax'                     => $order_query->row['fax'],
				'custom_field'            => json_decode($order_query->row['custom_field'], true),
				'payment_mr_mrs'  	      => $order_query->row['payment_mr_mrs'],
				'payment_firstname'       => $order_query->row['payment_firstname'],
				'payment_lastname'        => $order_query->row['payment_lastname'],
				'payment_email'       => $order_query->row['payment_email'],
				'payment_phone_code'       => $order_query->row['payment_phone_code'],
				'payment_mobile'       => $order_query->row['payment_mobile'],
				'payment_company'         => $order_query->row['payment_company'],
				'payment_address_1'       => $order_query->row['payment_address_1'],
				'payment_address_2'       => $order_query->row['payment_address_2'],
				'payment_postcode'        => $order_query->row['payment_postcode'],
				'payment_city'            => $order_query->row['payment_city'],
				'payment_zone_id'         => $order_query->row['payment_zone_id'],
				'payment_zone'            => $order_query->row['payment_zone'],
				'payment_zone_code'       => $payment_zone_code,
				'payment_country_id'      => $order_query->row['payment_country_id'],
				'payment_country'         => $order_query->row['payment_country'],
				'payment_iso_code_2'      => $payment_iso_code_2,
				'payment_iso_code_3'      => $payment_iso_code_3,
				'payment_address_format'  => $order_query->row['payment_address_format'],
				'payment_custom_field'    => json_decode($order_query->row['payment_custom_field'], true),
				'payment_method'          => $order_query->row['payment_method']."<br>".$order_query->row['custom_field'],
				'payment_code'            => $order_query->row['payment_code'],
				'shipping_mr_mrs'         => $order_query->row['shipping_mr_mrs'],
				'shipping_firstname'      => $order_query->row['shipping_firstname'],
				'shipping_lastname'       => $order_query->row['shipping_lastname'],
				'shipping_company'        => $order_query->row['shipping_company'],
				'shipping_address_1'      => $order_query->row['shipping_address_1'],
				'shipping_address_2'      => $order_query->row['shipping_address_2'],
				'shipping_postcode'       => $order_query->row['shipping_postcode'],
				'shipping_city'           => $order_query->row['shipping_city'],
				'shipping_phone_code'     => $order_query->row['shipping_phone_code'],
				'shipping_phone'           => $order_query->row['shipping_phone'],
				'shipping_zone_id'        => $order_query->row['shipping_zone_id'],
				'shipping_zone'           => $order_query->row['shipping_zone'],
				'shipping_zone_code'      => $shipping_zone_code,
				'shipping_country_id'     => $order_query->row['shipping_country_id'],
				'shipping_country'        => $order_query->row['shipping_country'],
				'shipping_iso_code_2'     => $shipping_iso_code_2,
				'shipping_iso_code_3'     => $shipping_iso_code_3,
				'shipping_address_format' => $order_query->row['shipping_address_format'],
				'shipping_custom_field'   => json_decode($order_query->row['shipping_custom_field'], true),
				'shipping_method'         => $order_query->row['shipping_method'],
				'shipping_code'           => $order_query->row['shipping_code'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'reward'                  => $reward,
				'order_status_id'         => $order_query->row['order_status_id'],
				'order_status'            => $order_query->row['order_status'],
				'affiliate_id'            => $order_query->row['affiliate_id'],
				'marketing_id'            => $order_query->row['marketing_id'],
				'affiliate_firstname'     => $affiliate_firstname,
				'affiliate_lastname'      => $affiliate_lastname,
				'commission'              => $order_query->row['commission'],
				'language_id'             => $order_query->row['language_id'],
				'language_code'           => $language_code,
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'ip'                      => $order_query->row['ip'],
				'forwarded_ip'            => $order_query->row['forwarded_ip'],
				'user_agent'              => $order_query->row['user_agent'],
				'accept_language'         => $order_query->row['accept_language'],
				'date_added'              => $order_query->row['date_added'],
				'date_modified'           => $order_query->row['date_modified'],
				'boy_id'           => $order_query->row['boy_id'],
				'disclose_sender_details'           => $order_query->row['disclose_sender_details'],
				'added_by' => $added_by
			);
		} else {
			return;
		}
	}

	public function getOrders($data = array()) {
		/*$sql = "SELECT o.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, o.shipping_city AS city, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS order_status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified FROM `" . DB_PREFIX . "order` o";*/
		$sql = "SELECT o.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, o.shipping_city AS city, o.affiliate_id, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS order_status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified, o.date_forshipping, o.slot_forshipping, o.shipping_postcode FROM `" . DB_PREFIX . "order` o";

		if (isset($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			//$sql .= " WHERE o.order_status_id > '0'";
			$sql .= " WHERE o.order_id > '0'";
		}

		$sql .= " AND o.vendor_id = '".$this->user->getId()."'";

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND (o.firstname LIKE '%" . $this->db->escape($data['filter_customer']) . "%' OR o.email LIKE '" . $this->db->escape($data['filter_customer']) . "%' OR o.telephone LIKE '" . $this->db->escape($data['filter_customer']) . "%')";
		}

		if (!empty($data['filter_email'])) {
			$sql .= " AND o.email = '" . $this->db->escape($data['filter_email']) . "'";
		}

		if (!empty($data['filter_phone'])) {
			$sql .= " AND o.telephone = '" . $this->db->escape($data['filter_phone']) . "'";
		}

		if (!empty($data['filter_order_custom']) && $data['filter_order_custom'] == 1) {
			$sql .= " AND o.affiliate_id = '1'";
		}

		if (!empty($data['filter_city'])) {
			$sql .= " AND o.shipping_city LIKE '%" . $this->db->escape($data['filter_city']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(o.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(o.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_date_delivery'])) {
			$sql .= " AND o.date_forshipping = '" . $this->db->escape(date('Y-m-d', strtotime($data['filter_date_delivery']))) . "'";
		}

		if (!empty($data['filter_slot_delivery'])) {
			$sql .= " AND o.slot_forshipping = '" . $this->db->escape($data['filter_slot_delivery']) . "'";
		}

		/*if (!empty($data['filter_date_delivery'])) {

			$sql .= " AND DATE(o.date_forshipping) = DATE('" . $this->db->escape($data['filter_date_delivery']) . "')";
		}*/

		if (!empty($data['filter_total'])) {
			$sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
		}

		$sort_data = array(
			'o.order_id',
			'customer',
			'order_status',
			'o.date_added',
			'o.date_modified',
			'o.total'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY o.order_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		//echo $sql; die;
		$query = $this->db->query($sql);	

		$allOrders = $query->rows;
		/* $a = array();
		$b = array();
		$rt = array();
		if(isset($data['filter_date_delivery']) && !empty($data['filter_date_delivery'])){
			$query1 = $this->db->query("SELECT order_id FROM `" . DB_PREFIX . "order_delivery_date` WHERE delivery_date = '" . $data['filter_date_delivery'] . "'");
			$oo = $query1->rows;
			foreach ($oo as $o) {
				$a[] = $o['order_id'];
			}
		}

		if(isset($data['filter_slot_delivery']) && !empty($data['filter_slot_delivery'])){
			$query1 = $this->db->query("SELECT order_id FROM `" . DB_PREFIX . "order_delivery_slot` WHERE slot like '%" . $data['filter_slot_delivery'] . "%'");	
			$slots = $query1->rows;
			foreach ($slots as $value) {
				$b[] = $value['order_id'];
			}
		}
		if(!empty($a) && !empty($b)){
			$rt = array_unique(array_intersect($a,$b));	
		}
		
		if(count($rt) > 0){
			$orders = array();
			foreach ($allOrders as $order) {
				if((in_array($order['order_id'], $rt))){
					$orders[] = $order;
				}
			}
		} elseif (count($a) > 0) {
			$orders = array();
			foreach ($allOrders as $order) {
				if((in_array($order['order_id'], $a))){
					$orders[] = $order;
				}
			}
		} elseif (count($b) > 0) {
			$orders = array();
			foreach ($allOrders as $order) {
				if((in_array($order['order_id'], $b))){
					$orders[] = $order;
				}
			}
		} else {
			$orders = $allOrders;
		}

		$alo = array();
		foreach ($orders as $order) {
			$alo[] = $order['order_id'];
		}

		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_delivery_slot WHERE order_id IN ('" . implode("','", $alo) . "')");
		$slots = $query->rows;
		$slt = array();
		foreach ($slots as $value) {
			$slt[$value['order_id']][] = $value['slot'];
		}


		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_delivery_date WHERE order_id IN ('" . implode("','", $alo) . "')");
		$dates = $query->rows;

		$dts = array();
		foreach ($dates as $value) {
			$dts[$value['order_id']][] = $value['delivery_date'];
		}

		$allO = array();
		foreach ($orders as $value) {
			$value['delivery_dates'] = '';
			if(isset($dts[$value['order_id']]) && !empty($dts[$value['order_id']])){
				$value['delivery_dates'] = implode(', ', $dts[$value['order_id']]);
			}

			$value['delivery_slots'] = '';
			if(isset($slt[$value['order_id']]) && !empty($slt[$value['order_id']])){
				$value['delivery_slots'] = implode(', ', $slt[$value['order_id']]);
			}

			$allO[] = $value;
		} */
		//echo "<pre />"; print_r($allO); die();
		return $allOrders;
	}

	public function getOrderProducts($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getProductImage($product_id) {
		$query = $this->db->query("SELECT image FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id . "'");

		return $query->row;
	}

	public function getOrderOptions($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");

		return $query->rows;
	}

	public function getOrderVouchers($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getOrderVoucherByVoucherId($voucher_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_voucher` WHERE voucher_id = '" . (int)$voucher_id . "'");

		return $query->row;
	}

	public function getOrderTotals($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");

		return $query->rows;
	}

	public function getTotalOrders($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order`";

		if (isset($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE order_status_id >= '0'";
		}

		$sql .= " AND vendor_id = '".$this->user->getId()."'";

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$sql .= " AND o.email = '" . $this->db->escape($data['filter_email']) . "'";
		}

		if (!empty($data['filter_phone'])) {
			$sql .= " AND o.telephone = '" . $this->db->escape($data['filter_phone']) . "'";
		}

		if (!empty($data['filter_order_custom']) && $data['filter_order_custom'] == 1) {
			$sql .= " AND o.affiliate_id = '1'";
		}

		if (!empty($data['filter_city'])) {
			$sql .= " AND o.shipping_city LIKE '%" . $this->db->escape($data['filter_city']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND total = '" . (float)$data['filter_total'] . "'";
		}

		if (!empty($data['filter_date_delivery'])) {
			$sql .= " AND o.date_forshipping = '" . $this->db->escape(date('Y-m-d', strtotime($data['filter_date_delivery']))) . "'";
		}

		if (!empty($data['filter_slot_delivery'])) {
			$sql .= " AND o.slot_forshipping = '" . $this->db->escape($data['filter_slot_delivery']) . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];

		/* $rt = array();
		$a =  array();
		$b =  array();
		if(isset($data['filter_date_delivery']) && !empty($data['filter_date_delivery'])){
			$query1 = $this->db->query("SELECT order_id FROM `" . DB_PREFIX . "order_delivery_date` WHERE delivery_date = '" . $data['filter_date_delivery'] . "'");	
			$dates = $query1->rows;
			foreach ($dates as $value) {
				$a[] = $value['order_id'];
			}
		}

		if(isset($data['filter_slot_delivery']) && !empty($data['filter_slot_delivery'])){
			$query1 = $this->db->query("SELECT order_id FROM `" . DB_PREFIX . "order_delivery_slot` WHERE slot LIKE '%" . $data['filter_slot_delivery'] . "%'");	
			$slots = $query1->rows;
			foreach ($slots as $value) {
				$b[] = $value['order_id'];
			}
		}
		if(!empty($a) && !empty($b)){
			$rt = array_unique(array_intersect($a,$b));	
		}		
		if(count($rt) > 0){
			return count($rt);
		} elseif (count($a) > 0) {
			return count($a);
		} elseif (count($b) > 0) {
			return count($b);
		} else {
			return $query->row['total'];
		} */
	}

	public function getTotalOrdersByStoreId($store_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE store_id = '" . (int)$store_id . "'");

		return $query->row['total'];
	}

	public function getTotalOrdersByOrderStatusId($order_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id = '" . (int)$order_status_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalOrdersByProcessingStatus() {
		$implode = array();

		$order_statuses = $this->config->get('config_processing_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE " . implode(" OR ", $implode));

			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function getTotalOrdersByCompleteStatus() {
		$implode = array();

		$order_statuses = $this->config->get('config_complete_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE " . implode(" OR ", $implode) . "");

			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function getTotalOrdersByLanguageId($language_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE language_id = '" . (int)$language_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalOrdersByCurrencyId($currency_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE currency_id = '" . (int)$currency_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function createInvoiceNo($order_id) {
		$order_info = $this->getOrder($order_id);

		if ($order_info && !$order_info['invoice_no']) {
			$query = $this->db->query("SELECT MAX(invoice_no) AS invoice_no FROM `" . DB_PREFIX . "order` WHERE invoice_prefix = '" . $this->db->escape($order_info['invoice_prefix']) . "'");

			if ($query->row['invoice_no']) {
				$invoice_no = $query->row['invoice_no'] + 1;
			} else {
				$invoice_no = 1;
			}

			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET invoice_no = '" . (int)$invoice_no . "', invoice_prefix = '" . $this->db->escape($order_info['invoice_prefix']) . "' WHERE order_id = '" . (int)$order_id . "'");

			return $order_info['invoice_prefix'] . $invoice_no;
		}
	}

	public function getOrderHistories($order_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT oh.date_added, os.name AS status, oh.comment, oh.notify, oh.created_by FROM " . DB_PREFIX . "order_history oh LEFT JOIN " . DB_PREFIX . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int)$order_id . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY oh.date_added ASC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getAllAdminUsers(){
		$query = $this->db->query("SELECT * from oc_user");
		$users = $query->rows;
		$allUsers = array();
		foreach ($users as $user) {
			$allUsers[$user['user_id']] = $user;
		}	
		return $allUsers;
	}

	public function getTotalOrderHistories($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}

	public function getTotalOrderHistoriesByOrderStatusId($order_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_history WHERE order_status_id = '" . (int)$order_status_id . "'");

		return $query->row['total'];
	}

	public function getEmailsByProductsOrdered($products, $start, $end) {
		$implode = array();

		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . (int)$product_id . "'";
		}

		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op ON (o.order_id = op.order_id) WHERE (" . implode(" OR ", $implode) . ") AND o.order_status_id <> '0' LIMIT " . (int)$start . "," . (int)$end);

		return $query->rows;
	}

	public function getTotalEmailsByProductsOrdered($products) {
		$implode = array();

		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . (int)$product_id . "'";
		}

		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op ON (o.order_id = op.order_id) WHERE (" . implode(" OR ", $implode) . ") AND o.order_status_id <> '0'");

		return $query->row['email'];
	}

	public function editOrderSpecialInstruction($order_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "order SET comment = '" . $data['new_comment'] . "' WHERE order_id = '" . (int)$order_id . "'");
	}

	public function getBoys($order_id) {
		$query = $this->db->query("select u.* FROM oc_user u, oc_order o WHERE u.vendor_id = o.vendor_id and u.user_group_id = '15' and u.vendor_id > 0 and o.order_id = '".$order_id."'");

		return $query->rows;
	}

	public function getProductAttributes($product_id) {
		$product_attribute_group_data = array();

		$product_attribute_group_query = $this->db->query("SELECT ag.attribute_group_id, agd.name FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (a.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) WHERE pa.product_id = '" . (int)$product_id . "' AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY ag.attribute_group_id ORDER BY ag.sort_order, agd.name");

		foreach ($product_attribute_group_query->rows as $product_attribute_group) {
			$product_attribute_data = array();

			$product_attribute_query = $this->db->query("SELECT a.attribute_id, ad.name, pa.text FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE pa.product_id = '" . (int)$product_id . "' AND a.attribute_group_id = '" . (int)$product_attribute_group['attribute_group_id'] . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY a.sort_order, ad.name");

			foreach ($product_attribute_query->rows as $product_attribute) {
				$product_attribute_data[] = array(
					'attribute_id' => $product_attribute['attribute_id'],
					'name'         => $product_attribute['name'],
					'text'         => $product_attribute['text']
				);
			}

			$product_attribute_group_data[] = array(
				'attribute_group_id' => $product_attribute_group['attribute_group_id'],
				'name'               => $product_attribute_group['name'],
				'attribute'          => $product_attribute_data
			);
		}

		return $product_attribute_group_data;
	}
}
