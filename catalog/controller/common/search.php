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
		require 'CakeSearchEngine.php';

		$products = [
			['id' => 1, 'title' => 'Spiderman Cake'],
			['id' => 2, 'title' => 'Batman Cake'],
			['id' => 3, 'title' => 'Chocolate Truffle Cake'],
			['id' => 4, 'title' => 'Superman Cake'],
			['id' => 5, 'title' => 'Strawberry Designer Cake'],
		];

		// Optional synonym map (can be loaded from CSV or generated offline)
		$synonyms = [
			'spicermen' => 'spiderman',
			'spicer' => 'spiderman',
			'bday' => 'birthday',
			'choco' => 'chocolate',
		];

		$searchEngine = new CakeSearchEngine($products, $synonyms);

		// Simulated user input
		$input = "Spicer cake";
		$results = $searchEngine->search($input);

		// Display results
		echo "🔍 Search results for: \"$input\"\n\n";
		foreach ($results as $result) {
			echo "- " . $result['product']['title'] . " (score: " . $result['score'] . ")\n";
		}
	}
}