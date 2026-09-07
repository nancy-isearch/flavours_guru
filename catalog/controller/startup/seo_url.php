<?php
class ControllerStartupSeoUrl extends Controller {
	public function index() {
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}

		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);

			// remove any empty arrays from trailing
			if (utf8_strlen(end($parts)) == 0) {
				array_pop($parts);
			}


			foreach ($parts as $part) {
				if ($part == 'customize') {
					$this->request->get['route'] = 'information/customize';
					continue;
				}

				if (strpos($part, 'cakes-in-') === 0) {
					// Extract potential city keyword
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE '" . $this->db->escape($part) . "' LIKE CONCAT('cakes-in-%-', keyword) AND query LIKE 'category_id=%' ORDER BY LENGTH(keyword) DESC LIMIT 1");
					if ($query->num_rows) {
						$city_keyword = $query->row['keyword'];
						$url_parts = explode('=', $query->row['query']);
						if ($url_parts[0] == 'category_id') {
							$cat_id = (int)$url_parts[1];
							$locality_slug = substr($part, 9, -strlen('-' . $city_keyword));
							
							// find the area name from DB
							$loc_query = $this->db->query("SELECT area_name FROM " . DB_PREFIX . "category_locality WHERE category_id = '" . $cat_id . "'");
							$matched_locality = '';
							foreach ($loc_query->rows as $lrow) {
								$slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $lrow['area_name']), '-'));
								if ($slug === $locality_slug) {
									$matched_locality = $lrow['area_name'];
									break;
								}
							}
							
							if ($matched_locality) {
								$this->request->get['route'] = 'product/locality';
								$this->request->get['category_id'] = $cat_id;
								$this->request->get['locality'] = $matched_locality;
								continue;
							}
						}
					}
				}

				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");

				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);

					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}

					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}

					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}

					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}

					if ($query->row['query'] && $url[0] != 'information_id' && $url[0] != 'manufacturer_id' && $url[0] != 'category_id' && $url[0] != 'product_id') {
						$this->request->get['route'] = $query->row['query'];
					}
				} else {
					$this->request->get['route'] = 'error/not_found';

					break;
				}
			}

			if (!isset($this->request->get['route'])) {
				if (isset($this->request->get['product_id'])) {
					$this->request->get['route'] = 'product/product';
				} elseif (isset($this->request->get['path'])) {
					$this->request->get['route'] = 'product/category';
				} elseif (isset($this->request->get['manufacturer_id'])) {
					$this->request->get['route'] = 'product/manufacturer/info';
				} elseif (isset($this->request->get['information_id'])) {
					$this->request->get['route'] = 'information/information';
				}
			}
		}
	}

	public function rewrite($link) {
		$url_info = parse_url(str_replace('&amp;', '&', $link));

		$url = '';

		$data = array();

		parse_str($url_info['query'], $data);

		if (isset($data['route']) && $data['route'] == 'information/customize') {
			$url .= '/customize';
			unset($data['route']);
		}

		foreach ($data as $key => $value) {
			if (isset($data['route'])) {
				if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id')) {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");

					if ($query->num_rows && $query->row['keyword']) {
						$url .= '/' . $query->row['keyword'];

						unset($data[$key]);
					}
				} elseif ($data['route'] == 'product/locality' && $key == 'locality') {
					if (isset($data['category_id'])) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$data['category_id'] . "'");
						if ($query->num_rows && $query->row['keyword']) {
							$locality_slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $value), '-'));
							$url .= '/cakes-in-' . $locality_slug . '-' . $query->row['keyword'];
							unset($data['locality']);
							unset($data['category_id']);
						}
					}
				} elseif ($key == 'path') {
					$categories = explode('_', $value);
					
					foreach ($categories as $category) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");

						if ($query->num_rows && $query->row['keyword']) {
							$url .= '/' . $query->row['keyword'];
						} else {
							$url = '';

							break;
						}
					}
					
					unset($data[$key]);
				}
			}
		}

		if ($url) {
			unset($data['route']);

			$query = '';

			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . rawurlencode((string)$key) . '=' . rawurlencode((is_array($value) ? http_build_query($value) : (string)$value));
				}

				if ($query) {
					$query = '?' . str_replace('&', '&amp;', trim($query, '&'));
				}
			}

			return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
		} else {
			return $link;
		}
	}
}
