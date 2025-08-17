<?php
class ControllerProductSearch extends Controller {
	public function index() {
		$this->load->language('product/search');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['search'])) {
			$search = str_replace('-', ' ', $this->request->get['search']);
		} else {
			$search = '';
		}

		$limit = 60;

		if (isset($this->request->get['search'])) {
			$this->document->setTitle($this->language->get('heading_title') .  ' - ' . $this->request->get['search']);
		} elseif (isset($this->request->get['tag'])) {
			$this->document->setTitle($this->language->get('heading_title') .  ' - ' . $this->language->get('heading_tag') . $this->request->get['tag']);
		} else {
			$this->document->setTitle($this->language->get('heading_title'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$url = '';

		if (isset($this->request->get['search'])) {
			$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
		}

		
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('product/search', $url)
		);

		

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_search'] = "Search cakes by flavour, type, theme etc";
		/*$data['text_search'] = $this->language->get('text_search');*/
		$data['text_keyword'] = $this->language->get('text_keyword');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_sub_category'] = $this->language->get('text_sub_category');
		$data['text_quantity'] = $this->language->get('text_quantity');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_model'] = $this->language->get('text_model');
		$data['text_price'] = $this->language->get('text_price');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_points'] = $this->language->get('text_points');
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');

		$data['entry_search'] = $this->language->get('entry_search');
		$data['entry_description'] = $this->language->get('entry_description');

		$data['button_search'] = $this->language->get('button_search');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_list'] = $this->language->get('button_list');
		$data['button_grid'] = $this->language->get('button_grid');

		$data['compare'] = $this->url->link('product/compare');

		

		$data['products'] = array();
		$data['productsNotFound'] = array();

		if (isset($this->request->get['search'])) {
			require '/home/master/applications/npffwsymrc/public_html/catalog/controller/product/CakeSearchEngine.php';
			$aa = "SELECT product_id id, name title, description, tag tags FROM `oc_product_description`";
			$allProducts = $this->db->query($aa)->rows;
			$synonyms = [];
			$searchEngine = new CakeSearchEngine($allProducts, $synonyms);
			$allSearchProducts = $searchEngine->search($search, 1, 0, 1);
			$i = 0;
			foreach($allSearchProducts as $searchedProduct){
				$result = $this->model_catalog_product->getProduct($searchedProduct['product']['id']);
				if ($result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$price = false;
					}

					if ((float)$result['special']) {
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = (int)$result['rating'];
					} else {
						$rating = false;
					}

					$data['products'][] = array(
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
						'rating'      => $result['rating'],
						'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
					);
					$i++;
					if ($i >= $limit) {
						break; // Limit the number of results
					} 
				}
			}
			//echo "<pre />"; print_r($data['products']); die;

			$filter_data123 = array('filter_category_id' => 1, 'filter_filter' => '', 'sort' => 'p2c.sort_order', 'order' => 'ASC', 'start' => 0, 'limit' => $limit);
			$results = $this->model_catalog_product->getProducts($filter_data123);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$data['productsNotFound'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
				);
			}

			


			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['search']) && $this->config->get('config_customer_search')) {
				$this->load->model('account/search');

				if ($this->customer->isLogged()) {
					$customer_id = $this->customer->getId();
				} else {
					$customer_id = 0;
				}

				if (isset($this->request->server['REMOTE_ADDR'])) {
					$ip = $this->request->server['REMOTE_ADDR'];
				} else {
					$ip = '';
				}

				$search_data = array(
					'keyword'       => $search,
					'category_id'   => $category_id,
					'sub_category'  => $sub_category,
					'description'   => $description,
					'products'      => count($data['products']),
					'customer_id'   => $customer_id,
					'ip'            => $ip
				);

				$this->model_account_search->addSearch($search_data);
			}
		}

		$data['search'] = $search;
		$data['description'] = $description;
		$data['category_id'] = $category_id;
		$data['sub_category'] = $sub_category;

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('product/search', $data));
	}

	public function searchSynonyms(){
		set_time_limit(0);
		ini_set('memory_limit', '-1');
		$aa = "select keyword from oc_customer_search group by keyword";
		$queries = $this->db->query($aa)->rows;

		$groups = [];

		// Normalize queries: lowercase, remove extra spaces
		$normalize = function ($str) {
			return strtolower(trim(preg_replace('/\s+/', ' ', $str)));
		};

		foreach ($queries as $query) {
			$query = $this->removeStopWords($query['keyword']);
			$query = $normalize($query);

			if (!preg_match('/^[a-z0-9\s\-\.\,\(\)]+$/i', $query)) {
				continue;
			}

			$added = false;
			foreach ($groups as $groupKey => &$group) {
				$rep = $normalize($groupKey);

				$lev = levenshtein($query, $rep);
				$sound1 = metaphone($query);
				$sound2 = metaphone($rep);

				if ($lev <= 5 || $sound1 === $sound2) {
					$group[] = $query;
					$added = true;
					break;
				}
			}

			if (!$added) {
				$groups[$query] = [$query];
			}
		}
		$filepath = DIR_SYSTEM.'data/search_synonyms_all1.csv';
		$handle = fopen($filepath, 'w');
		if ($handle === false) {
			throw new Exception("Unable to open file for writing: $filepath");
		}
		// Write header
		fputcsv($handle, ['Word', 'Synonyms']);
		foreach ($groups as $key => $values) {
			fputcsv($handle, [$key, implode(',', $values)]);
		}
		fputcsv($handle, ["Ended", "Ended"]);
		fclose($handle);

		echo "Synonyms saved to $filepath";
	}

	public function loadSynonymMap($file = "synonyms.csv") {
		$map = [];
		if (($handle = fopen($file, "r")) !== false) {
			$header = fgetcsv($handle);
			while (($row = fgetcsv($handle)) !== false) {
			$map[strtolower(trim($row[0]))] = strtolower(trim($row[1]));
			}
			fclose($handle);
		}
		return $map;
	}

	public function removeStopWords($query) {
		$stopwords = ['cake', 'kg', 'cakes', 'online', 'buy', 'order', 'send', 'gift', 'delivery', 'near me', 'a', 'an', 'the', 'for', 'to', 'in', 'of', 'on', 'with', 'at', 'from', 'by', 'and', 'is', 'are', 'this', 'that', 'me', 'my', 'you', 'your', 'online'];
		$words = explode(" ", strtolower($query));
		$filtered = array_filter($words, function($word) use ($stopwords) {
			return !in_array($word, $stopwords);
		});
		return implode(" ", $filtered);
	}

	public function normalizeQuery($query, $synonymMap, $stopwords) {
		$clean = $this->removeStopWords($query, $stopwords);
		foreach ($synonymMap as $variant => $canonical) {
			if (stripos($clean, $variant) !== false) {
				$clean = preg_replace("/\b" . preg_quote($variant, '/') . "\b/i", $canonical, $clean);
			}
		}
		return trim($clean);
	}

}
