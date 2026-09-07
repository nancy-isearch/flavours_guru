<?php
class ControllerProductCategory extends Controller {
	public function index() {

		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		// Mobile detection
		$is_mobile = $this->isMobileDevice();

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p2c.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => '',
			'href' => HTTPS_SERVER
		);

		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';
 
			$parts = explode('_', (string)$this->request->get['path']);

			$path_cats=$parts;

			$category_id = (int)array_pop($parts);

			//$category_id = end($parts);
			/*$pathid = $this->model_catalog_category->getpathId($category_id);

				$arry = array();
				foreach($pathid as $key){
					$arry[] = $key['path_id'] ;
				}
		 		$short_path = implode('_',$arry);*/


			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				
				
			 
				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
				}

				
			}


		} else { 
			$category_id = 0;
		}

		$category_info = $this->model_catalog_category->getCategory($category_id);

		/*if(isset($category_info['redirect']) && !empty($category_info['redirect'])){
			$this->response->redirect($this->url->link($category_info['redirect'], '', true),301);
		}*/

		if ($category_info) {
			$this->document->setTitle($category_info['meta_title']);
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/category', "path=".$this->request->get['path']), 'canonical');
			$data['heading_title'] = $category_info['name'];
			$data['category_id'] = $category_id;
			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');

			// Automatically add 'Flavoursguru Cakes' if this is a city page and it wasn't in the path
			if (stripos($category_info['name'], 'Cakes Online In') !== false && strpos((string)$this->request->get['path'], '259') === false) {
				$parent_category_info = $this->model_catalog_category->getCategory(259);
				if ($parent_category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $parent_category_info['name'],
						'href' => $this->url->link('product/category', 'path=259')
					);
				}
			}

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);

			if ($category_info['image']) {
				if ($is_mobile) {
					$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $data['category_image_width_mobile'], $data['category_image_height_mobile']);
				} else {
					$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
				}
				$data['thumb_mobile'] = $this->model_tool_image->resize($category_info['image'], $data['category_image_width_mobile'], $data['category_image_height_mobile']);
			} else {
				$data['thumb'] = '';
				$data['thumb_mobile'] = '';
			}
			$data['category_image_width'] = (int)$this->config->get($this->config->get('config_theme') . '_image_category_width');
			$data['category_image_height'] = (int)$this->config->get($this->config->get('config_theme') . '_image_category_height');
			$data['product_image_width'] = (int)$this->config->get($this->config->get('config_theme') . '_image_product_width');
			$data['product_image_height'] = (int)$this->config->get($this->config->get('config_theme') . '_image_product_height');
			$data['category_image_width_mobile'] = min($data['category_image_width'], 360);
			$data['category_image_height_mobile'] = ($data['category_image_width'] > 0) ? (int)round(($data['category_image_height'] * $data['category_image_width_mobile']) / $data['category_image_width']) : $data['category_image_height'];
			$data['product_image_width_mobile'] = min($data['product_image_width'], 220);
			$data['product_image_height_mobile'] = ($data['product_image_width'] > 0) ? (int)round(($data['product_image_height'] * $data['product_image_width_mobile']) / $data['product_image_width']) : $data['product_image_height'];
			$data['is_mobile'] = $is_mobile;

			$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$data['category_faqs'] = $this->model_catalog_category->getCategoryFaqs($category_id);

			$localities_raw = $this->model_catalog_category->getCategoryLocalities($category_id);
			$data['category_localities'] = array();
			if (!empty($localities_raw)) {
				foreach ($localities_raw as &$loc) {
					$loc['href'] = $this->url->link('product/locality', 'category_id=' . $category_id . '&locality=' . urlencode($loc['area_name']));
				}
				unset($loc);
				$total = count($localities_raw);
				$max_per_box = 5;
				$num_boxes = ceil($total / $max_per_box);
				$chunk_size = ceil($total / $num_boxes);
				$data['category_localities'] = array_chunk($localities_raw, $chunk_size);
			}

			$data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['categories1'] = array();

			$results = $this->model_catalog_category->getCategories($category_id);

			foreach ($results as $result) {
				$filter_data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);

				$data['categories1'][] = array(
					'name' => $result['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
				);
			}

			if(count($path_cats)==3){
				$mc_parent_id=$path_cats[1];
				$mc_cat_id=$path_cats[2];
			} else if(count($path_cats)==2){
				$mc_parent_id=$path_cats[0];
				$mc_cat_id=$path_cats[1];
			} else {
				$mc_parent_id=0;
				$mc_cat_id=$path_cats[0];
			}

			$cat_path=$mc_parent_id."_".$mc_cat_id;
			$multicategory=$this->db->query("SELECT * from ".DB_PREFIX."category_multiparent where parent_id=".$mc_parent_id." and category_id=".$mc_cat_id)->row;
			$category_redirect=$this->db->query("SELECT * from ".DB_PREFIX."category_redirect where from_path='".$cat_path."'")->row;

			if(count($category_redirect)>0){
				$to_path=explode("_",$category_redirect['to_path']);

				if($to_path[0]==0){
					$to_cat_path=$to_path[1];
				} else {
					$to_cat_path=$category_redirect['to_path'];
				}

				$this->redirectCat($to_cat_path);

			} else if(count($multicategory)==0){
				$this->redirectCat(0);
			} 

			if($multicategory['title']!=''){
				$data['heading_title'] = $multicategory['title'];
			}

			if($multicategory['meta_title']!=''){
				$this->document->setTitle($multicategory['meta_title']);
			}

			if($multicategory['meta_description']!=''){
				$this->document->setDescription($multicategory['meta_description']);
			}

			if($multicategory['meta_keyword']!=''){
				$this->document->setKeywords($multicategory['meta_keyword']);
			}

			//$data['description']=$multicategory['description'];
			$data['description']=$category_info['description'];
			$data['category_content']=$multicategory['content'];

			$data['products'] = array();

			$filter_data = array(
				'filter_category_id' => $multicategory['id'],
				'filter_filter'      => $filter,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProductsForListing($filter_data);

			/*revie code start*/
			$review_summary = $this->model_catalog_product->getCategoryReviewSummary($multicategory['id']);
			$data['allreviews']['all'] = $this->model_catalog_product->getCategoryReviews($multicategory['id'], 5);
			$data['allreviews']['cnt'] = $review_summary['cnt'];
			$data['allreviews']['average'] = $review_summary['average'];
			//echo "<pre />"; print_r($data['allreviews']); die();
			/*revie code end*/
			$data['pMinPrice'] = 0;
			$data['pMaxPrice'] = 0;
			foreach ($results as $result) {
				if ($result['image']) {
					if ($is_mobile) {
						$image = $this->model_tool_image->resize($result['image'], $data['product_image_width_mobile'], $data['product_image_height_mobile']);
					} else {
						$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					}
					$image_mobile = $this->model_tool_image->resize($result['image'], $data['product_image_width_mobile'], $data['product_image_height_mobile']);
				} else {
					if ($is_mobile) {
						$image = $this->model_tool_image->resize('placeholder.png', $data['product_image_width_mobile'], $data['product_image_height_mobile']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					}
					$image_mobile = $this->model_tool_image->resize('placeholder.png', $data['product_image_width_mobile'], $data['product_image_height_mobile']);
				}

				if($data['pMinPrice'] == 0){
					$data['pMinPrice'] = $result['price'];
					$data['pMaxPrice'] = $result['price'];
				}

				if($data['pMinPrice'] > $result['price']){
					$data['pMinPrice'] = $result['price'];
				}

				if($data['pMaxPrice'] < $result['price']){
					$data['pMaxPrice'] = $result['price'];
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
					'thumb_mobile' => $image_mobile,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'reviewcnt'   => $result['reviews'],
					'href'        => $this->url->link('product/product','product_id=' . $result['product_id'] . $url),
					'quantity'    => $result['quantity'],
					'sku'    => $result['sku'],
					'mainp' => $result['price'],
					'purchased' => $result['purchased']
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			/*$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);*/

			/*$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);*/

			$data['sorts'][] = array(

				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				//'href'  => $this->url->link('product/category', 'path=' . $short_path . '&sort=p.price&order=ASC' . $url)
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				//'href'  => $this->url->link('product/category', 'path=' . $short_path . '&sort=p.price&order=DESC' . $url)
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					//'href'  => $this->url->link('product/category', 'path=' . $short_path . '&sort=rating&order=DESC' . $url)
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					//'href'  => $this->url->link('product/category', 'path=' . $short_path . '&sort=rating&order=ASC' . $url)
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$data['msorts'] = $data['sorts'];

			/*$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);*/

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				  $url .= '&filter=' . $this->request->get['filter'];

			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

			$data['pagination'] = $pagination->render();
			$data['paginationMobile'] = $pagination->renderMobile();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
				if(in_array($category_info['category_id'],array(49,265))) {
					$this->document->addLink(HTTP_SERVER, 'canonical');
				} else {
			    	$this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'canonical');
			    }
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page + 1), true), 'next');
			}

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
 
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');

			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');




			/* new filter code start */
			if ($category_info) {

				$this->load->language('extension/module/filter');

				$url = ''; 

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}


				$data['nfilter']['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url));
				//$data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $short_path . $url));
	 			//$data['action'] = strtok($data['action1'], '&');

				if (isset($this->request->get['filter'])) {
					$data['nfilter']['filter_category'] = explode(',', $this->request->get['filter']);
				} else {
					$data['nfilter']['filter_category'] = array();
				}

				if (isset($this->request->get['filter'])) {
					$filter = $this->request->get['filter'];
				} else {
					$filter = '';
				}

				$this->load->model('catalog/product');

				$data['nfilter']['filter_groups'] = array();

				if(count($path_cats)==2){
					$mc_parent_id=$path_cats[0];
					$mc_cat_id=$path_cats[1];
				} else {
					$mc_parent_id=0;
					$mc_cat_id=$path_cats[0];
				}

				$cat_path=$mc_parent_id."_".$mc_cat_id;
				$multicategory=$this->db->query("SELECT * from ".DB_PREFIX."category_multiparent where parent_id=".$mc_parent_id." and category_id=".$mc_cat_id)->row;

				$filter_cache_key = 'category.filter.groups.' . (int)$multicategory['id'] . '.' . (int)$category_id . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_product_count');
				$filter_cache_file = $this->getCategoryCacheFile($filter_cache_key);

				if (is_file($filter_cache_file)) {
					$cached_filter_groups = @unserialize(file_get_contents($filter_cache_file));
					if (is_array($cached_filter_groups)) {
						$data['nfilter']['filter_groups'] = $cached_filter_groups;
					}
				}

				if (empty($data['nfilter']['filter_groups'])) {
					$filter_groups = $this->model_catalog_category->getCategoryFilters($multicategory['id'],$filter);

					if ($filter_groups) {
						foreach ($filter_groups as $filter_group) {
							$childen_data = array();

							foreach ($filter_group['filter'] as $filter) {
								$filter_data = array(
									'filter_category_id' => $category_id,
									'filter_filter'      => $filter['filter_id']
								);

								$childen_data[] = array(
									'filter_id' => $filter['filter_id'],
									'name'      => $filter['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '')
								);
							}

							$data['nfilter']['filter_groups'][] = array(
								'filter_group_id' => $filter_group['filter_group_id'],
								'name'            => $filter_group['name'],
								'filter'          => $childen_data
							);
						}
					}

					@file_put_contents($filter_cache_file, serialize($data['nfilter']['filter_groups']));
				}
			}

			/* new filter code start */




			//echo "<pre />"; print_r($data); die();
			
			// Detect city/locality pages and load the new premium city template
			$_cat_name = isset($data['heading_title']) ? $data['heading_title'] : '';
			$_is_city_page = (
				stripos($_cat_name, 'Online Cake Delivery in') !== false ||
				stripos($_cat_name, 'Cakes Online in') !== false ||
				stripos($_cat_name, 'Cake Delivery in') !== false ||
				stripos($_cat_name, 'Cakes in ') !== false ||
				stripos($_cat_name, 'Cakes Shop in') !== false
			);
			
			if ($_is_city_page) {
				// Fetch dynamic content from home.tpl
				$home_tpl_path = DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl';
				if (!file_exists($home_tpl_path)) {
					$home_tpl_path = DIR_TEMPLATE . 'default/template/common/home.tpl';
				}
				$home_html = file_get_contents($home_tpl_path);
				$home_html_clean = preg_replace('/<\?php\s*\/\*.*?\*\/\s*\?>/is', '', $home_html);
				$home_html_clean = preg_replace('/<!--.*?-->/is', '', $home_html_clean);
				
				$data['home_quickcats'] = array();
				$data['home_banners'] = array();
				libxml_use_internal_errors(true);
				$dom = new DOMDocument();
				$dom->loadHTML($home_html_clean);
				$xpath = new DOMXPath($dom);
				
				$q_nodes = $xpath->query('//div[contains(@class, "home-header-tab")]//ul/li/a');
				$count = 0;
				foreach ($q_nodes as $node) {
					if ($count >= 8) break;
					$href = $node->getAttribute('href');
					$img_node = $xpath->query('.//img', $node)->item(0);
					if (!$img_node) continue;
					$img = '/' . ltrim($img_node->getAttribute('src'), '/');
					$p_node = $xpath->query('./following-sibling::p', $node)->item(0);
					$title = $p_node ? trim(strip_tags($p_node->nodeValue)) : '';
					$data['home_quickcats'][] = array('href' => $href, 'img' => $img, 'title' => $title);
					$count++;
				}
				
				// Helper for profession, cartoon, traits
				$parse_ul_li = function($xpath, $title) {
					$res = array();
					$nodes = $xpath->query('//div[contains(@class, "container")]//p[contains(text(), "'.$title.'")]/ancestor::div[contains(@class, "container")]/following-sibling::div[contains(@class, "container")]//ul/li/a | //p[contains(text(), "'.$title.'")]/ancestor::div[contains(@class, "container")]//ul/li/a');
					foreach ($nodes as $node) {
						$href = $node->getAttribute('href');
						$img_node = $xpath->query('.//img', $node)->item(0);
						if (!$img_node) continue;
						$img = '/' . ltrim($img_node->getAttribute('src'), '/');
						$p_node = $xpath->query('./following-sibling::p', $node)->item(0);
						$t = $p_node ? trim(strip_tags($p_node->nodeValue)) : '';
						$res[] = array('href' => $href, 'img' => $img, 'title' => $t);
					}
					return $res;
				};

				// 1. Trending Now
				$data['home_trending'] = array();
				$nodes = $xpath->query('//div[contains(@class, "teanding-section")]//div[contains(@class, "slide")]/a');
				foreach ($nodes as $node) {
					$href = $node->getAttribute('href');
					$img_nodes = $xpath->query('.//img', $node);
					$img = '';
					if ($img_nodes->length > 1) {
						$img = '/' . ltrim($img_nodes->item(1)->getAttribute('src'), '/');
					} elseif ($img_nodes->length > 0) {
						$img = '/' . ltrim($img_nodes->item(0)->getAttribute('src'), '/');
					}
					$title_node = $xpath->query('.//div[contains(@class, "trending-btn")]', $node)->item(0);
					$title = $title_node ? trim(strip_tags($title_node->nodeValue)) : '';
					$data['home_trending'][] = array('href' => $href, 'img' => $img, 'title' => $title);
				}

				// 2. Cakes by Profession
				$data['home_profession'] = $parse_ul_li($xpath, 'Cakes by Profession');

				// 3. Shop by Occasions
				$data['home_occasions'] = array();
				$nodes = $xpath->query('//p[contains(text(), "Shop by Occasions")]/ancestor::div[contains(@class, "row")]/following-sibling::div[contains(@class, "shop_by_occasions_row")]//a[contains(@class, "overlay-occasions-col")]');
				foreach ($nodes as $node) {
					$href = $node->getAttribute('href');
					$img_node = $xpath->query('./preceding-sibling::img', $node)->item(0);
					$img = $img_node ? '/' . ltrim($img_node->getAttribute('src'), '/') : '';
					$title_node = $xpath->query('.//div[contains(@class, "inner-overlay-cta-col")]/p', $node)->item(0);
					$title = $title_node ? trim(strip_tags($title_node->nodeValue)) : '';
					$data['home_occasions'][] = array('href' => $href, 'img' => $img, 'title' => $title);
				}

				// 4. Cakes for Kids
				$data['home_kids'] = array();
				$nodes = $xpath->query('//p[contains(text(), "Cakes for Kids")]/ancestor::div[contains(@class, "container")]/following-sibling::div[contains(@class, "container")]//div[contains(@class, "slide")]/a | //p[contains(text(), "Cakes for Kids")]/ancestor::div[contains(@class, "row")]//div[contains(@class, "slide")]/a');
				foreach ($nodes as $node) {
					$href = $node->getAttribute('href');
					$img_node = $xpath->query('.//img[contains(@class, "hidden-xs") or not(contains(@class, "visible-xs"))]', $node)->item(0);
					$img = $img_node ? '/' . ltrim($img_node->getAttribute('src'), '/') : '';
					$title_node = $xpath->query('.//h4[contains(@class, "product-name-title")]', $node)->item(0);
					$title = $title_node ? trim(strip_tags($title_node->nodeValue)) : '';
					if ($title) $data['home_kids'][] = array('href' => $href, 'img' => $img, 'title' => $title);
				}

				// 5. Cartoon Cakes
				$data['home_cartoon'] = $parse_ul_li($xpath, 'Cartoon Cakes');

				// 6. Cakes by Traits
				$data['home_traits'] = $parse_ul_li($xpath, 'Cakes by Traits');

				// 7. Shop by Flavours
				$data['home_flavours'] = array();
				$nodes = $xpath->query('//p[contains(text(), "Shop by Flavours")]/ancestor::div[contains(@class, "row")]//div[contains(@class, "for-mob-view-load-more")]//a | //p[contains(text(), "Shop by Flavours")]/ancestor::div[contains(@class, "row")]/following-sibling::div[contains(@class, "row")]//a');
				foreach ($nodes as $node) {
					$href = $node->getAttribute('href');
					$img_node = $xpath->query('.//img', $node)->item(0);
					$img = $img_node ? '/' . ltrim($img_node->getAttribute('src'), '/') : '';
					$title_node = $xpath->query('.//h4[contains(@class, "product-name-title")]', $node)->item(0);
					$title = $title_node ? trim(strip_tags($title_node->nodeValue)) : '';
					if ($title) $data['home_flavours'][] = array('href' => $href, 'img' => $img, 'title' => $title);
				}

				// 8. Bestselling Cakes
				$data['home_bestselling'] = array();
				$home_csv = DIR_SYSTEM . 'data/home_category.csv';
				$csv_mtime = file_exists($home_csv) ? (int)filemtime($home_csv) : 0;
				$cache_dir = DIR_CACHE . 'home/';
				if (!is_dir($cache_dir)) {
					@mkdir($cache_dir, 0777, true);
				}
				$cache_file = $cache_dir . md5('home.category.' . (int)$this->config->get('config_store_id') . '.' . (int)$this->config->get('config_language_id')) . '.cache';

				$csv_rows = array();
				$products_by_sku = array();
				$loaded_from_cache = false;

				if (is_file($cache_file)) {
					$payload = @unserialize(file_get_contents($cache_file));
					if (is_array($payload) && isset($payload['csv_mtime']) && (int)$payload['csv_mtime'] === $csv_mtime) {
						$csv_rows        = $payload['csv_rows'];
						$products_by_sku = $payload['products_by_sku'];
						$loaded_from_cache = true;
					}
				}

				if (!$loaded_from_cache) {
					if (is_file($home_csv) && ($file = fopen($home_csv, 'r')) !== false) {
						$skiphead = true;
						while (($line = fgetcsv($file)) !== false) {
							if ($skiphead) { $skiphead = false; continue; }
							$csv_rows[] = $line;
						}
						fclose($file);
					}

					$skus = array();
					foreach ($csv_rows as $line) {
						for ($col = 2; $col <= 7; $col++) {
							if (!empty($line[$col])) {
								$skus[] = $line[$col];
							}
						}
					}
					$products_by_sku = $skus ? $this->model_catalog_product->getProductsBySkus($skus) : array();

					@file_put_contents($cache_file, serialize(array(
						'csv_mtime'      => $csv_mtime,
						'csv_rows'       => $csv_rows,
						'products_by_sku' => $products_by_sku
					)));
				}

				$this->load->model('tool/image');
				$img_w = $this->config->get($this->config->get('config_theme') . '_image_product_width');
				$img_h = $this->config->get($this->config->get('config_theme') . '_image_product_height');

				$home_category = array();
				foreach ($csv_rows as $line) {
					$category_line = array('title' => $line[0], 'url' => $line[1], 'products' => array());
					for ($col = 2; $col <= 7; $col++) {
						if (empty($line[$col]) || !isset($products_by_sku[$line[$col]])) continue;
						$catpro = $products_by_sku[$line[$col]];
						$image  = $catpro['image']
							? $this->model_tool_image->resize($catpro['image'], $img_w, $img_h)
							: $this->model_tool_image->resize('placeholder.png', $img_w, $img_h);

						$price   = $this->currency->format($this->tax->calculate($catpro['price'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						$special = (float)$catpro['special']
							? $this->currency->format($this->tax->calculate($catpro['special'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
							: false;

						$category_line['products'][] = array(
							'product_id' => $catpro['product_id'],
							'name'    => $catpro['name'],
							'image'   => $image,
							'price'   => $price,
							'special' => $special,
							'href'    => $this->url->link('product/product', 'product_id=' . $catpro['product_id'])
						);
					}
					$home_category[] = $category_line;
				}
				
				if (!empty($home_category) && isset($home_category[0]['products'])) {
					$data['home_bestselling'] = $home_category[0]['products'];
				}
				
				$b_nodes = $xpath->query('//div[contains(@class, "main-banner-slide")]//div[contains(@class, "banner-slide")]/a');
				foreach ($b_nodes as $node) {
					$href = $node->getAttribute('href');
					$img_nodes = $xpath->query('.//img[contains(@class, "hidden-xs") or not(contains(@class, "visible-xs"))]', $node);
					$img = '';
					if ($img_nodes->length > 0) {
						$img = '/' . ltrim($img_nodes->item(0)->getAttribute('src'), '/');
					}
					if ($img && $href) {
						$data['home_banners'][] = array('href' => $href, 'img' => $img);
					}
				}
				libxml_clear_errors();

				$this->response->setOutput($this->load->view('product/city', $data));
			} else {
				$this->response->setOutput($this->load->view('product/category', $data));
			}
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/category', $url)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function redirectCat($code){
		if($code==0){
			$this->response->redirect($this->url->link('common/home', '', true),301);
		} else {
			$this->response->redirect($this->url->link('product/category', 'path='.$code, true),301);
		}
	}

	public function proIDetails(){
		$product_id = $_GET['proId'];
		$this->load->model('catalog/product');
		$options = $this->model_catalog_product->getProductOptions($product_id);
		$attributes = $this->model_catalog_product->getProductAttributes($product_id);
		$reviews = $this->model_catalog_product->getProductsReviews(array($product_id));
		$data = array();
		$data['attribute'] = $attributes[0]['attribute'];
		foreach ($options as $value) {
			if($value['option_id'] == 1){
				foreach ($value['product_option_value'] as $val) {
					$data['options'][] = $val['name'];
				}
			}
		}
		$data['reviewCnt'] = count($reviews);
		echo json_encode($data);
	}

	public function testimonials(){
		$this->load->model('catalog/category');

		$url = '';
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = 10;
		}

		if (isset($this->request->get['path'])) {
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
		}

		$filter_data = array(
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);

		$product_total = $this->model_catalog_category->getTotalTestimonials($filter_data);
		$data['total'] = $product_total;

		$results = $this->model_catalog_category->getTestimonials($filter_data);

		$data['testis'] = $results;

		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('product/category/testimonials', $url . '&page={page}');

		$data['pagination'] = $pagination->render();
		$data['paginationMobile'] = $pagination->renderMobile();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
			$this->document->addLink($this->url->link('product/category/testimonials', '', true), 'canonical');
		} elseif ($page == 2) {
		    $this->document->addLink($this->url->link('product/category/testimonials', '', true), 'prev');
		} else {
		    $this->document->addLink($this->url->link('product/category/testimonials', '&page='. ($page - 1), true), 'prev');
		}

		if ($limit && ceil($product_total / $limit) > $page) {
		    $this->document->addLink($this->url->link('product/category', '&page='. ($page + 1), true), 'next');
		}

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		$data['column_left'] = $this->load->controller('common/column_left');

		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$this->response->setOutput($this->load->view('product/customer_review', $data));
	}

	private function getCategoryCacheFile($key) {
		$directory = DIR_CACHE . 'category/';

		if (!is_dir($directory)) {
			@mkdir($directory, 0777, true);
		}

		return $directory . md5($key) . '.cache';
	}

	private function isMobileDevice() {
		$user_agent = $_SERVER['HTTP_USER_AGENT'] ?? '';
		$mobile_keywords = ['Mobile', 'Android', 'iPhone', 'iPad', 'Windows Phone', 'BlackBerry', 'webOS'];
		foreach ($mobile_keywords as $keyword) {
			if (stripos($user_agent, $keyword) !== false) {
				return true;
			}
		}
		return false;
	}
}
