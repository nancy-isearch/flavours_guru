<?php
class ModelAccountSearch extends Model {
	public function addSearch($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "customer_search` SET `store_id` = '" . (int)$this->config->get('config_store_id') . "', `language_id` = '" . (int)$this->config->get('config_language_id') . "', `customer_id` = '" . (int)$data['customer_id'] . "', `keyword` = '" . $this->db->escape($data['keyword']) . "', `category_id` = '" . (int)$data['category_id'] . "', `sub_category` = '" . (int)$data['sub_category'] . "', `description` = '" . (int)$data['description'] . "', `products` = '" . (int)$data['products'] . "', `ip` = '" . $this->db->escape($data['ip']) . "', `date_added` = NOW()");
	}


	public function searchProducts($data){
		 
		$query = $this->db->query("SELECT name,product_id FROM  " . DB_PREFIX . "product_description WHERE tag like '%$data%' OR  name like '%$data%' ORDER BY name");
		if($query->num_rows > 0){
			 return $query->rows;
			} else {
 			 return false;
			}
		 
	}

	public function searchCategory($data){
		 
		$query = $this->db->query("SELECT name, category_id FROM  " . DB_PREFIX . "category_description WHERE name like '%$data%' ORDER BY name");
		if($query->num_rows > 0){
			 return $query->rows;
			} else {
 			 return false;
			}
		 
	}
}
