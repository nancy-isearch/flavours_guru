<?php
class ModelReportSale extends Model {
	public function getTotalSales($data = array()) {
		$sql = "SELECT SUM(total) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '0'";

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalOrdersByCountry() {
		$query = $this->db->query("SELECT COUNT(*) AS total, SUM(o.total) AS amount, c.iso_code_2 FROM `" . DB_PREFIX . "order` o LEFT JOIN `" . DB_PREFIX . "country` c ON (o.payment_country_id = c.country_id) WHERE o.order_status_id > '0' GROUP BY o.payment_country_id");

		return $query->rows;
	}

	public function getTotalOrdersByDay() {
		$implode = array();

		foreach ($this->config->get('config_complete_status') as $order_status_id) {
			$implode[] = "'" . (int)$order_status_id . "'";
		}

		$order_data = array();

		for ($i = 0; $i < 24; $i++) {
			$order_data[$i] = array(
				'hour'  => $i,
				'total' => 0
			);
		}

		$query = $this->db->query("SELECT COUNT(*) AS total, HOUR(date_added) AS hour FROM `" . DB_PREFIX . "order` WHERE order_status_id IN(" . implode(",", $implode) . ") AND DATE(date_added) = DATE(NOW()) GROUP BY HOUR(date_added) ORDER BY date_added ASC");

		foreach ($query->rows as $result) {
			$order_data[$result['hour']] = array(
				'hour'  => $result['hour'],
				'total' => $result['total']
			);
		}

		return $order_data;
	}

	public function getTotalOrdersByWeek() {
		$implode = array();

		foreach ($this->config->get('config_complete_status') as $order_status_id) {
			$implode[] = "'" . (int)$order_status_id . "'";
		}

		$order_data = array();

		$date_start = strtotime('-' . date('w') . ' days');

		for ($i = 0; $i < 7; $i++) {
			$date = date('Y-m-d', $date_start + ($i * 86400));

			$order_data[date('w', strtotime($date))] = array(
				'day'   => date('D', strtotime($date)),
				'total' => 0
			);
		}

		$query = $this->db->query("SELECT COUNT(*) AS total, date_added FROM `" . DB_PREFIX . "order` WHERE order_status_id IN(" . implode(",", $implode) . ") AND DATE(date_added) >= DATE('" . $this->db->escape(date('Y-m-d', $date_start)) . "') GROUP BY DAYNAME(date_added)");

		foreach ($query->rows as $result) {
			$order_data[date('w', strtotime($result['date_added']))] = array(
				'day'   => date('D', strtotime($result['date_added'])),
				'total' => $result['total']
			);
		}

		return $order_data;
	}

	public function getTotalOrdersByMonth() {
		$implode = array();

		foreach ($this->config->get('config_complete_status') as $order_status_id) {
			$implode[] = "'" . (int)$order_status_id . "'";
		}

		$order_data = array();

		for ($i = 1; $i <= date('t'); $i++) {
			$date = date('Y') . '-' . date('m') . '-' . $i;

			$order_data[date('j', strtotime($date))] = array(
				'day'   => date('d', strtotime($date)),
				'total' => 0
			);
		}

		$query = $this->db->query("SELECT COUNT(*) AS total, date_added FROM `" . DB_PREFIX . "order` WHERE order_status_id IN(" . implode(",", $implode) . ") AND DATE(date_added) >= '" . $this->db->escape(date('Y') . '-' . date('m') . '-1') . "' GROUP BY DATE(date_added)");

		foreach ($query->rows as $result) {
			$order_data[date('j', strtotime($result['date_added']))] = array(
				'day'   => date('d', strtotime($result['date_added'])),
				'total' => $result['total']
			);
		}

		return $order_data;
	}

	public function getTotalOrdersByYear() {
		$implode = array();

		foreach ($this->config->get('config_complete_status') as $order_status_id) {
			$implode[] = "'" . (int)$order_status_id . "'";
		}

		$order_data = array();

		for ($i = 1; $i <= 12; $i++) {
			$order_data[$i] = array(
				'month' => date('M', mktime(0, 0, 0, $i)),
				'total' => 0
			);
		}

		$query = $this->db->query("SELECT COUNT(*) AS total, date_added FROM `" . DB_PREFIX . "order` WHERE order_status_id IN(" . implode(",", $implode) . ") AND YEAR(date_added) = YEAR(NOW()) GROUP BY MONTH(date_added)");

		foreach ($query->rows as $result) {
			$order_data[date('n', strtotime($result['date_added']))] = array(
				'month' => date('M', strtotime($result['date_added'])),
				'total' => $result['total']
			);
		}

		return $order_data;
	}

	public function getOrders($data = array()) {
		$sql = "SELECT MIN(o.date_added) AS date_start, MAX(o.date_added) AS date_end, COUNT(*) AS `orders`, SUM((SELECT SUM(op.quantity) FROM `" . DB_PREFIX . "order_product` op WHERE op.order_id = o.order_id GROUP BY op.order_id)) AS products, SUM((SELECT SUM(ot.value) FROM `" . DB_PREFIX . "order_total` ot WHERE ot.order_id = o.order_id AND ot.code = 'tax' GROUP BY ot.order_id)) AS tax, SUM(o.total) AS `total` FROM `" . DB_PREFIX . "order` o";

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE o.order_status_id >= '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if (!empty($data['filter_group'])) {
			$group = $data['filter_group'];
		} else {
			$group = 'week';
		}

		switch($group) {
			case 'day';
				$sql .= " GROUP BY YEAR(o.date_added), MONTH(o.date_added), DAY(o.date_added)";
				break;
			default:
			case 'week':
				$sql .= " GROUP BY YEAR(o.date_added), WEEK(o.date_added)";
				break;
			case 'month':
				$sql .= " GROUP BY YEAR(o.date_added), MONTH(o.date_added)";
				break;
			case 'year':
				$sql .= " GROUP BY YEAR(o.date_added)";
				break;
		}

		$sql .= " ORDER BY o.date_added DESC";

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

		return $query->rows;
	}

	public function getTotalOrders($data = array()) {
		if (!empty($data['filter_group'])) {
			$group = $data['filter_group'];
		} else {
			$group = 'week';
		}

		switch($group) {
			case 'day';
				$sql = "SELECT COUNT(DISTINCT YEAR(date_added), MONTH(date_added), DAY(date_added)) AS total FROM `" . DB_PREFIX . "order`";
				break;
			default:
			case 'week':
				$sql = "SELECT COUNT(DISTINCT YEAR(date_added), WEEK(date_added)) AS total FROM `" . DB_PREFIX . "order`";
				break;
			case 'month':
				$sql = "SELECT COUNT(DISTINCT YEAR(date_added), MONTH(date_added)) AS total FROM `" . DB_PREFIX . "order`";
				break;
			case 'year':
				$sql = "SELECT COUNT(DISTINCT YEAR(date_added)) AS total FROM `" . DB_PREFIX . "order`";
				break;
		}

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getOrdersDetail($data = array()) {
		$sql = "SELECT * FROM oc_user";
		$query = $this->db->query($sql);
		$allUsers = array();
		foreach ($query->rows as $key => $value) {
			$allUsers[$value['user_id']] = $value;
		}

		$sql = "SELECT * FROM oc_order_status";
		$query = $this->db->query($sql);
		$allStatus = array();
		foreach ($query->rows as $key => $value) {
			$allStatus[$value['order_status_id']] = $value;
		}

		
		//echo "<pre />"; print_r($allProcessing['43174']['created_by']); die();
		$sql = "SELECT op.*, p.price as original_price, o.total ototal, o.vendor_id, o.order_status_id status, o.order_id, o.date_added, o.firstname, o.lastname, o.telephone, o.payment_method, o.shipping_postcode, o.custom_field, o.added_by, o.is_admin_order, o.boy_id FROM oc_order o INNER JOIN oc_order_product op ON o.order_id = op.order_id INNER JOIN oc_product p ON op.product_id = p.product_id WHERE order_status_id > '0'";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$sql .= " ORDER BY o.date_added DESC";

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
		$allOrderIds = array();
		$allOrder = array();
		foreach ($query->rows as $order) {
			$allOrder[$order['order_id']][] = $order;
			$allOrderIds[] = $order['order_id'];
		}

		$sql = "SELECT * FROM `oc_order_history` WHERE `order_status_id` = '2' AND order_id IN ('".implode("','", $allOrderIds)."') AND `created_by` > '0'";
		$query = $this->db->query($sql);
		$allProcessing = array();
		foreach ($query->rows as $key => $value) {
			$allProcessing[$value['order_id']] = $value;
		}

		$sql = "SELECT * FROM oc_order_total WHERE order_id IN ('".implode("','", $allOrderIds)."')";
		$query = $this->db->query($sql);
		$allOrderTotals = array();
		foreach ($query->rows as $total) {
			$allOrderTotals[$total['order_id']][$total['code']] = $total['value'];
		}

		$sql = "SELECT * FROM `oc_order_option` WHERE name = 'Weight' AND order_id IN ('".implode("','", $allOrderIds)."') and value like '%kg%'";
		$query = $this->db->query($sql);
		$allWeight = array();
		foreach ($query->rows as $key => $value) {
			$allWeight[$value['order_id']] = $value['value'];
		}

		$all = array();

		$sql = "SELECT order_id, SUM(price) AS total_price FROM oc_order_product WHERE order_id IN ('".implode("','", $allOrderIds)."') GROUP BY order_id;";
		$query = $this->db->query($sql);
		$allProductPrice = array();
		foreach ($query->rows as $key => $value) {
			$allProductPrice[$value['order_id']] = $value['total_price'];
		}


		$sql = "SELECT date_added dd, order_id FROM oc_order_history WHERE order_id IN ('".implode("','", $allOrderIds)."') AND order_status_id = 7";
		$query = $this->db->query($sql);
		$allDD = array();
		foreach ($query->rows as $key => $value) {
			$allDD[$value['order_id']] = $value['dd'];
		}
		//echo "<pre >"; print_r($allDD); die;

		foreach ($allOrder as $key => $val) {
			foreach ($val as $value) {
				if(isset($allDD[$value['order_id']])){
					$dd = $allDD[$value['order_id']];	
					$delivered = "Yes";
				} else {
					$dd = '';
					$delivered = "No";
				}
				
				$del1 = '';
				$del2 = '';
				if(!empty($dd)){
					$del1 = date('d/m/Y', strtotime($dd));
					$del2 = date('H:s', strtotime($dd));
				}

				$ddate = '';
				$dtime = '';
				$dtype = '';
				$dcity = '';
				if(!empty($value['shipping_info'])){
					$shipinfo = json_decode($value['shipping_info']);
					$ddate = (!empty($shipinfo->{'Shipping Date'})) ? date('d/m/Y', strtotime($shipinfo->{'Shipping Date'})) : '';
					$dtime = $shipinfo->{'Shipping Time'};
					$dtype = $shipinfo->{'Shipping Type'};
					$dcity = $shipinfo->{'City'};
				}

				$dateadded = date('d/m/Y', strtotime($value['date_added']));
				$timeadded = date('H:s', strtotime($value['date_added']));

				$all[] = array('order_id' => $value['order_id'], 'name' => $value['name'], 'ddate' => $ddate, 'dtime' => $dtime, 'dtype' => $dtype, 'shipping_postcode' => $value['shipping_postcode'], 'dcity' => $dcity, 'payment_method' => $value['payment_method'], 'sku' => $value['model'], 'quantity' => $value['quantity'], 'price' => $value['price'], 'tax' => $value['tax'], 'afterGst' => $value['price'] + $value['tax'], 'total' => $value['ototal'], 'pp' => isset($value['pp_price']) && !empty($value['pp_price']) ? $value['pp_price'] : '', 'pp_total' => isset($allProductPrice[$value['order_id']]) && !empty($allProductPrice[$value['order_id']]) ? $allProductPrice[$value['order_id']] : '', 'status' => $allStatus[$value['status']]['name'], 'vendor' => $allUsers[$value['vendor_id']]['firstname'].' '.$allUsers[$value['vendor_id']]['lastname'], 'date' => $del1, 'time' => $del2, 'firstname' => $value['firstname'], 'lastname' => $value['lastname'], 'telephone' => $value['telephone'], 'dateadded' => $dateadded, 'timeadded' => $timeadded, 'transaction_id' => $value['custom_field'], 'is_admin_order' => $value['is_admin_order'], 'added_by' => $allUsers[$value['added_by']]['firstname'].' '.$allUsers[$value['added_by']]['lastname'], 'boy' => $allUsers[$value['boy_id']]['firstname'].' '.$allUsers[$value['boy_id']]['lastname'], 'processing' => $allUsers[$allProcessing[$value['order_id']]['created_by']]['firstname'].' '.$allUsers[$allProcessing[$value['order_id']]['created_by']]['lastname'], 'weight' => $allWeight[$value['order_id']], 'delivered' => $delivered, 'unit_discount' => $value['original_price'] - $value['price'], 'overall_discount' => isset($allOrderTotals[$value['order_id']]['coupon']) ? $allOrderTotals[$value['order_id']]['coupon'] : 0);
			}
		}
		//echo "<pre />"; print_r($all); die();
		return $all;
	}

	public function getOrdersDetailVendor($data = array()) {
		$sql = "SELECT * FROM oc_user";
		$query = $this->db->query($sql);
		$allUsers = array();
		foreach ($query->rows as $key => $value) {
			$allUsers[$value['user_id']] = $value;
		}

		$sql = "SELECT * FROM oc_order_status";
		$query = $this->db->query($sql);
		$allStatus = array();
		foreach ($query->rows as $key => $value) {
			$allStatus[$value['order_status_id']] = $value;
		}

		
		//echo "<pre />"; print_r($allProcessing['43174']['created_by']); die();
		$sql = "SELECT op.*, o.total ototal, o.vendor_id, o.order_status_id status, o.order_id, o.date_added, o.firstname, o.lastname, o.telephone, o.payment_method, o.shipping_postcode, o.custom_field, o.added_by, o.is_admin_order, o.boy_id FROM oc_order o INNER JOIN oc_order_product op ON o.order_id = op.order_id WHERE order_status_id > '0' AND o.vendor_id = '".$this->user->getId()."' ";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$sql .= " ORDER BY o.date_added DESC";

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
		$allOrderIds = array();
		$allOrder = array();
		foreach ($query->rows as $order) {
			$allOrder[$order['order_id']][] = $order;
			$allOrderIds[] = $order['order_id'];
		}

		$sql = "SELECT * FROM `oc_order_history` WHERE `order_status_id` = '2' AND order_id IN ('".implode("','", $allOrderIds)."') AND `created_by` > '0'";
		$query = $this->db->query($sql);
		$allProcessing = array();
		foreach ($query->rows as $key => $value) {
			$allProcessing[$value['order_id']] = $value;
		}

		$sql = "SELECT * FROM `oc_order_option` WHERE name = 'Weight' AND order_id IN ('".implode("','", $allOrderIds)."') and value like '%kg%'";
		$query = $this->db->query($sql);
		$allWeight = array();
		foreach ($query->rows as $key => $value) {
			$allWeight[$value['order_id']] = $value['value'];
		}

		$all = array();

		$sql = "SELECT order_id, SUM(price) AS total_price FROM oc_order_product WHERE order_id IN ('".implode("','", $allOrderIds)."') GROUP BY order_id;";
		$query = $this->db->query($sql);
		$allProductPrice = array();
		foreach ($query->rows as $key => $value) {
			$allProductPrice[$value['order_id']] = $value['total_price'];
		}


		$sql = "SELECT date_added dd, order_id FROM oc_order_history WHERE order_id IN ('".implode("','", $allOrderIds)."') AND order_status_id = 7";
		$query = $this->db->query($sql);
		$allDD = array();
		foreach ($query->rows as $key => $value) {
			$allDD[$value['order_id']] = $value['total_price'];
		}

		foreach ($allOrder as $key => $val) {
			foreach ($val as $value) {
				if(isset($allDD[$value['order_id']])){
					$dd = $allDD[$value['order_id']];	
					$delivered = "Yes";
				} else {
					$dd = '';
					$delivered = "No";
				}
				
				$del1 = '';
				$del2 = '';
				if(!empty($dd)){
					$del1 = date('d/m/Y', strtotime($dd));
					$del2 = date('H:s', strtotime($dd));
				}

				$ddate = '';
				$dtime = '';
				$dtype = '';
				$dcity = '';
				if(!empty($value['shipping_info'])){
					$shipinfo = json_decode($value['shipping_info']);
					$ddate = (!empty($shipinfo->{'Shipping Date'})) ? date('d/m/Y', strtotime($shipinfo->{'Shipping Date'})) : '';
					$dtime = $shipinfo->{'Shipping Time'};
					$dtype = $shipinfo->{'Shipping Type'};
					$dcity = $shipinfo->{'City'};
				}

				$dateadded = date('d/m/Y', strtotime($value['date_added']));
				$timeadded = date('H:s', strtotime($value['date_added']));

				$all[] = array('order_id' => $value['order_id'], 'name' => $value['name'], 'ddate' => $ddate, 'dtime' => $dtime, 'dtype' => $dtype, 'shipping_postcode' => $value['shipping_postcode'], 'dcity' => $dcity, 'payment_method' => $value['payment_method'], 'sku' => $value['model'], 'quantity' => $value['quantity'], 'price' => $value['price'], 'tax' => $value['tax'], 'afterGst' => $value['price'] + $value['tax'], 'total' => $value['ototal'], 'pp' => isset($value['pp_price']) && !empty($value['pp_price']) ? $value['pp_price'] : '', 'pp_total' => isset($allProductPrice[$value['order_id']]) && !empty($allProductPrice[$value['order_id']]) ? $allProductPrice[$value['order_id']] : '', 'status' => $allStatus[$value['status']]['name'], 'vendor' => $allUsers[$value['vendor_id']]['firstname'].' '.$allUsers[$value['vendor_id']]['lastname'], 'date' => $del1, 'time' => $del2, 'firstname' => $value['firstname'], 'lastname' => $value['lastname'], 'telephone' => $value['telephone'], 'dateadded' => $dateadded, 'timeadded' => $timeadded, 'transaction_id' => $value['custom_field'], 'is_admin_order' => $value['is_admin_order'], 'added_by' => $allUsers[$value['added_by']]['firstname'].' '.$allUsers[$value['added_by']]['lastname'], 'boy' => $allUsers[$value['boy_id']]['firstname'].' '.$allUsers[$value['boy_id']]['lastname'], 'processing' => $allUsers[$allProcessing[$value['order_id']]['created_by']]['firstname'].' '.$allUsers[$allProcessing[$value['order_id']]['created_by']]['lastname'], 'weight' => $allWeight[$value['order_id']]);
			}
		}
		//echo "<pre />"; print_r($all); die();
		return $all;
	}

	public function getOrdersDetailDelivered($data = array()) {
		$sql = "SELECT * FROM oc_user";
		$query = $this->db->query($sql);
		$allUsers = array();
		foreach ($query->rows as $key => $value) {
			$allUsers[$value['user_id']] = $value;
		}

		$sql = "SELECT * FROM oc_order_status";
		$query = $this->db->query($sql);
		$allStatus = array();
		foreach ($query->rows as $key => $value) {
			$allStatus[$value['order_status_id']] = $value;
		}

		$sql = "select product_id from oc_product where product_addon_status = 1";
		$query = $this->db->query($sql);
		$allAddOnProduct = array();
		foreach ($query->rows as $key => $value) {
			$allAddOnProduct[$value['product_id']] = $value;
		}
		//echo "<pre />"; print_r($allProcessing['43174']['created_by']); die();

		$sql = "SELECT oh.order_id FROM oc_order_history oh WHERE oh.order_status_id = '7' ";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(oh.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(oh.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$sql .= " ORDER BY oh.date_added DESC";
		$query = $this->db->query($sql);
		$allHistoryOrderIds = array();
		foreach ($query->rows as $order) {
			$allHistoryOrderIds[] = $order['order_id'];
		}


		$sql = "SELECT op.*, p.price as original_price, o.total ototal, o.vendor_id, o.order_status_id status, o.order_id, o.date_added, o.firstname, o.lastname, o.telephone, o.payment_method, o.shipping_postcode, o.custom_field, o.added_by, o.is_admin_order, o.boy_id FROM oc_order o INNER JOIN oc_order_product op ON o.order_id = op.order_id INNER JOIN oc_product p ON op.product_id = p.product_id WHERE o.order_id IN ('".implode("','", $allHistoryOrderIds)."')";

		$query = $this->db->query($sql);

		$allOrderIds = array();
		$allOrder = array();
		foreach ($query->rows as $order) {
			$allOrderIds[] = $order['order_id'];
			$allOrder[$order['order_id']][] = $order;
		}

		$sql = "SELECT * FROM oc_order_total WHERE order_id IN ('".implode("','", $allOrderIds)."')";
		$query = $this->db->query($sql);
		$allOrderTotals = array();
		foreach ($query->rows as $total) {
			$allOrderTotals[$total['order_id']][$total['code']] = $total['value'];
		}

		$sql = "SELECT * FROM `oc_order_history` WHERE `order_status_id` = '7' AND order_id IN ('".implode("','", $allOrderIds)."') AND `created_by` > '0'";
		$query = $this->db->query($sql);
		$allProcessing = array();
		foreach ($query->rows as $key => $value) {
			$allProcessing[$value['order_id']] = $value;
		}

		$sql = "SELECT * FROM `oc_order_option` WHERE name = 'Weight' AND order_id IN ('".implode("','", $allOrderIds)."') and value like '%kg%'";
		$query = $this->db->query($sql);
		$allWeight = array();
		foreach ($query->rows as $key => $value) {
			$allWeight[$value['order_id']] = $value['value'];
		}

		//echo "<pre />"; print_r($allOrder); die();
		$all = array();

		$sql = "SELECT order_id, SUM(price) AS total_price FROM oc_order_product WHERE order_id IN ('".implode("','", $allOrderIds)."') GROUP BY order_id;";
		$query = $this->db->query($sql);
		$allProductPrice = array();
		foreach ($query->rows as $key => $value) {
			$allProductPrice[$value['order_id']] = $value['total_price'];
		}


		$sql = "SELECT date_added dd, order_id FROM oc_order_history WHERE order_id IN ('".implode("','", $allOrderIds)."') AND order_status_id = 7";
		$query = $this->db->query($sql);
		$allDD = array();
		foreach ($query->rows as $key => $value) {
			$allDD[$value['order_id']] = $value['dd'];
		}

		foreach ($allOrder as $key => $val) {
			foreach ($val as $value) {
				if(isset($allDD[$value['order_id']])){
					$dd = $allDD[$value['order_id']];	
					$delivered = "Yes";
				} else {
					$dd = '';
					$delivered = "No";
				}
				
				$del1 = '';
				$del2 = '';
				if(!empty($dd)){
					$del1 = date('d/m/Y', strtotime($dd));
					$del2 = date('H:i', strtotime($dd));
				}

				$ddate = '';
				$dtime = '';
				$dtype = '';
				$dcity = '';
				if(!empty($value['shipping_info'])){
					$shipinfo = json_decode($value['shipping_info']);
					$ddate = (!empty($shipinfo->{'Shipping Date'})) ? date('d/m/Y', strtotime($shipinfo->{'Shipping Date'})) : '';
					$dtime = $shipinfo->{'Shipping Time'};
					$dtype = $shipinfo->{'Shipping Type'};
					$dcity = $shipinfo->{'City'};
				} else {
					continue;
				}

				$weight = "";
				if(!isset($allAddOnProduct[$value['product_id']])){
					$weight = $allWeight[$value['order_id']];
				}

				$dateadded = date('d/m/Y', strtotime($value['date_added']));
				$timeadded = date('H:i:s', strtotime($value['date_added']));

				$all[] = array('order_id' => $value['order_id'], 'name' => $value['name'], 'ddate' => $ddate, 'dtime' => $dtime, 'dtype' => $dtype, 'shipping_postcode' => $value['shipping_postcode'], 'dcity' => $dcity, 'payment_method' => $value['payment_method'], 'sku' => $value['model'], 'quantity' => $value['quantity'], 'price' => $value['price'], 'tax' => $value['tax'], 'afterGst' => $value['price'] + $value['tax'], 'total' => $value['ototal'], 'pp' => isset($value['pp_price']) && !empty($value['pp_price']) ? $value['pp_price'] : '', 'pp_total' => isset($allProductPrice[$value['order_id']]) && !empty($allProductPrice[$value['order_id']]) ? $allProductPrice[$value['order_id']] : '', 'status' => $allStatus[$value['status']]['name'], 'vendor' => $allUsers[$value['vendor_id']]['firstname'].' '.$allUsers[$value['vendor_id']]['lastname'], 'date' => $del1, 'time' => $del2, 'firstname' => $value['firstname'], 'lastname' => $value['lastname'], 'telephone' => $value['telephone'], 'dateadded' => $dateadded, 'timeadded' => $timeadded, 'transaction_id' => $value['custom_field'], 'is_admin_order' => $value['is_admin_order'], 'added_by' => $allUsers[$value['added_by']]['firstname'].' '.$allUsers[$value['added_by']]['lastname'], 'boy' => $allUsers[$value['boy_id']]['firstname'].' '.$allUsers[$value['boy_id']]['lastname'], 'processing' => $allUsers[$allProcessing[$value['order_id']]['created_by']]['firstname'].' '.$allUsers[$allProcessing[$value['order_id']]['created_by']]['lastname'], 'delivered_at' => $value['delivered_at'], 'weight' => $weight, 'unit_discount' => $value['original_price'] - $value['price'], 'overall_discount' => isset($allOrderTotals[$value['order_id']]['coupon']) ? $allOrderTotals[$value['order_id']]['coupon'] : 0);
			}
		}
		//echo "<pre />"; print_r($all); die();
		return $all;
	}

	public function getOrdersDetailDeliveredVendor($data = array()) {
		$sql = "SELECT * FROM oc_user";
		$query = $this->db->query($sql);
		$allUsers = array();
		foreach ($query->rows as $key => $value) {
			$allUsers[$value['user_id']] = $value;
		}

		$sql = "SELECT * FROM oc_order_status";
		$query = $this->db->query($sql);
		$allStatus = array();
		foreach ($query->rows as $key => $value) {
			$allStatus[$value['order_status_id']] = $value;
		}

		$sql = "SELECT * FROM `oc_order_history` WHERE `order_status_id` = '7' AND `created_by` > '0'";
		$query = $this->db->query($sql);
		$allProcessing = array();
		foreach ($query->rows as $key => $value) {
			$allProcessing[$value['order_id']] = $value;
		}

		$sql = "SELECT * FROM `oc_order_option` WHERE name = 'Weight' and value like '%kg%'";
		$query = $this->db->query($sql);
		$allWeight = array();
		foreach ($query->rows as $key => $value) {
			$allWeight[$value['order_id']] = $value['value'];
		}
		//echo "<pre />"; print_r($allProcessing['43174']['created_by']); die();
		$sql = "SELECT op.*, o.total ototal, o.vendor_id, o.order_status_id status, o.order_id, o.date_added, o.firstname, o.lastname, o.telephone, o.payment_method, o.shipping_postcode, o.custom_field, o.added_by, o.is_admin_order, o.boy_id, oh.date_added delivered_at FROM oc_order o INNER JOIN oc_order_product op ON o.order_id = op.order_id INNER JOIN oc_order_history oh ON o.order_id = oh.order_id WHERE oh.order_status_id = '7' AND o.vendor_id = '".$this->user->getId()."'";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(oh.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(oh.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$sql .= " GROUP BY oh.order_id ORDER BY oh.date_added DESC";

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		//echo $sql;
		$query = $this->db->query($sql);

		$allOrder = array();
		foreach ($query->rows as $order) {

			$allOrder[$order['order_id']][] = $order;
		}
		//echo "<pre />"; print_r($allOrder); die();
		$all = array();
		foreach ($allOrder as $key => $val) {
			foreach ($val as $value) {
				$sql = "SELECT SUM(pp_price) ppsm FROM oc_order_product WHERE order_id = '".$key."'";
				$query = $this->db->query($sql);
				$ppsm = $query->row;

				$sql = "SELECT date_added dd FROM oc_order_history WHERE order_id = '".$key."' AND order_status_id = 7";
				$query = $this->db->query($sql);
				$dd = $query->row;
				$del1 = '';
				$del2 = '';
				if(isset($dd['dd']) && !empty($dd['dd'])){
					$del1 = date('d/m/Y', strtotime($dd['dd']));
					$del2 = date('H:i:s', strtotime($dd['dd']));
				}

				$ddate = '';
				$dtime = '';
				$dtype = '';
				$dcity = '';
				if(!empty($value['shipping_info'])){
					$shipinfo = json_decode($value['shipping_info']);
					$ddate = (!empty($shipinfo->{'Shipping Date'})) ? date('d/m/Y', strtotime($shipinfo->{'Shipping Date'})) : '';
					$dtime = $shipinfo->{'Shipping Time'};
					$dtype = $shipinfo->{'Shipping Type'};
					$dcity = $shipinfo->{'City'};
				} else {
					continue;
				}

				$dateadded = date('d/m/Y', strtotime($value['date_added']));
				$timeadded = date('H:i:s', strtotime($value['date_added']));

				$all[] = array('order_id' => $value['order_id'], 'name' => $value['name'], 'ddate' => $ddate, 'dtime' => $dtime, 'dtype' => $dtype, 'shipping_postcode' => $value['shipping_postcode'], 'dcity' => $dcity, 'payment_method' => $value['payment_method'], 'sku' => $value['model'], 'quantity' => $value['quantity'], 'price' => $value['price'], 'tax' => $value['tax'], 'afterGst' => $value['price'] + $value['tax'], 'total' => $value['ototal'], 'pp' => isset($value['pp_price']) && !empty($value['pp_price']) ? $value['pp_price'] : '', 'pp_total' => isset($ppsm['ppsm']) && !empty($ppsm['ppsm']) ? $ppsm['ppsm'] : '', 'status' => $allStatus[$value['status']]['name'], 'vendor' => $allUsers[$value['vendor_id']]['firstname'].' '.$allUsers[$value['vendor_id']]['lastname'], 'date' => $del1, 'time' => $del2, 'firstname' => $value['firstname'], 'lastname' => $value['lastname'], 'telephone' => $value['telephone'], 'dateadded' => $dateadded, 'timeadded' => $timeadded, 'transaction_id' => $value['custom_field'], 'is_admin_order' => $value['is_admin_order'], 'added_by' => $allUsers[$value['added_by']]['firstname'].' '.$allUsers[$value['added_by']]['lastname'], 'boy' => $allUsers[$value['boy_id']]['firstname'].' '.$allUsers[$value['boy_id']]['lastname'], 'processing' => $allUsers[$allProcessing[$value['order_id']]['created_by']]['firstname'].' '.$allUsers[$allProcessing[$value['order_id']]['created_by']]['lastname'], 'delivered_at' => $value['delivered_at'], 'weight' => $allWeight[$value['order_id']]);
			}
		}
		//echo "<pre />"; print_r($all); die();
		return $all;
	}

	public function getTotalOrdersDetail($data = array()) {
		$sql = "SELECT count(*) total FROM oc_order o INNER JOIN oc_order_product op ON o.order_id = op.order_id WHERE order_status_id > '0'";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getOrdersDetailn($data = array()) {
		$sql = "SELECT * FROM oc_user";
		$query = $this->db->query($sql);
		$allUsers = array();
		foreach ($query->rows as $key => $value) {
			$allUsers[$value['user_id']] = $value;
		}

		$sql = "SELECT * FROM oc_order_status";
		$query = $this->db->query($sql);
		$allStatus = array();
		foreach ($query->rows as $key => $value) {
			$allStatus[$value['order_status_id']] = $value;
		}

		$sql = "SELECT op.*, o.total ototal, o.vendor_id, o.order_status_id status, o.order_id, o.shipping_firstname, o.shipping_lastname,  o.shipping_postcode, o.payment_method FROM oc_order o INNER JOIN oc_order_product op ON o.order_id = op.order_id WHERE o.vendor_id = '".$this->user->getId()."'";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$sql .= " ORDER BY o.date_added DESC";

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

		$allOrder = array();
		foreach ($query->rows as $order) {
			$allOrder[$order['order_id']][] = $order;
		}

		$all = array();
		foreach ($allOrder as $key => $val) {
			foreach ($val as $value) {
				$sql = "SELECT SUM(pp_price) ppsm FROM oc_order_product WHERE order_id = '".$key."'";
				$query = $this->db->query($sql);
				$ppsm = $query->row;

				$sql = "SELECT date_added dd FROM oc_order_history WHERE order_id = '".$key."' AND order_status_id = 7";
				$query = $this->db->query($sql);
				$dd = $query->row;
				$del1 = '';
				$del2 = '';
				if(isset($dd['dd']) && !empty($dd['dd'])){
					$del1 = date('d-M', strtotime($dd['dd']));
					$del2 = date('H:s', strtotime($dd['dd']));
				}

				$ddate = '';
				$dtime = '';
				$dtype = '';
				$dcity = '';
				if(!empty($value['shipping_info'])){
					$shipinfo = json_decode($value['shipping_info']);
					$ddate = $shipinfo->{'Shipping Date'};
					$dtime = $shipinfo->{'Shipping Time'};
					$dtype = $shipinfo->{'Shipping Type'};
					$dcity = $shipinfo->{'City'};
				}

				$all[] = array('order_id' => $value['order_id'], 'name' => $value['shipping_firstname'].' '.$value['shipping_lastname'], 'ddate' => $ddate, 'dtime' => $dtime, 'dtype' => $dtype, 'shipping_postcode' => $value['shipping_postcode'], 'dcity' => $dcity, 'payment_method' => $value['payment_method'], 'pname' => $value['name'], 'sku' => $value['sku'], 'quantity' => $value['quantity'], 'pp' => isset($value['pp_price']) && !empty($value['pp_price']) ? $value['pp_price'] : '', 'pp_total' => isset($ppsm['ppsm']) && !empty($ppsm['ppsm']) ? $ppsm['ppsm'] : '', 'status' => $allStatus[$value['status']]['name'], 'vendor' => $allUsers[$value['vendor_id']]['firstname'].' '.$allUsers[$value['vendor_id']]['lastname'], 'date' => $del1, 'time' => $del2);
			}
		}
		//echo "<pre />"; print_r($all); die();
		return $all;
	}

	public function getTotalOrdersDetailn($data = array()) {
		$sql = "SELECT count(*) total FROM oc_order o INNER JOIN oc_order_product op ON o.order_id = op.order_id WHERE o.vendor_id = '".$this->user->getId()."'";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTaxes($data = array()) {
		$sql = "SELECT MIN(o.date_added) AS date_start, MAX(o.date_added) AS date_end, ot.title, SUM(ot.value) AS total, COUNT(o.order_id) AS `orders` FROM `" . DB_PREFIX . "order` o LEFT JOIN `" . DB_PREFIX . "order_total` ot ON (ot.order_id = o.order_id) WHERE ot.code = 'tax'";

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " AND o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " AND o.order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if (!empty($data['filter_group'])) {
			$group = $data['filter_group'];
		} else {
			$group = 'week';
		}

		switch($group) {
			case 'day';
				$sql .= " GROUP BY YEAR(o.date_added), MONTH(o.date_added), DAY(o.date_added), ot.title";
				break;
			default:
			case 'week':
				$sql .= " GROUP BY YEAR(o.date_added), WEEK(o.date_added), ot.title";
				break;
			case 'month':
				$sql .= " GROUP BY YEAR(o.date_added), MONTH(o.date_added), ot.title";
				break;
			case 'year':
				$sql .= " GROUP BY YEAR(o.date_added), ot.title";
				break;
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

		return $query->rows;
	}

	public function getTotalTaxes($data = array()) {
		if (!empty($data['filter_group'])) {
			$group = $data['filter_group'];
		} else {
			$group = 'week';
		}

		switch($group) {
			case 'day';
				$sql = "SELECT COUNT(DISTINCT YEAR(o.date_added), MONTH(o.date_added), DAY(o.date_added), ot.title) AS total FROM `" . DB_PREFIX . "order` o";
				break;
			default:
			case 'week':
				$sql = "SELECT COUNT(DISTINCT YEAR(o.date_added), WEEK(o.date_added), ot.title) AS total FROM `" . DB_PREFIX . "order` o";
				break;
			case 'month':
				$sql = "SELECT COUNT(DISTINCT YEAR(o.date_added), MONTH(o.date_added), ot.title) AS total FROM `" . DB_PREFIX . "order` o";
				break;
			case 'year':
				$sql = "SELECT COUNT(DISTINCT YEAR(o.date_added), ot.title) AS total FROM `" . DB_PREFIX . "order` o";
				break;
		}

		$sql .= " LEFT JOIN `" . DB_PREFIX . "order_total` ot ON (o.order_id = ot.order_id) WHERE ot.code = 'tax'";

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " AND o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " AND o.order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getShipping($data = array()) {
		$sql = "SELECT MIN(o.date_added) AS date_start, MAX(o.date_added) AS date_end, ot.title, SUM(ot.value) AS total, COUNT(o.order_id) AS `orders` FROM `" . DB_PREFIX . "order` o LEFT JOIN `" . DB_PREFIX . "order_total` ot ON (o.order_id = ot.order_id) WHERE ot.code = 'shipping'";

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " AND o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " AND o.order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if (!empty($data['filter_group'])) {
			$group = $data['filter_group'];
		} else {
			$group = 'week';
		}

		switch($group) {
			case 'day';
				$sql .= " GROUP BY YEAR(o.date_added), MONTH(o.date_added), DAY(o.date_added), ot.title";
				break;
			default:
			case 'week':
				$sql .= " GROUP BY YEAR(o.date_added), WEEK(o.date_added), ot.title";
				break;
			case 'month':
				$sql .= " GROUP BY YEAR(o.date_added), MONTH(o.date_added), ot.title";
				break;
			case 'year':
				$sql .= " GROUP BY YEAR(o.date_added), ot.title";
				break;
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

		return $query->rows;
	}

	public function getTotalShipping($data = array()) {
		if (!empty($data['filter_group'])) {
			$group = $data['filter_group'];
		} else {
			$group = 'week';
		}

		switch($group) {
			case 'day';
				$sql = "SELECT COUNT(DISTINCT YEAR(o.date_added), MONTH(o.date_added), DAY(o.date_added), ot.title) AS total FROM `" . DB_PREFIX . "order` o";
				break;
			default:
			case 'week':
				$sql = "SELECT COUNT(DISTINCT YEAR(o.date_added), WEEK(o.date_added), ot.title) AS total FROM `" . DB_PREFIX . "order` o";
				break;
			case 'month':
				$sql = "SELECT COUNT(DISTINCT YEAR(o.date_added), MONTH(o.date_added), ot.title) AS total FROM `" . DB_PREFIX . "order` o";
				break;
			case 'year':
				$sql = "SELECT COUNT(DISTINCT YEAR(o.date_added), ot.title) AS total FROM `" . DB_PREFIX . "order` o";
				break;
		}

		$sql .= " LEFT JOIN `" . DB_PREFIX . "order_total` ot ON (o.order_id = ot.order_id) WHERE ot.code = 'shipping'";

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " AND order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " AND order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
}