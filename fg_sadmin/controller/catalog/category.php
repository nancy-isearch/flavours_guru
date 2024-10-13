<?php
class ControllerCatalogCategory extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/category');

		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/category');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_category->addCategory($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/category');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_category->editCategory($this->request->get['category_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/category');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $category_id) {
				$this->model_catalog_category->deleteCategory($category_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	public function repair() {
		$this->load->language('catalog/category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/category');

		if ($this->validateRepair()) {
			$this->model_catalog_category->repairCategories();

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'category_id';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
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
			'href' => $this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('catalog/category/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/category/delete', 'token=' . $this->session->data['token'] . $url, true);
		$data['repair'] = $this->url->link('catalog/category/repair', 'token=' . $this->session->data['token'] . $url, true);

		$data['categories'] = array();

		$filter_data = array(
			'filter_name'	  => $filter_name,
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$category_total = $this->model_catalog_category->getTotalCategories($filter_data);

		$results = $this->model_catalog_category->getCategories($filter_data);

		/*foreach ($results as $result) {
			$data['categories'][] = array(
				'category_id' => $result['category_id'],
				'name'        => $result['name'],
				'sort_order'  => $result['sort_order'],
				'edit'        => $this->url->link('catalog/category/edit', 'token=' . $this->session->data['token'] . '&category_id=' . $result['category_id'] . $url, true),
				'delete'      => $this->url->link('catalog/category/delete', 'token=' . $this->session->data['token'] . '&category_id=' . $result['category_id'] . $url, true)
			);
		}*/
		foreach ($results as $result) {
			$multipleCategories = $this->model_catalog_category->getMultipleParentCategories($result['category_id']);
                        // echo $multipleCategories;
			$data['categories'][] = array(
				'category_id' => $result['category_id'],
				'name'        => $multipleCategories[0]['parentcategories'].$result['name'],
				'sort_order'  => $result['sort_order'],
				'edit'        => $this->url->link('catalog/category/edit', 'token=' . $this->session->data['token'] . '&category_id=' . $result['category_id'] . $url, 'SSL'),
				'delete'      => $this->url->link('catalog/category/delete', 'token=' . $this->session->data['token'] . '&category_id=' . $result['category_id'] . $url, 'SSL')
				);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_rebuild'] = $this->language->get('button_rebuild');
		$data['token'] = $this->session->data['token'];

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

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('catalog/category', 'token=' . $this->session->data['token'] . '&sort=name' . $url, true);
		$data['sort_sort_order'] = $this->url->link('catalog/category', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $category_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($category_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($category_total - $this->config->get('config_limit_admin'))) ? $category_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $category_total, ceil($category_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/category_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['category_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_parent'] = $this->language->get('entry_parent');
		$data['entry_filter'] = $this->language->get('entry_filter');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_top'] = $this->language->get('entry_top');
		$data['entry_column'] = $this->language->get('entry_column');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_layout'] = $this->language->get('entry_layout');

		$data['entry_category'] = $this->language->get('entry_category');
		$data['help_category'] = $this->language->get('help_category');

		$data['help_filter'] = $this->language->get('help_filter');
		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_top'] = $this->language->get('help_top');
		$data['help_column'] = $this->language->get('help_column');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_design'] = $this->language->get('tab_design');


		/*multi category*/
		if (isset($this->request->post['product_category'])) {
			$categories = $this->request->post['product_category'];
		} elseif (isset($this->request->get['category_id'])) {
			$categories = $this->model_catalog_category->getParentCategories($this->request->get['category_id']);
		} else {
			$categories = array();
		}

		$data['product_categories'] = array();
		foreach ($categories as $category_id) {
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$data['product_categories'][] = array(
					'category_id' => $category_info['category_id'],
					'name' => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
					);
			}
		}

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

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		if (isset($this->error['parent'])) {
			$data['error_parent'] = $this->error['parent'];
		} else {
			$data['error_parent'] = '';
		}
		
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['category_id'])) {
			$data['action'] = $this->url->link('catalog/category/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('catalog/category/edit', 'token=' . $this->session->data['token'] . '&category_id=' . $this->request->get['category_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$category_info = $this->model_catalog_category->getCategory($this->request->get['category_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['category_description'])) {
			$data['category_description'] = $this->request->post['category_description'];
		} elseif (isset($this->request->get['category_id'])) {
			$data['category_description'] = $this->model_catalog_category->getCategoryDescriptions($this->request->get['category_id']);
		} else {
			$data['category_description'] = array();
		}

		if (isset($this->request->post['path'])) {
			$data['path'] = $this->request->post['path'];
		} elseif (!empty($category_info)) {
			$data['path'] = $category_info['path'];
		} else {
			$data['path'] = '';
		}

		if (isset($this->request->post['parent_id'])) {
			$data['parent_id'] = $this->request->post['parent_id'];
		} elseif (!empty($category_info)) {
			$data['parent_id'] = $category_info['parent_id'];
		} else {
			$data['parent_id'] = 0;
		}

		$this->load->model('catalog/filter');

		if (isset($this->request->post['category_filter'])) {
			$filters = $this->request->post['category_filter'];
		} elseif (isset($this->request->get['category_id'])) {
			$filters = $this->model_catalog_category->getCategoryFilters($this->request->get['category_id']);
		} else {
			$filters = array();
		}

		$data['category_filters'] = array();

		foreach ($filters as $filter_id) {
			$filter_info = $this->model_catalog_filter->getFilter($filter_id);

			if ($filter_info) {
				$data['category_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
				);
			}
		}

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['category_store'])) {
			$data['category_store'] = $this->request->post['category_store'];
		} elseif (isset($this->request->get['category_id'])) {
			$data['category_store'] = $this->model_catalog_category->getCategoryStores($this->request->get['category_id']);
		} else {
			$data['category_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($category_info)) {
			$data['keyword'] = $category_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($category_info)) {
			$data['image'] = $category_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($category_info) && is_file(DIR_IMAGE . $category_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($category_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['top'])) {
			$data['top'] = $this->request->post['top'];
		} elseif (!empty($category_info)) {
			$data['top'] = $category_info['top'];
		} else {
			$data['top'] = 0;
		}

		if (isset($this->request->post['column'])) {
			$data['column'] = $this->request->post['column'];
		} elseif (!empty($category_info)) {
			$data['column'] = $category_info['column'];
		} else {
			$data['column'] = 1;
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($category_info)) {
			$data['sort_order'] = $category_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($category_info)) {
			$data['status'] = $category_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['category_layout'])) {
			$data['category_layout'] = $this->request->post['category_layout'];
		} elseif (isset($this->request->get['category_id'])) {
			$data['category_layout'] = $this->model_catalog_category->getCategoryLayouts($this->request->get['category_id']);
		} else {
			$data['category_layout'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/category_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['category_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}

			if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			}
		}

		if (isset($this->request->get['category_id']) && $this->request->post['parent_id']) {
			$results = $this->model_catalog_category->getCategoryPath($this->request->post['parent_id']);
			
			foreach ($results as $result) {
				if ($result['path_id'] == $this->request->get['category_id']) {
					$this->error['parent'] = $this->language->get('error_parent');
					
					break;
				}
			}
		}

		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['category_id']) && $url_alias_info['query'] != 'category_id=' . $this->request->get['category_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['category_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateRepair() {
		if (!$this->user->hasPermission('modify', 'catalog/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/category');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 20
			);

			$results = $this->model_catalog_category->getCategories($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'category_id' => $result['category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
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

	public function autocompletemulti() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/category');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_category->getMultiCategories($filter_data);

			foreach ($results as $result) {
				$name=$result['cpname']==NULL?$result['name']:$result['cpname'];
				$json[] = array(
					'category_id' => $result['id'],
					'name'        => strip_tags(html_entity_decode($name, ENT_QUOTES, 'UTF-8'))
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

	public function checkIfKeywordExist($key, $data){
		if(array_key_exists($key, $data)){
			return $key.'-1';
		} else {
			return $key;
		}
	}

	public function addLocalCategories(){
		die('die in script');
		$this->load->model('catalog/category');
		$allKeywords = $this->model_catalog_category->getAllKeywords();
		$city = 'Delhi';
		echo $parentCategoryId = 68;
		$local = array("Adarsh Nagar","AIIMS","Akshardham","Anand Vihar","Arjan Garh","Arthala","Ashok Park Main","Ashram","Azadpur","Bahdurgarh City","Barakhamba","Bhikaji Cama Place","Botanical Garden","Brigadier Hoshiar Singh","Central Secretariat","Chanakyapuri","Chandni Chowk","Chawri Bazar","Chhattarpur","Chirag Delhi","Civil Lines","Dabri Mor - Janakpuri South","Daryaganj","Dashrath Puri","Delhi Aerocity","Delhi Cantonment","Delhi Cantt","Delhi Gate","Dhaula Kuan","Dilli Haat INA","Dilshad Garden","Durgabai Deshmukh South Campus","Dwarka","Dwarka Mor","Dwarka Sector 10","Dwarka Sector 11","Dwarka Sector 12","Dwarka Sector 13","Dwarka Sector 14","Dwarka Sector 21","Dwarka Sector 8","Dwarka Sector 9","East Azad Nagar","ESI BASAI DARAPUR","Ghevra Metro station","Ghitorni","Gokulpuri","Govind Puri","Greater Kailash","Green Park","Guru Dronacharya","Guru Tegh Bahadur Nagar","Haiderpur Badli Mor","Hauz Khas","Hindon River","IGI Airport","IIT Delhi","Inderlok","Indraprastha","IP Extension","ITO","Jaffrabad","Jahangirpuri","Jama Masjid","JAMIA MILLIA ISLAMIA","Janak Puri","Janak Puri East","Janak Puri West","Jangpura","Janpath","Jasola","Jasola Vihar Shaheen Bagh","Jawaharlal Nehru Stadium","Jhandewalan","Jhil Mil","Johri Enclave","Jorbagh","Kailash Colony","Kalindi Kunj","Kalkaji Mandir","Kanhaiya Nagar","Karawal Nagar","Karkar Duma","Karkarduma Court","Karol Bagh","Kashmere Gate","Kaushambi","Keshav Puram","Khan Market","Kirti Nagar","Kohat Enclave","Krishna Nagar","Lajpat Nagar","Lajpat Nagar","Lal Quila","Laxmi Nagar","Lok Kalyan Marg","Madipur","Maharaja Surajmal Stadium","Majlis Park","Major Mohit Sharma","Malviya Nagar","Mandawali - West Vinod Nagar","Mandi House","Mansarovar Park","Maujpur","Maya Puri","Mayur Vihar Extention","Mayur Vihar Pocket I","Mehrauli","Model Town","Mohan Estate","Mohan Nagar","Moolchand","Moti Nagar","Mundka","Mundka Industrial Area (MIA)","Munirka","Nangloi","Nangloi Railway Station","Naraina Vihar","Nawada","Nehru Enclave","Nehru Place","Netaji Subash Place","New Ashok Nagar","New Delhi","Nirman Vihar","Okhla Bird Sanctuary","Okhla","Okhla NSIC","Okhla Vihar","Palam","Panchsheel Park","Pandit Shree Ram Sharma","Paschim Vihar (East)","Paschim Vihar (West)","Patel Chowk","Patel Nagar","Peera Garhi","Pitam Pura","Pratap Nagar","Preet Vihar","Pul Bangash","Punjabi Bagh","Punjabi Bagh West","Qutab Minar","R K Ashram Marg","Raj Bagh","Raja Nahar Singh","Rajdhani Park","Rajendra Place","Rajiv Chowk","Rajouri Garden","Ramesh Nagar","Rithala","RK Puram","Rohini","Rohini East","Rohini Sector 18-19","Rohini West","Sadar Bazaar Cantonment","Saket","Samaypur Badli","Sarai Kale Khan Hazrat Nizamuddin","Sarita Vihar","Sarojini Nagar","Satguru Ram Singh Marg","Seelampur","Shadipur","Shahdara","Shaheed Nagar","Shakurpur","Shalimar Bagh","Shankar Vihar","Shastri Nagar","Shastri Park","Shiv Vihar","Shivaji Park","Shivaji Stadium","Shyam park","Sir Vishweshwaraiah Moti Bagh","South Delhi","South Extension","Station","Subhash Nagar","Sukhdev Vihar","Sultanpur","Supreme Court (Pragati Maidan)","Tagore Garden","Terminal 1 IGI Airport","Tikri Border","Tikri Kalan","Tilak Nagar","Tis Hazari","Trilokpuri Sanjay Lake","Udyog Bhawan","Udyog Nagar","Uttam Nagar","Uttam Nagar East","Uttam Nagar West","Vaishali","Vasant Kunj","Vasant Vihar","Vidhan Sabha","Vinobapuri","Vinod Nagar East","Vishwavidyalaya","Welcome","Yamuna Bank");

		foreach ($local as $loc) {
			$key1 = strtolower(str_replace(' ', '-', $loc));
			$keyword = $this->checkIfKeywordExist($key1, $allKeywords);
			$allKeywords[$key1] = 1;
			$data = array();
			$data['category_description'][1] = array();
			$data['category_description'][1]['name'] = "Online Cake Delivery in ".$loc." ".$city;
			$data['category_description'][1]['description'] = '<p style="font-family: &quot;open sans&quot;, sans-serif;">The most reputable bakery in '.$city.' is Flavoursguru, which is renowned for offering reliable &amp; fresh online cake delivery. To add elegance to your festivities, we give you delectable cakes. For our scrumptious cakes, which are guaranteed to leave your visitors with a lasting impression, we only utilize the best ingredients.</p><p style="font-family: &quot;open sans&quot;, sans-serif;">A variety of cakes in vibrant flavors are available from us, including chocolate, truffle, blueberry, strawberry, red velvet, vanilla, mango, KitKat, butterscotch, and many more. With our rapid delivery service, we can deliver cake to your door in any location in '.$city.' within an hour of your online purchase.</p><h2 style="font-family: &quot;open sans&quot;, sans-serif; color: rgb(0, 0, 0);"><span style="font-weight: 700;">Get Free Delivery Cake In '.$loc.' '.$city.'</span></h2><p style="font-family: &quot;open sans&quot;, sans-serif;">With Flavoursguru, your search for midnight cake delivery in '.$city.' is over. On your dear &amp; near ones\' birthdays, anniversaries, or any other important event, sending midnight cake delivery is the perfect way to express your love &amp; care to them. In addition, you may choose from a variety of delivery options, including same-day, faster, early morning, set timing, standard, and early morning. We provide a large selection of tempting cakes in a variety of tastes, including&nbsp;<span style="font-weight: 700;"><a href="https://www.flavoursguru.com/regular-cakes/chocolate-cakes">chocolate cakes</a>,&nbsp;<a href="https://www.flavoursguru.com/regular-cakes/butterscotch-cakes">butterscotch cakes</a></span>, and many more options.</p><p style="font-family: &quot;open sans&quot;, sans-serif;">Our team of specialists is committed to making sure that your cake is created with the best ingredients and cooked to perfection. You would not have to wait long for your preferred cakes thanks to our quick &amp; free&nbsp;<a href="https://www.flavoursguru.com/cakes/'.strtolower($city).'">cake delivery service in '.$city.'</a>. For your party or special events, you may choose from a huge selection of innovative cakes.</p><h3 style="font-family: &quot;open sans&quot;, sans-serif; color: rgb(0, 0, 0);"><span style="font-weight: 700;">Online Cake Collection in '.$loc.' '.$city.' - Flavoursguru.com</span></h3><p style="font-family: &quot;open sans&quot;, sans-serif;">Cakes for any festive event are expertly created by Flavoursguru. Every time, we deliver a new assortment of cakes, perfecting your special occasions and reviving your spirit. By placing an online cake purchase, you may completely relish every event and bless your relationships with family, friends, and loved ones.</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">Photo Cakes:</span>&nbsp;We additionally provide online photo cakes in flavors like vanilla, strawberry, chocolate, and butterscotch to add excitement and delight to the celebration. Get a beautiful picture of your loved ones printed on your cake, which is sure to raise happiness &amp; excitement. Photo cakes often bring back memories and provide your loved ones with a sense of uniqueness.</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">Kid Cakes:</span>&nbsp;A child\'s smile is perhaps the most beautiful sight. To add a little additional sparkle to your kids\' birthday celebration, we go the extra step of bringing a wide selection of&nbsp;<a href="https://www.flavoursguru.com/kids">Kids\' Cakes</a>. We have a variety of cakes that will astound your children. Your search is over if you are looking for a&nbsp;<a href="https://www.flavoursguru.com/birthday"><span style="font-weight: 700;">birthday cake</span></a>&nbsp;with a cartoon theme, a superhero theme, or a wonderful birthday cake for your newborn boy or girl.</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">Hot Selling Cakes:</span>&nbsp;This category includes tempting, trendy cakes that are also attractive. Some of our best-selling and highly rated cakes that are adored by our clients are butterscotch, vanilla, pineapple, cherry pool, and&nbsp;<a href="https://www.flavoursguru.com/regular-cakes/black-forest-cakes"><span style="font-weight: 700;">black forest cakes</span></a>.</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">Theme Cakes:</span>&nbsp;A superb cake\'s mouthwatering flavor and stunning appearance make the recipient happy. We also have a wonderful selection of theme cakes in a variety of forms. Order the greatest cake and enjoy hassle-free online cake delivery. For your child\'s birthday celebration, choose from a wide variety of cakes that are shaped like numbers and the alphabet.</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">Eggless Cakes:</span>&nbsp;Are you seeking a marvelous cake that tastes great but does not include eggs? In this instance, we offer you an incredible selection of eggless cakes at affordable prices. The best and most pure ingredients are used to make each eggless cake. Make an eggless cake delivery to your vegetarian buddy and make them joyful &amp; excited on their special occasions.</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">Premium Cakes:</span>&nbsp;Multi-tier cakes are beautiful cakes that are just unexplainable. These kinds of treats are ideal for any size party or festive event. By buying the multi-tier cake from our website\'s luxury cakes category, you may draw your guests\' attention. We offer you one-, two-, or three-tier cakes that will be the center of attention even before they are cut and served. With our amazing delivery choices, choose a cake from our assortment and have it delivered to the appropriate location.</p><h3 style="font-family: &quot;open sans&quot;, sans-serif; color: rgb(0, 0, 0);"><span style="font-weight: 700;">Buy/Send Cakes to '.$loc.' '.$city.' Online at Best Prices</span></h3><p style="font-family: &quot;open sans&quot;, sans-serif;">We have the most extensive selection of cakes available for online delivery from the comfort of your home, wherever you may be. Events are a natural part of life and are meant to be cherished. We present you delightful cakes that you may gift to your family and friends for making them on cloud nine on their special occasions such as birthdays, anniversaries, or any other occasion/festival.</p><p style="font-family: &quot;open sans&quot;, sans-serif;">To ensure a delicious and moist texture that will have you demanding more, we only use the best ingredients while baking our cakes. Additionally, you may pair the cake with gifts like flowers, chocolates, cards, and plants. We have been able to establish a position for ourselves in this competitive sector by providing only the best items at reasonable costs, and we have thousands of happy clients all throughout the country.</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">FAQ</span><span style="font-weight: 700;">s</span></p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">Q1. How to send cakes to '.$loc.' '.$city.' online?</span></p><p style="font-family: &quot;open sans&quot;, sans-serif;">On Flavoursguru cake website, ordering a cake online is easy. Visit our website, choose the cake of your choice, and then finish the payment process. Give the required information, select your delivery day and time, and finish placing your purchase.</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">Q2. What are the best cake flavors to buy in '.$loc.' '.$city.' online?</span></p><p style="font-family: &quot;open sans&quot;, sans-serif;">Amazing chocolate cakes like Chocolate Truffle, Chocolate Pinata, Chocolate Vanilla, Chocolate Kitkat, and many more can be found on Flavoursguru.</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">Q3. Can I get same-day cake delivery in '.$loc.' '.$city.' from FlavoursGuru?</span></p><p style="font-family: &quot;open sans&quot;, sans-serif;">Yes, we do offer same-day cake delivery. You may also use our services for cake delivery at a certain hour or at midnight.</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><span style="font-weight: 700;">Q4. Which is the best online cake delivery in '.$loc.' '.$city.'?</span></p><p style="font-family: &quot;open sans&quot;, sans-serif;">One of the greatest online cake stores in India, Flavoursguru, understands the value of surprising your loved ones with flavorful cakes at affordable prices.</p><p style="font-family: &quot;open sans&quot;, sans-serif;">&nbsp;</p><h2 style="font-family: &quot;open sans&quot;, sans-serif; color: rgb(0, 0, 0);"><span style="font-weight: 700;">Also Avail FlavoursGuru Cake Delivery Service In Below Mentioned Cities</span></h2><p style="font-family: &quot;open sans&quot;, sans-serif;"><a href="https://www.flavoursguru.com/cakes/'.strtolower($city).'">Cake Delivery in '.$city.'</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/cakes/gurgaon">Cake Delivery in Gurgaon</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/cakes/noida">Cake Delivery in Noida</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/mumbai">Cake Delivery in Mumbai</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/cakes/ghaziabad">Cake Delivery in Ghaziabad</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/cakes/hyderabad">Cake Delivery in Hyderabad</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/cakes/lucknow">Cake Delivery in Lucknow</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/cakes/greater-noida">Cake Delivery in Greater Noida</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/cakes/faridabad">Cake Delivery in Faridabad</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/patna">Cake Delivery in Patna</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/cakes/mohali">Cake Delivery in Mohali</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/cakes/panchkula">Cake Delivery in Panchkula</a>&nbsp;|&nbsp;<a href="https://www.flavoursguru.com/cakes/chandigarh">Cake Delivery in Chandigarh</a></p><p style="font-family: &quot;open sans&quot;, sans-serif;">&nbsp;</p><p style="font-family: &quot;open sans&quot;, sans-serif;"><br></p>';
			$data['category_description'][1]['meta_title'] = "Cake Delivery in ".$loc." ".$city." | Starting @379/- | Order Now";
			$data['category_description'][1]['meta_keyword'] = "Cakes in ".$loc." ".$city.",  Cakes Delivery in ".$loc." ".$city;
			$data['category_description'][1]['meta_description'] = "";
			$data['category_description'][1]['redirect'] = "";
			$data['category'] = array();
			$data['product_category'] = array($parentCategoryId);
			$data['path'] = '';
			$data['parent_id'] = 0;
			$data['filter'] = '';
			$data['category_store'] = array(0);
			$data['keyword'] = $keyword;
			$data['image'] = '';
			$data['column'] = 1;
			$data['sort_order'] = 0;
			$data['status'] = 1;
			$data['category_layout'][0] = '';
			$this->load->model('catalog/category');
			$this->model_catalog_category->addCategory($data);
			//die;
		}
	}
}
