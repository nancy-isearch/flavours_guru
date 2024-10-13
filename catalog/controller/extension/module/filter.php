<?php
class ControllerExtensionModuleFilter extends Controller {
	public function index() {
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$category_id = end($parts);
		$path_cats=$parts;

		$this->load->model('catalog/category');

		/*$pathid = $this->model_catalog_category->getpathId($category_id);

				$arry = array();
				foreach($pathid as $key){
					$arry[] = $key['path_id'] ;
				}
		 	$short_path = implode('_',$arry);*/
		 
		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {

			$this->load->language('extension/module/filter');

			$data['heading_title'] = $this->language->get('heading_title');

			$data['button_filter'] = $this->language->get('button_filter');

			$url = ''; 

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


			$data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url));
			//$data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $short_path . $url));
 			//$data['action'] = strtok($data['action1'], '&');

			if (isset($this->request->get['filter'])) {
				$data['filter_category'] = explode(',', $this->request->get['filter']);
			} else {
				$data['filter_category'] = array();
			}

			if (isset($this->request->get['filter'])) {
				$filter = $this->request->get['filter'];
			} else {
				$filter = '';
			}

			$this->load->model('catalog/product');

			$data['filter_groups'] = array();

			if(count($path_cats)==2){
				$mc_parent_id=$path_cats[0];
				$mc_cat_id=$path_cats[1];
			} else {
				$mc_parent_id=0;
				$mc_cat_id=$path_cats[0];
			}

			$cat_path=$mc_parent_id."_".$mc_cat_id;
			$multicategory=$this->db->query("SELECT * from ".DB_PREFIX."category_multiparent where parent_id=".$mc_parent_id." and category_id=".$mc_cat_id)->row;

			$filter_groups = $this->model_catalog_category->getCategoryFilters($multicategory['id'],$filter);
		 
			if ($filter_groups) {
				foreach ($filter_groups as $filter_group) {
					$childen_data = array();

					foreach ($filter_group['filter'] as $filter) {
						$filter_data = array(
							'filter_category_id' => $category_id,
							'filter_filter'      => $filter['filter_id']
						);

						$childen_data[] = array(
							'filter_id' => $filter['filter_id'],
							'name'      => $filter['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '')
						);
					}

					$data['filter_groups'][] = array(
						'filter_group_id' => $filter_group['filter_group_id'],
						'name'            => $filter_group['name'],
						'filter'          => $childen_data
					);
				}

				return $this->load->view('extension/module/filter', $data);
			}
		}
	}
}