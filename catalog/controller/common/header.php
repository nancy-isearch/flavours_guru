<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		if (!isset($this->request->get['_route_']) || $this->request->get['_route_'] == 'home') {
			$this->document->setDescription($this->config->get('config_meta_description'));
			$this->document->setKeywords($this->config->get('config_meta_keyword'));
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}
		

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		if(isset($this->session->data['selectedPincode']) && !empty($this->session->data['selectedPincode'])){
			$data['selected_pincode'] = $this->session->data['selectedPincode'];
		} else {
			$data['selected_pincode'] = "";
		}

		if(isset($this->session->data['selectedCity']) && !empty($this->session->data['selectedCity'])){
			$data['selected_city'] = $this->session->data['selectedCity'];
		} else {
			$data['selected_city'] = "";
		}
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['link'] = $this->url->link('','', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['ordertrack'] = $this->url->link('ordertrack/ordertrack', '', true);
		$data['helper'] = $this->url->link('common/helper', '', true);
		$data['sitemap'] = $this->url->link('sitemap/', '', true);
		$data['contact'] = $this->url->link('contact/', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		if (!$this->cart->hasProducts()) {
			unset($this->session->data['proData']);
			unset($this->session->data['checkoutCity']);
			unset($this->session->data['checkoutPincode']);
		}
		$header_menu_data = $this->getHeaderMenuData();
		$data['menu_structure'] = $header_menu_data['menu_structure'];
		if (!empty($header_menu_data['first_menu'])) {
			$data['first_menu'] = $header_menu_data['first_menu'];
		}
		$data['categories'] = $header_menu_data['categories'];

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');
		$data['currencyCode'] = $this->session->data['currency'];
		$data['route_name'] = isset($this->request->get['route']) ? $this->request->get['route'] : 'common/home';
		$data['is_home_page'] = ($data['route_name'] == 'common/home');
		$data['is_category_page'] = ($data['route_name'] == 'product/category');
		$data['is_product_page'] = ($data['route_name'] == 'product/product');
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->getFilteredStyles($this->document->getStyles(), $data['route_name']);
		$data['scripts'] = $this->getFilteredScripts($this->document->getScripts(), $data['route_name']);
		$data['show_global_faq_schema'] = true;
		$css_file = DIR_CATALOG . 'view/theme/default/stylesheet/stylesheet_1.css';
		$data['theme_stylesheet_version'] = file_exists($css_file) ? filemtime($css_file) : '1';
		$js_file = DIR_CATALOG . 'view/javascript/custom.js';
		$data['custom_js_version'] = file_exists($js_file) ? filemtime($js_file) : '1';
		$data['category_preload_image'] = '';
		$data['category_preload_image_mobile'] = '';
		$data['category_preload_sizes'] = '';

		if ($data['is_category_page'] && isset($this->request->get['path'])) {
			$this->load->model('tool/image');

			$path_parts = explode('_', (string)$this->request->get['path']);
			$preload_category_id = (int)array_pop($path_parts);
			$preload_category_info = $this->model_catalog_category->getCategory($preload_category_id);

			if (!empty($preload_category_info['image'])) {
				$category_image_width = (int)$this->config->get($this->config->get('config_theme') . '_image_category_width');
				$category_image_height = (int)$this->config->get($this->config->get('config_theme') . '_image_category_height');
				$category_image_width_mobile = min($category_image_width, 360);
				$category_image_height_mobile = ($category_image_width > 0) ? (int)round(($category_image_height * $category_image_width_mobile) / $category_image_width) : $category_image_height;

				$data['category_preload_image'] = $this->model_tool_image->resize($preload_category_info['image'], $category_image_width, $category_image_height);
				$data['category_preload_image_mobile'] = $this->model_tool_image->resize($preload_category_info['image'], $category_image_width_mobile, $category_image_height_mobile);
				$data['category_preload_sizes'] = '(max-width: 767px) 100vw, ' . $category_image_width . 'px';
			}
		}
		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}

	private function getHeaderMenuData() {
		$cache_key = 'header.menu.' . (int)$this->config->get('config_store_id') . '.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_product_count');
		$cache_file = $this->getHeaderCacheFile($cache_key);
		$menu_csv = DIR_SYSTEM . 'data/category_menu.csv';
		$csv_mtime = is_file($menu_csv) ? (int)filemtime($menu_csv) : 0;

		if (is_file($cache_file)) {
			$payload = @unserialize(file_get_contents($cache_file));

			if (is_array($payload) && isset($payload['csv_mtime']) && (int)$payload['csv_mtime'] === $csv_mtime) {
				return $payload['data'];
			}
		}

		$data = array(
			'menu_structure' => array(),
			'first_menu' => array(),
			'categories' => array()
		);

		if (is_file($menu_csv) && ($handle = fopen($menu_csv, 'r')) !== false) {
			$rows = array();
			$keywords = array();
			$skiphead = true;

			while (($line = fgetcsv($handle)) !== false) {
				if ($skiphead) {
					$skiphead = false;
					continue;
				}

				$rows[] = $line;

				if (!empty($line[3])) {
					foreach (explode('/', $line[3]) as $keyword) {
						$keywords[] = $this->db->escape($keyword);
					}
				}
			}

			fclose($handle);

			$alias_map = array();
			$keywords = array_unique(array_filter($keywords));

			if ($keywords) {
				$alias_rows = $this->db->query("SELECT keyword, query FROM " . DB_PREFIX . "url_alias WHERE keyword IN ('" . implode("','", $keywords) . "')")->rows;

				foreach ($alias_rows as $alias_row) {
					$alias_map[$alias_row['keyword']] = $alias_row['query'];
				}
			}

			$menu_structure = array();
			$current_parent = '';
			$current_subparent = '';

			foreach ($rows as $line) {
				$cats = !empty($line[3]) ? explode('/', $line[3]) : array();
				$path = '';

				if (count($cats) == 2) {
					if (empty($alias_map[$cats[0]]) || empty($alias_map[$cats[1]])) {
						continue;
					}

					$parent_id = explode('=', $alias_map[$cats[0]])[1];
					$child_id = explode('=', $alias_map[$cats[1]])[1];
					$path = $parent_id . '_' . $child_id;
				} elseif (count($cats) == 1 && !empty($alias_map[$cats[0]])) {
					$child_id = explode('=', $alias_map[$cats[0]])[1];
					$path = $child_id;
				} else {
					continue;
				}

				if ($line[0] != '') {
					$current_parent = $line[0];
					$current_subparent = $line[1];
				} elseif ($line[1] != '') {
					$current_subparent = $line[1];
				}

				$link = ($current_parent == 'Customized Cakes')
					? $this->url->link('information/customize')
					: $this->url->link('product/category', 'path=' . $path);

				$menu_structure[$current_parent][$current_subparent][] = array($line[2], $line[3], $link);
			}

			$tmp_menu_structure = $menu_structure;
			$menu_structure2 = array_splice($tmp_menu_structure, 1);
			$first_menu = $tmp_menu_structure;

			if ($first_menu && key(reset($first_menu)) == '0') {
				$data['menu_structure'] = $menu_structure2;
				$data['first_menu'] = $first_menu;
			} else {
				$data['menu_structure'] = $menu_structure;
			}
		}

		$all_categories = $this->model_catalog_category->getAllCategoriesTree();
		$categories = isset($all_categories[0]) ? $all_categories[0] : array();

		// Fix #3: batch-fetch all child category product counts in one query
		$category_counts = array();
		if ($this->config->get('config_product_count')) {
			$child_ids = array();
			foreach ($categories as $category) {
				if ($category['top']) {
					$children = isset($all_categories[$category['category_id']]) ? $all_categories[$category['category_id']] : array();
					foreach ($children as $child) {
						$child_ids[] = (int)$child['category_id'];
					}
				}
			}
			if ($child_ids) {
				$category_counts = $this->model_catalog_product->getTotalProductsByCategoryIds($child_ids);
			}
		}

		foreach ($categories as $category) {
			if ($category['top']) {
				$children_data = array();
				$children = isset($all_categories[$category['category_id']]) ? $all_categories[$category['category_id']] : array();

				foreach ($children as $child) {
					$children_data2 = array();
					$children2 = isset($all_categories[$child['category_id']]) ? $all_categories[$child['category_id']] : array();

					foreach ($children2 as $child2) {
						$children_data2[] = array(
							'name'  => $child2['name'],
							'href'  => $this->url->link('product/categorys', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child2['category_id'])
						);
					}

					$child_name = $child['name'];

					if ($this->config->get('config_product_count')) {
						$child_name .= ' (' . (isset($category_counts[(int)$child['category_id']]) ? $category_counts[(int)$child['category_id']] : 0) . ')';
					}

					$children_data[] = array(
						'name'  => $child_name,
						'href'  => $this->url->link('product/categorys', 'path=' . $category['category_id'] . '_' . $child['category_id']),
						'children' => $children_data2
					);
				}

				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		@file_put_contents($cache_file, serialize(array(
			'csv_mtime' => $csv_mtime,
			'data' => $data
		)));

		return $data;
	}

	private function getFilteredStyles($styles, $route_name) {
		if ($route_name !== 'product/category') {
			return $styles;
		}

		$blocked_fragments = array(
			'media/newsletter/css/stylesheet.css',
			'media/newsletter/css/subscribe-better.css',
			'catalog/view/javascript/jquery/owl-carousel/owl.carousel.css',
			'catalog/view/javascript/jquery/owl-carousel/owl.transitions.css'
		);

		foreach ($styles as $href => $style) {
			foreach ($blocked_fragments as $fragment) {
				if (strpos($href, $fragment) !== false) {
					unset($styles[$href]);
					break;
				}
			}
		}

		return $styles;
	}

	private function getFilteredScripts($scripts, $route_name) {
		if ($route_name !== 'product/category') {
			return $scripts;
		}

		$blocked_fragments = array(
			'media/newsletter/js/jquery.subscribe-better.js',
			'media/newsletter/js/main.js',
			'catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js'
		);

		foreach ($scripts as $href => $script) {
			foreach ($blocked_fragments as $fragment) {
				if (strpos($href, $fragment) !== false) {
					unset($scripts[$href]);
					break;
				}
			}
		}

		return $scripts;
	}

	private function getHeaderCacheFile($key) {
		$directory = DIR_CACHE . 'header/';

		if (!is_dir($directory)) {
			@mkdir($directory, 0777, true);
		}

		return $directory . md5($key) . '.cache';
	}
}
