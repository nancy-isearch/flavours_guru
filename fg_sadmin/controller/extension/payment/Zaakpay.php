<?php 
class ControllerextensionpaymentZaakpay extends Controller {
	private $error = array(); 
	public function index() { 
		$this->load->language('extension/payment/Zaakpay');


	$data['heading_title'] = $this->language->get('heading_title'); 	
	$this->load->model('setting/setting');
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');
			$this->model_setting_setting->editSetting('Zaakpay', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
		}
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
	
		$data['entry_status'] = $this->language->get('entry_status');
		$data['merchantIdentifier'] = $this->language->get('merchantIdentifier');
		$data['secret_key'] = $this->language->get('secret_key');
		$data['mode'] = $this->language->get('mode');
		$data['log'] = $this->language->get('log');

		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['text_all_zones'] = $this->language->get('text_all_zones');


$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		if (isset($this->request->post['merchantIdentifier'])) {
			$data['Zaakpay_merchantIdentifier'] = $this->request->post['Zaakpay_merchantIdentifier'];
		} else {
			$data['Zaakpay_merchantIdentifier'] = $this->config->get('Zaakpay_merchantIdentifier');
		}
		if (isset($this->request->post['Zaakpay_secret_key'])) {
			$data['Zaakpay_secret_key'] = $this->request->post['Zaakpay_secret_key'];
		} else {
			$data['Zaakpay_secret_key'] = $this->config->get('Zaakpay_secret_key');
		}
		
		if (isset($this->request->post['Zaakpay_test'])) {
			$data['Zaakpay_test'] = $this->request->post['Zaakpay_test'];
		} else {
			$data['Zaakpay_test'] = $this->config->get('Zaakpay_test');
		}
		if (isset($this->request->post['Zaakpay_log'])) {
			$data['Zaakpay_log'] = $this->request->post['Zaakpay_log'];
		} else {
			$data['Zaakpay_log'] = $this->config->get('Zaakpay_log');
		}
			if (isset($this->request->post['Zaakpay_status'])) {
			$data['Zaakpay_status'] = $this->request->post['Zaakpay_status'];
		} else {
			$data['Zaakpay_status'] = $this->config->get('Zaakpay_status');
		}
// newly added code for zone status for guest checkout
		if (isset($this->request->post['Zaakpay_geo_zone_id'])) {
			$data['Zaakpay_geo_zone_id'] = $this->request->post['Zaakpay_geo_zone_id'];
		} else {
			$data['Zaakpay_geo_zone_id'] = $this->config->get('Zaakpay_geo_zone_id'); 
		} 

		$this->load->model('localisation/geo_zone');
										
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
//end

		
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');

	//	$data['error_warning'] = @$this->error['warning'];
if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

 	
		
  		$this->document->breadcrumbs = array();

   		$this->document->breadcrumbs[] = array(
       		//'href'      => HTTPS_SERVER .'index.php?route=common/home&token=' . $this->session->data['token'],
		'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
       		'text'      => $this->language->get('text_home')
      		
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => 'https://api.zaakpay.com/transact?v=3',
       		'text'      => $this->language->get('text_payment')
      		
   		);
		
   		$this->document->breadcrumbs[] = array(
       		//'href'      => HTTPS_SERVER .'index.php?route=extension/payment/Zaakpay&token=' . $this->session->data['token'],
		'href' => $this->url->link('extension/payment/Zaakpay', 'token=' . $this->session->data['token'], true),
       		'text'      => $this->language->get('heading_title')
      		
   		);
		
		//$data['action'] = HTTPS_SERVER .'index.php?route=extension/payment/Zaakpay&token=' . $this->session->data['token'];

		//$data['cancel'] = HTTPS_SERVER .'index.php?route=extension/payment&token=' . $this->session->data['token'];	
		
		$data['action'] = $this->url->link('extension/payment/Zaakpay', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true);
	
				
		//$this->id       = 'content';
		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');
		$data['column_left'] = $this->load->controller('common/column_left');
		$this->response->setOutput($this->load->view('extension/payment/Zaakpay', $data));
	//		$this->template = 'payment/Zaakpay.tpl';
		$this->layout   = 'common/layout';
		
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/Zaakpay')){
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>
