<?php
class ModelCatalogProduct extends Model {
	public function updateViewed($product_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "product SET viewed = (viewed + 1) WHERE product_id = '" . (int)$product_id . "'");
	}

	public function getProduct($product_id) {
		$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.product_addon_shipping_type, p.image, m.name AS manufacturer, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT points FROM " . DB_PREFIX . "product_reward pr WHERE pr.product_id = p.product_id AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return array(
				'product_id'       => $query->row['product_id'],
				'name'             => $query->row['name'],
				'description'      => $query->row['description'],
				'meta_title'       => $query->row['meta_title'],
				'meta_description' => $query->row['meta_description'],
				'meta_keyword'     => $query->row['meta_keyword'],
				'tag'              => $query->row['tag'],
				'model'            => $query->row['model'],
				'sku'              => $query->row['sku'],
				'upc'              => $query->row['upc'],
				'ean'              => $query->row['ean'],
				'jan'              => $query->row['jan'],
				'isbn'             => $query->row['isbn'],
				'mpn'              => $query->row['mpn'],
				'location'         => $query->row['location'],
				'quantity'         => $query->row['quantity'],
				'stock_status'     => $query->row['stock_status'],
				'image'            => $query->row['image'],
				'manufacturer_id'  => $query->row['manufacturer_id'],
				'manufacturer'     => $query->row['manufacturer'],
				'price'            => ($query->row['discount'] ? $query->row['discount'] : $query->row['price']),
				'special'          => $query->row['special'],
				'reward'           => $query->row['reward'],
				'points'           => $query->row['points'],
				'tax_class_id'     => $query->row['tax_class_id'],
				'date_available'   => $query->row['date_available'],
				'weight'           => $query->row['weight'],
				'weight_class_id'  => $query->row['weight_class_id'],
				'length'           => $query->row['length'],
				'width'            => $query->row['width'],
				'height'           => $query->row['height'],
				'length_class_id'  => $query->row['length_class_id'],
				'subtract'         => $query->row['subtract'],
				'rating'           => number_format($query->row['rating'], 1),
				'reviews'          => $query->row['reviews'] ? $query->row['reviews'] : 0,
				'minimum'          => $query->row['minimum'],
				'sort_order'       => $query->row['sort_order'],
				'status'           => $query->row['status'],
				'date_added'       => $query->row['date_added'],
				'date_modified'    => $query->row['date_modified'],
				'viewed'           => $query->row['viewed'],
				'product_addon_shipping_type' => $query->row['product_addon_shipping_type'],
				'purchased' => $query->row['purchased']
			);
		} else {
			return false;
		}
	}

	/**
	 * Batch-fetch full product data for multiple IDs in a single query.
	 * Returns array keyed by product_id with same structure as getProduct().
	 */
	private function getProductsByIds(array $product_ids) {
		if (empty($product_ids)) {
			return array();
		}

		$ids_str = implode(',', array_map('intval', $product_ids));

		$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.product_addon_shipping_type, p.image, m.name AS manufacturer, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT points FROM " . DB_PREFIX . "product_reward pr WHERE pr.product_id = p.product_id AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p.product_id IN (" . $ids_str . ") AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		$result = array();
		foreach ($query->rows as $row) {
			$result[$row['product_id']] = array(
				'product_id'       => $row['product_id'],
				'name'             => $row['name'],
				'description'      => $row['description'],
				'meta_title'       => $row['meta_title'],
				'meta_description' => $row['meta_description'],
				'meta_keyword'     => $row['meta_keyword'],
				'tag'              => $row['tag'],
				'model'            => $row['model'],
				'sku'              => $row['sku'],
				'upc'              => $row['upc'],
				'ean'              => $row['ean'],
				'jan'              => $row['jan'],
				'isbn'             => $row['isbn'],
				'mpn'              => $row['mpn'],
				'location'         => $row['location'],
				'quantity'         => $row['quantity'],
				'stock_status'     => $row['stock_status'],
				'image'            => $row['image'],
				'manufacturer_id'  => $row['manufacturer_id'],
				'manufacturer'     => $row['manufacturer'],
				'price'            => ($row['discount'] ? $row['discount'] : $row['price']),
				'special'          => $row['special'],
				'reward'           => $row['reward'],
				'points'           => $row['points'],
				'tax_class_id'     => $row['tax_class_id'],
				'date_available'   => $row['date_available'],
				'weight'           => $row['weight'],
				'weight_class_id'  => $row['weight_class_id'],
				'length'           => $row['length'],
				'width'            => $row['width'],
				'height'           => $row['height'],
				'length_class_id'  => $row['length_class_id'],
				'subtract'         => $row['subtract'],
				'rating'           => number_format($row['rating'], 1),
				'reviews'          => $row['reviews'] ? $row['reviews'] : 0,
				'minimum'          => $row['minimum'],
				'sort_order'       => $row['sort_order'],
				'status'           => $row['status'],
				'date_added'       => $row['date_added'],
				'date_modified'    => $row['date_modified'],
				'viewed'           => $row['viewed'],
				'product_addon_shipping_type' => $row['product_addon_shipping_type'],
				'purchased'        => $row['purchased']
			);
		}

		return $result;
	}

	public function getProductBySku($sku) {
		$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.product_addon_shipping_type, p.image, m.name AS manufacturer, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT points FROM " . DB_PREFIX . "product_reward pr WHERE pr.product_id = p.product_id AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p.sku = '" . $sku . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return array(
				'product_id'       => $query->row['product_id'],
				'name'             => $query->row['name'],
				'description'      => $query->row['description'],
				'meta_title'       => $query->row['meta_title'],
				'meta_description' => $query->row['meta_description'],
				'meta_keyword'     => $query->row['meta_keyword'],
				'tag'              => $query->row['tag'],
				'model'            => $query->row['model'],
				'sku'              => $query->row['sku'],
				'upc'              => $query->row['upc'],
				'ean'              => $query->row['ean'],
				'jan'              => $query->row['jan'],
				'isbn'             => $query->row['isbn'],
				'mpn'              => $query->row['mpn'],
				'location'         => $query->row['location'],
				'quantity'         => $query->row['quantity'],
				'stock_status'     => $query->row['stock_status'],
				'image'            => $query->row['image'],
				'manufacturer_id'  => $query->row['manufacturer_id'],
				'manufacturer'     => $query->row['manufacturer'],
				'price'            => ($query->row['discount'] ? $query->row['discount'] : $query->row['price']),
				'special'          => $query->row['special'],
				'reward'           => $query->row['reward'],
				'points'           => $query->row['points'],
				'tax_class_id'     => $query->row['tax_class_id'],
				'date_available'   => $query->row['date_available'],
				'weight'           => $query->row['weight'],
				'weight_class_id'  => $query->row['weight_class_id'],
				'length'           => $query->row['length'],
				'width'            => $query->row['width'],
				'height'           => $query->row['height'],
				'length_class_id'  => $query->row['length_class_id'],
				'subtract'         => $query->row['subtract'],
				'rating'           => round($query->row['rating']),
				'reviews'          => $query->row['reviews'] ? $query->row['reviews'] : 0,
				'minimum'          => $query->row['minimum'],
				'sort_order'       => $query->row['sort_order'],
				'status'           => $query->row['status'],
				'date_added'       => $query->row['date_added'],
				'date_modified'    => $query->row['date_modified'],
				'viewed'           => $query->row['viewed'],
				'product_addon_shipping_type' => $query->row['product_addon_shipping_type']
			);
		} else {
			return false;
		}
	}

	public function getProductsBySkus(array $skus) {
		if (!$skus) {
			return array();
		}
		$escaped = array();
		foreach ($skus as $sku) {
			$escaped[] = "'" . $this->db->escape($sku) . "'";
		}
		$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.product_addon_shipping_type, p.image, m.name AS manufacturer, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT points FROM " . DB_PREFIX . "product_reward pr WHERE pr.product_id = p.product_id AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p.sku IN (" . implode(',', $escaped) . ") AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		$products = array();
		foreach ($query->rows as $row) {
			$products[$row['sku']] = array(
				'product_id'       => $row['product_id'],
				'name'             => $row['name'],
				'description'      => $row['description'],
				'meta_title'       => $row['meta_title'],
				'meta_description' => $row['meta_description'],
				'meta_keyword'     => $row['meta_keyword'],
				'tag'              => $row['tag'],
				'model'            => $row['model'],
				'sku'              => $row['sku'],
				'upc'              => $row['upc'],
				'ean'              => $row['ean'],
				'jan'              => $row['jan'],
				'isbn'             => $row['isbn'],
				'mpn'              => $row['mpn'],
				'location'         => $row['location'],
				'quantity'         => $row['quantity'],
				'stock_status'     => $row['stock_status'],
				'image'            => $row['image'],
				'manufacturer_id'  => $row['manufacturer_id'],
				'manufacturer'     => $row['manufacturer'],
				'price'            => ($row['discount'] ? $row['discount'] : $row['price']),
				'special'          => $row['special'],
				'reward'           => $row['reward'],
				'points'           => $row['points'],
				'tax_class_id'     => $row['tax_class_id'],
				'date_available'   => $row['date_available'],
				'weight'           => $row['weight'],
				'weight_class_id'  => $row['weight_class_id'],
				'length'           => $row['length'],
				'width'            => $row['width'],
				'height'           => $row['height'],
				'length_class_id'  => $row['length_class_id'],
				'subtract'         => $row['subtract'],
				'rating'           => round($row['rating']),
				'reviews'          => $row['reviews'] ? $row['reviews'] : 0,
				'minimum'          => $row['minimum'],
				'sort_order'       => $row['sort_order'],
				'status'           => $row['status'],
				'date_added'       => $row['date_added'],
				'date_modified'    => $row['date_modified'],
				'viewed'           => $row['viewed'],
				'product_addon_shipping_type' => $row['product_addon_shipping_type']
			);
		}
		return $products;
	}

	public function getProducts($data = array()) {
		// Fetch city products once and reuse
		$city_product_ids = array();
		$all_city_product_ids = array();
		if (!empty($this->session->data['selectedCityId'])) {
			$city_query = $this->db->query("SELECT DISTINCT product_id FROM " . DB_PREFIX . "product_to_city WHERE shipping_cities_id = '" . (int)$this->session->data['selectedCityId'] . "'");
			foreach ($city_query->rows as $row) {
				$city_product_ids[] = (int)$row['product_id'];
			}
		}

		// Fetch list of all products that have city mappings (used to allow products without any mapping to be shown globally)
		$all_query = $this->db->query("SELECT DISTINCT product_id FROM " . DB_PREFIX . "product_to_city");
		foreach ($all_query->rows as $row) {
			$all_city_product_ids[] = (int)$row['product_id'];
		}

		$sql = "SELECT p.product_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special";

		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (cp.category_id = p2c.category_id)";
			} else {
				$sql .= " FROM " . DB_PREFIX . "product_to_category p2c";
			}

			if (!empty($data['filter_filter'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p2c.product_id = pf.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pf.product_id = p.product_id)";
			} else {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";
			}
		} else {
			$sql .= " FROM " . DB_PREFIX . "product p";
		}

		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1'  AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		$sql .= "AND p.product_addon_status != '1'";

		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " AND cp.path_id = '" . (int)$data['filter_category_id'] . "'";
			} else {
				$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
			}

			if (!empty($data['filter_filter'])) {
				$implode = array();

				$filters = explode(',', $data['filter_filter']);

				foreach ($filters as $filter_id) {
					$implode[] = (int)$filter_id;
				}

				$sql .= " AND pf.filter_id IN (" . implode(',', $implode) . ")";
			}
		}

		// Apply city filter using pre-fetched data
		if (!empty($this->session->data['selectedCityId'])) {
			if (!empty($all_city_product_ids)) {
				if (!empty($city_product_ids)) {
					$sql .= " AND (p.product_id NOT IN (" . implode(',', $all_city_product_ids) . ") OR p.product_id IN (" . implode(',', $city_product_ids) . "))";
				} else {
					// Selected city has no specific products; only show products with no city mapping (globally available)
					$sql .= " AND p.product_id NOT IN (" . implode(',', $all_city_product_ids) . ")";
				}
			}
		}

		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
			$sql .= " AND (";

			if (!empty($data['filter_name'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_name'])));

				foreach ($words as $word) {
					$implode[] = "pd.name LIKE '%" . $this->db->escape($word) . "%'";
				}

				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}

				if (!empty($data['filter_description'])) {
					$sql .= " OR pd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
			}

			if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
				$sql .= " OR ";
			}

			if (!empty($data['filter_tag'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_tag'])));

				foreach ($words as $word) {
					$implode[] = "pd.tag LIKE '%" . $this->db->escape($word) . "%'";
				}

				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}
			}

			if (!empty($data['filter_name'])) {
				$sql .= " OR LCASE(p.model) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.sku) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.upc) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.ean) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.jan) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.isbn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.mpn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
			}

			$sql .= ")";
		}

		if (!empty($data['filter_manufacturer_id'])) {
			$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
		}

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'p.quantity',
			'p.price',
			'rating',
			'p.sort_order',
			'p.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} elseif ($data['sort'] == 'p.price') {
				$sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p2c.sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(pd.name) DESC";
		} else {
			$sql .= " ASC, LCASE(pd.name) ASC";
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

		$query = $this->db->query($sql);

		if (!$query->rows) {
			return array();
		}

		$product_ids = array_column($query->rows, 'product_id');
		$products_map = $this->getProductsByIds($product_ids);

		$product_data = array();
		foreach ($query->rows as $result) {
			if (isset($products_map[$result['product_id']])) {
				$product_data[$result['product_id']] = $products_map[$result['product_id']];
			}
		}

		return $product_data;
	}

	public function getProductsForListing($data = array()) {
		$city_product_ids = array();
		$all_city_product_ids = array();

		if (!empty($this->session->data['selectedCityId'])) {
			$city_query = $this->db->query("SELECT DISTINCT product_id FROM " . DB_PREFIX . "product_to_city WHERE shipping_cities_id = '" . (int)$this->session->data['selectedCityId'] . "'");

			foreach ($city_query->rows as $row) {
				$city_product_ids[] = (int)$row['product_id'];
			}
		}

		$all_query = $this->db->query("SELECT DISTINCT product_id FROM " . DB_PREFIX . "product_to_city");

		foreach ($all_query->rows as $row) {
			$all_city_product_ids[] = (int)$row['product_id'];
		}

		$sql = "SELECT
				p.product_id,
				p.image,
				p.price,
				p.tax_class_id,
				p.minimum,
				p.quantity,
				p.sku,
				p.purchased,
				p.sort_order,
				pd.name,
				pd.description,
				(SELECT AVG(r1.rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating,
				(SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews,
				(SELECT price FROM " . DB_PREFIX . "product_discount pd2
					WHERE pd2.product_id = p.product_id
						AND pd2.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'
						AND pd2.quantity = '1'
						AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW()))
					ORDER BY pd2.priority ASC, pd2.price ASC
					LIMIT 1) AS discount,
				(SELECT price FROM " . DB_PREFIX . "product_special ps
					WHERE ps.product_id = p.product_id
						AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'
						AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW()))
					ORDER BY ps.priority ASC, ps.price ASC
					LIMIT 1) AS special";

		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (cp.category_id = p2c.category_id)";
			} else {
				$sql .= " FROM " . DB_PREFIX . "product_to_category p2c";
			}

			if (!empty($data['filter_filter'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p2c.product_id = pf.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pf.product_id = p.product_id)";
			} else {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";
			}
		} else {
			$sql .= " FROM " . DB_PREFIX . "product p";
		}

		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
			LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)
			WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
				AND p.status = '1'
				AND p.date_available <= NOW()
				AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
				AND p.product_addon_status != '1'";

		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " AND cp.path_id = '" . (int)$data['filter_category_id'] . "'";
			} else {
				$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
			}

			if (!empty($data['filter_filter'])) {
				$implode = array();
				$filters = explode(',', $data['filter_filter']);

				foreach ($filters as $filter_id) {
					$implode[] = (int)$filter_id;
				}

				$sql .= " AND pf.filter_id IN (" . implode(',', $implode) . ")";
			}
		}

		if (!empty($this->session->data['selectedCityId']) && !empty($all_city_product_ids)) {
			if (!empty($city_product_ids)) {
				$sql .= " AND (p.product_id NOT IN (" . implode(',', $all_city_product_ids) . ") OR p.product_id IN (" . implode(',', $city_product_ids) . "))";
			} else {
				$sql .= " AND p.product_id NOT IN (" . implode(',', $all_city_product_ids) . ")";
			}
		}

		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
			$sql .= " AND (";

			if (!empty($data['filter_name'])) {
				$implode = array();
				$words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_name'])));

				foreach ($words as $word) {
					$implode[] = "pd.name LIKE '%" . $this->db->escape($word) . "%'";
				}

				if ($implode) {
					$sql .= implode(" AND ", $implode);
				}

				if (!empty($data['filter_description'])) {
					$sql .= " OR pd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
			}

			if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
				$sql .= " OR ";
			}

			if (!empty($data['filter_tag'])) {
				$implode = array();
				$words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_tag'])));

				foreach ($words as $word) {
					$implode[] = "pd.tag LIKE '%" . $this->db->escape($word) . "%'";
				}

				if ($implode) {
					$sql .= implode(" AND ", $implode);
				}
			}

			if (!empty($data['filter_name'])) {
				$sql .= " OR LCASE(p.model) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.sku) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.upc) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.ean) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.jan) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.isbn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.mpn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
			}

			$sql .= ")";
		}

		if (!empty($data['filter_manufacturer_id'])) {
			$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
		}

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'p.quantity',
			'p.price',
			'rating',
			'p.sort_order',
			'p.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} elseif ($data['sort'] == 'p.price') {
				$sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p2c.sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(pd.name) DESC";
		} else {
			$sql .= " ASC, LCASE(pd.name) ASC";
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

		$product_data = array();
		$query = $this->db->query($sql);

		foreach ($query->rows as $result) {
			$product_data[$result['product_id']] = array(
				'product_id' => $result['product_id'],
				'name' => $result['name'],
				'description' => $result['description'],
				'image' => $result['image'],
				'price' => ($result['discount'] ? $result['discount'] : $result['price']),
				'special' => $result['special'],
				'tax_class_id' => $result['tax_class_id'],
				'rating' => $result['rating'] !== null ? number_format((float)$result['rating'], 1) : 0,
				'reviews' => $result['reviews'] ? $result['reviews'] : 0,
				'minimum' => $result['minimum'],
				'quantity' => $result['quantity'],
				'sku' => $result['sku'],
				'purchased' => $result['purchased']
			);
		}

		return $product_data;
	}

	public function getProductSpecials($data = array()) {
		$sql = "SELECT DISTINCT ps.product_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = ps.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'ps.price',
			'rating',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p.sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(pd.name) DESC";
		} else {
			$sql .= " ASC, LCASE(pd.name) ASC";
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

		$query = $this->db->query($sql);

		if (!$query->rows) {
			return array();
		}

		$product_ids = array_column($query->rows, 'product_id');
		$products_map = $this->getProductsByIds($product_ids);

		$product_data = array();
		foreach ($query->rows as $result) {
			if (isset($products_map[$result['product_id']])) {
				$product_data[$result['product_id']] = $products_map[$result['product_id']];
			}
		}

		return $product_data;
	}

	public function getLatestProducts($limit) {
		$product_data = $this->cache->get('product.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit);

		if (!$product_data) {
			$query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.date_added DESC LIMIT " . (int)$limit);

			$product_ids = array_column($query->rows, 'product_id');
			$products_map = $this->getProductsByIds($product_ids);

			$product_data = array();
			foreach ($query->rows as $result) {
				if (isset($products_map[$result['product_id']])) {
					$product_data[$result['product_id']] = $products_map[$result['product_id']];
				}
			}

			$this->cache->set('product.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit, $product_data);
		}

		return $product_data;
	}

	public function getPopularProducts($limit) {
		$product_data = $this->cache->get('product.popular.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit);

		if (!$product_data) {
			$query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.viewed DESC, p.date_added DESC LIMIT " . (int)$limit);

			$product_ids = array_column($query->rows, 'product_id');
			$products_map = $this->getProductsByIds($product_ids);

			$product_data = array();
			foreach ($query->rows as $result) {
				if (isset($products_map[$result['product_id']])) {
					$product_data[$result['product_id']] = $products_map[$result['product_id']];
				}
			}

			$this->cache->set('product.popular.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit, $product_data);
		}

		return $product_data;
	}

	public function getBestSellerProducts($limit) {
		$product_data = $this->cache->get('product.bestseller.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit);

		if (!$product_data) {
			$product_data = array();

			$query = $this->db->query("SELECT op.product_id, SUM(op.quantity) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' GROUP BY op.product_id ORDER BY total DESC LIMIT " . (int)$limit);

			$product_ids = array_column($query->rows, 'product_id');
			$products_map = $this->getProductsByIds($product_ids);

			foreach ($query->rows as $result) {
				if (isset($products_map[$result['product_id']])) {
					$product_data[$result['product_id']] = $products_map[$result['product_id']];
				}
			}

			$this->cache->set('product.bestseller.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit, $product_data);
		}

		return $product_data;
	}

	public function getProductAttributes($product_id) {
		$query = $this->db->query("SELECT ag.attribute_group_id, agd.name AS group_name, ag.sort_order AS group_sort_order, a.attribute_id, ad.name AS attr_name, a.sort_order AS attr_sort_order, pa.text FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (a.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE pa.product_id = '" . (int)$product_id . "' AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ag.sort_order, agd.name, a.sort_order, ad.name");

		$groups = array();
		foreach ($query->rows as $row) {
			$gid = $row['attribute_group_id'];
			if (!isset($groups[$gid])) {
				$groups[$gid] = array(
					'attribute_group_id' => $gid,
					'name'               => $row['group_name'],
					'attribute'          => array()
				);
			}
			$groups[$gid]['attribute'][] = array(
				'attribute_id' => $row['attribute_id'],
				'name'         => $row['attr_name'],
				'text'         => $row['text']
			);
		}

		return array_values($groups);
	}

	public function getProductOptions($product_id) {
		$query = $this->db->query("SELECT po.product_option_id, po.option_id, po.value, po.required, o.type, o.sort_order AS option_sort_order, od.name AS option_name, pov.product_option_value_id, pov.option_value_id, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.weight, pov.weight_prefix, ov.sort_order AS value_sort_order, ov.image, ovd.name AS value_name FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) LEFT JOIN " . DB_PREFIX . "product_option_value pov ON (po.product_option_id = pov.product_option_id AND pov.product_id = '" . (int)$product_id . "') LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "') WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order, ov.sort_order");

		$options = array();
		foreach ($query->rows as $row) {
			$oid = $row['product_option_id'];
			if (!isset($options[$oid])) {
				$options[$oid] = array(
					'product_option_id'    => $oid,
					'product_option_value' => array(),
					'option_id'            => $row['option_id'],
					'name'                 => $row['option_name'],
					'type'                 => $row['type'],
					'value'                => $row['value'],
					'required'             => $row['required']
				);
			}
			if ($row['product_option_value_id']) {
				$options[$oid]['product_option_value'][] = array(
					'product_option_value_id' => $row['product_option_value_id'],
					'option_value_id'         => $row['option_value_id'],
					'name'                    => $row['value_name'],
					'image'                   => $row['image'],
					'quantity'                => $row['quantity'],
					'subtract'                => $row['subtract'],
					'price'                   => $row['price'],
					'price_prefix'            => $row['price_prefix'],
					'weight'                  => $row['weight'],
					'weight_prefix'           => $row['weight_prefix']
				);
			}
		}

		return array_values($options);
	}

	public function getProductDiscounts($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND quantity > 1 AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity ASC, priority ASC, price ASC");

		return $query->rows;
	}

	public function getProductImages($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	/*revie code start*/
	public function getProductsReviews($data) {
		$ids = implode(',', array_map('intval', $data));
		return $this->db->query("SELECT r.*, CONCAT('" . HTTPS_SERVER . "image/', p.image) AS image FROM `oc_review` r LEFT JOIN `oc_product` p ON (r.product_id = p.product_id) WHERE r.status = 1 AND r.product_id IN (" . $ids . ") ORDER BY r.date_added DESC")->rows;
	}

	public function getCategoryReviewSummary($category_id) {
		$query = $this->db->query(
			"SELECT COUNT(DISTINCT r.review_id) AS total, AVG(r.rating) AS average_rating
			FROM " . DB_PREFIX . "review r
			INNER JOIN " . DB_PREFIX . "product_to_category p2c ON (p2c.product_id = r.product_id)
			INNER JOIN " . DB_PREFIX . "product p ON (p.product_id = r.product_id)
			WHERE r.status = '1'
				AND p2c.category_id = '" . (int)$category_id . "'
				AND p.status = '1'
				AND p.date_available <= NOW()"
		);

		return array(
			'cnt' => (int)$query->row['total'],
			'average' => $query->row['average_rating'] !== null ? round((float)$query->row['average_rating'], 2) : 0
		);
	}

	public function getCategoryReviews($category_id, $limit = 5) {
		$query = $this->db->query(
			"SELECT r.*, p.image
			FROM " . DB_PREFIX . "review r
			INNER JOIN " . DB_PREFIX . "product_to_category p2c ON (p2c.product_id = r.product_id)
			INNER JOIN " . DB_PREFIX . "product p ON (p.product_id = r.product_id)
			WHERE r.status = '1'
				AND p2c.category_id = '" . (int)$category_id . "'
				AND p.status = '1'
				AND p.date_available <= NOW()
			ORDER BY r.date_added DESC
			LIMIT " . (int)$limit
		);

		$image_server = $this->request->server['HTTPS'] ? $this->config->get('config_ssl') : $this->config->get('config_url');
		$reviews = array();

		foreach ($query->rows as $row) {
			$row['image'] = !empty($row['image']) ? $image_server . 'image/' . ltrim($row['image'], '/') : '';
			$reviews[] = $row;
		}

		return $reviews;
	}

	public function getAllReviews() {
		return $this->db->query("SELECT * FROM `oc_review` WHERE status = 1 ORDER BY date_added DESC LIMIT 10")->rows;
	}
	/*revie code end*/

	public function getProductRelated($product_id) {
		$query = $this->db->query("SELECT pr.related_id FROM " . DB_PREFIX . "product_related pr LEFT JOIN " . DB_PREFIX . "product p ON (pr.related_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pr.product_id = '" . (int)$product_id . "' AND p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if (!$query->rows) {
			return array();
		}

		$product_ids = array_column($query->rows, 'related_id');
		$products_map = $this->getProductsByIds($product_ids);

		$product_data = array();
		foreach ($query->rows as $result) {
			if (isset($products_map[$result['related_id']])) {
				$product_data[$result['related_id']] = $products_map[$result['related_id']];
			}
		}

		return $product_data;
	}

	public function getProductRelated2($product_id) {
		$query = $this->db->query("SELECT product_id from " . DB_PREFIX . "product where product_id in (select product_id from " . DB_PREFIX . "product_to_category where category_id in (select category_id from " . DB_PREFIX . "product_to_category where product_id=".(int)$product_id.")) and status='1' and date_available<=NOW() order by rand() limit 4");

		if (!$query->rows) {
			return array();
		}

		$product_ids = array_column($query->rows, 'product_id');
		$products_map = $this->getProductsByIds($product_ids);

		$product_data = array();
		foreach ($query->rows as $result) {
			if (isset($products_map[$result['product_id']])) {
				$product_data[$result['product_id']] = $products_map[$result['product_id']];
			}
		}

		return $product_data;
	}

	public function getProductRelatedWithCategory($cat_id) {
		 $_words = '"'.implode('","', $cat_id).'"';

    	$query = $this->db->query("SELECT *, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special , (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category pc ON (pc.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description p2d ON (p2d.product_id = p.product_id) WHERE p.product_id IN (" . $_words . " ) AND p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() group by p.product_id limit 4");


		return $query->rows;
	}


	public function getProductLayoutId($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$product_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}

	public function getCategories($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");

		return $query->rows;
	}

	public function getCategory($product_id) {
		$query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "' limit 4");
			foreach($query->rows as $prod){
				$cateId[] = $prod['category_id'];
			}
		return $cateId;
	}

	public function getTotalProducts($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total";

		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (cp.category_id = p2c.category_id)";
			} else {
				$sql .= " FROM " . DB_PREFIX . "product_to_category p2c";
			}

			if (!empty($data['filter_filter'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p2c.product_id = pf.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pf.product_id = p.product_id)";
			} else {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";
			}
		} else {
			$sql .= " FROM " . DB_PREFIX . "product p";
		}

		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " AND cp.path_id = '" . (int)$data['filter_category_id'] . "'";
			} else {
				$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
			}

			if (!empty($data['filter_filter'])) {
				$implode = array();

				$filters = explode(',', $data['filter_filter']);

				foreach ($filters as $filter_id) {
					$implode[] = (int)$filter_id;
				}

				$sql .= " AND pf.filter_id IN (" . implode(',', $implode) . ")";
			}
		}

		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
			$sql .= " AND (";

			if (!empty($data['filter_name'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_name'])));

				foreach ($words as $word) {
					$implode[] = "pd.name LIKE '%" . $this->db->escape($word) . "%'";
				}

				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}

				if (!empty($data['filter_description'])) {
					$sql .= " OR pd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
			}

			if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
				$sql .= " OR ";
			}

			if (!empty($data['filter_tag'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_tag'])));

				foreach ($words as $word) {
					$implode[] = "pd.tag LIKE '%" . $this->db->escape($word) . "%'";
				}

				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}
			}

			if (!empty($data['filter_name'])) {
				$sql .= " OR LCASE(p.model) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.sku) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.upc) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.ean) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.jan) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.isbn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.mpn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
			}

			$sql .= ")";
		}

		if (!empty($data['filter_manufacturer_id'])) {
			$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalProductsByCategoryIds(array $category_ids) {
		if (!$category_ids) {
			return array();
		}
		$ids = implode(',', array_map('intval', $category_ids));
		$query = $this->db->query("SELECT cp.path_id AS category_id, COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (cp.category_id = p2c.category_id) LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND cp.path_id IN (" . $ids . ") GROUP BY cp.path_id");
		$counts = array();
		foreach ($query->rows as $row) {
			$counts[(int)$row['category_id']] = (int)$row['total'];
		}
		return $counts;
	}

	public function getProfile($product_id, $recurring_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring r JOIN " . DB_PREFIX . "product_recurring pr ON (pr.recurring_id = r.recurring_id AND pr.product_id = '" . (int)$product_id . "') WHERE pr.recurring_id = '" . (int)$recurring_id . "' AND status = '1' AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

		return $query->row;
	}

	public function getProfiles($product_id) {
		$query = $this->db->query("SELECT rd.* FROM " . DB_PREFIX . "product_recurring pr JOIN " . DB_PREFIX . "recurring_description rd ON (rd.language_id = " . (int)$this->config->get('config_language_id') . " AND rd.recurring_id = pr.recurring_id) JOIN " . DB_PREFIX . "recurring r ON r.recurring_id = rd.recurring_id WHERE pr.product_id = " . (int)$product_id . " AND status = '1' AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getTotalProductSpecials() {
		$query = $this->db->query("SELECT COUNT(DISTINCT ps.product_id) AS total FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.quantity > '0' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW()))");

		if (isset($query->row['total'])) {
			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function getCities($city, $proId){
		$query = $this->db->query("SELECT sc.id as cityId, sc.name as cityName, st.duration FROM oc_shipping_to_product stp, oc_shipping_type st, oc_shipping_citygp scg, oc_shipping_citygrp_to_city ctc, oc_shipping_cities sc WHERE stp.shipping_id = st.id AND st.city_group_id = scg.id AND scg.id = ctc.city_grp_id AND sc.id = ctc.city_id AND stp.product_id = '".$proId."' AND sc.name LIKE '".$city."%' GROUP BY sc.name");
		$result = array();
		foreach ($query->rows as $row) {
			$result[] = array('cityId' => $row['cityId'], 'cityName' => ucwords($row['cityName']), 'duration' => $row['duration']);
		}
		return $result;
	}

	public function getDates($cityId, $proId){
		$query = $this->db->query("SELECT st.duration FROM oc_shipping_to_product stp, oc_shipping_type st, oc_shipping_citygp scg, oc_shipping_citygrp_to_city ctc, oc_shipping_cities sc WHERE stp.shipping_id = st.id AND st.city_group_id = scg.id AND scg.id = ctc.city_grp_id AND sc.id = ctc.city_id AND stp.product_id = '".$proId."' AND ctc.city_id = '".$cityId."'");

		return $query->row['duration'];
	}

	public function getDatesTimeForPro($shippingType){
		$query = $this->db->query("SELECT st.duration, st.shipping_holyday FROM oc_shipping_type st WHERE st.id = '".$shippingType."'");
		$query1 = $this->db->query("SELECT ts.*, st.cutoff_time, st.buffertime, st.leadtime FROM oc_shipping_type st, oc_shipping_to_timeslote stt, oc_timeslot_shipping ts WHERE st.id = '".$shippingType."' AND stt.timeslote_id = ts.id AND stt.shipping_id = st.id AND ts.status = 1 ORDER BY ts.timeslot_from ASC");
		$data['duration'] = $query->row['duration'];
		$data['holiday'] = $query->row['shipping_holyday'];
		$data['timeslot'] = $query1->rows;
		return $data;
	}

	public function getShippingTypes($duration, $proId){
		$sql = "SELECT st.id, st.name, st.shipping_charge as price FROM oc_shipping_type st, oc_shipping_to_product stp WHERE stp.shipping_id = st.id AND stp.product_id = '".$proId."' AND st.duration >= '".$duration."'";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getShippingTypeForPro($proId, $cid, $delDate){
		$curDate = date('Y-m-d');
		if(strtotime($delDate)>strtotime($curDate)){
			$condition = ' AND st.id NOT IN (20, 49, 56, 63, 70) ';
		}else{
			$condition = ' ';
		}
		$sql = "SELECT st.id, st.name, st.shipping_charge as price, st.buffertime, st.leadtime, st.show_description FROM oc_shipping_type st, oc_shipping_to_product stp, oc_shipping_citygrp_to_city ctc WHERE stp.shipping_id = st.id AND st.city_group_id = ctc.city_grp_id and st.active=1 AND ctc.city_id = '".$cid."' AND stp.product_id = '".$proId."' AND st.shipping_holyday not like '%".$delDate."%' ".$condition;
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getShippingTypeTime($shippingId,$timeCur){

		$sql = "Select COUNT(ts.id) as total from oc_shipping_to_timeslote stt, oc_timeslot_shipping ts where stt.timeslote_id = ts.id AND stt.shipping_id = '".$shippingId."' AND TIME(ts.timeslot_to) > TIME('".$timeCur."')";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getTimeslots($shippingType){
		$sql = "Select * from oc_shipping_to_timeslote stt, oc_timeslot_shipping ts where stt.timeslote_id = ts.id AND stt.shipping_id = '".$shippingType."'";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getPincodesList($pincode, $proId){
		if(strlen($pincode) == 6){
			$sql = "SELECT p.*, c.display_name AS name, c.holidays FROM oc_shipping_pincodes p INNER JOIN oc_shipping_cities c ON p.shipping_cities_id = c.id WHERE p.pincode = '".$pincode."' AND p.status = 1 AND EXISTS (SELECT 1 FROM oc_shipping_type st JOIN oc_shipping_to_product stp ON stp.shipping_id = st.id JOIN oc_shipping_citygrp_to_city ctc ON st.city_group_id = ctc.city_grp_id WHERE ctc.city_id = c.id AND st.active = 1 AND stp.product_id = '".$proId."');";
		} else {
			$sql = "Select p.*, c.display_name as name, c.holidays from oc_shipping_pincodes p inner join oc_shipping_cities c ON p.shipping_cities_id = c.id where p.pincode LIKE '".$pincode."%' AND p.status=1";
		}

		$query = $this->db->query($sql);
		$dd = array();
		$allData = array();
		$isCustomExist = false;
		$custom = array('10595', '10596', '10597', '10598');
		foreach ($query->rows as $key => $value) {
			$allData[] = $value;
			if(in_array($value['shipping_cities_id'], $custom)){
				$isCustomExist = true;
			}
		}
		foreach ($allData as $key => $value) {
			if($isCustomExist && !in_array($value['shipping_cities_id'], $custom) && $proId >= 9658 && $proId <= 9703){
				continue;
			}
			$holiall = array();
			if(!empty($value['holidays'])){
				$holid = explode(',', $value['holidays']);
				if(count($holid) > 0){
					foreach ($holid as $v) {
						$holiall[] = date('d-m-Y', strtotime($v));
					}
				}
			}

			$value['holidays'] = implode(',', $holiall);
			$dd[] = $value;
		}
		return $dd;
	}

	public function checkCustomPincode($pincode){
		$sql = "Select p.*, c.display_name as name, c.holidays from oc_shipping_pincodes p inner join oc_shipping_cities c ON p.shipping_cities_id = c.id where p.pincode = '".$pincode."' AND p.status=1";

		$query = $this->db->query($sql);
		return $query->row;
	}

	public function getAddons($proId){
		$sql ="SELECT p.product_id, p.image, pd.name, p.price from ".DB_PREFIX."product p, ".DB_PREFIX."product_description pd, ".DB_PREFIX."category_multiparent cm, ".DB_PREFIX."product_to_category p2c where p.product_id=pd.product_id and cm.id=p2c.category_id and p.product_id=p2c.product_id and cm.id=(SELECT product_addon_category from ".DB_PREFIX."product where product_id=".(int)$proId.")";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getPincodes($pincode){
		date_default_timezone_set("Asia/Kolkata");
		$data = array();
		$query = $this->db->query("SELECT * FROM `oc_shipping_courier_pincodes` WHERE pincode LIKE '".$pincode."%' LIMIT 10");
		foreach ($query->rows as $row) {
			$lastHoru = "13:00";
			$new_diff = strtotime($lastHoru);
			$diff_time = date("H:i", $new_diff);
			$dateTime = new DateTime($diff_time);
			$inc = 0;
			if ($dateTime->diff(new DateTime)->format('%R') == '+') {
			  $inc = 1;
			}
			$data[] = array('id' => $row['id'], 'pincode' => $row['pincode'], 'date' => date('Y-m-d', strtotime("+" . ($row['lead_day'] + $inc) . " days")));
		}
		return $data;
	}

	public function saveGetRecentlyViewed($product_id){
		$this->db->query("DELETE FROM " . DB_PREFIX . "recently_viewed WHERE (customer_id = '0') AND date_added < DATE_SUB(NOW(), INTERVAL 1 HOUR)");

		if ($this->customer->getId()) {
			$this->db->query("UPDATE " . DB_PREFIX . "recently_viewed SET session_id = '" . $this->db->escape($this->session->getId()) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");

			$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recently_viewed WHERE customer_id = '0' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

			if ($cart_query->rows) {
				$guest_ids = implode(',', array_map(function($r) { return (int)$r['id']; }, $cart_query->rows));
				$this->db->query("DELETE FROM " . DB_PREFIX . "recently_viewed WHERE id IN (" . $guest_ids . ")");

				$existing = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "recently_viewed WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'")->rows;
				$existing_pids = array_column($existing, 'product_id');

				foreach ($cart_query->rows as $cart) {
					if (!in_array($cart['product_id'], $existing_pids)) {
						$this->db->query("INSERT " . DB_PREFIX . "recently_viewed SET customer_id = '" . (int)$this->customer->getId() . "', session_id = '" . $this->db->escape($this->session->getId()) . "', product_id = '" . (int)$cart['product_id'] . "', date_added = NOW()");
						$existing_pids[] = $cart['product_id'];
					}
				}
			}
		}

		$check = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "recently_viewed WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "'");

		if (!$check->row['total']) {
			$this->db->query("INSERT " . DB_PREFIX . "recently_viewed SET customer_id = '" . (int)$this->customer->getId() . "', session_id = '" . $this->db->escape($this->session->getId()) . "', product_id = '" . (int)$product_id . "', date_added = NOW()");
		}

		$query = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "recently_viewed WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

		if (!$query->rows) {
			return array();
		}

		$product_ids = array_column($query->rows, 'product_id');
		$products_map = $this->getProductsByIds($product_ids);

		$product_data = array();
		foreach ($query->rows as $result) {
			if (isset($products_map[$result['product_id']])) {
				$product_data[$result['product_id']] = $products_map[$result['product_id']];
			}
		}
		return $product_data;
	}

	public function getSimilarProducts($product_id, $weight){
		$query = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "product WHERE status = 1 AND weight = '" . (int)$weight . "' AND product_id != '" . (int)$product_id . "' limit 10");

		if (!$query->rows) {
			return array();
		}

		$product_ids = array_column($query->rows, 'product_id');
		$products_map = $this->getProductsByIds($product_ids);

		$product_data = array();
		foreach ($query->rows as $result) {
			if (isset($products_map[$result['product_id']])) {
				$product_data[$result['product_id']] = $products_map[$result['product_id']];
			}
		}
		return $product_data;
	}

	public function getParentCategoryUrl($cat_id){
		$data = $this->db->query("SELECT category_id FROM oc_category_multiparent WHERE id = '".$cat_id."'")->row;
		return $this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$data['category_id']."'")->row;
	}

	public function getParentCategoryName($cat_id){
		return $this->db->query("SELECT * FROM oc_category_multiparent WHERE id = '".$cat_id."'")->row;
	}

}
