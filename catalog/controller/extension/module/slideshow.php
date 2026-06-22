<?php
class ControllerExtensionModuleSlideshow extends Controller {
	public function index($setting) {
		static $module = 0;		

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$desktop_width = isset($setting['width']) ? (int)$setting['width'] : 1140;
				$desktop_height = isset($setting['height']) ? (int)$setting['height'] : 380;
				$mobile_width = min($desktop_width, 767);
				$mobile_height = (int)round($desktop_height * ($mobile_width / max($desktop_width, 1)));

				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $desktop_width, $desktop_height),
					'image_mobile' => $this->model_tool_image->resize($result['image'], $mobile_width, $mobile_height),
					'width' => $desktop_width,
					'height' => $desktop_height
				);
			}
		}

		$data['sidebanners'] = array();

		$results2 = $this->model_design_banner->getBanner(9);

		foreach ($results2 as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['sidebanners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], 285, 114),
					'image_mobile' => $this->model_tool_image->resize($result['image'], min(285, 200), min(114, 80))
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('extension/module/slideshow', $data);
	}
}
