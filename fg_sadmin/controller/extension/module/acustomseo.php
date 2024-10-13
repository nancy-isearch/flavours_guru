<?php
class ControllerExtensionModuleAcustomseo extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/acustomseo');

		$this->load->model('extension/module/acustomseo');

		$this->document->setTitle($this->language->get('heading_title'));		

		$this->getList();
	}

	public function getList(){
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['entry_keyword']  = $this->language->get('entry_keyword');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_filter'] = $this->language->get('button_filter');

		$data['column_url'] = $this->language->get('column_url');
		$data['column_seo_url'] = $this->language->get('column_seo_url');
		$data['column_action'] = $this->language->get('column_action');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} elseif(isset($this->session->data['warning'])){
			$data['error_warning'] = $this->session->data['warning'];
			unset($this->session->data['warning']);
		}else{
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token']. '&type=module', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'query';
		}

		if (isset($this->request->get['keyword'])) {
			$keyword = $this->request->get['keyword'];
		} else {
			$keyword = '';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		$data['sort'] = $sort;

		$data['order'] = $order;

		$data['keyword'] = $keyword;

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if($keyword){
			$url .= '&keyword='.$keyword;
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url .= '&page='.$page;

		$data['sort_query'] = $this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'] . '&sort=query' . $url, 'SSL');

		$data['sort_keyword'] = $this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'] . '&sort=keyword' . $url, 'SSL');

		$url = '';

		$url .= '&sort='.$sort;

		if ($order == 'ASC') {
			$url .= '&order=ASC';
		} else {
			$url .= '&order=DESC';
		}

		$url .= '&page='.$page;

		if($keyword){
			$url .= '&keyword='.$keyword;
		}

		$data['action'] = $this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'].$url, 'SSL');

		$data['add_new'] = $this->url->link('extension/module/acustomseo/add', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token']. '&type=module', 'SSL');		

		$data['delete'] = $this->url->link('extension/module/acustomseo/delete', 'token=' . $this->session->data['token'].$url, 'SSL');

		$data['edit'] = $this->url->link('extension/module/acustomseo/edit', 'token=' . $this->session->data['token'].$url, 'SSL');

		$filter_data = array(
			'keyword' => $keyword,
			'sort' 	=> $sort, 
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$data['seo_urls'] = $this->model_extension_module_acustomseo->getAllSeoUrls($filter_data);

		$seo_url_total = $this->model_extension_module_acustomseo->getTotalSeoUrls($filter_data);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if($keyword){
			$url .= '&keyword='.$keyword;
		}

		$pagination = new Pagination();
		$pagination->total = $seo_url_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($seo_url_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($seo_url_total - $this->config->get('config_limit_admin'))) ? $seo_url_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $seo_url_total, ceil($seo_url_total / $this->config->get('config_limit_admin')));

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/acustomseo', $data));
	}

	public function add(){
		$this->load->language('extension/module/acustomseo');

		$this->load->model('extension/module/acustomseo');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_extension_module_acustomseo->addkeyword();
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function edit(){
		$this->load->language('extension/module/acustomseo');

		$this->load->model('extension/module/acustomseo');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'query';
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

		if (isset($this->request->get['keyword'])) {
			$keyword = $this->request->get['keyword'];
		} else {
			$keyword = '';
		}

		$url = '';

		$url .= '&sort='.$sort;

		if ($order == 'ASC') {
			$url .= '&order=ASC';
		} else {
			$url .= '&order=DESC';
		}

		$url .= '&page='.$page;

		if($keyword){
			$url .= '&keyword='.$keyword;
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_extension_module_acustomseo->editkeyword($this->request->get['url_alias_id']);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'].$url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete(){
		$this->load->language('extension/module/acustomseo');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module/acustomseo');

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'query';
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

		if (isset($this->request->get['keyword'])) {
			$keyword = $this->request->get['keyword'];
		} else {
			$keyword = '';
		}

		$url = '';

		$url .= '&sort='.$sort;

		if ($order == 'ASC') {
			$url .= '&order=ASC';
		} else {
			$url .= '&order=DESC';
		}

		$url .= '&page='.$page;

		if($keyword){
			$url .= '&keyword='.$keyword;
		}

		if (isset($this->request->get['url_alias_id']) && $this->validateDelete()) {
			$this->model_extension_module_acustomseo->deleteKeyword($this->request->get['url_alias_id']);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'].$url, 'SSL'));
		}else if (isset($this->request->post['selected']) && $this->validateDelete()) {
			$this->model_extension_module_acustomseo->deleteKeyword($this->request->post['selected']);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'].$url, 'SSL'));
		}

		$this->getList();
	}

	public function getForm(){

		if ($this->request->server['HTTPS']) {
	      $base_url = HTTPS_CATALOG;
	    } else {
	      $base_url = HTTP_CATALOG;
	    }

  		$data['base_url'] = $base_url;

		$data['heading_title'] = $this->language->get('heading_title');	

		$data['text_edit'] = isset($this->request->get['url_alias_id']) ? $this->language->get('text_edit') : $this->language->get('text_add');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_url'] = $this->language->get('entry_url');
		$data['entry_seo_url']  = $this->language->get('entry_seo_url');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['url'])) {
			$data['error_url'] = $this->error['url'];
		} else {
			$data['error_url'] = '';
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		$url_alias_id = isset($this->request->get['url_alias_id']) ? $this->request->get['url_alias_id'] : '';

		if($url_alias_id){
			$url_alias = $this->model_extension_module_acustomseo->getUrlAlias('', $url_alias_id);
		}else{
			$url_alias = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'], 'SSL')
		);


		if(isset($this->request->post['url'])){
			$data['url'] = $this->request->post['url'];
		}elseif(isset($url_alias['query'])){
			$query = $url_alias['query'];
      $query = explode('=', $query);
      if($query[0] == 'category_id'){
        $url_query = $base_url.'index.php?route=product/category&path='.$query[1];
      }elseif($query[0] == 'product_id'){
        $url_query = $base_url.'index.php?route=product/product&product_id='.$query[1];
      }elseif($query[0] == 'manufacturer_id'){
        $url_query = $base_url.'index.php?route=product/manufacturer/info&manufacturer_id='.$query[1];
      }elseif($query[0] == 'information_id'){
        $url_query = $base_url.'index.php?route=information/information&information_id='.$query[1];
      }else{
        $url_query = $base_url.'index.php?route='.$url_alias['query'];
      }
      
			$data['url'] = $url_query;
		}else{
			$data['url'] = '';
		}

		if(isset($this->request->post['keyword'])){
			$data['keyword'] = $this->request->post['keyword'];
		}elseif(isset($url_alias['keyword'])){
			$data['keyword'] = $base_url.$url_alias['keyword'];
		}else{
			$data['keyword'] = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'query';
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

		if (isset($this->request->get['keyword'])) {
			$keyword = $this->request->get['keyword'];
		} else {
			$keyword = '';
		}

		$url = '';

		$url .= '&sort='.$sort;

		if ($order == 'ASC') {
			$url .= '&order=ASC';
		} else {
			$url .= '&order=DESC';
		}

		$url .= '&page='.$page;

		if($keyword){
			$url .= '&keyword='.$keyword;
		}

		if($url_alias_id){
			$data['action'] = $this->url->link('extension/module/acustomseo/edit', 'token=' . $this->session->data['token'].'&url_alias_id='.$url_alias_id.$url, 'SSL');
		}else{
			$data['action'] = $this->url->link('extension/module/acustomseo/add', 'token=' . $this->session->data['token'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module/acustomseo', 'token=' . $this->session->data['token'], 'SSL');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/acustomseo_form.tpl', $data));
	}
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/acustomseo')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['url']) {
			$this->error['url'] = $this->language->get('error_url');
		}

		if (!$this->request->post['keyword']) {
			$this->error['keyword'] = $this->language->get('error_keyword');
		}else{			
			$this->load->model('extension/module/acustomseo');

			$url_alias_info = $this->model_extension_module_acustomseo->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info) {
				if(isset($this->request->get['url_alias_id'])){
					$url_alias_info = $this->model_extension_module_acustomseo->getUrlAlias($this->request->post['keyword'], $this->request->get['url_alias_id']);
					if(!$url_alias_info){	
						$this->error['keyword'] = $this->language->get('error_keyword_exits');
					}
				}else{
					$this->error['keyword'] = $this->language->get('error_keyword_exits');
				}
			}
		}

		return !$this->error;
	}
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/module/acustomseo')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
}