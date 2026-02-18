<?php
class ControllerProductProduct extends Controller {
	private $error = array();

	public function index() {

		$this->load->language('product/product');
	
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => '',
			'href' => HTTPS_SERVER
		);

		$this->load->model('catalog/category');

		/* if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$url = '';

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
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		} */



		$this->load->model('catalog/manufacturer');

		/* if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

			$url = '';

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

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		} */

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$subsku = explode('-', $product_info['sku']);
		if(count($subsku) > 1){
			$redirectPro = $this->model_catalog_product->getProductBySku($subsku[0]);
			$newUrl = $this->url->link('product/product','product_id=' . $redirectPro['product_id']);
			header("Location: ".$newUrl, true, 301);
			exit();
		}

		if(isset($product_info['weight']) && !empty($product_info['weight'])){
			$breadcrumpCatDetail = $this->model_catalog_category->getMultiParentCategory($product_info['weight']);
			$data['breadcrumbs'][] = array(
					'text' => $breadcrumpCatDetail['title'],
					'href' => $this->url->link('product/category', 'path=' . $breadcrumpCatDetail['category_id'])
				);
		}

		$recentlyViewed = $this->model_catalog_product->saveGetRecentlyViewed($product_id);
 
		if ($product_info) {
			$category_id = $this->model_catalog_category->getCategoryIds($product_id);

			$category_info = $this->model_catalog_category->getCategory($category_id);

			/*if ($category_info) {
				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $category_id)
				);
			}*/


			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', 'product_id=' . $product_id)
			);
			$data['plink'] = $this->url->link('product/product', 'product_id=' . $product_id);
	
			 
			$this->document->setTitle($product_info['meta_title']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

			$data['heading_title'] = $product_info['name'];

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];
			$data['product_addon_shipping_type'] = $product_info['product_addon_shipping_type'];

			$this->load->model('tool/image');

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


			/*egg/eggless products*/
			$eggProductsSku=explode(",",$product_info['mpn']);
			$eggProducts=array();
			if(count($eggProductsSku)>1)
				foreach($eggProductsSku as $sku){
					$lp=$this->model_catalog_product->getProductBySku($sku);

					if ($lp['image']) {
						$lpimage = $this->model_tool_image->resize($lp['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					} else {
						$lpimage = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$lpprice = $this->currency->format($this->tax->calculate($lp['price'], $lp['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$lpprice = false;
					}

					if ((float)$lp['special']) {
						$lpspecial = $this->currency->format($this->tax->calculate($lp['special'], $lp['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$lpspecial = false;
					}

					$eggProducts[]=array(
							'name'=>$lp['name'],
							'product_id'=>$lp['product_id'],
							'image'=>$lpimage,
							'price'=>$lpprice,
							'special'=>$lpspecial,
							'href' => $this->url->link('product/product', 'product_id=' . $lp['product_id'])

						);
				}

			$data['eggProducts']=$eggProducts;


			/*pick an upgrade products*/
			$linkedProductsSku=explode(",",$product_info['location']);
			$linkedProducts=array();
			if(count($linkedProductsSku)>1)
				foreach($linkedProductsSku as $sku){
					$lp=$this->model_catalog_product->getProductBySku($sku);

					if ($lp['image']) {
						$lpimage = $this->model_tool_image->resize($lp['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					} else {
						$lpimage = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$lpprice = $this->currency->format($this->tax->calculate($lp['price'], $lp['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$lpprice = false;
					}

					if ((float)$lp['special']) {
						$lpspecial = $this->currency->format($this->tax->calculate($lp['special'], $lp['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$lpspecial = false;
					}

					$linkedProducts[]=array(
							'name'=>$lp['name'],
							'product_id'=>$lp['product_id'],
							'image'=>$lpimage,
							'price'=>$lpprice,
							'special'=>$lpspecial,
							'href' => $this->url->link('product/product', 'product_id=' . $lp['product_id'])

						);
				}

			
			$data['linkedProducts']=$linkedProducts;

			$data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');

			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product_info['quantity'];
			} else {
				$data['stock'] = $this->language->get('text_instock');
			}

			$data['meta_description'] = $product_info['meta_description'];
			$data['pstock'] = $product_info['quantity'];
			$data['prating'] = (int)$product_info['rating'];
			$data['ptotalreviews'] = sprintf((int)$product_info['reviews']);
			$data['plink'] = $this->session->data['plink'];
			$data['pprice'] = $this->session->data['pprice'];
			$data['config_currency'] = $this->config->get('config_currency');
			$data['config_gr_status'] = $this->config->get('grsnippetgoogle_status');
			$this->load->model('catalog/review');
			$data['config_name'] = $this->config->get('config_name');
			$data['reviewresults'] = $this->model_catalog_review->getAllReviewsByProductId($this->request->get['product_id']);
			$ratingttl = 0;
			foreach ($data['reviewresults'] as $review) {
				$ratingttl = $ratingttl + $review['rating'];
			}
			if(count($data['reviewresults']) > 0){
				$data['raverage'] = round(($ratingttl / count($data['reviewresults'])),2);	
			} else {
				$data['raverage'] = 0;
			}
			$data['rcount'] = count($data['reviewresults']);

			if ($product_info['image']) {
				if($this->config->get('grsnippetfacebook_status') && $this->config->get('grsnippetpinterest_status')) {
					$data['pinimage'] = $this->model_tool_image->resize($product_info['image'],$this->language->get('mix_image_width'), $this->language->get('mix_image_height'));
				} else if($this->config->get('grsnippetfacebook_status')) {
					$data['pinimage'] = $this->model_tool_image->resize($product_info['image'],$this->language->get('facebook_image_width'), $this->language->get('facebook_image_height'));
				} else {
					$data['pinimage'] = $this->model_tool_image->resize($product_info['image'],$this->language->get('pinterest_image_width'), $this->language->get('pinterest_image_height'));
				}
			} else {
				$data['pinimage'] = '';
			}
			$this->session->data['pinimage'] = $data['pinimage'];

				if ($product_info['image']) {
					if($this->config->get('config_twitter_cardsize')) {
						$data['twitimage'] = $this->model_tool_image->resize($product_info['image'], $this->language->get('twitter_image_width'), $this->language->get('twitter_image_height'));
					} else {
						$data['twitimage'] = $this->model_tool_image->resize($product_info['image'], $this->language->get('twitter_imagesmall_width'), $this->language->get('twitter_imagesmall_height'));
					}
				} else {
					$data['twitimage'] = '';
				}
				$this->session->data['twitimage'] = $data['twitimage'];

			if ($product_info['image']) {
				//$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], 1000,1000);
			} else {
				$data['popup'] = '';
			}

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					//'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
					'popup' => $this->model_tool_image->resize($result['image'], 1000,1000),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
				);
			}
			
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['price'] = false;
			}
			$data['mainprice'] = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
			$data['oldmainprice'] = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
			$data['quantity'] = $product_info['quantity'];

			if ((float)$product_info['special'] && $product_info['special'] < $product_info['price']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['special'] = false;
			}

			if($data['special']){
				$data['mainprice'] = $this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'));
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}

			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix'],
							'simpleprice'			  => $option_value['price']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['review_status'] = $this->config->get('config_review_status');

			if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			} else {
				$data['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$data['rating'] = (int)$product_info['rating'];

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$data['products'] = array();

			$results = $this->model_catalog_product->getProductRelated2($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
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
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$data['recentlyViewed'] = array();
			foreach ($recentlyViewed as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
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

				$data['recentlyViewed'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$similarProducts = $this->model_catalog_product->getSimilarProducts($product_id, $product_info['weight']);
			$data['parent_cat_url'] = $this->model_catalog_product->getParentCategoryUrl($product_info['weight']);
			$data['parent_cat'] = $this->model_catalog_product->getParentCategoryName($product_info['weight']);
			$data['similarProducts'] = array();
			foreach ($similarProducts as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
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

				$data['similarProducts'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'reviews'        => $result['reviews'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);
			//echo "<pre />"; print_r($data); die();
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$data['pimage'] = $this->model_tool_image->resize($product_info['image'], 1000,1000);
			$data['sku'] = $product_info['sku'];
			$this->response->setOutput($this->load->view('product/product', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
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

	public function review() {
		$this->load->language('product/product');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 50, 50);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write() {
		$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getRecurringDescription() {
		$this->load->language('product/product');
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}


	public function getCities(){
		$cityname = $_GET['cityname'];
		$proId = $_GET['proId'];
		$this->load->model('catalog/product');
		$citynames = $this->model_catalog_product->getCities($cityname, $proId);
		$this->response->setOutput(json_encode($citynames));
	}

	public function getPin(){
		$pinvalue = $_POST['pincode1'];
		//return $pinvalue;
		$ch = fopen(DIR_SYSTEM.'pin1.csv', 'r');
		$header_row = fgetcsv($ch);

		$found=false;
		while($row = fgetcsv($ch)) {
			if($pinvalue==$row[0]){
				$found=true;
				break;
			}		 
		}
		if($found){
			echo '<div style="font-size: 13px; font-weight: normal;color:#008000;">Congratulations! Delivery is available in your area.</div>';
		} else {
			echo '<div style="font-size: 13px;font-weight: normal;">Sorry! Delivery is not currently available in your area.</div>';
		}
	}

	public function getDates(){
		$cityId = $this->request->post['cityId'];
		$proId = $this->request->post['proId'];
		$this->load->model('catalog/product');
		$duration = $this->model_catalog_product->getDates($cityId, $proId);
		$data['duration'] = $duration;
		$data['date'] = date('Y-m-d', strtotime("+".$duration." days"));
		print_r(json_encode($data));
	}

	public function getDatesTimeForPro(){
		date_default_timezone_set("Asia/Kolkata");
		$shippingType = $this->request->post['shippingType'];
		$this->load->model('catalog/product');
		$rslt = $this->model_catalog_product->getDatesTimeForPro($shippingType);
		$lastHoru = $rslt['timeslot'][count($rslt['timeslot'])-1]['timeslot_to'];
		$newTime = $rslt['timeslot'][count($rslt['timeslot'])-1]['leadtime'] - $rslt['timeslot'][count($rslt['timeslot'])-1]['buffertime'];
		$new_diff = strtotime($lastHoru)-$newTime*3600;
		$diff_time = date("H:i", $new_diff);
		$dateTime = new DateTime($diff_time);
		$inc = 0;
		if ($dateTime->diff(new DateTime)->format('%R') == '+' && $rslt['duration'] == 0) {
		  $inc = 1;
		}
		
		$data['holiday'] = $rslt['holiday'];
		$data['duration'] = $rslt['duration'] + $inc;
		$data['timeslot'] = $rslt['timeslot'];
		$data['date'] = date('Y-m-d', strtotime("+".$data['duration']." days"));
		print_r(json_encode($data));
	}

	public function getShippingTypes(){
		$duration = $this->request->post['duration'];
		$proId = $this->request->post['proId'];
		$this->load->model('catalog/product');
		$data = $this->model_catalog_product->getShippingTypes($duration, $proId);
		print_r(json_encode($data));
	}

	public function getShippingTypeForPro(){
		date_default_timezone_set("Asia/Calcutta");		
		$proId = $this->request->post['proId'];
		$cid = $this->request->post['cid'];
		$delDate = date('Y-m-d',strtotime($this->request->post['delDate']));
		$this->load->model('catalog/product');
		//echo "This is date=>".$delDate;
		$rslt = $this->model_catalog_product->getShippingTypeForPro($proId, $cid, $delDate);
		//echo "<pre />"; print_r($rslt);
		$data = array();
		foreach ($rslt as $rslt1) {
			$curDate = date('Y-m-d');
			if(strtotime($delDate)>strtotime($curDate)){
				$data[] = array('id' => $rslt1['id'], 'name' => $rslt1['name'], 'show_description' => $rslt1['show_description'], 'usePrice' =>$rslt1['price'], 'price' => $this->currency->format($this->tax->calculate($rslt1['price'], 0, $this->config->get('config_tax')), $this->session->data['currency']));
			}else{
				$shippingId = $rslt1['id'];
				$totalDelayHour = ($rslt1['leadtime'] + $rslt1['buffertime'])*60;
				$actualTime = date('Y-m-d H:i', strtotime('now +'.$totalDelayHour.' minutes'));
				$ipAddress = $_SERVER['REMOTE_ADDR'];
				if($shippingId=='5'){
					//echo "This is time=>".$actualTime." This is curr time=>".date('Y-m-d h:i:s');
				}
				$checkDate = date('Y-m-d', strtotime($actualTime));
				if(strtotime($checkDate)==strtotime($curDate)){
					$rsltTime1 = $this->model_catalog_product->getShippingTypeTime($shippingId, $actualTime);
					if($rsltTime1[0]['total']>0){
						$data[] = array('id' => $rslt1['id'], 'name' => $rslt1['name'], 'show_description' => $rslt1['show_description'], 'usePrice' =>$rslt1['price'], 'price' => $this->currency->format($this->tax->calculate($rslt1['price'], 0, $this->config->get('config_tax')), $this->session->data['currency']));
					}
				}						
				
			}			
		}
		//echo "<pre />"; print_r($data); die;
		print_r(json_encode($data));
	}

	public function checkTodayShipingType(){
		date_default_timezone_set("Asia/Calcutta");		
		$proId = $this->request->post['proId'];
		$cid = $this->request->post['cid'];
		$delDate = date('Y-m-d');
		$this->load->model('catalog/product');
		$rslt = $this->model_catalog_product->getShippingTypeForPro($proId, $cid, $delDate);
		$data = array();
		foreach ($rslt as $rslt1) {
			$shippingId = $rslt1['id'];
			$totalDelayHour = ($rslt1['leadtime'] + $rslt1['buffertime'])*60;
			$actualTime = date('Y-m-d H:i', strtotime('now +'.$totalDelayHour.' minutes'));
			$checkDate = date('Y-m-d', strtotime($actualTime));
			if(strtotime($checkDate)==strtotime($delDate)){
					$rsltTime1 = $this->model_catalog_product->getShippingTypeTime($shippingId, $actualTime);
					if($rsltTime1[0]['total']>0){
						$data['msg']='1';
						break;
					}else{
						$data['msg']='0';
					}
				}else{
					$data['msg']='0';
				}
		}
		//echo "<pre />"; print_r($data); die;
		print_r(json_encode($data));
	}

	public function getPincodesList(){
		$pincode = $this->request->post['pins'];
		$proId = $this->request->post['proId'];
		
		$this->load->model('catalog/product');
		$data = $this->model_catalog_product->getPincodesList($pincode, $proId);
		print_r(json_encode($data));
	}

	public function checkCustomPincode(){
		$pincode = $this->request->post['pincode'];
		
		$this->load->model('catalog/product');
		$data = $this->model_catalog_product->checkCustomPincode($pincode);
		if (count($data) > 0) {
			$data['pincodeServiceable'] = '1';
			$this->session->data['selectedCityId'] = $data["shipping_cities_id"];
			$this->session->data['selectedPincode'] = $pincode;
			$this->session->data['selectedCity'] = $data["name"];
		} else {
			$data['pincodeServiceable'] = '0';
			$this->session->data['selectedCityId'] = '';
			$this->session->data['selectedPincode'] = '';
			$this->session->data['selectedCity'] = '';
		}
		print_r(json_encode($data));
	}
	
	public function getTimeslots(){
		$shippingType = $this->request->post['shippingType'];
		$this->load->model('catalog/product');
		$data = $this->model_catalog_product->getTimeslots($shippingType);
		print_r(json_encode($data));
	}

	/*public function getAddons(){
		$proId = $this->request->post['proId'];
		$this->load->model('catalog/product');
		$data = $this->model_catalog_product->getAddons($proId);
		$this->load->model('tool/image');
		$data1 = array();
		$data2 = array();
		foreach ($data as $pro) {
			$data1['product_id'] = $pro['product_id'];
			$data1['image'] = $this->model_tool_image->resize($pro['image'], 135, 135);
			$data1['name'] = $pro['name'];
			$data1['price'] = $this->currency->format($pro['price'], $this->session->data['currency']);
			$data2[] = $data1;
		}		
		print_r(json_encode($data2));
	}*/

	public function getAddons(){
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$file=fopen(DIR_SYSTEM.'data/addons.csv', 'r');
		$addons=array();
		$counter=0;
		$skiphead=true;
		$cityId = $this->request->post['cityId'];
		$addData = array();
		while (($line = fgetcsv($file)) !== FALSE) {
		  	if($skiphead){$skiphead=false; continue;}
		  	$addData[$line[0]][] = array($line[1], $line[2]);
		 }
		foreach ($addData[$cityId] as $line) {
		  	if($skiphead){$skiphead=false; continue;}
		  	$pros = explode('|', $line[1]);
		  	if(is_array($pros) && count($pros) > 0){
		  		foreach ($pros as $pro) {
			  		$prodetail = $this->model_catalog_product->getProductBySku($pro);
			  		$attributes = $this->model_catalog_product->getProductAttributes($prodetail['product_id']);
			  		$addons[$line[0]][] = array(
			  								'product_id' => $prodetail['product_id'],
			  								'image' => $this->model_tool_image->resize($prodetail['image'], 250, 250),
			  								'name' => $prodetail['name'],
			  								'price' => $this->currency->format($prodetail['price'], $this->session->data['currency']),
			  								'pprice' => $prodetail['price'],
			  								'tax_class_id' => $prodetail['tax_class_id'],
			  								'attributes' => (isset($attributes[0]['attribute']) && !empty($attributes[0]['attribute'])) ? $attributes[0]['attribute'] : [],
			  							);
			  	}	
		  	}
		}
		print_r(json_encode($addons));
	}

	public function getPincodes(){
		$pincode = $_GET['pincode'];
		$this->load->model('catalog/product');
		$pincodes = $this->model_catalog_product->getPincodes($pincode);
		$this->response->setOutput(json_encode($pincodes));
	}

	public function uploadNew(){
		$sql = $this->db->query('SELECT product_id FROM `oc_product_description` WHERE name LIKE "%photo cake%"');
		$i = 0;
		foreach ($sql->rows as $value) {
			echo $i."<br>";
			$aa = "INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES (NULL, '".$value['product_id']."', '4', 'Please Enter Cake Message', '0')";
			$this->db->query($aa);
			$i++;
		}
	}

	public function addExpressShipSame(){
		//$sql = $this->db->query('SELECT product_id FROM `oc_product` WHERE  sku IN ("CAKECHOH004","CAKEBLFTH019","EXFNP29","VRTEXFNP14-1","VRTEXDFNP1034-1","VRTEXFNP181-8","VRTEXFNP181-20","EXDFNP1009","VRTEXFNP10-1","EXDRYFRUITS27","EXDSWEETS38","EXDSWEETS19","EXDSWEETS11","EXDRYFRUITS28","EXFNP220_CHOCO_BOQ","EXFNP204_CHOCO_BOQ","VRTEXDFNP2012-1","EXFNP255_CHOCO_BOQ","EXDSWEETS51","EXDCHOCO15","EXDRYFRUITS3","EXDRYFRUITS8","EXDSWEETS9","EXFNP201_CHOCO_BOQ","EXFNP202_CHOCO_BOQ","EXFNP203_CHOCO_BOQ","EXFNP204_CHOCO_BOQ","EXFNP206_CHOCO_BOQ","EXFNP213_CHOCO_BOQ","EXFNP214_CHOCO_BOQ","EXFNP216_CHOCO_BOQ","EXFNP219_CHOCO_BOQ","EXFNP221_CHOCO_BOQ","EXFNP222_CHOCO_BOQ","EXFNP223_CHOCO_BOQ","EXFNP229_CHOCO_BOQ","EXFNP230_CHOCO_BOQ","EXFNP232_CHOCO_BOQ","EXFNP233_CHOCO_BOQ","EXFNP241_CHOCO_BOQ","EXFNP242_CHOCO_BOQ","EXFNP244_CHOCO_BOQ","EXFNP246_CHOCO_BOQ","EXFNP248_CHOCO_BOQ","EXFNP250_CHOCO_BOQ","EXFNP251_CHOCO_BOQ","EXFNP253_CHOCO_BOQ","EXFNP256_CHOCO_BOQ","EXFNP258_CHOCO_BOQ")');

		$i = 0;
		foreach ($sql->rows as $value) {
			$this->db->query("DELETE FROM `oc_shipping_to_product` WHERE `product_id` = '".$value['product_id']."'");
			for ($i=2; $i < 6; $i++) { 
				echo $i."<br>";
				$aa = "INSERT INTO `oc_shipping_to_product` (`product_id`, `shipping_id`) VALUES ('".$value['product_id']."', '".$i."')";
				$this->db->query($aa);
			}
		}
	}



	public function addExpressShipNext(){
		//$sql = $this->db->query('SELECT product_id FROM `oc_product` WHERE  sku IN ("EXDPLANT4","EXDPLANT41","EXDPLANT145_TERRARIUM","EXDPLANT147_TERRARIUM")');
		echo "<pre />"; print_r($sql);
		$i = 0;
		foreach ($sql->rows as $value) {
			$aa = "INSERT INTO `oc_shipping_to_product` (`product_id`, `shipping_id`) VALUES ('".$value['product_id']."', '6')";
				$this->db->query($aa);
		}
	}


	public function generateSitemap(){
		$type = $this->request->get['type'];

		if($type == 'product'){
			$products=$this->db->query("SELECT product_id from ".DB_PREFIX."product where status=1 and product_addon_status = 0 order by product_id")->rows;
			$output = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
	  		$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";
	  		foreach($products as $product){
	  			$output.="<url>";
	  				$output.="<loc>".htmlspecialchars($this->url->link('product/product','product_id=' . $product['product_id']))."</loc>";
	  				$output.="<priority>0.5</priority>";
	  				$output.="<changefreq>weekly</changefreq>";
	  			$output.="</url>";
	  		}
	  		$output.="</urlset>";
	  		$xml_filename = DIR_SYSTEM.'../product-sitemap.xml';
	  		$fd = fopen ($xml_filename, "w");
	  		fputs($fd, $output);
	  		fclose($fd);
	  		echo "Product XML created successfully.";
		}

		if($type == 'category'){
			$file=fopen(DIR_SYSTEM.'data/category_remove_from_sitemap.csv', 'r');
			$excludeUrl = array();
			while (($line = fgetcsv($file)) !== FALSE) {
				$excludeUrl[] = $line[0];
			}
			$rows=$this->db->query("SELECT * from ".DB_PREFIX."category_multiparent order by id")->rows;
			$catpro=array();
			foreach($rows as $row){
				$parent="";
				if($row['parent_id']!=0){
					$parent=$this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$row['parent_id']."'")->row['keyword'];
					$parent.="/";
				}

				$child=$this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$row['category_id']."'")->row['keyword'];
				$url=$parent.$child;

				if($url=="" || $url=='/') continue;

				$catpro[$row['id']]=$url;
			}

			$output = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
	  		$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

	  		$output.="<url>";
				$output.="<loc>".HTTPS_SERVER."</loc>";
				$output.="<priority>1</priority>";
				$output.="<changefreq>daily</changefreq>";
			$output.="</url>";
			//$priority_cat=array("birthday/gifts","birthday/flowers","birthday/cakes","birthday/chocolates","birthday/gift-hampers","anniversary/gifts","anniversary/flowers","anniversary/cakes","anniversary/gift-hampers");
			//echo "<pre />"; print_r($catpro); die();
	  		foreach($catpro as $cat_url){
	  			if(in_array($cat_url, $excludeUrl)){
					continue;
				}
				$cat_url = str_replace('&', '-', $cat_url);
	  			$output.="<url>";
	  				$output.="<loc>".HTTPS_SERVER.$cat_url."</loc>";
	  				$output.="<priority>".(count(explode("/",$cat_url))==1 || in_array($cat_url, $priority_cat)?0.9:0.8)."</priority>";
	  				$output.="<changefreq>daily</changefreq>";
	  			$output.="</url>";
	  		}
	  		$output.="</urlset>";

	  		//echo $output; die;

	  		$xml_filename = DIR_SYSTEM.'../category-sitemap.xml';
	  		$fd = fopen ($xml_filename, "w");
	  		fputs($fd, $output);
	  		fclose($fd);
	  		echo "Category XML created successfully.";
		}

		//this is new logic to cover 3 level categories. Not commenting above code for reference. category-sitemap.xml will be override.
		if($type == 'category'){
			$file=fopen(DIR_SYSTEM.'data/sitemap-categories.csv', 'r');
			$output = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
	  		$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

	  		$output.="<url>";
			$output.="<loc>".HTTPS_SERVER."</loc>";
			$output.="<priority>1</priority>";
			$output.="<changefreq>daily</changefreq>";
			$output.="</url>";
			$exclude = true;
			while (($line = fgetcsv($file)) !== FALSE) {
				if($exclude){
					$exclude = false;
					continue;
				}
				if(!empty($line[0])){
					$output.="<url>";
	  				$output.="<loc>".str_replace('&', '-', $line[0])."</loc>";
	  				$output.="<priority>0.9</priority>";
	  				$output.="<changefreq>daily</changefreq>";
	  				$output.="</url>";
				}
			}
			$output.="</urlset>";

	  		$xml_filename = DIR_SYSTEM.'../category-sitemap.xml';
	  		$fd = fopen ($xml_filename, "w");
	  		fputs($fd, $output);
	  		fclose($fd);
	  		echo "Category XML created successfully.";
		}

		if($type == 'blog'){
			$servername = "localhost";
			$username = "hzgvevxgbf";
			$password = "BJUyNdRy7Z";
			$dbname = "hzgvevxgbf";

			// Create connection
			$conn = new mysqli($servername, $username, $password, $dbname);
			// Check connection
			if ($conn->connect_error) {
			  die("Connection failed: " . $conn->connect_error);
			}
			$sql = "SELECT post_name FROM `wp_posts` WHERE `post_status` = 'publish' ORDER BY `post_status`";
			$result = $conn->query($sql);
			$output = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
	  		$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";
			if ($result->num_rows > 0) {
			  // output data of each row
			  while($row = $result->fetch_assoc()) {
			  	$output.="<url>";
  				$output.="<loc>".HTTPS_SERVER.'blogs/'.$row["post_name"]."</loc>";
  				$output.="<priority>0.5</priority>";
  				$output.="</url>";
			  }
			} else {
			  echo "0 results";
			}
			$output.="</urlset>";
			$conn->close();
			$xml_filename = DIR_SYSTEM.'../blog-sitemap.xml';
	  		$fd = fopen ($xml_filename, "w");
	  		fputs($fd, $output);
	  		fclose($fd);
	  		echo "Blog XML created successfully.";
		}

		$output = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
	  	$output .= '<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";
	  	
	  	$output.="<sitemap>";
		$output.="<loc>".HTTPS_SERVER."product-sitemap.xml</loc>";
		$output.="<lastmod>".date('Y-m-d')."</lastmod>";
		$output.="</sitemap>";
		
		$output.="<sitemap>";
		$output.="<loc>".HTTPS_SERVER."blog-sitemap.xml</loc>";
		$output.="<lastmod>".date('Y-m-d')."</lastmod>";
		$output.="</sitemap>";

		$output.="<sitemap>";
		$output.="<loc>".HTTPS_SERVER."category-sitemap.xml</loc>";
		$output.="<lastmod>".date('Y-m-d')."</lastmod>";
		$output.="</sitemap>";

		$output.="</sitemapindex>";
		$xml_filename = DIR_SYSTEM.'../sitemap.xml';
  		$fd = fopen ($xml_filename, "w");
  		fputs($fd, $output);
  		fclose($fd);
	}

	public function updateParentCategory(){
		$file=fopen(DIR_SYSTEM.'data/similarpro.csv', 'r');
		$excludeUrl = array();
		$i = 0;
		while (($line = fgetcsv($file)) !== FALSE) {
			//echo "<pre />"; print_r($line); die();
			$this->db->query("UPDATE `oc_product` SET weight = '".$line[1]."' WHERE `product_id` = '".$line[0]."'");
			$i++;
		}
		echo $i;
	}

	public function triggerCron1(){
		$sql = "select * from ".DB_PREFIX."followup WHERE type = 'followup' AND status NOT IN ('2','5','7', '8', '10', '11') AND is_notify = 0 AND TIMESTAMPDIFF(MINUTE, date_added, now()) > 5";
		$rows=$this->db->query($sql)->rows;
		$ids = array();
		$url = "https://live-server-957.wati.io/api/v1/sendTemplateMessage?whatsappNumber=91";
		foreach ($rows as $row) {
			$ids[] = $row['id'];
			$send1 = array();
			$send1['template_name'] = 'abcnew';
			$send1['broadcast_name'] = 'abcnew';
			$send1['parameters'][] = array('name' => 'name', 'value' => $row['customer_name']);
			$url1 = $url.$row['customer_phone'];
			$this->setWhatsAppMessage($url1, $send1);
		}

		if(!empty($ids)){
			$this->db->query("UPDATE oc_followup SET is_notify = 1 WHERE id IN (".implode(',', $ids).")");
		}

		$sql = "select * from ".DB_PREFIX."order WHERE order_status_id = 0 AND is_notify = 0 AND TIMESTAMPDIFF(MINUTE, date_added, now()) > 5";
		$rows=$this->db->query($sql)->rows;
		$ids = array();
		foreach ($rows as $row) {
			$ids[] = $row['order_id'];
			$send1 = array();
			$send1['template_name'] = 'pnc0503252';
			$send1['broadcast_name'] = 'pnc0503252';
			$send1['parameters'][] = array('name' => 'name', 'value' => $row['payment_firstname']);
			$send1['parameters'][] = array('name' => 'order_amount', 'value' => $row['total']);
			$send1['parameters'][] = array('name' => 'agent', 'value' => 'Vivek');
			$url1 = $url.$row['payment_mobile'];
			$this->setWhatsAppMessage($url1, $send1);
		}
		if(!empty($ids)){
			$this->db->query("UPDATE oc_order SET is_notify = 1 WHERE order_id IN (".implode(',', $ids).")");
		}
	}

	public function triggerCron2(){
		$sql = "select o.payment_firstname, h.date_added, o.shipping_firstname, o.payment_mobile from oc_order o join oc_order_history h ON o.order_id = h.order_id where h.order_status_id = 7 and date(h.date_added) = '".date('Y-m-d', strtotime('-362 days'))."' group by h.order_id";
		$rows=$this->db->query($sql)->rows;
		$ids = array();
		$url = "https://live-server-957.wati.io/api/v1/sendTemplateMessage?whatsappNumber=91";
		foreach ($rows as $row) {
			$ids[] = $row['order_id'];
			$send1 = array();
			$send1['template_name'] = 'odb';
			$send1['broadcast_name'] = 'odb';
			$send1['parameters'][] = array('name' => 'name', 'value' => $row['payment_firstname']);
			$send1['parameters'][] = array('name' => 'sendername', 'value' => $row['shipping_firstname']);
			$send1['parameters'][] = array('name' => 'date', 'value' => date('d-M-Y', strtotime($row['date_added'])));
			$url1 = $url.$row['payment_mobile'];
			$this->setWhatsAppMessage($url1, $send1);
		}
	}

	public function updateDeliveryDate(){
		$sql = "select order_id, shipping_info from oc_order_product where shipping_info <> '[]' ";
		$rows=$this->db->query($sql)->rows;
		foreach ($rows as $row) {
			$dd = (array)json_decode($row['shipping_info'], true);
			if(isset($dd) && !empty($dd) && isset($dd['Shipping Date'])){
				$date = date('Y-m-d', strtotime($dd['Shipping Date']));
				$slot = $dd['Shipping Time'];
				$this->db->query("UPDATE oc_order SET date_forshipping = '".$date."', slot_forshipping = '".$slot."' WHERE order_id = ".$row['order_id']);
			}
		}
	}

	private function setWhatsAppMessage($url, $data){
		$token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxZDMyNzg3My02MmIyLTQyNTQtYWVjZi0yNWVjYmQxMjM3YTYiLCJ1bmlxdWVfbmFtZSI6InNoYXJpcXVlQGZsYXZvdXJzZ3VydS5jb20iLCJuYW1laWQiOiJzaGFyaXF1ZUBmbGF2b3Vyc2d1cnUuY29tIiwiZW1haWwiOiJzaGFyaXF1ZUBmbGF2b3Vyc2d1cnUuY29tIiwiYXV0aF90aW1lIjoiMDcvMDgvMjAyNSAwODo1NTo0OCIsInRlbmFudF9pZCI6Ijk1NyIsImRiX25hbWUiOiJtdC1wcm9kLVRlbmFudHMiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBRE1JTklTVFJBVE9SIiwiZXhwIjoyNTM0MDIzMDA4MDAsImlzcyI6IkNsYXJlX0FJIiwiYXVkIjoiQ2xhcmVfQUkifQ.qJJmVG2la68CvFH1k7xMeDIT4lDtC_xJk5dR9hfUO-c";
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
		   'Content-Type: application/json',
		   'Authorization: Bearer ' . $token
		   ));
		curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
		$data = curl_exec($ch);
		$httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
		curl_close($ch);
		if ($httpcode >= 200 && $httpcode < 300) {
			echo 'sent';
		} else {
			echo 'error';
		}
		echo "<br>";
	}

	public function addNovatr(){
		die();
		$file=fopen(DIR_SYSTEM.'data/novatr.csv', 'r');
		$excludeUrl = array();
		$i = 0;
		$tmp  =true;
		die;
		while (($data = fgetcsv($file)) !== FALSE) {
			if($tmp){
				$tmp = false;
				continue;
			}
			//echo "<pre />"; print_r($data); die();

			$comment = '';

			$customized = 0;

			if(isset($data['19']) && !empty($data['19'])){
				$comment .= '_'.$data['19'];
			} else {
				$comment .= '_';
			}

			if(isset($data['message_card']) && !empty($data['message_card'])){
				$comment .= '_'.$data['message_card'];
			} else {
				$comment .= '_';
			}

			if(isset($data['special_instruction']) && !empty($data['special_instruction'])){
				$comment .= '_'.$data['special_instruction'];
			} else {
				$comment .= '_';
			}
			$subtotal = 0;
			

			$customized  = 1;
			$productDetails = $this->db->query("SELECT * FROM oc_product p, oc_product_description d WHERE p.product_id = d.product_id AND  p.product_id = '8826'")->row;
			$productPrice = 0 + $data[2];
			$productPriceTotal = $productPrice * 1;
			$subtotal = $subtotal + $productPriceTotal;
			
			$slot_forshipping = '';
			$date_forshipping = '';
			$this->db->query("INSERT INTO `" . DB_PREFIX . "order` SET invoice_prefix = '" . $this->db->escape($data['invoice_prefix']) . "', store_id = '0', store_name = 'Flavours Guru', store_url = 'https://www.flavoursguru.com/', customer_id = '0', customer_group_id = '1', firstname = '" . $this->db->escape($data['11']) . "', lastname = '', email = '" . $this->db->escape($data['13']) . "', telephone = '" . $this->db->escape($data['12']) . "', fax = '', custom_field = 'transaction_id: novatr', payment_firstname = '" . $this->db->escape($data['11']) . "', payment_lastname = '', payment_email= '" . $this->db->escape($data['13']) . "', payment_mobile= '" . $this->db->escape($data['12']) . "', payment_company = '', payment_address_1 = '', payment_address_2 = '', payment_city = '', payment_postcode = '', payment_country = '', payment_country_id = '', payment_zone = '', payment_zone_id = '', payment_address_format = '', payment_custom_field = '[]', payment_method = 'Credit/Debit Card / Net Banking / Wallets', payment_code = 'payu', shipping_firstname = '" . $this->db->escape($data['15']) . "', shipping_lastname = '', shipping_company = '', shipping_address_1 = '" . $this->db->escape($data['16']) . "', shipping_address_2 = '', shipping_phone = '" . $this->db->escape($data['17']) . "', shipping_city = '', shipping_postcode = '" . $this->db->escape($data['18']) . "', shipping_country = 'India', shipping_country_id = '99', shipping_zone = 'Delhi', shipping_zone_id = '1475', shipping_address_format = '', shipping_custom_field = '[]', shipping_method = 'Free Shipping', shipping_code = 'free.free', comment = '" .  $this->db->escape($comment) . "', total = '0', affiliate_id = '".$customized."', commission = '0.00', marketing_id = '0', tracking = '', language_id = '1', currency_id = '4', currency_code = 'INR', currency_value = '1.00000000', ip = '', forwarded_ip = '', user_agent = '', accept_language = '', mr_mrs = '" . $this->db->escape($data['14']) . "', phone_code = '+91', payment_mr_mrs = '" . $this->db->escape($data['14']) . "', payment_phone_code = '+91', shipping_mr_mrs = '" . $this->db->escape($data['14']) . "', shipping_phone_code = '+91', date_added = NOW(), date_modified = NOW()". ", date_forshipping = '', is_admin_order = 1, order_status_id = 2, added_by = '1'");

			$order_id = $this->db->getLastId();
			$receipntcity = '';

			$ttax = 0;
			$dis = 0;
			

			$shipCity = '';

			


			$productDetails = $this->db->query("SELECT * FROM oc_product p, oc_product_description d WHERE p.product_id = d.product_id AND  p.product_id = '8826'")->row;
			$productPrice = 0 + $data['2'];
			$productPriceTotal = $productPrice * 1;
			
			$aa1 = ($productPriceTotal / $subtotal) * 100;
      		$aa2 = ($aa1 / 100) * $dis;
      		$aa3 = $productPriceTotal - $aa2;
      		$productTax = 0;
	      	if($productDetails['tax_class_id'] == 9){
	        	$ttax = $ttax + ((18 * $aa3) / 100);
	        	$productTax = ((18 * $aa3) / 100);
	      	}

			$shippingInfo = array();
			$shippingInfo['Pincode'] = '400088';
			$shippingInfo['City'] = 'Outstation';
			$shippingInfo['Shipping Date'] = date('d-m-Y', strtotime('2024-03-01'));
			$shippingInfo['Shipping Type'] = 'Free Delivery - u20b90';
			$shippingInfo['Shipping Time'] = '15:00 - 18:00';
			$shipCity = $shippingInfo['City'];

			$this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET order_id = '" . (int)$order_id . "', product_id = '8826', name = '" . $this->db->escape($productDetails['name']) . "', model = '" . $this->db->escape($productDetails['model']) . "', quantity = '1', price = '" . (float)$productPrice  . "', total = '" . (float)$productPriceTotal . "', tax = '" . (float)$productTax . "', reward = '0', shipping_info = '" . json_encode($shippingInfo) . "', shipping_price = '0'");
			$order_product_id = $this->db->getLastId();

			$shippingdateforadminfilter = '2024-03-01';
			$shippingdateforadminfiltertime = '15:00 - 18:00';
			$shippingdateforadminfilter1 = date("Y-m-d", strtotime($shippingdateforadminfilter));

			$slot_forshipping = $shippingdateforadminfiltertime;
			$date_forshipping = $shippingdateforadminfilter1;
			//$this->db->query("INSERT INTO " . DB_PREFIX . "order_delivery_date SET order_id = '" . (int)$order_id . "', 	delivery_date = '" . $this->db->escape($shippingdateforadminfilter1) . "'");
			//$this->db->query("INSERT INTO " . DB_PREFIX . "order_delivery_slot SET order_id = '" . (int)$order_id . "', 	slot = '" . $this->db->escape($shippingdateforadminfiltertime) . "'");

			if(isset($data['flavour'][$i]) && !empty($data['flavour'][$i])){
				$productFlavourDetails = $this->db->query("SELECT * FROM oc_product_option_value p WHERE p.product_id = '8826' AND p.option_id = 5 AND p.option_value_id = 39")->row;

				$flavourNeed = $this->db->query("SELECT * FROM oc_option_value_description p WHERE p.option_value_id = '39'")->row;
				$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', product_option_id = '" . (int)$productFlavourDetails['product_option_id'] . "', product_option_value_id = '" . (int)$productFlavourDetails['product_option_value_id'] . "', name = 'Flavor', `value` = '" . $this->db->escape($flavourNeed['name']) . "', `type` = 'select'");
			}

				

				if(isset($data['weight'][$i]) && !empty($data['weight'][$i])){
					$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', product_option_id = '1', product_option_value_id = '57', name = 'Weight', `value` = '" . $this->db->escape($data['weight'][$i]) . "', `type` = 'radio'");
				}

				
			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = 'sub_total', title = 'Sub-Total', `value` = '" . (float)$subtotal . "', sort_order = '1'");
			$shipping = 0;
			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = 'shipping', title = 'Free Shipping', `value` = '" . (float)$shipping . "', sort_order = '3'");
			$discount = 0;
			if(isset($data['discount']) && !empty($data['discount'])){
				$discount = $data['discount'];
				$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = 'coupon', title = 'Coupon (Backend Order)', `value` = '-" . (float)$discount . "', sort_order = '4'");
			}
			$subtotalmain = $subtotal - $discount;
			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = 'tax', title = 'GST (18%)', `value` = '" . (float)$ttax . "', sort_order = '4'");
			$ttotal = $subtotalmain + $ttax;
			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = 'total', title = 'Total', `value` = '" . (float)$ttotal . "', sort_order = '9'");
			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET shipping_city = '".$shipCity."' , total = '".$ttotal."', slot_forshipping = '".$slot_forshipping."', date_forshipping = '".$date_forshipping."' WHERE order_id = '".$order_id."'");
			$i++;
		}
		echo $i;
	}

}
