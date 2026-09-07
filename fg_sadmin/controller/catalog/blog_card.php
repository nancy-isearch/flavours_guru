<?php
class ControllerCatalogBlogCard extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/blog_card');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/blog_card');

		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/blog_card');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/blog_card');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_blog_card->addBlogCard($this->request->post);

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

			$this->response->redirect($this->url->link('catalog/blog_card', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/blog_card');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/blog_card');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_blog_card->editBlogCard($this->request->get['blog_id'], $this->request->post);

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

			$this->response->redirect($this->url->link('catalog/blog_card', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/blog_card');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/blog_card');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $blog_id) {
				$this->model_catalog_blog_card->deleteBlogCard($blog_id);
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

			$this->response->redirect($this->url->link('catalog/blog_card', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'title';
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
			'href' => $this->url->link('catalog/blog_card', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('catalog/blog_card/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/blog_card/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['blog_cards'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$blog_card_total = $this->model_catalog_blog_card->getTotalBlogCards();

		$results = $this->model_catalog_blog_card->getBlogCards($filter_data);

		foreach ($results as $result) {
			$data['blog_cards'][] = array(
				'blog_id'      => $result['blog_id'],
				'title'        => $result['title'],
				'display_page' => $result['display_page'],
				'status'       => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'edit'         => $this->url->link('catalog/blog_card/edit', 'token=' . $this->session->data['token'] . '&blog_id=' . $result['blog_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_title'] = $this->language->get('column_title');
		$data['column_display'] = $this->language->get('column_display');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

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

		$data['sort_title'] = $this->url->link('catalog/blog_card', 'token=' . $this->session->data['token'] . '&sort=title' . $url, true);
		$data['sort_display_page'] = $this->url->link('catalog/blog_card', 'token=' . $this->session->data['token'] . '&sort=display_page' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $blog_card_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/blog_card', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($blog_card_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($blog_card_total - $this->config->get('config_limit_admin'))) ? $blog_card_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $blog_card_total, ceil($blog_card_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/blog_card_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['blog_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_default'] = $this->language->get('text_default');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_author'] = $this->language->get('entry_author');
		$data['entry_publish_date'] = $this->language->get('entry_publish_date');
		$data['entry_blog_link'] = $this->language->get('entry_blog_link');
		$data['entry_display_page'] = $this->language->get('entry_display_page');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = '';
		}

		if (isset($this->error['author'])) {
			$data['error_author'] = $this->error['author'];
		} else {
			$data['error_author'] = '';
		}

		if (isset($this->error['blog_link'])) {
			$data['error_blog_link'] = $this->error['blog_link'];
		} else {
			$data['error_blog_link'] = '';
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
			'href' => $this->url->link('catalog/blog_card', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['blog_id'])) {
			$data['action'] = $this->url->link('catalog/blog_card/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('catalog/blog_card/edit', 'token=' . $this->session->data['token'] . '&blog_id=' . $this->request->get['blog_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('catalog/blog_card', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['blog_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$blog_card_info = $this->model_catalog_blog_card->getBlogCard($this->request->get['blog_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['title'])) {
			$data['title'] = $this->request->post['title'];
		} elseif (!empty($blog_card_info)) {
			$data['title'] = $blog_card_info['title'];
		} else {
			$data['title'] = '';
		}

		if (isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
		} elseif (!empty($blog_card_info)) {
			$data['description'] = $blog_card_info['description'];
		} else {
			$data['description'] = '';
		}

		if (isset($this->request->post['author'])) {
			$data['author'] = $this->request->post['author'];
		} elseif (!empty($blog_card_info)) {
			$data['author'] = $blog_card_info['author'];
		} else {
			$data['author'] = '';
		}

		if (isset($this->request->post['publish_date'])) {
			$data['publish_date'] = $this->request->post['publish_date'];
		} elseif (!empty($blog_card_info)) {
			$data['publish_date'] = ($blog_card_info['publish_date'] != '0000-00-00') ? $blog_card_info['publish_date'] : '';
		} else {
			$data['publish_date'] = date('Y-m-d');
		}

		if (isset($this->request->post['blog_link'])) {
			$data['blog_link'] = $this->request->post['blog_link'];
		} elseif (!empty($blog_card_info)) {
			$data['blog_link'] = $blog_card_info['blog_link'];
		} else {
			$data['blog_link'] = '';
		}

		if (isset($this->request->post['display_page'])) {
			$data['display_page'] = $this->request->post['display_page'];
		} elseif (!empty($blog_card_info)) {
			$data['display_page'] = $blog_card_info['display_page'];
		} else {
			$data['display_page'] = 'home';
		}

		// Image
		if (isset($this->request->post['feature_image'])) {
			$data['feature_image'] = $this->request->post['feature_image'];
		} elseif (!empty($blog_card_info)) {
			$data['feature_image'] = $blog_card_info['feature_image'];
		} else {
			$data['feature_image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['feature_image']) && is_file(DIR_IMAGE . $this->request->post['feature_image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['feature_image'], 100, 100);
		} elseif (!empty($blog_card_info) && is_file(DIR_IMAGE . $blog_card_info['feature_image'])) {
			$data['thumb'] = $this->model_tool_image->resize($blog_card_info['feature_image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($blog_card_info)) {
			$data['status'] = $blog_card_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($blog_card_info)) {
			$data['sort_order'] = $blog_card_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/blog_card_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/blog_card')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['title']) < 3) || (utf8_strlen($this->request->post['title']) > 255)) {
			$this->error['title'] = $this->language->get('error_title');
		}

		if ((utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 64)) {
			$this->error['author'] = $this->language->get('error_author');
		}

		if (empty($this->request->post['blog_link'])) {
			$this->error['blog_link'] = $this->language->get('error_blog_link');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/blog_card')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
