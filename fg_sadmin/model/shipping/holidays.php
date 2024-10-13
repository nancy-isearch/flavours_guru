<?php
class ModelshippingHolidays extends Model {
	public function addholiday($data) {
		$query	=	$this->db->query("INSERT INTO " . DB_PREFIX . "shipping_holidays SET name = '" . $this->db->escape($data['shippingholidayname']) . "', date = '" . $data['date_available'] . "', status = '" . (int)$data['status'] . "'");

		if($query)
		{
			return true;
		}
		else
		{
			return false;
		}

		$this->cache->delete('holidays');

	}

	public function editholiday($group_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "shipping_holidays SET name = '" . $this->db->escape($data['shippingholidayname']) . "', date = '" . $data['date_available'] . "',status = '" . (int)$data['status'] . "' WHERE id = '" . (int)$group_id . "'");

		$this->cache->delete('cities_group');
	}

	public function deleteholiday($holiday_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "shipping_holidays WHERE id = '" . (int)$holiday_id . "'");
		
		$this->cache->delete('holidays');
	}

	public function getholidays($group_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "shipping_holidays WHERE id = '" . (int)$group_id . "'");

		return $query->row;
	}

	public function gettotalholidays($data = array()) {
		
		$sql = "SELECT COUNT(DISTINCT id) AS total FROM " . DB_PREFIX . "shipping_holidays";

		//$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getholidaydata($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "shipping_holidays";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "'";
		}

		$sql .= " GROUP BY id";

		$sort_data = array(
			'name',
			'state',
			'country',
			'pincode',
			'status'
		);

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

		$query = $this->db->query($sql);

		return $query->rows;
	}

}
