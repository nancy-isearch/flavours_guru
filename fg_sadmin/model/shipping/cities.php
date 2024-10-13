<?php
class ModelShippingCities extends Model {
public function addCities($data) {
	$query = $this->db->query("INSERT INTO " . DB_PREFIX . "shipping_cities SET name = '" . $this->db->escape($data['model']) . "', display_name = '" . $this->db->escape($data['display_name']) . "', holidays = '" . $this->db->escape($data['holidays']) . "',  status = '" . (int)$data['status'] ."'");

		if($query)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public function editCity($city_id, $data) {

		$query = $this->db->query("UPDATE " . DB_PREFIX . "shipping_cities SET name = '" . $this->db->escape($data['model']) . "', display_name = '" . $this->db->escape($data['display_name']) . "', holidays = '" . $this->db->escape($data['holidays']) . "', status = '" . (int)$data['status'] . "' WHERE id = '" . (int)$city_id . "'");

		if($query)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public function deletecities($city_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "shipping_cities WHERE id = '" . (int)$city_id . "'");
		//$this->cache->delete('product');
	}

	public function getcity($city_id) {
		//$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "shipping_cities WHERE id = '" . (int)$city_id . "' ");
	$query = $this->db->query("select c.* from ".DB_PREFIX."shipping_cities as c WHERE id = '" . (int)$city_id . "' ");
		return $query->row;
	}

	public function getCities($data = array()) {
		$sql = "select c.* from ".DB_PREFIX."shipping_cities c";
		
		if (!empty($data['filter_name'])) {
			$sql .= " WHERE c.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY id";
		
		$sort_data = array(
			'name',
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
		return	$query->rows;
		
	}


	public function getTotalCities($data = array()) 
	{
		$sql = "SELECT COUNT(DISTINCT id) AS total FROM " . DB_PREFIX . "shipping_cities ";
		if (!empty($data['filter_name'])) 
		{
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	public function getCitiesforPin($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "shipping_cities ";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getPincodesFromCity($city_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "shipping_pincodes WHERE shipping_cities_id = '".$city_id."'";
		$query = $this->db->query($sql);
		return $query->rows;	
	}

	public function downloadallpincode(){
		$sql = "SELECT *, p.id pincodeid, p.status pstatus, p.pincode ppin FROM " . DB_PREFIX . "shipping_pincodes p inner join oc_shipping_cities c ON p.shipping_cities_id = c.id";
		$query = $this->db->query($sql);
		return $query->rows;	
	}

	public function updatePincodesFromCity($city_id, $csv){
		foreach ($csv as $c) {
			$sql = "SELECT * FROM " . DB_PREFIX . "shipping_pincodes WHERE shipping_cities_id = '".$city_id."' AND pincode = '".$c[0]."'";
			$query = $this->db->query($sql);
			if(count($query->rows) > 0){
				$sql = "UPDATE " . DB_PREFIX . "shipping_pincodes SET status = '".$c[1]."', updated_by = '".$this->user->getId()."', updated_at=NOW() WHERE shipping_cities_id = '".$city_id."' AND pincode = '".$c[0]."'";
				$this->db->query($sql);
			} else {
				$sql = "INSERT INTO " . DB_PREFIX . "shipping_pincodes SET pincode = '".$c[0]."', status = '".$c[1]."', shipping_cities_id = '".$city_id."', added_by = '".$this->user->getId()."', added_at=NOW()";
				$this->db->query($sql);
			}
		}
	}
}
