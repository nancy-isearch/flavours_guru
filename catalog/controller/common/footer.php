<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
				//print_r($data['informations']);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		// Blog Cards Logic
		$this->load->model('catalog/blog_card');
		$this->load->model('tool/image');

		$route = isset($this->request->get['route']) ? (string)$this->request->get['route'] : 'common/home';
		$city_name = '';
		$cat_name_debug = '';
		
		if ($route == 'common/home' || $route == '') {
			$display_page = 'home';
		} elseif ($route == 'product/locality') {
			$display_page = 'city';
			if (isset($this->request->get['locality'])) {
				$city_name = trim($this->request->get['locality']);
			}
		} elseif ($route == 'product/category') {
			$display_page = 'category';
			if (isset($this->request->get['path'])) {
				$parts = explode('_', (string)$this->request->get['path']);
				$category_id = (int)array_pop($parts);
				$this->load->model('catalog/category');
				$category_info = $this->model_catalog_category->getCategory($category_id);
				if ($category_info) {
					$_cat_name = isset($category_info['name']) ? $category_info['name'] : '';
					$cat_name_debug = $_cat_name;
					if (
						stripos($_cat_name, 'Online Cake Delivery in') !== false ||
						stripos($_cat_name, 'Cakes Online in') !== false ||
						stripos($_cat_name, 'Cake Delivery in') !== false ||
						stripos($_cat_name, 'Cakes in ') !== false ||
						stripos($_cat_name, 'Cakes Shop in') !== false ||
						stripos($_cat_name, 'Delhi') !== false ||
						stripos($_cat_name, 'Gurgaon') !== false ||
						stripos($_cat_name, 'Noida') !== false
					) {
						$display_page = 'city';
						
						// Extract pure city name
						$city_name = str_ireplace(
							array('Online Cake Delivery in', 'Cakes Online in', 'Cake Delivery in', 'Cakes Shop in', 'Cakes in', 'Online Cake Delivery In', 'Cakes Online In', 'Cake Delivery In', 'Cakes In', 'Cakes Shop In'),
							'',
							$_cat_name
						);
						$city_name = trim($city_name);
					}
				}
			}
		} else {
			$display_page = 'all';
		}

		$data['blog_cards'] = array();
		$blog_results = $this->model_catalog_blog_card->getLatestBlogCards($display_page, 3, $city_name);

		// DEBUG INFO
		$data['debug_blog'] = "<!-- Route: $route | Display Page: $display_page | Cat Name: $cat_name_debug | City Name: $city_name -->";
		
		$this->log->write("BLOG DEBUG: Route: $route | Display Page: $display_page | Cat Name: $cat_name_debug | City Name: $city_name | Count: " . count($blog_results));

		foreach ($blog_results as $result) {
			if ($result['feature_image']) {
				$image = $this->model_tool_image->resize($result['feature_image'], 400, 300);
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', 400, 300);
			}

			$data['blog_cards'][] = array(
				'title'        => $result['title'],
				'description'  => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '...',
				'thumb'        => $image,
				'author'       => $result['author'],
				'publish_date' => date('d M Y', strtotime($result['publish_date'])),
				'blog_link'    => $result['blog_link']
			);
		}

		return $this->load->view('common/footer', $data);
	}
}
