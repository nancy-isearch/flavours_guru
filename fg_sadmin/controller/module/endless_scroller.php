<?php
define('EXTENSION_NAME',            'Endless Scroller');
define('EXTENSION_VERSION',         '1.8.5');
define('EXTENSION_ID',              '5678');
define('EXTENSION_COMPATIBILITY',   'OpenCart 2.3.x.x');
define('EXTENSION_STORE_URL',       'http://www.opencart.com/index.php?route=extension/extension/info&extension_id=' . EXTENSION_ID);
define('EXTENSION_PURCHASE_URL',    'http://www.opencart.com/index.php?route=extension/purchase&extension_id=' . EXTENSION_ID);
define('EXTENSION_SUPPORT_EMAIL',   'support@opencart.ee');
define('EXTENSION_SUPPORT_FORUM',   'http://forum.opencart.com/viewtopic.php?f=123&t=57210');
define('OTHER_EXTENSIONS',          'http://www.opencart.com/index.php?route=extension/extension&filter_username=bull5-i');

class ControllerExtensionModuleEndlessScroller extends Controller {
	private $error = array();
	protected $alert = array(
		'error'     => array(),
		'warning'   => array(),
		'success'   => array(),
		'info'      => array()
	);

	private $defaults = array(
		'es_installed'              => 1,
		'es_installed_version'      => EXTENSION_VERSION,
		'es_status'                 => 0,
		'es_bottom_pixels'          => 400,
		'es_use_fade_in'            => 1,
		'es_use_back_to_top'        => 1,
		'es_use_more'               => 0,
		'es_use_more_after'         => 0,
		'es_use_sticky_footer'      => 1,
		'es_max_items_per_load'     => 500,
		'es_services'               => "W10=",
		'es_as'                     => "WyIwIl0=",
	);

	private static $language_texts = array(
		// Texts
		'text_enabled', 'text_disabled', 'text_yes', 'text_no', 'text_toggle_navigation', 'text_legal_notice', 'text_license', 'text_extension_information',
		'text_terms', 'text_license_text', 'text_support_subject', 'text_faq', 'text_saving', 'text_upgrading', 'text_loading', 'text_canceling',
		// Tabs
		'tab_settings', 'tab_support', 'tab_about', 'tab_general', 'tab_faq', 'tab_services', 'tab_changelog', 'tab_extension',
		// Buttons
		'button_save', 'button_apply', 'button_cancel', 'button_close', 'button_upgrade', 'button_refresh', 'button_purchase_license',
		// Help texts
		'help_bottom_pixels', 'help_use_fade_in', 'help_use_more', 'help_use_more_after', 'help_use_sticky_footer', 'help_max_items_per_load',
		'help_purchase_additional_licenses',
		// Entries
		'entry_extension_status', 'entry_bottom_pixels', 'entry_use_fade_in', 'entry_use_back_to_top', 'entry_use_more', 'entry_use_more_after',
		'entry_use_sticky_footer', 'entry_max_items_per_load', 'entry_installed_version', 'entry_extension_name', 'entry_extension_compatibility',
		'entry_extension_store_url', 'entry_copyright_notice', 'entry_active_on', 'entry_inactive_on',
		// Errors
		'error_positive_integer', 'error_positive_integer_zero', 'error_ajax_request'
	);

	public function __construct($registry) {
		parent::__construct($registry);
		$this->load->helper('es');

		$this->load->language('extension/module/endless_scroller');
	}

	public function index() {
		$this->document->addStyle('view/stylesheet/es/css/custom.min.css');
		$this->document->addScript('view/javascript/es/custom.min.js');

		$this->document->setTitle($this->language->get('extension_name'));

		$this->load->model('setting/setting');

		$ajax_request = isset($this->request->server['HTTP_X_REQUESTED_WITH']) && !empty($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$ajax_request && $this->validateForm($this->request->post)) {
			$original_settings = $this->model_setting_setting->getSetting('es');

			foreach ($this->defaults as $setting => $default) {
				$value = $this->config->get($setting);
				if ($value === null) {
					$original_settings[$setting] = $default;
				}
			}

			$settings = array_merge($original_settings, $this->request->post);
			$settings['es_installed_version'] = $original_settings['es_installed_version'];

			$this->model_setting_setting->editSetting('es', $settings);

			$this->session->data['success'] = $this->language->get('text_success_update');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		} else if ($this->request->server['REQUEST_METHOD'] == 'POST' && $ajax_request) {
			$response = array();

			if ($this->validateForm($this->request->post)) {
				$original_settings = $this->model_setting_setting->getSetting('es');

				foreach ($this->defaults as $setting => $default) {
					$value = $this->config->get($setting);
					if ($value === null) {
						$original_settings[$setting] = $default;
					}
				}

				$settings = array_merge($original_settings, $this->request->post);
				$settings['es_installed_version'] = $original_settings['es_installed_version'];

				$this->model_setting_setting->editSetting('es', $settings);

				$this->alert['success']['updated'] = $this->language->get('text_success_update');
			}

			$response = array_merge($response, array("errors" => $this->error), array("alerts" => $this->alert));

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_enc($response, JSON_UNESCAPED_SLASHES));
			return;
		}

		$this->checkPrerequisites();

		$this->checkVersion();

		$data['heading_title'] = $this->language->get('extension_name');
		$data['text_other_extensions'] = sprintf($this->language->get('text_other_extensions'), OTHER_EXTENSIONS);

		foreach (self::$language_texts as $text) {
			$data[$text] = $this->language->get($text);
		}

		$data['ext_name'] = EXTENSION_NAME;
		$data['ext_version'] = EXTENSION_VERSION;
		$data['ext_id'] = EXTENSION_ID;
		$data['ext_compatibility'] = EXTENSION_COMPATIBILITY;
		$data['ext_store_url'] = EXTENSION_STORE_URL;
		$data['ext_purchase_url'] = EXTENSION_PURCHASE_URL;
		$data['ext_support_email'] = EXTENSION_SUPPORT_EMAIL;
		$data['ext_support_forum'] = EXTENSION_SUPPORT_FORUM;
		$data['other_extensions_url'] = OTHER_EXTENSIONS;

		$data['alert_icon'] = function($type) {
			$icon = "";
			switch ($type) {
				case 'error':
					$icon = "fa-times-circle";
					break;
				case 'warning':
					$icon = "fa-exclamation-triangle";
					break;
				case 'success':
					$icon = "fa-check-circle";
					break;
				case 'info':
					$icon = "fa-info-circle";
					break;
				default:
					break;
			}
			return $icon;
		};

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
			'active'    => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_extension'),
			'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true),
			'active'    => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('extension_name'),
			'href'      => $this->url->link('extension/module/endless_scroller', 'token=' . $this->session->data['token'], true),
			'active'    => true
		);

		$data['save'] = $this->url->link('extension/module/endless_scroller', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		$data['upgrade'] = $this->url->link('extension/module/endless_scroller/upgrade', 'token=' . $this->session->data['token'], true);
		$data['extension_installer'] = $this->url->link('extension/installer', 'token=' . $this->session->data['token'], true);
		$data['services'] = html_entity_decode($this->url->link('extension/module/endless_scroller/services', 'token=' . $this->session->data['token'], true));

		$data['update_pending'] = !$this->checkVersion();

		if (!$data['update_pending']) {
			$this->updateEventHooks();
		}

		$data['ssl'] = (
				(int)$this->config->get('config_secure') ||
				isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on' ||
				!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' ||
				!empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on'
			) ? 's' : '';

		$data['installed_version'] = $this->installedVersion();

		# Loop through all settings for the post/config values
		foreach (array_keys($this->defaults) as $setting) {
			if (isset($this->request->post[$setting])) {
				$data[$setting] = $this->request->post[$setting];
			} else {
				$data[$setting] = $this->config->get($setting);
				if ($data[$setting] === null) {
					if (!isset($this->alert['warning']['unsaved']) && $this->checkVersion())  {
						$this->alert['warning']['unsaved'] = $this->language->get('error_unsaved_settings');
					}
					if (isset($this->defaults[$setting])) {
						$data[$setting] = $this->defaults[$setting];
					}
				}
			}
		}

		$this->load->model('setting/store');

		$stores = $this->model_setting_store->getStores();

		$data['stores'] = array();

		$data['stores'][0] = array(
			'name' => $this->config->get('config_name'),
			'url'  => HTTP_CATALOG
		);

		foreach ($stores as $store) {
			$data['stores'][$store['store_id']] = array(
				'name' => $store['name'],
				'url'  => $store['url']
			);
		}

		if (isset($this->session->data['error'])) {
			$this->error = $this->session->data['error'];

			unset($this->session->data['error']);
		}

		if (isset($this->error['warning'])) {
			$this->alert['warning']['warning'] = $this->error['warning'];
		}

		if (isset($this->error['error'])) {
			$this->alert['error']['error'] = $this->error['error'];
		}

		if (isset($this->session->data['success'])) {
			$this->alert['success']['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		}

		$data['errors'] = $this->error;

		$data['token'] = $this->session->data['token'];

		$data['alerts'] = $this->alert;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$template = 'extension/module/endless_scroller';

		$this->response->setOutput($this->load->view($template, $data));
	}

	public function install() {
		$this->registerEventHooks();

		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('es', $this->defaults);
	}

	public function uninstall() {
		$this->removeEventHooks();

		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting('es');
	}

	public function upgrade() {
		$ajax_request = isset($this->request->server['HTTP_X_REQUESTED_WITH']) && !empty($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';

		$response = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateUpgrade()) {
			$this->load->model('setting/setting');

			$settings = array();

			// Go over all settings, add new values and remove old ones
			foreach ($this->defaults as $setting => $default) {
				$value = $this->config->get($setting);
				if ($value === null) {
					$settings[$setting] = $default;
				} else {
					$settings[$setting] = $value;
				}
			}

			$settings['es_installed_version'] = EXTENSION_VERSION;

			$this->model_setting_setting->editSetting('es', $settings);

			$this->session->data['success'] = sprintf($this->language->get('text_success_upgrade'), EXTENSION_VERSION);
			$this->alert['success']['upgrade'] = sprintf($this->language->get('text_success_upgrade'), EXTENSION_VERSION);

			$response['success'] = true;
			$response['reload'] = true;
		}

		$response = array_merge($response, array("errors" => $this->error), array("alerts" => $this->alert));

		if (!$ajax_request) {
			$this->session->data['errors'] = $this->error;
			$this->session->data['alerts'] = $this->alert;
			$this->response->redirect($this->url->link('extension/module/endless_scroller', 'token=' . $this->session->data['token'], true));
		} else {
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_enc($response, JSON_UNESCAPED_SLASHES));
			return;
		}
	}

	public function services() {
		$services = base64_decode($this->config->get('es_services'));
		$response = json_decode($services, true);
		$force = isset($this->request->get['force']) && (int)$this->request->get['force'];

		if ($response && isset($response['expires']) && $response['expires'] >= strtotime("now") && !$force) {
			$response['cached'] = true;
		} else {
			$url = "http://www.opencart.ee/services/?eid=" . EXTENSION_ID . "&info=true&general=true";
			$hostname = (!empty($_SERVER['HTTP_HOST'])) ? $_SERVER['HTTP_HOST'] : '' ;

			if (function_exists('curl_init')) {
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, $url);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
				curl_setopt($ch, CURLOPT_HEADER, false);
				curl_setopt($ch, CURLOPT_MAXREDIRS, 3);
				curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
				curl_setopt($ch, CURLOPT_TIMEOUT, 60);
				curl_setopt($ch, CURLOPT_USERAGENT, base64_encode("curl " . EXTENSION_ID));
				curl_setopt($ch, CURLOPT_REFERER, $hostname);
				$json = curl_exec($ch);
			} else {
				$json = false;
			}

			if ($json !== false) {
				$this->load->model('setting/setting');
				$settings = $this->model_setting_setting->getSetting('es');
				$settings['es_services'] = base64_encode($json);
				$this->model_setting_setting->editSetting('es', $settings);
				$response = json_decode($json, true);
			} else {
				$response = array();
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_enc($response, JSON_UNESCAPED_SLASHES));
	}

	private function registerEventHooks() {
		// $this->load->model('extension/event');
		// $this->model_extension_event->addEvent('es.product.delete', 'pre.admin.product.delete', 'extension/module/endless_scroller/hook');
	}

	private function removeEventHooks() {
		// $this->load->model('extension/event');
		// $this->model_extension_event->deleteEvent('es.product.delete');
	}

	private function updateEventHooks() {
		$this->load->model('extension/event');

		$event_hooks = array(
			// 'es.product.delete'         => array('trigger' => 'pre.admin.product.delete',           'action' => 'extension/module/endless_scroller/hook'),
		);

		foreach ($event_hooks as $code => $hook) {
			$event = $this->model_extension_event->getEvent($code, $hook['trigger'], $hook['action']);

			if (!$event) {
				$this->model_extension_event->addEvent($code, $hook['trigger'], $hook['action']);

				if (empty($this->alert['success']['hooks_updated'])) {
					$this->alert['success']['hooks_updated'] = $this->language->get('text_success_hooks_update');
				}
			}
		}

		// Delete old triggers
		$query = $this->db->query("SELECT `code` FROM " . DB_PREFIX . "event WHERE `code` LIKE 'es.%'");
		$events = array_keys($event_hooks);

		foreach ($query->rows as $row) {
			if (!in_array($row['code'], $events)) {
				$this->model_extension_event->deleteEvent($row['code']);

				if (empty($this->alert['success']['hooks_updated'])) {
					$this->alert['success']['hooks_updated'] = $this->language->get('text_success_hooks_update');
				}
			}
		}
	}

	private function checkPrerequisites() {
		$errors = false;

		if (!defined('VQMOD_WORKING')) {
			if (!class_exists('VQMod')) {
				$this->alert['warning']['vqmod'] = $this->language->get('error_vqmod');
			} else {
				$this->alert['warning']['vqmod'] = $this->language->get('error_vqmod_script');
			}
		}

		return !$errors;
	}

	private function checkVersion() {
		$errors = false;

		$installed_version = $this->installedVersion();
		if ($installed_version != EXTENSION_VERSION) {
			$errors = true;
			$this->alert['info']['version'] = sprintf($this->language->get('error_version'), EXTENSION_VERSION);
		}

		return !$errors;
	}

	private function validate() {
		$errors = false;

		if (!$this->user->hasPermission('modify', 'extension/module/endless_scroller')) {
			$errors = true;
			$this->alert['error']['permission'] = $this->language->get('error_permission');
		}

		if (!$errors) {
			return $this->checkVersion() && $this->checkPrerequisites();
		} else {
			return false;
		}
	}

	private function validateForm(&$data) {
		$errors = !$this->validate();

		if (!is_numeric($data['es_use_more_after']) || (int)$data['es_use_more_after'] != $data['es_use_more_after'] || (int)$data['es_use_more_after'] < 0) {
			$errors = true;
			$this->error['use_more_after'] = $this->language->get('error_positive_integer_zero');
		}

		if (!is_numeric($data['es_bottom_pixels']) || (int)$data['es_bottom_pixels'] != $data['es_bottom_pixels'] || (int)$data['es_bottom_pixels'] < 0) {
			$errors = true;
			$this->error['bottom_pixels'] = $this->language->get('error_positive_integer_zero');
		}

		if (!is_numeric($data['es_max_items_per_load']) || (int)$data['es_max_items_per_load'] != $data['es_max_items_per_load'] || (int)$data['es_max_items_per_load'] <= 0) {
			$errors = true;
			$this->error['max_items_per_load'] = $this->language->get('error_positive_integer');
		}

		if ($errors) {
			$this->alert['warning']['warning'] = $this->language->get('error_warning');
		}

		return !$errors;
	}

	private function validateUpgrade() {
		$errors = false;

		if (!$this->user->hasPermission('modify', 'extension/module/endless_scroller')) {
			$errors = true;
			$this->alert['error']['permission'] = $this->language->get('error_permission');
		}

		return !$errors;
	}

	private function installedVersion() {
		$installed_version = $this->config->get('es_installed_version');
		return $installed_version ? $installed_version : '1.8.5';
	}
}
