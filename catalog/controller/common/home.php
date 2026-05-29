<?php
class ControllerCommonHome extends Controller {
	public function index() {
		
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['category_content'] = $this->load->controller('common/category_content');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$data['home_footer_text']=html_entity_decode($this->config->get('config_home_footer_text'));

		//for innovative category on front page
		$this->load->model('catalog/category'); 
		$this->load->model('catalog/product'); 

			/*$data['categories'] = array(); 
			$results = $this->model_catalog_category->getMultiParentCategories(150); 

				 foreach($results as $result){                  
                   $cat_path =  $this->url->link('product/category','path='.$result['category_id'].'');
                   $data['category'][] = array('name'=>$result['name'],'category_id'=>$result['category_id'],'path'=>$cat_path,'image'=>$result['image']);
		 		}
*/


		//home page categories

		// Fix #6: cache CSV rows + raw product data keyed by store+language
		// Fix #2: batch-fetch all SKUs in one query instead of 6 per row
		$home_csv = DIR_SYSTEM . 'data/home_category.csv';
		$csv_mtime = is_file($home_csv) ? (int)filemtime($home_csv) : 0;
		$cache_dir = DIR_CACHE . 'home/';
		if (!is_dir($cache_dir)) {
			@mkdir($cache_dir, 0777, true);
		}
		$cache_file = $cache_dir . md5('home.category.' . (int)$this->config->get('config_store_id') . '.' . (int)$this->config->get('config_language_id')) . '.cache';

		$csv_rows = array();
		$products_by_sku = array();
		$loaded_from_cache = false;

		if (is_file($cache_file)) {
			$payload = @unserialize(file_get_contents($cache_file));
			if (is_array($payload) && isset($payload['csv_mtime']) && (int)$payload['csv_mtime'] === $csv_mtime) {
				$csv_rows        = $payload['csv_rows'];
				$products_by_sku = $payload['products_by_sku'];
				$loaded_from_cache = true;
			}
		}

		if (!$loaded_from_cache) {
			if (is_file($home_csv) && ($file = fopen($home_csv, 'r')) !== false) {
				$skiphead = true;
				while (($line = fgetcsv($file)) !== false) {
					if ($skiphead) { $skiphead = false; continue; }
					$csv_rows[] = $line;
				}
				fclose($file);
			}

			$skus = array();
			foreach ($csv_rows as $line) {
				for ($col = 2; $col <= 7; $col++) {
					if (!empty($line[$col])) {
						$skus[] = $line[$col];
					}
				}
			}
			$products_by_sku = $skus ? $this->model_catalog_product->getProductsBySkus($skus) : array();

			@file_put_contents($cache_file, serialize(array(
				'csv_mtime'      => $csv_mtime,
				'csv_rows'       => $csv_rows,
				'products_by_sku' => $products_by_sku
			)));
		}

		$this->load->model('tool/image');
		$img_w = $this->config->get($this->config->get('config_theme') . '_image_product_width');
		$img_h = $this->config->get($this->config->get('config_theme') . '_image_product_height');

		$home_category = array();
		foreach ($csv_rows as $line) {
			$category_line = array('title' => $line[0], 'url' => $line[1], 'products' => array());

			for ($col = 2; $col <= 7; $col++) {
				if (empty($line[$col]) || !isset($products_by_sku[$line[$col]])) {
					continue;
				}
				$catpro = $products_by_sku[$line[$col]];
				$image  = $catpro['image']
					? $this->model_tool_image->resize($catpro['image'], $img_w, $img_h)
					: $this->model_tool_image->resize('placeholder.png', $img_w, $img_h);

				$price   = $this->currency->format($this->tax->calculate($catpro['price'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				$special = (float)$catpro['special']
					? $this->currency->format($this->tax->calculate($catpro['special'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
					: false;

				$category_line['products'][] = array(
					'name'    => $catpro['name'],
					'image'   => $image,
					'price'   => $price,
					'special' => $special,
					'href'    => $this->url->link('product/product', 'product_id=' . $catpro['product_id'])
				);
			}

			$home_category[] = $category_line;
		}

		$data['home_category'] = $home_category;

		$allreviews = $this->model_catalog_product->getAllReviews();
		$data['allreviews']['all'] = $allreviews;
		$data['allreviews']['cnt'] = count($allreviews);
		$ratingttl = 0;
		foreach ($allreviews as $review) {
			$ratingttl += $review['rating'];
		}
		$data['allreviews']['average'] = count($allreviews) > 0 ? round($ratingttl / count($allreviews), 2) : 0;

		//$data['home_cat'] = $this->load->view('common/home_cat', $data);

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
