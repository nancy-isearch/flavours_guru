<?php
class ModelshippingCitiesGroup extends Model {
	public function editCity($group_id, $data) {

		 $this->db->query("UPDATE " . DB_PREFIX . "shipping_citygp SET name = '" . $this->db->escape($data['citygpname']) . "' WHERE id = '" . (int)$group_id . "'");
		
			$this->db->query("DELETE FROM " . DB_PREFIX . "shipping_citygrp_to_city WHERE city_grp_id = '" . (int)$group_id . "'");

		foreach($data['city'] as $cityIds)	
		{
			$query2 =$this->db->query("INSERT INTO " . DB_PREFIX . "shipping_citygrp_to_city SET city_id = '" . (int)$cityIds . "', city_grp_id = '" .$group_id. "'");

		}
		$this->cache->delete('cities_group');
	}

	public function deletecitygp($citygp_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "shipping_citygp WHERE id = '" . (int)$citygp_id . "'");
		
		$this->cache->delete('cities_group');
	}

	public function getgpcitybyID($group_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "shipping_citygp WHERE id = '" . (int)$group_id . "'");
		foreach ($query->rows as $row) {
			$data = array();
			$data['city_grp_id'] = $row['id'];
			$data['city_grp_name'] = $row['name'];
			$data['gp_city_id'] = "";
			$rw = $this->db->query("SELECT sc.id FROM oc_shipping_cities sc, oc_shipping_citygrp_to_city ctc WHERE sc.id = ctc.city_id AND ctc.city_grp_id = '".$row['id']."'");
			if($rw->num_rows == 0){
				$data['gp_city_id'] = "";
			} else {
				foreach ($rw->rows as $val) 
				{
					$data['gp_city_id'] .= $val['id'].", ";
				}
			}
			$result[] = $data;
		}
		return $result;
		//return $query->row;
	}

	public function getallcities() {
		$allcities = array();
		$query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "shipping_cities");
		$allcities = $query->rows;
		return $allcities;
	}

	public function addcitygp($data){

		
		$query =$this->db->query("INSERT INTO " . DB_PREFIX . "shipping_citygp SET name = '" . $this->db->escape($data['citygpname']) . "'");

		if($query)
		{
			$getLastId =	$this->db->getLastId();
			foreach($data['city'] as $city )
			{
			$query2 =$this->db->query("INSERT INTO " . DB_PREFIX . "shipping_citygrp_to_city SET city_id = '" . (int)$city . "', city_grp_id = '" .$getLastId. "'");	
			//print_r($query2);
			}

		}
		

	}

	public function getTotalCitiesgp($data = array()) {
		
		$sql = "SELECT COUNT(DISTINCT id) AS total FROM " . DB_PREFIX . "shipping_citygp";

		//$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getCitiesgp($data = array()) {
		//$sql = "SELECT sc.*, sctc.city_id as sctcID, sctc.city_grp_id, osc.id as oscID,osc.name as oscname from oc_shipping_citygp as sc inner join oc_shipping_citygrp_to_city as sctc on sc.id = sctc.city_grp_id inner join oc_shipping_cities as osc on sctc.city_id = osc.id";

		$sql = "SELECT * FROM ".DB_PREFIX."shipping_citygp";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "'";
		}

		$sort_data = array(
			'name'	);

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
		
		foreach ($query->rows as $row) {
			$data = array();
			$data['city_grp_id'] = $row['id'];
			$data['city_grp_name'] = $row['name'];
			$data['gp_city_name'] = "";
			$rw = $this->db->query("SELECT sc.name FROM oc_shipping_cities sc, oc_shipping_citygrp_to_city ctc WHERE sc.id = ctc.city_id AND ctc.city_grp_id = '".$row['id']."'");
			if($rw->num_rows == 0){
				$data['gp_city_name'] = "";
			} else {
				foreach ($rw->rows as $val) 
				{
					$data['gp_city_name'] .= $val['name'].", ";
				}
			}
				$rslt[] = $data;
			}
			return $rslt;
			
	}

}