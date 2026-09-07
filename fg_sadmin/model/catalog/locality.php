<?php
class ModelCatalogLocality extends Model {
	public function addLocality($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "category_locality SET category_id = '" . (int)$data['category_id'] . "', area_name = '" . $this->db->escape($data['area_name']) . "', region_name = '" . $this->db->escape($data['region_name']) . "', pin_code = '" . $this->db->escape($data['pin_code']) . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', image = '" . $this->db->escape($data['image']) . "'");

		$locality_id = $this->db->getLastId();

		if (isset($data['locality_description'])) {
			foreach ($data['locality_description'] as $language_id => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "category_locality_description SET category_id = '" . (int)$data['category_id'] . "', area_name = '" . $this->db->escape($data['area_name']) . "', language_id = '" . (int)$language_id . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', description = '" . $this->db->escape($value['description']) . "'");
			}
		}

		if (isset($data['locality_faq'])) {
			foreach ($data['locality_faq'] as $faq) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "category_locality_faq SET locality_id = '" . (int)$locality_id . "', question = '" . $this->db->escape($faq['question']) . "', answer = '" . $this->db->escape($faq['answer']) . "', sort_order = '" . (int)$faq['sort_order'] . "'");
			}
		}

		return $locality_id;
	}

	public function editLocality($locality_id, $data) {
		// First get the old locality info so we can delete old descriptions
		$old = $this->getLocality($locality_id);

		$this->db->query("UPDATE " . DB_PREFIX . "category_locality SET category_id = '" . (int)$data['category_id'] . "', area_name = '" . $this->db->escape($data['area_name']) . "', region_name = '" . $this->db->escape($data['region_name']) . "', pin_code = '" . $this->db->escape($data['pin_code']) . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', image = '" . $this->db->escape($data['image']) . "' WHERE locality_id = '" . (int)$locality_id . "'");

		if ($old) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "category_locality_description WHERE category_id = '" . (int)$old['category_id'] . "' AND area_name = '" . $this->db->escape($old['area_name']) . "'");
		}

		if (isset($data['locality_description'])) {
			foreach ($data['locality_description'] as $language_id => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "category_locality_description SET category_id = '" . (int)$data['category_id'] . "', area_name = '" . $this->db->escape($data['area_name']) . "', language_id = '" . (int)$language_id . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', description = '" . $this->db->escape($value['description']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "category_locality_faq WHERE locality_id = '" . (int)$locality_id . "'");

		if (isset($data['locality_faq'])) {
			foreach ($data['locality_faq'] as $faq) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "category_locality_faq SET locality_id = '" . (int)$locality_id . "', question = '" . $this->db->escape($faq['question']) . "', answer = '" . $this->db->escape($faq['answer']) . "', sort_order = '" . (int)$faq['sort_order'] . "'");
			}
		}
	}

	public function getLocality($locality_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "category_locality WHERE locality_id = '" . (int)$locality_id . "'");
		return $query->row;
	}

	public function getLocalityFaqs($locality_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_locality_faq WHERE locality_id = '" . (int)$locality_id . "' ORDER BY sort_order ASC");
		return $query->rows;
	}

	public function getLocalityDescriptions($category_id, $area_name) {
		$locality_description_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_locality_description WHERE category_id = '" . (int)$category_id . "' AND area_name = '" . $this->db->escape($area_name) . "'");

		foreach ($query->rows as $result) {
			$locality_description_data[$result['language_id']] = array(
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'description'      => $result['description']
			);
		}

		return $locality_description_data;
	}

	public function getLocalities($data = array()) {
		$sql = "SELECT cl.locality_id, cl.category_id, cl.area_name, cl.region_name, cl.pin_code, cd.name AS category_name FROM " . DB_PREFIX . "category_locality cl LEFT JOIN " . DB_PREFIX . "category_description cd ON (cl.category_id = cd.category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_area_name'])) {
			$sql .= " AND cl.area_name LIKE '%" . $this->db->escape($data['filter_area_name']) . "%'";
		}
		
		if (!empty($data['filter_name'])) {
			$sql .= " AND cd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_pin_code'])) {
			$sql .= " AND cl.pin_code LIKE '%" . $this->db->escape($data['filter_pin_code']) . "%'";
		}

		$sort_data = array(
			'cd.name',
			'cl.area_name',
			'cl.pin_code'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY cd.name, cl.area_name";
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

		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getTotalLocalities($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category_locality cl LEFT JOIN " . DB_PREFIX . "category_description cd ON (cl.category_id = cd.category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
		if (!empty($data['filter_area_name'])) {
			$sql .= " AND cl.area_name LIKE '%" . $this->db->escape($data['filter_area_name']) . "%'";
		}
		
		if (!empty($data['filter_name'])) {
			$sql .= " AND cd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_pin_code'])) {
			$sql .= " AND cl.pin_code LIKE '%" . $this->db->escape($data['filter_pin_code']) . "%'";
		}

		$query = $this->db->query($sql);
		return $query->row['total'];
	}
}
