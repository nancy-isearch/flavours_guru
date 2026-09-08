<?php
class ModelCatalogBlogCard extends Model {
	public function getLatestBlogCards($display_page, $limit = 3, $city_name = '') {
		$sql = "SELECT * FROM " . DB_PREFIX . "blog_cards WHERE status = '1'";

		if ($display_page && $display_page != 'all') {
			if ($display_page == 'city' && $city_name != '') {
				$city_words = explode(' ', trim($city_name));
				$like_conditions = array();
				foreach ($city_words as $word) {
					$word = trim($word);
					if (strlen($word) >= 3) {
						$safe_word = $this->db->escape($word);
						$like_conditions[] = "LOWER(title) LIKE LOWER('%" . $safe_word . "%') OR LOWER(description) LIKE LOWER('%" . $safe_word . "%')";
					}
				}
				
				if (!empty($like_conditions)) {
					$sql .= " AND (display_page = 'all' OR (display_page = 'city' AND (" . implode(' OR ', $like_conditions) . ")))";
				} else {
					$city_safe = $this->db->escape($city_name);
					$sql .= " AND (display_page = 'all' OR (display_page = 'city' AND (LOWER(title) LIKE LOWER('%" . $city_safe . "%') OR LOWER(description) LIKE LOWER('%" . $city_safe . "%'))))";
				}
			} else {
				$sql .= " AND (display_page = '" . $this->db->escape($display_page) . "' OR display_page = 'all')";
			}
		} elseif ($display_page == 'all') {
			$sql .= " AND display_page = 'all'";
		}
		
		$sql .= " ORDER BY publish_date DESC LIMIT " . (int)$limit;
		
		error_log("BLOG SQL: " . $sql);

		try {
			$query = $this->db->query($sql);
			return $query->rows;
		} catch (\Exception $e) {
			error_log("BLOG SQL ERROR: " . $e->getMessage());
			return array();
		}
	}
}
