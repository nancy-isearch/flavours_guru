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

		if(!isset($_GET['_route_'])){
			$this->document->setDescription($this->config->get('config_meta_description'));
			$this->document->setKeywords($this->config->get('config_meta_keyword'));
		} else if(isset($_GET['_route_']) && $_GET['_route_']=='home'){
			$this->document->setDescription($this->config->get('config_meta_description'));
			$this->document->setKeywords($this->config->get('config_meta_keyword'));
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
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

		// custom menu
		$file=fopen(DIR_SYSTEM.'data/category_menu.csv', 'r');
		$menu_structure=array();
		$current_parent="";
		$current_subparent="";
		$counter=0;

		$skiphead=true;
		 
		if(empty($this->cart->getProducts())){
		 		unset($_SESSION['proData']);
		 		unset($_SESSION['checkoutCity']);
		 		unset($_SESSION['checkoutPincode']);
		}

		//echo "<pre>";

		while (($line = fgetcsv($file)) !== FALSE) {
		  	if($skiphead){$skiphead=false; continue;}
		  	//print_r($line);

		  	$cats=explode("/",$line[3]);
		  	//array_shift($cats);
		  	$path="";
		  	if(count($cats)==2){
			  	$parent_query=$this->db->query("SELECT query from ".DB_PREFIX."url_alias where keyword='".$cats[0]."'")->row;
			  	if(!isset($parent_query['query'])) continue;
			  	$parent_id=explode("=",$parent_query['query'])[1];
			  	$child_query=$this->db->query("SELECT query from ".DB_PREFIX."url_alias where keyword='".$cats[1]."'")->row;
			  	if(!isset($child_query['query'])) continue;
			  	$child_id=explode("=",$child_query['query'])[1];

			  	$path=$parent_id."_".$child_id;
		  	} else {
			  	$parent_id=0;
			  	$child_query=$this->db->query("SELECT query from ".DB_PREFIX."url_alias where keyword='".$cats[0]."'")->row;
			  	if(!isset($child_query['query'])) continue;
			  	$child_id=explode("=",$child_query['query'])[1];

			  	$path=$child_id;
		  	}

		  	if($line[0]!=""){
		  		$current_parent=$line[0];
		  		$current_subparent=$line[1];
		  		if($line[0] == "Customized Cakes"){
		  			$path = 'information/customize';
		  			$menu_structure[$current_parent][$current_subparent][]=array($line[2],$line[3],$this->url->link($path));
		  		} else {
		  			$menu_structure[$current_parent][$current_subparent][]=array($line[2],$line[3],$this->url->link('product/category', 'path='.$path));
		  		}
		  		
		  	} else {
		  		if($line[1]!="")
		  			$current_subparent=$line[1];
		  		$menu_structure[$current_parent][$current_subparent][]=array($line[2],$line[3],$this->url->link('product/category', 'path='.$path));
		  	}
		}

		$tmp_menu_structure=$menu_structure;

		$menu_structure2=array_splice($tmp_menu_structure, 1);
		$first_menu=$tmp_menu_structure;
		//echo "<pre />"; print_r($tmp_menu_structure);

		if(key(reset($first_menu))=='0'){
			$menu_structure=$menu_structure2;
			$data['first_menu']=$first_menu;
		} 
		//print_r($menu_structure); die;
		$data['menu_structure']=$menu_structure;

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) { 
				// Level 2
				$children_data = array();

				//$children = $this->model_catalog_category->getCategories($category['category_id']);
				$children = $this->model_catalog_category->getMultiParentCategories($category['category_id']);

				foreach ($children as $child) {

					// Level 3
					$children_data2 = array();

					$children2 = $this->model_catalog_category->getCategories($child['category_id']);

					foreach ($children2 as $child2) {
								 
						$children_data2[] = array(
							'name'  => $child2['name'],
							'href'  => $this->url->link('product/categorys', 'path=' . $category['category_id'] . '_' . $child['category_id'].'_'.$child2['category_id'])
						);
					}

					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
							 
					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/categorys', 'path=' . $category['category_id'] . '_' . $child['category_id']),
						'children' => $children_data2
					);
				}
					  
				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');
		$data['currencyCode'] = $this->session->data['currency'];
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
}
