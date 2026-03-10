<?php
class ControllerCheckoutCheckout extends Controller {
	public function index() {

		if(!$this->customer->isLogged()){
			$this->response->redirect($this->url->link('checkout/cart'));
		}
		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$this->response->redirect($this->url->link('checkout/cart'));
		}

		if ($this->customer->getFirstName()) {
			$data['sender_name'] = $this->customer->getFirstName().' '.$this->customer->getLastName();
		} else {
			$data['sender_name'] = '';
		}

		if ($this->customer->getEmail()) {
			$data['sender_email'] = $this->customer->getEmail();
		} else {
			$data['sender_email'] = '';
		}

		if ($this->customer->getTelephone()) {
			$data['sender_phone'] = $this->customer->getTelephone();
		} else {
			$data['sender_phone'] = '';
		}

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
		$mail->setTo('sharique@flavoursguru.com');

		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode('admin@flavoursguru.com', ENT_QUOTES, 'UTF-8'));
	//	$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
		$abandoned_date = date('d-m-Y H:i:s', strtotime('5 hour 30 minute'));
		$mail->setSubject(html_entity_decode(sprintf('Abandoned Details ['.$abandoned_date.']', $data['sender_name']), ENT_QUOTES, 'UTF-8'));
		$msg = '<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" style="width:450px; border-top:1px solid #efefef; border-right:1px solid #efefef;">
			<tr>
			   <th style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle">Name</td>
			   <td style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle">'.$data['sender_name'].'</td>
			 </tr>
			 <tr>
			   <th style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle" scope="col">Telephone</th>
			   <td style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle" scope="col">'.$data['sender_phone'].'</th>
			 </tr>
			 <tr>
			   <th style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle">Customer Email</td>
			   <td style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle">'.$data['sender_email'].'</td>
			 </tr> 
			</table>';
		$mail->setHtml($msg); 
		//$mail->setText($msg);
		$mail->send();
		$this->load->model('checkout/order');
		$this->model_checkout_order->addFollowUp($data['sender_name'],$data['sender_phone'],$data['sender_email'],$this->cart->getTotal());


 	
		// Validate minimum quantity requirements.
		$products = $this->cart->getProducts();
		$this->load->model('checkout/cart');
		$data['availableCoupons'] = $this->model_checkout_cart->getCoupons();
		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$this->response->redirect($this->url->link('checkout/cart'));
			}

			$data['products'][] = array(
					'name'      => $product['name'],
					'model'     => $product['model'],
					'quantity'  => $product['quantity'],
					'mprice' => $product['price']
				);
		}
		$data['nval'] = $this->cart->getTotal();

		$this->load->language('checkout/checkout');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		// Required by klarna
		if ($this->config->get('klarna_account') || $this->config->get('klarna_invoice')) {
			$this->document->addScript('http://cdn.klarna.com/public/kitt/toc/v1.0/js/klarna.terms.min.js');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_cart'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_checkout_option'] = sprintf($this->language->get('text_checkout_option'), 1);
		$data['text_checkout_account'] = sprintf($this->language->get('text_checkout_account'), 2);
		$data['text_checkout_payment_address'] = sprintf($this->language->get('text_checkout_payment_address'), 2);
		$data['text_checkout_shipping_address'] = sprintf($this->language->get('text_checkout_shipping_address'), 3);
		$data['text_checkout_shipping_method'] = sprintf($this->language->get('text_checkout_shipping_method'), 4);
		
		if ($this->cart->hasShipping()) {
			$data['text_checkout_payment_method'] = sprintf($this->language->get('text_checkout_payment_method'), 5);
			$data['text_checkout_confirm'] = sprintf($this->language->get('text_checkout_confirm'), 6);
		} else {
			$data['text_checkout_payment_method'] = sprintf($this->language->get('text_checkout_payment_method'), 3);
			$data['text_checkout_confirm'] = sprintf($this->language->get('text_checkout_confirm'), 4);	
		}

		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}
 
		$data['logged'] = $this->customer->isLogged();

		if (isset($this->session->data['account'])) {
			$data['account'] = $this->session->data['account'];
		} else {
			$data['account'] = '';
		}

		$data['shipping_required'] = $this->cart->hasShipping();

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		if(isset($this->session->data['customer_group_id'])){
			$data['customer_group_id'] = $this->session->data['customer_group_id'];	
		} else {
			$data['customer_group_id'] = '';
		}

		$data['customername'] = $this->customer->getFirstName().' '.$this->customer->getLastName();
		$data['customeremail'] = $this->customer->getEmail();
		$data['customerphone'] = $this->customer->getTelephone();

		$data['button_confirm'] = 'Razorpay Button';

        
		$this->load->model('account/address');
        $data['addresses'] = $this->model_account_address->getAddresses();

        $data['products'] = array(); 

			$products = $this->cart->getProducts();
 
			foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
				} else {
					$image = '';
				}

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

				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
					
					$price = $this->currency->format($unit_price, $this->session->data['currency']);
					$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
				} else {
					$price = false;
					$total = false;
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


				$shiPrice = $this->currency->format($product['shipping_price'], $this->session->data['currency']);
				$actualPrice = $product['price'] - $product['shipping_price'];
				$actualPrice = $this->currency->format($actualPrice, $this->session->data['currency']);
				$proData = array(
					'cart_id'   => $product['cart_id'],
					'product_id' => $product['product_id'],
					'thumb'     => $image,
					'name'      => $product['name'],
					'model'     => $product['model'],
					'option'    => $option_data,
					'recurring' => $recurring,
					'quantity'  => $product['quantity'],
					'stock'     => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
					'reward'    => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
					'price'     => $price,
					'shiPrice'	=> $shiPrice,
					'total'     => $total,
					'actualPrice' => $actualPrice,
					'mprice' => $product['price'],
					'shipping_info'	  => (empty($product['shipping_info'])?json_encode([]):$product['shipping_info']),
					'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
				$data['products'][] = $proData;
				/*if($product['addon'] == 1){
					$data['products'][$product['addon_pro']]['addOn'] = $proData;
				} else {
					$data['products'][$product['product_id']]['mainPro'] = $proData;
				}*/
			}
			//echo "<pre />"; print_r($data['products']); die;
			$this->load->model('extension/extension');

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;
			
			// Because __call can not keep var references so we put them into an array. 			
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
			
			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
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
			}
			
			$data['totals'] = array();
			$nval = 0;
			foreach ($totals as $total) {
				if($total['code'] == 'shipping'){
					continue;
				}
				$nval = $total['value'] + $nval;
				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
				);
			}
			$data['nval'] = $this->cart->getTotal();

			$data['newCity'] = '';
			$data['newPin'] = '';
			$products = $this->cart->getProducts(); /*get all products_id of cart */
	   		foreach ($products as $product) {
				$proct[] =  $product['product_id'];
				$chckdata = json_decode($product['shipping_info']);
				if(isset($chckdata->City) && !empty(isset($chckdata->City))){
					$data['newCity'] = $chckdata->City;
				} 

				if(isset($chckdata->Pincode) && !empty(isset($chckdata->Pincode))){
					$data['newPin'] = $chckdata->Pincode;
				} 
			}

			if (isset($this->session->data['coupon'])) {
				$data['coupon'] = $this->session->data['coupon'];
			} else {
				$data['coupon'] = '';
			}

		$this->response->setOutput($this->load->view('checkout/checkout', $data));
	}

	public function continueAndPay(){
		$data = array();
		$data['key_id'] = 'rzp_test_kBHe3abCoZA8BH';
        $data['currency_code'] = 'INR';
        $data['total'] = $this->currency->format(200, 'INR', 1, false) * 100;
        $data['merchant_order_id'] = 123;
        $data['card_holder_name'] = 'Udit';
        $data['email'] = 'udit@yopmail.com';
        $data['phone'] = '9250137368';
        $data['name'] = 'Flavours Guru';
        $data['lang'] = $this->session->data['language'];
        $data['return_url'] = $this->url->link('payment/razorpay/callback', '', 'SSL');
		$this->response->setOutput($this->load->view('checkout/razorpay', $data));
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function customfield() {
		$json = array();

		$this->load->model('account/custom_field');

		// Customer Group
		if (isset($this->request->get['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->get['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

		foreach ($custom_fields as $custom_field) {
			$json[] = array(
				'custom_field_id' => $custom_field['custom_field_id'],
				'required'        => $custom_field['required']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getCustomTotals(){
		$this->load->model('extension/extension');

		$totals = array();
		$taxes = $this->cart->getTaxes();
		$total = 0;
		
		// Because __call can not keep var references so we put them into an array. 			
		$total_data = array(
			'totals' => &$totals,
			'taxes'  => &$taxes,
			'total'  => &$total
		);
		
		// Display prices
		if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
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
		}

		$data['totals'] = array();
		$nval = 0;
		foreach ($totals as $total) {
			if($total['code'] == 'shipping'){
				continue;
			}
			$nval = $total['value'] + $nval;
			$data['totals'][] = array(
				'title' => $total['title'],
				'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
			);
		}
		echo json_encode($data);
	}
}
