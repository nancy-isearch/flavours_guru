<?php
class Modelshippingcountries extends Model {
	public function addcountries($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "countries SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "'");

		$countries_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "countries SET image = '" . $this->db->escape($data['image']) . "' WHERE countries_id = '" . (int)$countries_id . "'");
		}

		if (isset($data['countries_store'])) {
			foreach ($data['countries_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "countries_to_store SET countries_id = '" . (int)$countries_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['keyword'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'countries_id=" . (int)$countries_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('countries');

		return $countries_id;
	}

	public function editcountries($countries_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "countries SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE countries_id = '" . (int)$countries_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "countries SET image = '" . $this->db->escape($data['image']) . "' WHERE countries_id = '" . (int)$countries_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "countries_to_store WHERE countries_id = '" . (int)$countries_id . "'");

		if (isset($data['countries_store'])) {
			foreach ($data['countries_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "countries_to_store SET countries_id = '" . (int)$countries_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'countries_id=" . (int)$countries_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'countries_id=" . (int)$countries_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('countries');
	}

	public function deletecountries($countries_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "countries WHERE countries_id = '" . (int)$countries_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "countries_to_store WHERE countries_id = '" . (int)$countries_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'countries_id=" . (int)$countries_id . "'");

		$this->cache->delete('countries');
	}

	public function getcountries($countries_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'countries_id=" . (int)$countries_id . "') AS keyword FROM " . DB_PREFIX . "countries WHERE countries_id = '" . (int)$countries_id . "'");

		return $query->row;
	}

	public function getcountriess($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "country";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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

	public function getstates($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "zone where";


		if (!empty($data['country_id'])) {
			$sql .= " country_id LIKE '" . $this->db->escape($data['country_id']) . "'";
		}

		if (!empty($data['filter_name'])) {
			$sql .= " and name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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

	public function getcountriesStores($countries_id) {
		$countries_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "countries_to_store WHERE countries_id = '" . (int)$countries_id . "'");

		foreach ($query->rows as $result) {
			$countries_store_data[] = $result['store_id'];
		}

		return $countries_store_data;
	}

	public function getTotalcountriess() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "countries");

		return $query->row['total'];
	}
}
