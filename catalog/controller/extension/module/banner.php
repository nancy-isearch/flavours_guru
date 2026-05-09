<?php
class ControllerExtensionModuleBanner extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		// Mobile detection
		$is_mobile = $this->isMobileDevice();

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.transitions.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				if ($is_mobile) {
					$width = min($setting['width'], 600);
					$height = min($setting['height'], 400);
				} else {
					$width = $setting['width'];
					$height = $setting['height'];
				}
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $width, $height)
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('extension/module/banner', $data);
	}

	private function isMobileDevice() {
		$user_agent = $_SERVER['HTTP_USER_AGENT'] ?? '';
		$mobile_keywords = ['Mobile', 'Android', 'iPhone', 'iPad', 'Windows Phone', 'BlackBerry', 'webOS'];
		foreach ($mobile_keywords as $keyword) {
			if (stripos($user_agent, $keyword) !== false) {
				return true;
			}
		}
		return false;
	}
}