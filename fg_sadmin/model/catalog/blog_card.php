<?php
class ModelCatalogBlogCard extends Model {
	public function addBlogCard($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "blog_cards SET title = '" . $this->db->escape($data['title']) . "', description = '" . $this->db->escape($data['description']) . "', feature_image = '" . $this->db->escape($data['feature_image']) . "', author = '" . $this->db->escape($data['author']) . "', publish_date = '" . $this->db->escape($data['publish_date']) . "', blog_link = '" . $this->db->escape($data['blog_link']) . "', display_page = '" . $this->db->escape($data['display_page']) . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "'");

		$blog_id = $this->db->getLastId();

		return $blog_id;
	}

	public function editBlogCard($blog_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "blog_cards SET title = '" . $this->db->escape($data['title']) . "', description = '" . $this->db->escape($data['description']) . "', feature_image = '" . $this->db->escape($data['feature_image']) . "', author = '" . $this->db->escape($data['author']) . "', publish_date = '" . $this->db->escape($data['publish_date']) . "', blog_link = '" . $this->db->escape($data['blog_link']) . "', display_page = '" . $this->db->escape($data['display_page']) . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "' WHERE blog_id = '" . (int)$blog_id . "'");
	}

	public function deleteBlogCard($blog_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_cards WHERE blog_id = '" . (int)$blog_id . "'");
	}

	public function getBlogCard($blog_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "blog_cards WHERE blog_id = '" . (int)$blog_id . "'");

		return $query->row;
	}

	public function getBlogCards($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "blog_cards";

		$sort_data = array(
			'title',
			'display_page',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY title";
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

	public function getTotalBlogCards() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_cards");

		return $query->row['total'];
	}
}
