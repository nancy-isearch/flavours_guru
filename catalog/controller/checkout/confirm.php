<?php
class ControllerCheckoutConfirm extends Controller {
	public function index() {
		$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 1 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
		$redirect = '';
		$this->load->language('checkout/checkout');
			$data['column_name'] = $this->language->get('column_name');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_total'] = $this->language->get('column_total');
			$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 2 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
		if ($this->cart->hasShipping()) {
			// Validate if shipping address has been set.
			if (!isset($this->session->data['shipping_address'])) {
				$this->db->query("UPDATE ".DB_PREFIX."followup set stage1 = 19 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
				$redirect = $this->url->link('checkout/checkout', '', true);
			}

			// Validate if shipping method has been set.
			if (!isset($this->session->data['shipping_method'])) {
				$this->db->query("UPDATE ".DB_PREFIX."followup set stage1 = 20 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
				$redirect = $this->url->link('checkout/checkout', '', true);
			}
		} else {
			unset($this->session->data['shipping_address']);
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
		}
		$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 3 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
		// Validate if payment address has been set.
		/*if (!isset($this->session->data['payment_address'])) {
			$redirect = $this->url->link('checkout/checkout', '', true);
		}*/

		// Validate if payment method has been set.
		/*if (!isset($this->session->data['payment_method'])) {
			$redirect = $this->url->link('checkout/checkout', '', true);
		}*/

		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$this->db->query("UPDATE ".DB_PREFIX."followup set stage1 = 21 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
			$redirect = $this->url->link('checkout/cart');
		}

		$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 4 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");

		// Validate minimum quantity requirements.
		$products = $this->cart->getProducts();
		$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 5 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$this->db->query("UPDATE ".DB_PREFIX."followup set stage1 = 22 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
				$redirect = $this->url->link('checkout/cart'); 
				break;
			}
		}
		$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 6 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
		
		if (!$redirect) {
		$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 7 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
			$order_data = array();

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			$this->load->model('extension/extension');

			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']); 
					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			$sort_order = array();

			foreach ($totals as $key => $value) {

				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $totals);
			 
			$order_data['totals'] = $totals;

			$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 8 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");

			$order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
			$order_data['store_id'] = $this->config->get('config_store_id');
			$order_data['store_name'] = $this->config->get('config_name');

			if ($order_data['store_id']) {
				$order_data['store_url'] = $this->config->get('config_url');
			} else {
				if ($this->request->server['HTTPS']) {
					$order_data['store_url'] = HTTPS_SERVER;
				} else {
					$order_data['store_url'] = HTTP_SERVER;
				}
			}

			$order_data['disclose_sender_details'] = $this->session->data['disclose_sender_details'];

			if ($this->customer->isLogged()) {
				$this->load->model('account/customer');

				$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

				$order_data['customer_id'] = $this->customer->getId();
				$order_data['customer_group_id'] = $customer_info['customer_group_id'];
				$order_data['firstname'] = $customer_info['firstname'];
				$order_data['lastname'] = $customer_info['lastname'];
				$order_data['email'] = $customer_info['email'];
				$order_data['telephone'] = $customer_info['telephone'];
				$order_data['fax'] = $customer_info['fax'];
				$order_data['custom_field'] = json_decode($customer_info['custom_field'], true);
			} elseif (isset($this->session->data['guest'])) {
				$order_data['customer_id'] = 0;
				$order_data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
				$order_data['mr_mrs'] = $this->session->data['guest']['mr_mrs'];
				$order_data['firstname'] = $this->session->data['guest']['firstname'];
				if(isset($this->session->data['guest']['lastname']) && !empty($this->session->data['guest']['lastname'])){
					$order_data['lastname'] = $this->session->data['guest']['lastname'];
				} else {
					$order_data['lastname'] = '';
				}

				if(isset($this->session->data['guest']['fax']) && !empty($this->session->data['guest']['fax'])){
					$order_data['fax'] = $this->session->data['guest']['fax'];
				} else {
					$order_data['fax'] = '';
				}
				
				$order_data['email'] = $this->session->data['guest']['email'];
				$order_data['telephone'] = $this->session->data['guest']['telephone']; 
				$order_data['phone_code'] = $this->session->data['guest']['phone_code'];
				$order_data['custom_field'] = $this->session->data['guest']['custom_field'];
			}
			$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 9 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
				$order_data['payment_email'] = $this->session->data['payment_email']['email'];
				$order_data['payment_mobile'] = $this->session->data['payment_mobile']['telephone'];
				$order_data['payment_phone_code'] = $this->session->data['payment_phonecode']['phone_code'];
			  	$order_data['payment_mr_mrs'] = $this->session->data['payment_mrmrs']['mr_mrs'];
			  	$order_data['payment_firstname'] = $this->session->data['payment_firstname']['firstname'];
 
			if(isset($this->session->data['payment_address']['lastname']) && !empty($this->session->data['payment_address']['lastname'])){
				$order_data['payment_lastname'] = $this->session->data['payment_address']['lastname'];
			} else{
				$order_data['payment_lastname'] = '';
			}
			if(isset($this->session->data['payment_address']['company']) && !empty($this->session->data['payment_address']['company'])){
				$order_data['payment_company'] = $this->session->data['payment_address']['company'];
			} else{
				$order_data['payment_company'] = '';
			}
			if(isset($this->session->data['payment_address']['address_2']) && !empty($this->session->data['payment_address']['address_2'])){
				$order_data['payment_address_2'] = $this->session->data['payment_address']['address_2'];
			} else{
				$order_data['payment_address_2'] = '';
			}

			if(isset($this->session->data['new_sender_detail']['name']) && !empty($this->session->data['new_sender_detail']['name'])){
				$order_data['payment_firstname'] = $this->session->data['new_sender_detail']['name'];
			} else {
				$order_data['payment_firstname'] = $order_data['payment_firstname'];
			}

			if(isset($this->session->data['new_sender_detail']['email']) && !empty($this->session->data['new_sender_detail']['email'])){
				$order_data['payment_email'] = $this->session->data['new_sender_detail']['email'];
			} else {
				$order_data['payment_email'] = $order_data['payment_email'];
			}

			if(isset($this->session->data['new_sender_detail']['phone']) && !empty($this->session->data['new_sender_detail']['phone'])){
				$order_data['payment_mobile'] = $this->session->data['new_sender_detail']['phone'];
			} else {
				$order_data['payment_mobile'] = $order_data['payment_mobile'];
			}
			
			$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 10 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
			$order_data['payment_address_1'] = $this->session->data['payment_address']['address_1'];
			
			$order_data['payment_city'] = $this->session->data['payment_address']['city'];
			$order_data['payment_postcode'] = $this->session->data['payment_address']['postcode'];
			$order_data['payment_zone'] = $this->session->data['payment_address']['zone'];
			$order_data['payment_zone_id'] = $this->session->data['payment_address']['zone_id'];
			$order_data['payment_country'] = $this->session->data['payment_address']['country'];
			$order_data['payment_country_id'] = $this->session->data['payment_address']['country_id'];
			$order_data['payment_address_format'] = $this->session->data['payment_address']['address_format'];
			$order_data['payment_custom_field'] = (isset($this->session->data['payment_address']['custom_field']) ? $this->session->data['payment_address']['custom_field'] : array());

			if (isset($this->session->data['payment_method']['title'])) {
				$order_data['payment_method'] = $this->session->data['payment_method']['title'];
			} else {
				$order_data['payment_method'] = '';
			}


			if (isset($this->session->data['payment_method']['code'])) {
				$order_data['payment_code'] = $this->session->data['payment_method']['code'];
			} else {
				$order_data['payment_code'] = '';
			}
			$order_data['payment_method'] = 'razorpay';
			$order_data['payment_code'] = 'razorpay';
			$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 11 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
			if ($this->cart->hasShipping()) {
				$order_data['shipping_mr_mrs'] = $this->session->data['shipping_address']['mr_mrs'];
				$order_data['shipping_firstname'] = $this->session->data['shipping_address']['firstname'];
				//$order_data['shipping_lastname'] = $this->session->data['shipping_address']['lastname'];
				$order_data['shipping_lastname'] = "";
				//$order_data['shipping_company'] = $this->session->data['shipping_address']['company'];
				$order_data['shipping_company'] = "";
				$order_data['shipping_address_1'] = $this->session->data['shipping_address']['address_1'];
				//$order_data['shipping_address_2'] = $this->session->data['shipping_address']['address_2'];
				$order_data['shipping_address_2'] = "";
				$order_data['shipping_phone'] = $this->session->data['shipping_address']['phone'];
				$order_data['shipping_phone_code'] = $this->session->data['shipping_address']['phone_code'];
				$order_data['shipping_city'] = $this->session->data['shipping_address']['city'];
				$order_data['shipping_postcode'] = $this->session->data['shipping_address']['postcode'];
				$order_data['shipping_zone'] = $this->session->data['shipping_address']['zone'];
				$order_data['shipping_zone_id'] = $this->session->data['shipping_address']['zone_id'];
				$order_data['shipping_country'] = $this->session->data['shipping_address']['country'];
				$order_data['shipping_country_id'] = $this->session->data['shipping_address']['country_id'];
				$order_data['shipping_address_format'] = $this->session->data['shipping_address']['address_format'];
				$order_data['shipping_custom_field'] = (isset($this->session->data['shipping_address']['custom_field']) ? $this->session->data['shipping_address']['custom_field'] : array());

				if (isset($this->session->data['shipping_method']['title'])) {
					$order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
				} else {
					$order_data['shipping_method'] = '';
				}

				if (isset($this->session->data['shipping_method']['code'])) {
					$order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
				} else {
					$order_data['shipping_code'] = '';
				}
			} else {
				$order_data['shipping_firstname'] = '';
				$order_data['shipping_lastname'] = '';
				$order_data['shipping_company'] = '';
				$order_data['shipping_address_1'] = '';
				$order_data['shipping_address_2'] = '';
				$order_data['shipping_city'] = '';
				$order_data['shipping_postcode'] = '';
				$order_data['shipping_zone'] = '';
				$order_data['shipping_zone_id'] = '';
				$order_data['shipping_country'] = '';
				$order_data['shipping_country_id'] = '';
				$order_data['shipping_address_format'] = '';
				$order_data['shipping_custom_field'] = array();
				$order_data['shipping_method'] = '';
				$order_data['shipping_code'] = '';
			}

			$order_data['products'] = array();
$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 12 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
			$allLogsPre = array();
			foreach ($this->cart->getProducts() as $product) {
				$allLogsPre[] = $product;
				
				$option_data = array();

				foreach ($product['option'] as $option) {
					$option_data[] = array(
						'product_option_id'       => $option['product_option_id'],
						'product_option_value_id' => $option['product_option_value_id'],
						'option_id'               => $option['option_id'],
						'option_value_id'         => $option['option_value_id'],
						'name'                    => $option['name'],
						'value'                   => $option['value'],
						'type'                    => $option['type']
					);
				} 

				$order_data['products'][] = array(
					'product_id' => $product['product_id'],
					'name'       => $product['name'],
					'model'      => $product['model'],
					'option'     => $option_data,
					'download'   => $product['download'],
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'price'      => $product['price'],
					'total'      => $product['total'],
					'shipping_info'      =>  $product['shipping_info'],
					'shipping_price'      => $product['shipping_price'],
					'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
					'reward'     => $product['reward']
				);
			}
			$this->db->query("UPDATE ".DB_PREFIX."followup set stage2 = '".json_encode($allLogsPre)."', stage3 = '".json_encode($order_data['products'])."' WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 13 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
			// Gift Voucher
			$order_data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $voucher) {
					$order_data['vouchers'][] = array(
						'description'      => $voucher['description'],
						'code'             => token(10),
						'to_name'          => $voucher['to_name'],
						'to_email'         => $voucher['to_email'],
						'from_name'        => $voucher['from_name'],
						'from_email'       => $voucher['from_email'],
						'voucher_theme_id' => $voucher['voucher_theme_id'],
						'message'          => $voucher['message'],
						'amount'           => $voucher['amount']
					);
				}
			}

			$order_data['comment'] = $this->session->data['comment'];
			$order_data['total'] = $total_data['total'];

			if (isset($this->request->cookie['tracking'])) {
				$order_data['tracking'] = $this->request->cookie['tracking'];

				$subtotal = $this->cart->getSubTotal();

				// Affiliate
				$this->load->model('affiliate/affiliate');

				$affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

				if ($affiliate_info) {
					$order_data['affiliate_id'] = $affiliate_info['affiliate_id'];
					$order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
				} else {
					$order_data['affiliate_id'] = 0;
					$order_data['commission'] = 0;
				}

				$order_data['affiliate_id'] = 0;
				$order_data['commission'] = 0;

				// Marketing
				$this->load->model('checkout/marketing');

				$marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

				if ($marketing_info) {
					$order_data['marketing_id'] = $marketing_info['marketing_id'];
				} else {
					$order_data['marketing_id'] = 0;
				}
			} else {
				$order_data['affiliate_id'] = 0;
				$order_data['commission'] = 0;
				$order_data['marketing_id'] = 0;
				$order_data['tracking'] = '';
			}
$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 14 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
			$order_data['language_id'] = $this->config->get('config_language_id');
			$order_data['currency_id'] = $this->currency->getId($this->session->data['currency']);
			$order_data['currency_code'] = $this->session->data['currency'];
			$order_data['currency_value'] = $this->currency->getValue($this->session->data['currency']);
			$order_data['ip'] = $this->request->server['REMOTE_ADDR'];

			if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
				$order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
			} elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
				$order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
			} else {
				$order_data['forwarded_ip'] = '';
			}

			if (isset($this->request->server['HTTP_USER_AGENT'])) {
				$order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
			} else {
				$order_data['user_agent'] = ''; 
			}

			if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
				$order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
			} else {
				$order_data['accept_language'] = '';
			}

			$this->load->model('checkout/order');
		 	 
			$this->model_checkout_order->editMobile($order_data['customer_id'],$order_data['payment_mobile']);

			//print_r($this->session->data); print_r($order_data); die();
			 $this->db->query("UPDATE ".DB_PREFIX."followup set stage = 15 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
			$this->session->data['order_id'] = $this->model_checkout_order->addOrder($order_data);
$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 16 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");


			$data['text_recurring_item'] = $this->language->get('text_recurring_item');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');

			
			$this->load->model('tool/image');
			$this->load->model('tool/upload');

			$data['products'] = array();
			$Alltotal = 0;
			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();

				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['value'];
					} else {
						$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

						if ($upload_info) {
							$value = $upload_info['name'];
						} else {
							$value = '';
						}
					}

					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}

				$recurring = '';

				if ($product['recurring']) {
					$frequencies = array(
						'day'        => $this->language->get('text_day'),
						'week'       => $this->language->get('text_week'),
						'semi_month' => $this->language->get('text_semi_month'),
						'month'      => $this->language->get('text_month'),
						'year'       => $this->language->get('text_year'),
					);

					if ($product['recurring']['trial']) {
						$recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
					}

					if ($product['recurring']['duration']) {
						$recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					} else {
						$recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					}
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
				} else {
					$image = '';
				}
					
					//print_r($product);
				
				$totl = ($product['price'] * $product['quantity']);
				 
				$data['products'][] = array(
					
					'cart_id'    => $product['cart_id'],
					'product_id' => $product['product_id'],
					'name'       => $product['name'],
					'model'      => $product['model'],
					'thumb'      => $image,
					'option'     => $option_data,
					'recurring'  => $recurring, 
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'shipping_info'   => $product['shipping_info'],
					'shipping_price'  =>$this->currency->format($this->tax->calculate($product['shipping_price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), 
					'price'      => $this->currency->format($this->tax->calculate($product['price']-$product['shipping_price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']),
					'total'      => $this->currency->format(($this->tax->calculate($totl, $product['tax_class_id'], $this->config->get('config_tax'))), $this->session->data['currency']),
					'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
				 
			}
			 
			// Gift Voucher
			$data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $voucher) {
					$data['vouchers'][] = array(
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency'])
					);
				}
			}

			$data['totals'] = array();
	 
			foreach ($order_data['totals'] as $total) {
			    if($total['title'] != 'Free Shipping'){
			 		$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
				);
			  }
			}
$this->db->query("UPDATE ".DB_PREFIX."followup set stage = 17 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
			//$data['payment'] = $this->load->controller('extension/payment/' . $this->session->data['payment_method']['code']);
			

			
			
			// API endpoint
			$url = 'https://api.razorpay.com/v1/orders';

			// Data to be sent in JSON format
			$data123 = [
			    "amount" => $this->currency->format($order_data['total'], 'INR', 1, false) * 100,
			    "currency" => "INR",
			    "receipt" => $this->session->data['order_id'],
			    "partial_payment" => false
			];
			// Initialize cURL session
			$ch = curl_init($url);

			// Set cURL options
			curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
			curl_setopt($ch, CURLOPT_USERPWD, RAZORPAY_KEY . ':' . RAZORPAY_SECRET);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_POST, true);
			curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data123));

			// Execute the request and capture the response
			$response = curl_exec($ch);

			// Check for cURL errors
			if (curl_errno($ch)) {
			    //echo 'Error:' . curl_error($ch);
			} else {
			    // Print the response
			    //echo 'Response:' . $response;
			}
			$response = json_decode($response);
			//echo 'Response:' . $response; die;

			// Close cURL session
			curl_close($ch);


			$this->db->query("UPDATE ".DB_PREFIX."followup set stage3 = '".json_encode($response).'-----'.json_encode($data123)."', order_id = '".$this->session->data['order_id']."' WHERE session_id = '" . $this->db->escape($this->session->getId())."'");


			$data = array();
			$data['key_id'] = RAZORPAY_KEY;
	        $data['currency_code'] = 'INR';
	        $data['total'] = $this->currency->format($order_data['total'], 'INR', 1, false) * 100;
	        $data['merchant_order_id'] = $this->session->data['order_id'];
	        //$data['card_holder_name'] = 'Udit';
	        $data['email'] = $order_data['email'] ;
	        $data['phone'] = $order_data['telephone'] ;
	        $data['name'] = $this->config->get('config_name');
	        $data['lang'] = $this->session->data['language'];
	        $data['r_order_id'] = $response->id;
	        $data['return_url'] = $this->url->link('payment/razorpay/callback', '', 'SSL');
	        $this->db->query("UPDATE ".DB_PREFIX."followup set stage = 18 WHERE session_id = '" . $this->db->escape($this->session->getId())."'");
			$this->response->setOutput($this->load->view('checkout/razorpay', $data));
			//echo "<pre />"; print_r($this->session->data);
		} else {
			$data = array();
			$data['redirect'] = $redirect;
			echo json_encode($data);
		}
		
		//$this->response->setOutput($this->load->view('checkout/confirm', $data));
	}
}
