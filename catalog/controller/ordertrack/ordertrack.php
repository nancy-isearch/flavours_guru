<?php
class ControllerOrdertrackOrdertrack extends Controller {
	public function index() {
 
		//$this->load->language('Ordertrack/Ordertrack');

		$this->document->setTitle("Track Order Status - Flavoursguru.com");
		$this->document->setDescription("Track your order delivery status online at www.flavoursguru.com. Enter your order number & email id (used to place the order) and get the updated status right away!");
		$this->document->setKeywords("");

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('ordertrack'),
			'href' => $this->url->link('ordertrack/ordertrack', '', true)
		);
 


		$data['entry_email'] = $this->language->get(' Email-Id');
		$data['entry_orderid'] = $this->language->get('Order Id.');
		$data['action'] = $this->url->link('ordertrack/ordertrack/submitdata', '', true); 
		$data['loder'] = $this->config->get("config_url"); 
		/*if (isset($this->session->data['statusMsg'])) {
			$data['msg'] = $this->session->data['statusMsg'];
			unset($this->session->data['statusMsg']);
		} else {
			$data['msg'] = '';
		}*/


		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->request->get['msg'])) {
			$data['mesg'] = $this->request->post['msg'];
		} else {
			$data['msg'] = '';
		}
		
		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['orderid'])) {
			$data['orderid'] = $this->request->post['orderid'];
		} else {
			$data['orderid'] = '';
		}

		if (isset($this->error['email'])) {
			echo $data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['orderid'])) {
			echo $data['error_orderid'] = $this->error['orderid'];
		} else {
			$data['error_orderid'] = '';
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header'); 
	 
		
		$this->response->setOutput($this->load->view('ordertrack/ordertrak', $data));
	}
	
	private function validate() {
		 
		if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}

	 
		if ((utf8_strlen($this->request->post['orderid']) < 1) || (utf8_strlen($this->request->post['orderid']) > 32)) {
			$this->error['orderid'] = $this->language->get('error_orderid');
		} 

		return !$this->error;
	}

	public function submitdata(){ 
			
			$this->load->model('account/order');		 
			 if(isset($_POST['orderid']) && !empty($_POST['orderid']) && isset($_POST['email']) && !empty($_POST['email'])){
				$orderStatus = $this->model_account_order->getTrackOrder($_POST['orderid'],$_POST['email']);
 				if($orderStatus){
 					 echo 'Order status of your order <bold class="">#'.$_POST['orderid'].'</bold> is <bold class="">'.$orderStatus.'</bold>';

 				} else {
 					 echo '0'; 
 				} 	
 			} else{
 				echo 'all fields are required!';
 			}
			// $this->response->redirect($this->url->link('ordertrack/ordertrack'));
		 
	}	 
	  
}
