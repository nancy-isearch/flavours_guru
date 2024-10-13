<?php
class ControllerCheckoutSuccess extends Controller {
	public function index() {
		$this->load->language('checkout/success');
		$order_id="";
		if (isset($this->session->data['order_id'])) {
			$this->cart->clear();
			$order_id = $this->session->data['order_id'];
			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				if ($this->customer->isLogged()) {
					$activity_data = array(
						'customer_id' => $this->customer->getId(),
						'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
						'order_id'    => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_account', $activity_data);
				} else {
					$activity_data = array(
						'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
						'order_id' => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_guest', $activity_data);
				}
			}

			if(isset($this->session->data['coupon']) && $this->session->data['coupon']!=''){
				$data['coupon_applied']=$this->session->data['coupon'];
			} else {
				$data['coupon_applied']='';
			}

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			//unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);


		$this->load->model('account/order');
		 
		$results = $this->model_account_order->getOrderProductsOnsummary($this->session->data['order_id']);
	 
		$orderDetails = $this->model_account_order->getOrdersByOrderId($this->session->data['order_id']);
		//echo "<pre />"; print_r($orderDetails);
		//$orderDetails = $this->model_account_order->getOrdersByOrderId($this->session->data['order_id']);
		$data['orderId'] = $this->session->data['order_id'];

		$data['orderTotal'] = $orderDetails[0]['total'];

		$data['Userdetails'] = $orderDetails[0]; 
		// print_r($data['Userdetails']);
		$Alltotal = 0;
		$shippingTotal = 0;
		foreach ($results as $result) { 
		  
			$data['orders'][] = array(
				'order_id'   => $result['order_id'],
				'image'       => $orderDetails[0]['store_url'].'image/'.$result['image'],
				'name'	 => $result['name'],  
				'qty'	 => $result['quantity'], 
				'model'	 => $result['model'], 
				'shipping_info'	 => $result['shipping_info'], 
				'date_added' => date($this->language->get('date_format_short'), strtotime($orderDetails[0]['date_added'])),  
				'price'   => $result['price']-$result['shipping_price'],
				'pricen'   => $result['price'],
				'shipping_price'   => $result['shipping_price'],
				'total'    => $result['total'],				
				'totaln'    => $result['total'],				
			); 

			$Alltotal += $result['total'];
			$shippingTotal = $shippingTotal + $result['shipping_price'];
		} 
		$data['shippingTotal'] = $shippingTotal;
		$data['totals'] = array();

		$totals = $this->model_account_order->getOrderTotals($this->session->data['order_id']);
		$data['affiTotal'] = 0;
		$data['affiCoupon'] = false;
		foreach ($totals as $total) {
			if($total['code'] == 'total'){
				$data['affiTotal'] = $total['value'];

			}
			if($total['code'] == 'total'){
				$data['affiCoupon'] = true;
			}
			if($total['title']!='Free Shipping'){
			$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $total['value'],
				);
			}
		}

		//echo "<pre />"; print_r($data['totals']);

		$data['Alltotal']  = $Alltotal;

		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', true), $this->url->link('account/order', '', true), $this->url->link('account/download', '', true), $this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}
		
		  
		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');
 
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		if (isset($this->session->data['shipping_address']['firstname'])) {
			$shpngaddr_name = $this->session->data['shipping_address']['firstname'];
		}
		 
	 if($order_id) 
		{   
			$msg = "Hi ".$data['Userdetails']['payment_firstname'].", Your order ".$order_id." is confirmed and processed for the selected date and time. www.flavoursguru.com";

			$path = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=NUdMWd6QgkeeTMHfWiPQlQ&senderid=FLGURU&channel=Trans&DCS=0&flashsms=0&number=91".$orderDetails[0]['payment_mobile']."&text=".urlencode($msg)."&route=1";
			
			$ch = curl_init($path);
			curl_setopt($ch, CURLOPT_HEADER, 0);
			curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
			$rlt = curl_exec($ch);
			curl_close($ch);
		}		 


		$this->response->setOutput($this->load->view('common/success', $data));
	}


}