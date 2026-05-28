<?php
class ModelCatalogCategory extends Model {
	public function getCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row;
	}

	public function getAllCategoriesTree() {
		$query = $this->db->query("
			SELECT c.category_id, c.top, c.column, cmprt.parent_id, cd.name, c.sort_order
			FROM " . DB_PREFIX . "category c
			LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id)
			LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id)
			LEFT JOIN " . DB_PREFIX . "category_multiparent cmprt ON (c.category_id = cmprt.category_id)
			WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "'
			  AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
			  AND c.status = '1'
			ORDER BY c.sort_order, LCASE(cd.name)
		");

		$category_data = array();
		
		foreach ($query->rows as $row) {
			$parent_id = (int)$row['parent_id'];
			if (!isset($category_data[$parent_id])) {
				$category_data[$parent_id] = array();
			}
			$category_data[$parent_id][] = $row;
		}

		return $category_data;
	}

	public function getCategories($parent_id = 0) {
		/*echo "SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)"; */
		/*$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order");*/

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_multiparent c2s ON (c.category_id = c2s.category_id) WHERE c2s.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c.status = '1' ORDER BY c.sort_order");
		
		return $query->rows;
	}

	public function getMultiParentCategory($id){
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "category_multiparent c WHERE c.id = '" . (int)$id . "'");
		return $query->row;
	}


	public function getpathId($category_id){
	
		$query = $this->db->query("SELECT path_id FROM `oc_category_path` WHERE category_id = '" . (int)$category_id . "'");
		return $query->rows;
	}

	public function getCategoryFilters($category_id, $filter = "") {
		// Step 1: get all filter_ids for this category in one query
		$filter_id_query = $this->db->query("SELECT DISTINCT pf.filter_id FROM " . DB_PREFIX . "product_filter pf, " . DB_PREFIX . "product_to_category p2c WHERE pf.product_id = p2c.product_id AND p2c.category_id = '" . (int)$category_id . "'");

		$implode = array();
		foreach ($filter_id_query->rows as $result) {
			$implode[] = (int)$result['filter_id'];
		}

		if (empty($implode)) {
			return array();
		}

		$ids_str = implode(',', $implode);

		// Step 2: single query fetches all groups + their filters together (eliminates N+1)
		$query = $this->db->query("SELECT f.filter_group_id, fgd.name AS group_name, fg.sort_order AS group_sort_order, f.filter_id, fd.name AS filter_name, f.sort_order AS filter_sort_order FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_group fg ON (f.filter_group_id = fg.filter_group_id) LEFT JOIN " . DB_PREFIX . "filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id) LEFT JOIN " . DB_PREFIX . "filter_description fd ON (f.filter_id = fd.filter_id) WHERE f.filter_id IN (" . $ids_str . ") AND fgd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY fg.sort_order, LCASE(fgd.name), f.sort_order, LCASE(fd.name)");

		$groups = array();
		foreach ($query->rows as $row) {
			$gid = $row['filter_group_id'];
			if (!isset($groups[$gid])) {
				$groups[$gid] = array(
					'filter_group_id' => $gid,
					'name'            => $row['group_name'],
					'filter'          => array()
				);
			}
			$groups[$gid]['filter'][] = array(
				'filter_id' => $row['filter_id'],
				'name'      => $row['filter_name']
			);
		}

		return array_values($groups);
	}

	public function getCategoryLayoutId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_layout WHERE category_id = '" . (int)$category_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}

	public function getTotalCategoriesByCategoryId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row['total'];
	}

	public function getMultiParentCategories($parent_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) LEFT JOIN " . DB_PREFIX . "category_multiparent cmprt ON (c.category_id = cmprt.category_id) WHERE cmprt.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");
		return $query->rows;
	}

	public function getCategoryIds($product_id) {
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category ptc INNER JOIN " . DB_PREFIX . "category cat ON cat.category_id = ptc.category_id WHERE ptc.product_id = '" . (int)$product_id . "' AND cat.parent_id > 0 ORDER BY ptc.category_id ASC LIMIT 1");
		if(isset($query->row['category_id'])){
			return $query->row['category_id'];
		} else {
			return false;
		}
	}

	public function getTotalTestimonials($data = array()) {
		$sql = "SELECT COUNT(1) AS total";

		$sql .= " FROM " . DB_PREFIX . "review";

		$sql .= " WHERE status = 1 ";

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTestimonials($data = array()) {
		$sql = "SELECT * ";

		$sql .= " FROM " . DB_PREFIX . "review ";

		$sql .= "WHERE status = 1 ";

		$sql .= " ORDER BY review_id desc";

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