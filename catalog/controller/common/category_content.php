<?php
class ControllerCommonCategoryContent extends Controller {
	public function index() {
		
		$this->load->model('hcategory/category');

		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}
		
		$data=array();

		//$first_cat_data = $this->model_hcategory_category->get_first_cat_data();
		$first_cat_data = $this->model_hcategory_category->get_cat_data(159);

		$products=array();

		foreach($first_cat_data as $row){
			$row['price']=$this->currency->format($row['price'], $this->session->data['currency']);
			$row['href']=$this->url->link('product/product&product_id=' . $row['product_id']);
			$row['category_id']  = $this->url->link('product/category', 'path=' . $row['category_id']);
			$products[]=$row;
		}

		$data['first_cat_data']=$products;

		//$second_cat_data = $this->model_hcategory_category->get_second_cat_data();
		$second_cat_data = $this->model_hcategory_category->get_cat_data(160);

		$products=array();

		foreach($second_cat_data as $row){
			$row['price']=$this->currency->format($row['price'], $this->session->data['currency']);
			$row['href']=$this->url->link('product/product&product_id=' . $row['product_id']);
			$row['category_id']  = $this->url->link('product/categorys', 'path=' . $row['category_id']);
			$products[]=$row;
		}

		$data['second_cat_data']=$products;




		//$third_cat_data = $this->model_hcategory_category->get_third_cat_data();
		$third_cat_data = $this->model_hcategory_category->get_cat_data(161);

		$products=array();

		foreach($third_cat_data as $row){
			$row['price']=$this->currency->format($row['price'], $this->session->data['currency']);
			$row['href']=$this->url->link('product/product&product_id=' . $row['product_id']);
			$row['category_id']  = $this->url->link('product/categorys', 'path=' . $row['category_id']);
			$products[]=$row;
		}

		$data['third_cat_data']=$products;



		//$fourth_cat_data = $this->model_hcategory_category->get_fourth_cat_data();
		$fourth_cat_data = $this->model_hcategory_category->get_cat_data(162);

		$products=array();

		foreach($fourth_cat_data as $row){
			$row['price']=$this->currency->format($row['price'], $this->session->data['currency']);
			$row['href']=$this->url->link('product/product&product_id=' . $row['product_id']);
			$row['category_id']  = $this->url->link('product/categorys', 'path=' . $row['category_id']);
			$products[]=$row;
		}

		$data['fourth_cat_data']=$products;


		//$fifth_cat_data = $this->model_hcategory_category->get_fifth_cat_data();
		$fifth_cat_data = $this->model_hcategory_category->get_cat_data(163);

		$products=array();

		foreach($fifth_cat_data as $row){
			$row['price']=$this->currency->format($row['price'], $this->session->data['currency']);
			$row['href']=$this->url->link('product/product&product_id=' . $row['product_id']);
			$row['category_id']  = $this->url->link('product/categorys', 'path=' . $row['category_id']);
			$products[]=$row;
		}

		$data['fifth_cat_data']=$products;

	/*	//innovative product urls */
		$data['under'] = $this->url->link('product/category', 'path=151' );
		$data['gifthamper'] = $this->url->link('product/category', 'path=152' );
		$data['giftforher'] = $this->url->link('product/category', 'path=153' );
		$data['giftforhim'] = $this->url->link('product/category', 'path=154' );
		$data['samedaydelivery'] = $this->url->link('product/category', 'path=156' );
		$data['worldwidedelivery'] = $this->url->link('product/category', 'path=158' );
		
		return $data;
	}
}
