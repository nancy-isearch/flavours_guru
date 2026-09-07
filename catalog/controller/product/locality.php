<?php
class ControllerProductLocality extends Controller {
	public function index() {
		$this->load->language('product/category');

		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		if (isset($this->request->get['category_id'])) {
			$category_id = (int)$this->request->get['category_id'];
		} else {
			$category_id = 0;
		}

		if (isset($this->request->get['locality'])) {
			$area_name = $this->request->get['locality'];
		} else {
			$area_name = '';
		}

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info && $area_name) {
			$original_category_name = $category_info['name'];
            $category_info['name'] = trim(str_ireplace('Cakes Online In', '', $category_info['name']));

			// Try to get dynamic content for locality
			$locality_desc = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_locality_description WHERE category_id = '" . (int)$category_id . "' AND area_name = '" . $this->db->escape($area_name) . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
			$locality_info = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_locality WHERE category_id = '" . (int)$category_id . "' AND area_name = '" . $this->db->escape($area_name) . "'");
			
			$loc_string = $area_name . ', ' . $category_info['name'];
			$default_title = 'Cakes Shop in ' . $loc_string . ' - Order Fresh Cakes for Every Celebration | Flavoursguru';
			$default_desc = 'Cakes Shop in ' . $loc_string . ' Online - Find the best cakes at our cake shop in ' . $loc_string . '. Flavoursguru offers a variety of cakes for every occasion with fresh and fast delivery.';

			if ($locality_desc->num_rows) {
				$this->document->setTitle(!empty($locality_desc->row['meta_title']) ? $locality_desc->row['meta_title'] : $default_title);
				$this->document->setDescription(!empty($locality_desc->row['meta_description']) ? $locality_desc->row['meta_description'] : $default_desc);
				$this->document->setKeywords($locality_desc->row['meta_keyword']);
				$data['description'] = html_entity_decode($locality_desc->row['description'], ENT_QUOTES, 'UTF-8');
			} else {
				$this->document->setTitle($default_title);
				$this->document->setDescription($default_desc);
				$data['description'] = '';
			}

			$data['faqs'] = array();
			if ($locality_info->num_rows) {
				$faq_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_locality_faq WHERE locality_id = '" . (int)$locality_info->row['locality_id'] . "' ORDER BY sort_order ASC");
				
				foreach ($faq_query->rows as $result) {
					$data['faqs'][] = array(
						'question' => $result['question'],
						'answer'   => html_entity_decode($result['answer'], ENT_QUOTES, 'UTF-8')
					);
				}
			}

			$data['heading_title'] = 'Online Cake Delivery In ' . $area_name . ', ' . $category_info['name'];

			$data['breadcrumbs'] = array();
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);
			
			if (stripos($original_category_name, 'Cakes Online In') !== false) {
				$parent_category_info = $this->model_catalog_category->getCategory(259); // Flavoursguru Cakes
				if ($parent_category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $parent_category_info['name'],
						'href' => $this->url->link('product/category', 'path=259')
					);
				}
			}

			$data['breadcrumbs'][] = array(
				'text' => $original_category_name,
				'href' => $this->url->link('product/category', 'path=' . $category_id)
			);
			$data['breadcrumbs'][] = array(
				'text' => $area_name,
				'href' => $this->url->link('product/locality', 'category_id=' . $category_id . '&locality=' . urlencode($area_name))
			);

            $data['area_name'] = $area_name;
            $data['city_name'] = $category_info['name'];

            if ($locality_info->num_rows && $locality_info->row['image']) {
                $data['thumb'] = $this->model_tool_image->resize($locality_info->row['image'], 800, 600);
            } elseif ($category_info['image']) {
                $data['thumb'] = $this->model_tool_image->resize($category_info['image'], 800, 600);
            } else {
                $data['thumb'] = '/catalog/view/theme/default/image/city_page/birthday-image.webp'; // Fallback image
            }

            $data['pin_code'] = $locality_info->num_rows ? $locality_info->row['pin_code'] : '';

			// Fetch landmarks (nearby localities) based on pincode
			$data['landmarks'] = array();
			if (!empty($data['pin_code'])) {
				$landmark_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_locality WHERE pin_code = '" . $this->db->escape($data['pin_code']) . "' AND locality_id != '" . (int)$locality_info->row['locality_id'] . "' AND status = '1' LIMIT 8");
				
				foreach ($landmark_query->rows as $l_result) {
					$data['landmarks'][] = array(
						'name'     => $l_result['area_name'],
						'vicinity' => $l_result['region_name'] ? $l_result['region_name'] : $category_info['name']
					);
				}
			}
			
			// Fallback: If not enough landmarks, fetch other localities in the same city
			if (count($data['landmarks']) < 4) {
				$limit = 8 - count($data['landmarks']);
				$exclude_ids = array((int)$locality_info->row['locality_id']);
				foreach ($landmark_query->rows as $l_result) {
					$exclude_ids[] = (int)$l_result['locality_id'];
				}
				
				$fallback_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_locality WHERE category_id = '" . (int)$category_id . "' AND locality_id NOT IN (" . implode(',', $exclude_ids) . ") AND status = '1' LIMIT " . (int)$limit);
				
				foreach ($fallback_query->rows as $f_result) {
					$data['landmarks'][] = array(
						'name'     => $f_result['area_name'],
						'vicinity' => $f_result['region_name'] ? $f_result['region_name'] : $category_info['name']
					);
				}
			}

			// Fetch reviews using multicategory ID
			$multicategory = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_multiparent WHERE category_id = '" . (int)$category_id . "' LIMIT 1")->row;
			
			if (isset($multicategory['id'])) {
				$review_summary = $this->model_catalog_product->getCategoryReviewSummary($multicategory['id']);
				$data['allreviews']['all'] = $this->model_catalog_product->getCategoryReviews($multicategory['id'], 5);
				$data['allreviews']['cnt'] = $review_summary['cnt'];
				$data['allreviews']['average'] = $review_summary['average'];
			} else {
				$data['allreviews']['cnt'] = 0;
				$data['allreviews']['average'] = 0;
			}

			// Fetch products for this city (category)
			$data['products'] = array();

			$filter_data = array(
				'filter_category_id' => $category_id,
				'sort'               => 'p.sort_order',
				'order'              => 'ASC',
				'start'              => 0,
				'limit'              => 50
			);

			$results = $this->model_catalog_product->getProducts($filter_data);

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
					'reviews'     => $result['reviews'],
					'href'        => $this->url->link('product/product', 'path=' . $category_id . '&product_id=' . $result['product_id']),
					'quantity'    => $result['quantity'],
					'sku'         => $result['sku'],
					'purchased'   => isset($result['purchased']) ? $result['purchased'] : 0
				);
			}

			// ── Helper: fetch products by category without city filtering ──────
			// Get language_id directly from DB - more reliable than config_language_id
			$lang_code = $this->config->get('config_language');
			$lang_q    = $this->db->query("SELECT language_id FROM " . DB_PREFIX . "language WHERE code = '" . $this->db->escape($lang_code) . "' LIMIT 1");
			$lang_id   = $lang_q->num_rows ? (int)$lang_q->row['language_id'] : 1;
			$cg_id     = (int)$this->config->get('config_customer_group_id');
			$tax_on    = $this->config->get('config_tax');

			// ── Wedding Cake Products (category 52) ──────────────────────────
			$data['wedding_products'] = array();

			$wq = $this->db->query("
				SELECT p.product_id, p.image, p.price, p.tax_class_id, pd.name,
				  (SELECT price FROM " . DB_PREFIX . "product_special ps
				   WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . $cg_id . "'
				   AND ((ps.date_start='0000-00-00' OR ps.date_start<=NOW()) AND (ps.date_end='0000-00-00' OR ps.date_end>=NOW()))
				   ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special,
				  (SELECT AVG(r.rating) FROM " . DB_PREFIX . "review r WHERE r.product_id=p.product_id AND r.status='1') AS rating,
				  (SELECT COUNT(*) FROM " . DB_PREFIX . "review r WHERE r.product_id=p.product_id AND r.status='1') AS reviews
				FROM " . DB_PREFIX . "product_to_category p2c
				INNER JOIN " . DB_PREFIX . "product p ON p2c.product_id = p.product_id AND p.status = '1'
				INNER JOIN " . DB_PREFIX . "product_description pd ON p.product_id = pd.product_id AND pd.language_id = '" . $lang_id . "'
				WHERE p2c.category_id = '52'
				GROUP BY p.product_id ORDER BY pd.name ASC LIMIT 4
			");

			$wedding_index = 0;
			foreach ($wq->rows as $result) {
				$w_image = $result['image']
					? $this->model_tool_image->resize($result['image'], 400, 400)
					: $this->model_tool_image->resize('placeholder.png', 400, 400);
				$w_price   = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $tax_on), $this->session->data['currency']);
				$w_special = $result['special'] ? $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $tax_on), $this->session->data['currency']) : false;

				$data['wedding_products'][] = array(
					'product_id'   => $result['product_id'],
					'thumb'        => $w_image,
					'name'         => $result['name'],
					'price'        => $w_price,
					'special'      => $w_special,
					'rating'       => $result['rating'] ? number_format((float)$result['rating'], 1) : '5.0',
					'reviews'      => (int)$result['reviews'],
					'is_bestseller'=> ($wedding_index === 0),
					'href'         => $this->url->link('product/product', 'path=52&product_id=' . $result['product_id'])
				);
				$wedding_index++;
			}
			// ─────────────────────────────────────────────────────────────────

			// ── Anniversary Cake Products (category 51) ───────────────────────
			$data['anniversary_products'] = array();

			$aq = $this->db->query("
				SELECT p.product_id, p.image, pd.name
				FROM " . DB_PREFIX . "product_to_category p2c
				INNER JOIN " . DB_PREFIX . "product p ON p2c.product_id = p.product_id AND p.status = '1'
				INNER JOIN " . DB_PREFIX . "product_description pd ON p.product_id = pd.product_id AND pd.language_id = '" . $lang_id . "'
				WHERE p2c.category_id = '51'
				GROUP BY p.product_id ORDER BY pd.name ASC LIMIT 6
			");

			foreach ($aq->rows as $result) {
				$a_image = $result['image']
					? $this->model_tool_image->resize($result['image'], 200, 200)
					: $this->model_tool_image->resize('placeholder.png', 200, 200);
				$data['anniversary_products'][] = array(
					'name'  => $result['name'],
					'thumb' => $a_image,
					'href'  => $this->url->link('product/product', 'path=51&product_id=' . $result['product_id'])
				);
			}
			// ─────────────────────────────────────────────────────────────────

			// ── Baby Shower Cake Products (category 116) ──────────────────────
			$data['baby_shower_products'] = array();

			$bsq = $this->db->query("
				SELECT p.product_id, p.image, pd.name
				FROM " . DB_PREFIX . "product_to_category p2c
				INNER JOIN " . DB_PREFIX . "product p ON p2c.product_id = p.product_id AND p.status = '1'
				INNER JOIN " . DB_PREFIX . "product_description pd ON p.product_id = pd.product_id AND pd.language_id = '" . $lang_id . "'
				WHERE p2c.category_id = '116'
				GROUP BY p.product_id ORDER BY pd.name ASC LIMIT 4
			");

			foreach ($bsq->rows as $result) {
				$bs_image = $result['image']
					? $this->model_tool_image->resize($result['image'], 400, 400)
					: $this->model_tool_image->resize('placeholder.png', 400, 400);
				$data['baby_shower_products'][] = array(
					'name'  => $result['name'],
					'thumb' => $bs_image,
					'href'  => $this->url->link('product/product', 'path=116&product_id=' . $result['product_id'])
				);
			}
			// ─────────────────────────────────────────────────────────────────

			// ── Cakes by Profession ───────────────────────────────────────────
			$prof_map = array(
				array('img'=>'/catalog/view/theme/default/image/city_page/doctor.webp',       'color'=>'t-coral', 'keyword'=>'doctor',       'label'=>'Doctor'),
				array('img'=>'/catalog/view/theme/default/image/city_page/engineer.webp',     'color'=>'t-gold',  'keyword'=>'engineer',     'label'=>'Engineer'),
				array('img'=>'/catalog/view/theme/default/image/city_page/entrepreneur.webp', 'color'=>'t-rose',  'keyword'=>'entrepreneur', 'label'=>'Entrepreneur'),
				array('img'=>'/catalog/view/theme/default/image/city_page/blogger.webp',      'color'=>'t-peach', 'keyword'=>'blogger',      'label'=>'Blogger'),
				array('img'=>'/catalog/view/theme/default/image/city_page/teacher.webp',      'color'=>'t-lilac', 'keyword'=>'teacher',      'label'=>'Teacher'),
				array('img'=>'/catalog/view/theme/default/image/city_page/makeup.webp',       'color'=>'t-pink',  'keyword'=>'makeup',       'label'=>'Makeup'),
				array('img'=>'/catalog/view/theme/default/image/city_page/soldier.webp',      'color'=>'t-gold',  'keyword'=>'soldier',      'label'=>'Soldier'),
				array('img'=>'/catalog/view/theme/default/image/city_page/traveler.webp',    'color'=>'t-coral', 'keyword'=>'traveller',    'label'=>'Traveller'),
			);

			$data['profession_cats'] = array();
			foreach ($prof_map as $pm) {
				$pq = $this->db->query("
					SELECT c.category_id
					FROM " . DB_PREFIX . "category c
					INNER JOIN " . DB_PREFIX . "category_description cd
					  ON c.category_id = cd.category_id AND cd.language_id = '" . $lang_id . "'
					WHERE cd.name LIKE '%" . $this->db->escape($pm['keyword']) . "%'
					  AND c.status = '1'
					LIMIT 1
				");
				if ($pq->num_rows) {
					$cat_id = (int)$pq->row['category_id'];
					// 163 is the category_id for "Cakes by Profession". We prepend it to get the correct SEO URL structure.
					$path = '163_' . $cat_id;
					$phref = $this->url->link('product/category', 'path=' . $path);
				} else {
					$phref = '#';
				}
				$data['profession_cats'][] = array(
					'img'   => $pm['img'],
					'color' => $pm['color'],
					'name'  => $pm['label'], // Force clean name
					'href'  => $phref,
				);
			}
			// ─────────────────────────────────────────────────────────────────

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/locality', $data));
		} else {
			$this->response->redirect($this->url->link('error/not_found'));
		}
	}
}
