<?php
class ControllerCommonSearch extends Controller {
	public function index() {
		$this->load->language('common/search');

		$data['text_search'] = $this->language->get('text_search');

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}
		$data['actionSearch'] = $this->url->link('common/search');
		return $this->load->view('common/search', $data);
	}

	public function searchProduct(){
		$this->load->model('account/search');
		$data = array();
		if (isset($this->request->post['searchProduct'])) {
			$rows=$this->model_account_search->searchCategory($this->request->post['searchProduct']);
			$products=array();
			if($rows)
				foreach($rows as $row){
					$products[]=array(
							'name'=>$row['name'],
							'href'        => $this->url->link('product/category', 'path=' . $row['category_id'])
						);
				}

			echo json_encode($products);
		}  
		 
	}

	public function searchCake(){
		$input = $this->request->get['search'];
		if (empty($input)) {
			echo "Please enter a search term.";
			return;
		}
		require '/home/master/applications/npffwsymrc/public_html/catalog/controller/product/CakeSearchEngine.php';
		$aa = "SELECT product_id id, name title FROM `oc_product_description`";
		$products = $this->db->query($aa)->rows;
		// $products = [
		// 	['id' => 1, 'title' => 'Spiderman Cake'],
		// 	['id' => 2, 'title' => 'Batman Cake'],
		// 	['id' => 3, 'title' => 'Chocolate Truffle Cake'],
		// 	['id' => 4, 'title' => 'Superman Cake'],
		// 	['id' => 5, 'title' => 'Strawberry Designer Cake'],
		// ];

		// Optional synonym map (can be loaded from CSV or generated offline)
		// $synonyms = [
		// 	'spicermen' => 'spiderman',
		// 	'spicer' => 'spiderman',
		// 	'bday' => 'birthday',
		// 	'choco' => 'chocolate',
		// ];

		$synonyms = [];
		$searchEngine = new CakeSearchEngine($products, $synonyms);
		$results = $searchEngine->search($input);

		// Display results
		echo "🔍 Search results for: \"$input\" - Count (".count($result).")<br><br>";
		foreach ($results as $result) {
			echo "- " . $result['product']['title'] . " (score: " . $result['score'] . ")<br>";
		}
	}
}