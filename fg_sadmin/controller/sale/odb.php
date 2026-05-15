<?php
class ControllerSaleOdb extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('sale/odb');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/odb');

		$this->getList();
	}

	public function add() {

		
		$this->load->language('shipping/cities');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('shipping/cities');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_sale_odb->addCities($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
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

			$this->response->redirect($this->url->link('shipping/cities', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		
		$this->load->language('sale/odb');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/odb');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			//echo "<pre />"; print_r($this->request->post); die();
			$this->model_sale_odb->editOdb($this->request->get['id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success_edit');

			$url = '';

			if (isset($this->request->get['customer_name'])) {
				$url .= '&customer_name=' . urlencode(html_entity_decode($this->request->get['customer_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['customer_email'])) {
				$url .= '&customer_email=' . urlencode(html_entity_decode($this->request->get['customer_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['customer_phone'])) {
				$url .= '&customer_phone=' . urlencode(html_entity_decode($this->request->get['customer_phone'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['status'])) {
				$url .= '&status=' . urlencode(html_entity_decode($this->request->get['status'], ENT_QUOTES, 'UTF-8'));
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

			$this->response->redirect($this->url->link('sale/odb', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {

		$this->load->language('shipping/cities');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('shipping/cities');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $city_id) {
				$this->model_sale_odb->deletecities($city_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
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

			$this->response->redirect($this->url->link('shipping/cities', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['customer_name'])) {
			$customer_name = $this->request->get['customer_name'];
		} else {
			$customer_name = null;
		}

		if (isset($this->request->get['customer_email'])) {
			$customer_email = $this->request->get['customer_email'];
		} else {
			$customer_email = null;
		}

		if (isset($this->request->get['customer_phone'])) {
			$customer_phone = $this->request->get['customer_phone'];
		} else {
			$customer_phone = null;
		}

		if (isset($this->request->get['status'])) {
			$status = $this->request->get['status'];
		} else {
			$status = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'pd.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		$data['customer_name'] = $customer_name;
		$data['customer_email'] = $customer_email;
		$data['customer_phone'] = $customer_phone;
		$data['status'] = $status;

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['customer_name'])) {
			$url .= '&customer_name=' . urlencode(html_entity_decode($this->request->get['customer_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['customer_email'])) {
			$url .= '&customer_email=' . urlencode(html_entity_decode($this->request->get['customer_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['customer_phone'])) {
			$url .= '&customer_phone=' . urlencode(html_entity_decode($this->request->get['customer_phone'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['status'])) {
			$url .= '&status=' . urlencode(html_entity_decode($this->request->get['status'], ENT_QUOTES, 'UTF-8'));
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/odb', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('sale/odb/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['copy'] = $this->url->link('sale/odb/copy', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('sale/odb/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['cities'] = array();

		$filter_data = array(
			'customer_name'	  => $customer_name,
			'customer_email'	  => $customer_email,
			'customer_phone'	  => $customer_phone,
			'status'	  => $status,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'           => $this->config->get('config_limit_admin')
		);

		

		$cities_total = $this->model_sale_odb->getTotalOdb($filter_data);

		$results = $this->model_sale_odb->getOrdersForOdb($filter_data);

		foreach ($results as $result) {

			$data['odbs'][] = array(
				'oid' => $result['oid'],
				'order_id' => $result['order_id'],
				'order_link' => $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id='.$result['order_id'], true),
				'customer_name'      => $result['payment_firstname'],
				'customer_phone'       => $result['payment_mobile'],
				'customer_email'	=> $result['payment_email'],
				'order_total'	=> $result['total'],
				'odstatus'	=> $result['odstatus'],
				'date_forshipping'	=> $result['date_forshipping'],
				'date_added'	=> $result['date_added'],
				'edit'       => $this->url->link('sale/odb/edit', 'token=' . $this->session->data['token'] . '&id=' . $result['oid'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_state'] = $this->language->get('column_state');
		$data['column_city'] = $this->language->get('column_city');
		$data['column_country'] = $this->language->get('column_country');
		$data['column_pincode'] = $this->language->get('column_pincode');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_model'] = $this->language->get('entry_model');
		$data['entry_price'] = $this->language->get('entry_price');
		$data['entry_quantity'] = $this->language->get('entry_quantity');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_image'] = $this->language->get('entry_image');

		$data['button_copy'] = $this->language->get('button_copy');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

		$data['exportcsv'] = $this->url->link('sale/odb/exportcsv', 'token=' . $this->session->data['token'], true);

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
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


		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		if (isset($this->request->get['customer_name'])) {
			$url .= '&customer_name=' . urlencode(html_entity_decode($this->request->get['customer_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['customer_email'])) {
			$url .= '&customer_email=' . urlencode(html_entity_decode($this->request->get['customer_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['customer_phone'])) {
			$url .= '&customer_phone=' . urlencode(html_entity_decode($this->request->get['customer_phone'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['status'])) {
			$url .= '&status=' . urlencode(html_entity_decode($this->request->get['status'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $cities_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('shipping/cities', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($cities_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($cities_total - $this->config->get('config_limit_admin'))) ? $cities_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $cities_total, ceil($cities_total / $this->config->get('config_limit_admin')));

		$data['filter_name'] = $filter_name;
		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['statuses'] = $this->getStatus();
		//echo "<pre />"; print_r($data); die();
		$data['adminusers'] = $this->model_sale_odb->adminusers();
		$this->response->setOutput($this->load->view('sale/odb_list', $data));
	}

	public function getStatus(){
		$statues = array('1' => 'No response / not reachable', '3' => 'Wrong number', '4' => 'Call Back', '5' => 'In process', '6' => 'Bad experience in past', '8' => 'Non serviceable', '9' => 'Time slot not possible');
		if($this->user->getGroupId() < 16 ){
			$statues['2'] = 'Not Interested';
			$statues['7'] = 'No Response-Multiple Calls';
		}
		return $statues;
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_plus'] = $this->language->get('text_plus');
		$data['text_minus'] = $this->language->get('text_minus');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_option'] = $this->language->get('text_option');
		$data['text_option_value'] = $this->language->get('text_option_value');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_percent'] = $this->language->get('text_percent');
		$data['text_amount'] = $this->language->get('text_amount');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_model'] = $this->language->get('entry_model');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_state'] = $this->language->get('entry_state');
		$data['entry_pincode'] = $this->language->get('entry_pincode');
		$data['entry_jan'] = $this->language->get('entry_jan');
		$data['entry_isbn'] = $this->language->get('entry_isbn');
		$data['entry_mpn'] = $this->language->get('entry_mpn');
		$data['entry_location'] = $this->language->get('entry_location');
		$data['entry_minimum'] = $this->language->get('entry_minimum');
		$data['entry_shipping'] = $this->language->get('entry_shipping');
		$data['entry_date_available'] = $this->language->get('entry_date_available');
		$data['entry_quantity'] = $this->language->get('entry_quantity');
		$data['entry_stock_status'] = $this->language->get('entry_stock_status');
		$data['entry_price'] = $this->language->get('entry_price');
		$data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$data['entry_points'] = $this->language->get('entry_points');
		$data['entry_option_points'] = $this->language->get('entry_option_points');
		$data['entry_subtract'] = $this->language->get('entry_subtract');
		$data['entry_weight_class'] = $this->language->get('entry_weight_class');
		$data['entry_weight'] = $this->language->get('entry_weight');
		$data['entry_dimension'] = $this->language->get('entry_dimension');
		$data['entry_length_class'] = $this->language->get('entry_length_class');
		$data['entry_length'] = $this->language->get('entry_length');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_additional_image'] = $this->language->get('entry_additional_image');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
		$data['entry_download'] = $this->language->get('entry_download');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_filter'] = $this->language->get('entry_filter');
		$data['entry_related'] = $this->language->get('entry_related');
		$data['entry_attribute'] = $this->language->get('entry_attribute');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_option'] = $this->language->get('entry_option');
		$data['entry_option_value'] = $this->language->get('entry_option_value');
		$data['entry_required'] = $this->language->get('entry_required');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_priority'] = $this->language->get('entry_priority');
		$data['entry_tag'] = $this->language->get('entry_tag');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_reward'] = $this->language->get('entry_reward');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_recurring'] = $this->language->get('entry_recurring');

		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_country'] = $this->language->get('help_country');
		$data['help_state'] = $this->language->get('help_state');
		$data['help_pincode'] = $this->language->get('help_pincode');
		$data['help_jan'] = $this->language->get('help_jan');
		$data['help_isbn'] = $this->language->get('help_isbn');
		$data['help_mpn'] = $this->language->get('help_mpn');
		$data['help_minimum'] = $this->language->get('help_minimum');
		$data['help_manufacturer'] = $this->language->get('help_manufacturer');
		$data['help_stock_status'] = $this->language->get('help_stock_status');
		$data['help_points'] = $this->language->get('help_points');
		$data['help_category'] = $this->language->get('help_category');
		$data['help_filter'] = $this->language->get('help_filter');
		$data['help_download'] = $this->language->get('help_download');
		$data['help_related'] = $this->language->get('help_related');
		$data['help_tag'] = $this->language->get('help_tag');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_attribute_add'] = $this->language->get('button_attribute_add');
		$data['button_option_add'] = $this->language->get('button_option_add');
		$data['button_option_value_add'] = $this->language->get('button_option_value_add');
		$data['button_discount_add'] = $this->language->get('button_discount_add');
		$data['button_special_add'] = $this->language->get('button_special_add');
		$data['button_image_add'] = $this->language->get('button_image_add');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_recurring_add'] = $this->language->get('button_recurring_add');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_attribute'] = $this->language->get('tab_attribute');
		$data['tab_option'] = $this->language->get('tab_option');
		$data['tab_recurring'] = $this->language->get('tab_recurring');
		$data['tab_discount'] = $this->language->get('tab_discount');
		$data['tab_special'] = $this->language->get('tab_special');
		$data['tab_image'] = $this->language->get('tab_image');
		$data['tab_links'] = $this->language->get('tab_links');
		$data['tab_reward'] = $this->language->get('tab_reward');
		$data['tab_design'] = $this->language->get('tab_design');
		$data['tab_openbay'] = $this->language->get('tab_openbay');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['model'])) {
			$data['error_model'] = $this->error['model'];
		} else {
			$data['error_model'] = '';
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/odb', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['id'])) {
			$data['action'] = $this->url->link('sale/odb/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('sale/odb/edit', 'token=' . $this->session->data['token'] . '&id=' . $this->request->get['id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('sale/odb', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$data['odb_info'] = $this->model_sale_odb->getOdb($this->request->get['id']);
			$data['order_link'] = $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id='.$$data['odb_info']['order_id'], true);
			$data['odb_comments'] = $this->model_sale_odb->getOdbComments($this->request->get['id']);
			$data['adminusers'] = $this->model_sale_odb->adminusers();
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['statuses'] = $this->getStatus();
		//echo "<pre />"; print_r($data); die();
		$this->response->setOutput($this->load->view('sale/odb_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'sale/odb')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'shipping/cities')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateCopy() {
		if (!$this->user->hasPermission('modify', 'shipping/cities')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function autocomplete() {
		$json = array();
		if (isset($this->request->get['filter_name'])) {

			$this->load->model('shipping/cities');
			
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 5;
			}

			$filter_data = array(
				'filter_name'  => $filter_name,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_sale_odb->getCities($filter_data);
			foreach ($results as $result) {
				
			$json[] = array(
					'id' => $result['id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
					
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}


	public function country_autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('shipping/countries');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_shipping_countries->getcountriess($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'countries_id' => $result['country_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function state_autocomplete() {
		
		$json = array();

		if (isset($this->request->get['country_id'])&&isset($this->request->get['filter_name'])) {
			$this->load->model('shipping/countries');

			$filter_data = array(
				'country_id' =>$this->request->get['country_id'],
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_shipping_countries->getstates($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'zone_id' => $result['zone_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function savecomment() {
		$this->load->model('sale/odb');
		$this->model_sale_odb->editOdb($_POST['id'], $_POST);
	}

	public function selfAssign(){
		$this->load->model('sale/odb');
		$dd = $this->model_sale_odb->selfAssign($_POST['id']);	
		echo json_encode(array("status" => $dd));
	}

	public function downloadcsv(){
		$this->load->model('sale/odb');
		$filter_data = $this->request->post;
		$results = $this->model_sale_odb->csvdata($filter_data);
		header('Content-Type: text/csv; charset=utf-8');
		header('Content-Disposition: attachment; filename=odb-'.date("d-m-Y").'.csv');
		$output = fopen('php://output', 'w');
		fputcsv($output, array('Order ID', 'Sender Name', 'Sender Number', 'Sender Email', 'Receiver Name', 'Receiver Number', 'Receiver Email', 'Order Status', 'Order Delivery Date', 'Order Place Date', 'Is Admin Order'));
		$status = $this->model_sale_odb->orderStatuses();
		$all = array();
		foreach ($results as $rslt) {
			$aa = array();
			$aa[] = $rslt['mainid'];
			$aa[] = $rslt['payment_firstname'];
			$aa[] = $rslt['payment_mobile'];
			$aa[] = $rslt['payment_email'];
			$aa[] = $rslt['shipping_firstname'];
			$aa[] = $rslt['shipping_phone'];
			$aa[] = $rslt['shipping_email'];
			$aa[] = $status[$rslt['fstatus']];
			$aa[] = (empty($rslt['date_forshipping'])) ? '' : date("d-m-Y", strtotime($rslt['date_forshipping']));
			$aa[] = (empty($rslt['fdate_added'])) ? '' : date("d-m-Y", strtotime($rslt['fdate_added']));
			$aa[] = ($rslt['is_admin_order'] == 1) ? 'Yes' : 'No';
			$all[] = $aa;
		}
		if (count($all) > 0) {
		    foreach ($all as $al) {
		        fputcsv($output, $al);
		    }
		}
	}
}
