<?php
class ControllerCatalogLocality extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/category'); // reuse existing lang
		$this->document->setTitle('Localities');
		$this->load->model('catalog/locality');
		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/category');
		$this->document->setTitle('Add Locality');
		$this->load->model('catalog/locality');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_locality->addLocality($this->request->post);
			$this->session->data['success'] = 'Success: You have added a new locality!';
			$url = '';
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			$this->response->redirect($this->url->link('catalog/locality', 'token=' . $this->session->data['token'] . $url, true));
		}
		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/category');
		$this->document->setTitle('Edit Locality');
		$this->load->model('catalog/locality');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_locality->editLocality($this->request->get['locality_id'], $this->request->post);
			$this->session->data['success'] = 'Success: You have modified localities!';
			$url = '';
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			$this->response->redirect($this->url->link('catalog/locality', 'token=' . $this->session->data['token'] . $url, true));
		}
		$this->getForm();
	}

	protected function getList() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_area_name'])) {
			$filter_area_name = $this->request->get['filter_area_name'];
		} else {
			$filter_area_name = null;
		}

		if (isset($this->request->get['filter_pin_code'])) {
			$filter_pin_code = $this->request->get['filter_pin_code'];
		} else {
			$filter_pin_code = null;
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_area_name'])) {
			$url .= '&filter_area_name=' . urlencode(html_entity_decode($this->request->get['filter_area_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_pin_code'])) {
			$url .= '&filter_pin_code=' . urlencode(html_entity_decode($this->request->get['filter_pin_code'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => 'Home',
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);
		$data['breadcrumbs'][] = array(
			'text' => 'Localities',
			'href' => $this->url->link('catalog/locality', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('catalog/locality/add', 'token=' . $this->session->data['token'] . $url, true);

		$data['localities'] = array();

		$filter_data = array(
			'filter_name'      => $filter_name,
			'filter_area_name' => $filter_area_name,
			'filter_pin_code'  => $filter_pin_code,
			'start'            => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'            => $this->config->get('config_limit_admin')
		);

		$locality_total = $this->model_catalog_locality->getTotalLocalities($filter_data);
		$results = $this->model_catalog_locality->getLocalities($filter_data);

		foreach ($results as $result) {
			$data['localities'][] = array(
				'category_name' => $result['category_name'],
				'area_name'     => $result['area_name'],
				'pin_code'      => $result['pin_code'],
				'edit'          => $this->url->link('catalog/locality/edit', 'token=' . $this->session->data['token'] . '&locality_id=' . $result['locality_id'] . $url, true)
			);
		}

		$data['heading_title'] = 'Localities';
		$data['text_list'] = 'Locality List';
		$data['text_no_results'] = 'No results!';
		$data['column_category'] = 'City/Category';
		$data['column_area_name'] = 'Area Name';
		$data['column_pin_code'] = 'Pin Code';
		$data['column_action'] = 'Action';

		$data['token'] = $this->session->data['token'];

		$data['filter_name'] = $filter_name;
		$data['filter_area_name'] = $filter_area_name;
		$data['filter_pin_code'] = $filter_pin_code;

		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} elseif (isset($this->error['warning'])) {
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

		$pagination = new Pagination();
		$pagination->total = $locality_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/locality', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($locality_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($locality_total - $this->config->get('config_limit_admin'))) ? $locality_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $locality_total, ceil($locality_total / $this->config->get('config_limit_admin')));

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/locality_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = !isset($this->request->get['locality_id']) ? 'Add Locality' : 'Edit Locality';
		
		$data['text_form'] = !isset($this->request->get['locality_id']) ? 'Add Locality Form' : 'Edit Locality Form';
		$data['entry_meta_title'] = 'Meta Title';
		$data['entry_meta_description'] = 'Meta Tag Description';
		$data['entry_meta_keyword'] = 'Meta Tag Keywords';
		$data['entry_description'] = 'SEO Content (Bottom Page)';

		$data['button_save'] = 'Save';
		$data['button_cancel'] = 'Cancel';

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$url = '';
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => 'Home',
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);
		$data['breadcrumbs'][] = array(
			'text' => 'Localities',
			'href' => $this->url->link('catalog/locality', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['locality_id'])) {
			$data['action'] = $this->url->link('catalog/locality/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('catalog/locality/edit', 'token=' . $this->session->data['token'] . '&locality_id=' . $this->request->get['locality_id'] . $url, true);
		}
		
		$data['cancel'] = $this->url->link('catalog/locality', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['locality_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$locality_info = $this->model_catalog_locality->getLocality($this->request->get['locality_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['category_id'])) {
			$data['category_id'] = $this->request->post['category_id'];
		} elseif (!empty($locality_info)) {
			$data['category_id'] = $locality_info['category_id'];
		} else {
			$data['category_id'] = '';
		}

		// Load Categories for dropdown
		$this->load->model('catalog/category');
		$all_categories = $this->model_catalog_category->getCategories(array('start' => 0, 'limit' => 2000)); // get all parent categories
		$data['categories'] = array();
		foreach ($all_categories as $cat) {
			$cat_name = isset($cat['name']) ? $cat['name'] : '';
			if (
				stripos($cat_name, 'Online Cake Delivery in') !== false ||
				stripos($cat_name, 'Cakes Online in') !== false ||
				stripos($cat_name, 'Cake Delivery in') !== false ||
				stripos($cat_name, 'Cakes in ') !== false ||
				stripos($cat_name, 'Cakes Shop in') !== false
			) {
				$data['categories'][] = $cat;
			}
		}

		if (isset($this->request->post['area_name'])) {
			$data['area_name'] = $this->request->post['area_name'];
		} elseif (!empty($locality_info)) {
			$data['area_name'] = $locality_info['area_name'];
		} else {
			$data['area_name'] = '';
		}

		if (isset($this->request->post['region_name'])) {
			$data['region_name'] = $this->request->post['region_name'];
		} elseif (!empty($locality_info)) {
			$data['region_name'] = $locality_info['region_name'];
		} else {
			$data['region_name'] = '';
		}

		if (isset($this->request->post['pin_code'])) {
			$data['pin_code'] = $this->request->post['pin_code'];
		} elseif (!empty($locality_info)) {
			$data['pin_code'] = $locality_info['pin_code'];
		} else {
			$data['pin_code'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($locality_info)) {
			$data['status'] = $locality_info['status'];
		} else {
			$data['status'] = 1; // Default to enabled
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($locality_info)) {
			$data['sort_order'] = $locality_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($locality_info)) {
			$data['image'] = $locality_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($locality_info) && is_file(DIR_IMAGE . $locality_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($locality_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['locality_description'])) {
			$data['locality_description'] = $this->request->post['locality_description'];
		} elseif (!empty($locality_info)) {
			$data['locality_description'] = $this->model_catalog_locality->getLocalityDescriptions($locality_info['category_id'], $locality_info['area_name']);
		} else {
			$data['locality_description'] = array();
		}

		if (isset($this->request->post['locality_faq'])) {
			$data['locality_faqs'] = $this->request->post['locality_faq'];
		} elseif (isset($this->request->get['locality_id'])) {
			$data['locality_faqs'] = $this->model_catalog_locality->getLocalityFaqs($this->request->get['locality_id']);
		} else {
			$data['locality_faqs'] = array();
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/locality_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/locality')) {
			$this->error['warning'] = 'Warning: You do not have permission to modify localities!';
		}
		if ((utf8_strlen($this->request->post['area_name']) < 1) || (utf8_strlen($this->request->post['area_name']) > 255)) {
			$this->error['warning'] = 'Area Name must be between 1 and 255 characters!';
		}
		return !$this->error;
	}
}
