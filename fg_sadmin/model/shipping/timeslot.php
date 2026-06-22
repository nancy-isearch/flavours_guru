<?php
class ModelshippingTimeslot extends Model {
	public function addtimeslot($data) {
		$query = $this->db->query("INSERT INTO " . DB_PREFIX . "timeslot_shipping SET name = '" . $this->db->escape($data['timeslotname']) . "', timeslot_from = '" . $data['datefrom'] . "',timeslot_to = '" . $data['dateto'] . "',status = '" . (int)$data['status'] . "'");

		if($query)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public function edittimeslot($timeslot_id, $data) {
		
		$query =	$this->db->query("UPDATE " . DB_PREFIX . "timeslot_shipping SET name = '" . $this->db->escape($data['timeslotname']) . "', timeslot_from = '" . $data['datefrom'] . "',timeslot_to = '" . $data['dateto'] . "',status = '" . (int)$data['status'] . "' WHERE id = '" . (int)$timeslot_id . "'");
		
		if($query)
		{
			return true;
		}
		else
		{
			return false;
		}

		$this->cache->delete('timeslot');
	}

	public function deletetimeslot($timeslot_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "timeslot_shipping WHERE id = '" . (int)$timeslot_id . "'");
		
		//$this->cache->delete('timeslot');
	}

	public function gettimeslotbyID($timeslot_id) {
		
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "timeslot_shipping WHERE id = '" . (int)$timeslot_id . "'");
		return $query->row;
	}

	

	public function getallcities() {
		$allcities = array();
		$query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "timeslot_shipping");
		$allcities = $query->rows;
		return $allcities;
	}

	

	public function getTotalShippingslot($data = array()) {
		
		$sql = "SELECT COUNT(DISTINCT id) AS total FROM " . DB_PREFIX . "timeslot_shipping";

		//$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getShippingslot($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "timeslot_shipping";

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
