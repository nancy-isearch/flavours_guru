<?php
class ModelshippingType extends Model {
	public function addtype($data) {

		$query = $this->db->query("INSERT INTO " . DB_PREFIX . "shipping_type SET name = '" . $this->db->escape($data['typename']) . "', description = '" . $this->db->escape($data['typedescription']) . "',duration = '" . $data['duration'] . "',city_group_id = '" . $data['citygroup'] . "',shipping_charge = '" . $data['shippingcharge'] . "',active = '" . (int)$data['status'] . "',buffertime ='".$data['buffertime']."',leadtime ='".$data['leadtime']."'");

		return $this->db->getlastid();
	 
	} 

	public function addshippingTimeSlot($shipping_id,$timeslote_id) {
		  $query = $this->db->query("INSERT INTO " . DB_PREFIX . "shipping_to_timeslote SET shipping_id = '" . $shipping_id . "',timeslote_id = '" . $timeslote_id . "' "); 
	}

 	public function deleteShippingTimeSlot($id) {
 		 $query = $this->db->query("DELETE FROM " . DB_PREFIX . "shipping_to_timeslote WHERE shipping_id = '" . $id . "' ");  
 	}
	  
  
	public function edittype($type_id, $data) {
 

		$query =	$this->db->query("UPDATE " . DB_PREFIX . "shipping_type SET name = '" . $this->db->escape($data['typename']) . "', description = '" . $this->db->escape($data['typedescription']) . "',duration = '" . $data['duration'] . "',city_group_id = '" . $data['citygroup'] . "',	shipping_holyday = '" . $data['shipping_holyday'] . "', shipping_charge = '" . $data['shippingcharge'] . "',active = '" . (int)$data['status'] . "',buffertime ='".$data['buffertime']."',leadtime ='".$data['leadtime']."' WHERE id = '" . (int)$type_id ."'");
		
		$this->cache->delete('type');
	}

	public function deletetype($type_id) {
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "shipping_type WHERE id = '" . (int)$type_id . "'");
		
		//$this->cache->delete('type');
	}

	public function gettypebyID($type_id) {
		
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "shipping_type WHERE id = '" . (int)$type_id . "'");
		return $query->row;
	}

	public function getTotalShippingslot($data = array()) {
		
		$sql = "SELECT COUNT(DISTINCT id) AS total FROM " . DB_PREFIX . "shipping_type";

		//$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	} 

	public function getShippingslot($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "shipping_type";

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

	public function getcitygroup($id=false){

		$allcities = array();
		if($id){
			$query = $this->db->query("SELECT name  FROM " . DB_PREFIX . "shipping_citygp where id=".$id."");
			$allcities = $query->row;
		} else {
			$query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "shipping_citygp");
			$allcities = $query->rows;
			
		}
		return $allcities;
	
	}
	
	public function getshippingholiday($id=false)
	{

		$shippingholidays = array();
		if($id){
			$query = $this->db->query("SELECT name  FROM " . DB_PREFIX . "shipping_holidays where id=".$id."");
			$shippingholidays = $query->row;
		} else {
			$query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "shipping_holidays");
			$shippingholidays = $query->rows;
		}
		return $shippingholidays;
	}

	public function gettimeslot(){

		$timeslot = array();
		$query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "timeslot_shipping");
		$timeslot = $query->rows;
		return $timeslot;

	}
	public function getshiptimeslot($id=false){

		$timeslot = array(); 
		$query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "shipping_to_timeslote where shipping_id=".$id."");
		$timeslot = $query->rows;
		return $timeslot;

	}
	
}
