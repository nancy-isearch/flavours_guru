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

		$file=fopen(DIR_SYSTEM.'data/home_category.csv', 'r');
		$home_category=array();
		$counter=0;

		$skiphead=true;

		while (($line = fgetcsv($file)) !== FALSE) {
		  	if($skiphead){$skiphead=false; continue;}
		  	$category_line=array();
		  	$category_line['title']=$line[0];
		  	$category_line['url']=$line[1];

		  	$category_line['products']=array();

		  	//product 1
		  	$catpro=$this->model_catalog_product->getProductBySku($line[2]);

		  	if($catpro){

			  	if ($catpro['image']) {
					$image = $this->model_tool_image->resize($catpro['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				$price = $this->currency->format($this->tax->calculate($catpro['price'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

			  	if ((float)$catpro['special']) {
					$special = $this->currency->format($this->tax->calculate($catpro['special'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

			  	$category_line['products'][]=array(
			  			'name'=>$catpro['name'],
			  			'image'=>$image,
			  			'price'=>$price,
			  			'special'=> $special,
			  			'href'=> $this->url->link('product/product','product_id=' . $catpro['product_id'])
			  	);

			}

			$catpro=false;

		  	//product 1
		  	$catpro=$this->model_catalog_product->getProductBySku($line[3]);

		  	if($catpro){

			  	if ($catpro['image']) {
					$image = $this->model_tool_image->resize($catpro['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				$price = $this->currency->format($this->tax->calculate($catpro['price'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

			  	if ((float)$catpro['special']) {
					$special = $this->currency->format($this->tax->calculate($catpro['special'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

			  	$category_line['products'][]=array(
			  			'name'=>$catpro['name'],
			  			'image'=>$image,
			  			'price'=>$price,
			  			'special'=> $special,
			  			'href'=> $this->url->link('product/product','product_id=' . $catpro['product_id'])
			  	);

			}

			$catpro=false;

		  	//product 2
		  	$catpro=$this->model_catalog_product->getProductBySku($line[4]);

		  	if($catpro){

			  	if ($catpro['image']) {
					$image = $this->model_tool_image->resize($catpro['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				$price = $this->currency->format($this->tax->calculate($catpro['price'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

			  	if ((float)$catpro['special']) {
					$special = $this->currency->format($this->tax->calculate($catpro['special'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

			  	$category_line['products'][]=array(
			  			'name'=>$catpro['name'],
			  			'image'=>$image,
			  			'price'=>$price,
			  			'special'=> $special,
			  			'href'=> $this->url->link('product/product','product_id=' . $catpro['product_id'])
			  	);

			}

			$catpro=false;

		  	//product 1
		  	$catpro=$this->model_catalog_product->getProductBySku($line[5]);

		  	if($catpro){

			  	if ($catpro['image']) {
					$image = $this->model_tool_image->resize($catpro['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				$price = $this->currency->format($this->tax->calculate($catpro['price'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

			  	if ((float)$catpro['special']) {
					$special = $this->currency->format($this->tax->calculate($catpro['special'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

			  	$category_line['products'][]=array(
			  			'name'=>$catpro['name'],
			  			'image'=>$image,
			  			'price'=>$price,
			  			'special'=> $special,
			  			'href'=> $this->url->link('product/product','product_id=' . $catpro['product_id'])
			  	);

			}

			$catpro=false;
		  	//product 1

		  	$catpro=$this->model_catalog_product->getProductBySku($line[6]);

		  	if($catpro){

			  	if ($catpro['image']) {
					$image = $this->model_tool_image->resize($catpro['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				$price = $this->currency->format($this->tax->calculate($catpro['price'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

			  	if ((float)$catpro['special']) {
					$special = $this->currency->format($this->tax->calculate($catpro['special'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

			  	$category_line['products'][]=array(
			  			'name'=>$catpro['name'],
			  			'image'=>$image,
			  			'price'=>$price,
			  			'special'=> $special,
			  			'href'=> $this->url->link('product/product','product_id=' . $catpro['product_id'])
			  	);

			}

			$catpro=false;

		  	//product 1
		  	$catpro=$this->model_catalog_product->getProductBySku($line[7]);

		  	if($catpro){

			  	if ($catpro['image']) {
					$image = $this->model_tool_image->resize($catpro['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				$price = $this->currency->format($this->tax->calculate($catpro['price'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

			  	if ((float)$catpro['special']) {
					$special = $this->currency->format($this->tax->calculate($catpro['special'], $catpro['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

			  	$category_line['products'][]=array(
			  			'name'=>$catpro['name'],
			  			'image'=>$image,
			  			'price'=>$price,
			  			'special'=> $special,
			  			'href'=> $this->url->link('product/product','product_id=' . $catpro['product_id'])
			  	);

			}

			$home_category[]=$category_line;

		}

		$data['home_category'] = $home_category;

		$allreviews = $this->model_catalog_product->getAllReviews($proIdsForReviews);
		$data['allreviews']['all'] = $allreviews;
		$data['allreviews']['cnt'] = count($allreviews);
		$ratingttl = 0;
		foreach ($allreviews as $review) {
			$ratingttl = $ratingttl + $review['rating'];
		}
		if(count($allreviews) > 0){
			$data['allreviews']['average'] = round(($ratingttl / count($allreviews)),2);	
		} else {
			$data['allreviews']['average'] = 0;
		}

		//$data['home_cat'] = $this->load->view('common/home_cat', $data);

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
