<?php
class ControllerToolUploadData extends Controller { 

	public function index() {
		echo "Ds"; die;
		$this->load->language('tool/export_import');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('tool/export_import');
		$this->getForm();
	}

	public function uploadCategoryMenu(){
		$data = array();
		$data['heading_title'] = "Update Menu";
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['error_warning'] = false;
		$data['success'] = false;
		if(isset($_GET['error']) && $_GET['error'] == 1){
			$data['error_warning'] = true;
		}
		if(isset($_GET['success']) && $_GET['success'] == 1){
			$data['success'] = true;
		}
		$data['action'] = $this->url->link('tool/upload_data/uploadCategoryMenuUp', 'token=' . $this->session->data['token'] , true);
		$data['download'] = $this->url->link('tool/upload_data/uploadCategoryMenuDown', 'token=' . $this->session->data['token'] , true);
		$this->response->setOutput($this->load->view('tool/upload_cat', $data));
	}

	public function uploadCategoryMenuUp(){
		$error = 0;
		$success = 0;

		if(isset($_FILES["file"])) {
			if ($_FILES["file"]["error"] > 0) {
				$error = 1;
			}
			else {
				$storagename = "category_menu.csv";
				if(move_uploaded_file($_FILES["file"]["tmp_name"], DIR_SYSTEM.'data/'. $storagename)){
					$success = 1;
				} else {
					$error = 1;
				}
			}
		} else {
			$error = 1;
		}
		$url = "tool/upload_data/uploadCategoryMenu&success=".$success."&error=".$error;
		$this->response->redirect($this->url->link($url, 'token=' . $this->session->data['token']));
	}

	public function uploadCategoryMenuDown(){
		$storagename = "category_menu.csv";
		if (!file_exists(DIR_SYSTEM.'data/'.$storagename)){
			$url = "tool/upload_data/uploadCategory&error=1";
			$this->response->redirect($this->url->link($url, 'token=' . $this->session->data['token']));
		}
		else{
			header('HTTP/1.1 200 OK');
			header('Cache-Control: no-cache, must-revalidate');
			header("Pragma: no-cache");
			header("Expires: 0");
			header("Content-type: text/csv");
			header("Content-Disposition: attachment; filename=$storagename");
			readfile(DIR_SYSTEM.'data/'.$storagename);
			exit;
		}
	}




	public function uploadHomeCat(){
		$data = array();
		$data['heading_title'] = "Update Home Categories";
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['error_warning'] = false;
		$data['success'] = false;
		if(isset($_GET['error']) && $_GET['error'] == 1){
			$data['error_warning'] = true;
		}
		if(isset($_GET['success']) && $_GET['success'] == 1){
			$data['success'] = true;
		}
		$data['action'] = $this->url->link('tool/upload_data/uploadHomeCatUp', 'token=' . $this->session->data['token'] , true);
		$data['download'] = $this->url->link('tool/upload_data/uploadHomeCatDown', 'token=' . $this->session->data['token'] , true);
		$this->response->setOutput($this->load->view('tool/upload_home_cat', $data));
	}

	public function uploadHomeCatUp(){
		$error = 0;
		$success = 0;
		if(isset($_FILES["file"])) {
			if ($_FILES["file"]["error"] > 0) {
				$error = 1;
			}
			else {
				$storagename = "home_category.csv";
				if(move_uploaded_file($_FILES["file"]["tmp_name"], DIR_SYSTEM.'data/'. $storagename)){
					$success = 1;
				} else {
					$error = 1;
				}
			}
		} else {
			$error = 1;
		}
		$url = "tool/upload_data/uploadHomeCat&success=".$success."&error=".$error;
		$this->response->redirect($this->url->link($url, 'token=' . $this->session->data['token']));
	}

	public function uploadHomeCatDown(){
		$storagename = "home_category.csv";
		if (!file_exists(DIR_SYSTEM. 'data/'.$storagename)){
			$url = "tool/upload_data/uploadCategory&error=1";
			$this->response->redirect($this->url->link($url, 'token=' . $this->session->data['token']));
		}
		else{
			header('HTTP/1.1 200 OK');
			header('Cache-Control: no-cache, must-revalidate');
			header("Pragma: no-cache");
			header("Expires: 0");
			header("Content-type: text/csv");
			header("Content-Disposition: attachment; filename=$storagename");
			readfile(DIR_SYSTEM. 'data/'. $storagename);
			exit;
		}
	}



	public function uploadSitemap(){
		$data = array();
		$data['heading_title'] = "Update Sitemap";
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['error_warning'] = false;
		$data['success'] = false;
		if(isset($_GET['error']) && $_GET['error'] == 1){
			$data['error_warning'] = true;
		}
		if(isset($_GET['success']) && $_GET['success'] == 1){
			$data['success'] = true;
		}
		$data['action'] = $this->url->link('tool/upload_data/uploadSitemapUp', 'token=' . $this->session->data['token'] , true);
		$data['download'] = $this->url->link('tool/upload_data/uploadSitemapDown', 'token=' . $this->session->data['token'] , true);
		$this->response->setOutput($this->load->view('tool/upload_sitemap', $data));
	}

	public function uploadSitemapUp(){
		$error = 0;
		$success = 0;
		if(isset($_FILES["file"])) {
			if ($_FILES["file"]["error"] > 0) {
				$error = 1;
			}
			else {
				$storagename = "sitemap.csv";
				if(move_uploaded_file($_FILES["file"]["tmp_name"], DIR_SYSTEM.'data/'. $storagename)){
					$success = 1;
				} else {
					$error = 1;
				}
			}
		} else {
			$error = 1;
		}
		$url = "tool/upload_data/uploadSitemap&success=".$success."&error=".$error;
		$this->response->redirect($this->url->link($url, 'token=' . $this->session->data['token']));
	}

	public function uploadSitemapDown(){
		$storagename = "sitemap.csv";
		if (!file_exists(DIR_SYSTEM. 'data/'.$storagename)){
			$url = "tool/upload_data/uploadSitemap&error=1";
			$this->response->redirect($this->url->link($url, 'token=' . $this->session->data['token']));
		}
		else{
			header('HTTP/1.1 200 OK');
			header('Cache-Control: no-cache, must-revalidate');
			header("Pragma: no-cache");
			header("Expires: 0");
			header("Content-type: text/csv");
			header("Content-Disposition: attachment; filename=$storagename");
			readfile(DIR_SYSTEM. 'data/'. $storagename);
			exit;
		}
	}



	public function uploadProMap(){
		$data = array();
		$data['heading_title'] = "Upload Product Mapping/Sequencing";
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['error_warning'] = false;
		$data['success'] = false;
		if(isset($_GET['error']) && $_GET['error'] == 1){
			$data['error_warning'] = true;
		}
		if(isset($_GET['success']) && $_GET['success'] == 1){
			$data['success'] = true;
		}
		$data['action'] = $this->url->link('tool/upload_data/uploadProMapUp', 'token=' . $this->session->data['token'] , true);
		$data['download'] = $this->url->link('tool/upload_data/uploadProMapDown', 'token=' . $this->session->data['token'] , true);
		$data['download2'] = $this->url->link('tool/upload_data/uploadProMapCatDown', 'token=' . $this->session->data['token'] , true);
		$data['download3'] = $this->url->link('tool/upload_data/uploadProMapSampleDown', 'token=' . $this->session->data['token'] , true);
		$this->response->setOutput($this->load->view('tool/upload_pro_map', $data));
	}

	public function uploadProMapUp(){
		$error = 0;
		$success = 0;
		if(isset($_FILES["file"])) {
			if ($_FILES["file"]["error"] > 0) {
				$error = 1;
			}
			else {
				$storagename = "product-mapping.csv";
				if(move_uploaded_file($_FILES["file"]["tmp_name"], DIR_UPLOAD_TMP. $storagename)){
					$success = 1;

					$file = fopen(DIR_UPLOAD_TMP. $storagename, 'r');
					$skipfirst=true;
					$counter=1;

					$rows=$this->db->query("SELECT product_id, sku from ".DB_PREFIX."product")->rows;
					$products=array();
					foreach($rows as $row)
						$products[$row['sku']]=$row['product_id'];

					$prev_catid=0;
					$this->db->query("TRUNCATE ".DB_PREFIX."product_to_category");
					while (($line = fgetcsv($file)) !== FALSE) {
						
					  if($skipfirst){$skipfirst=false; continue;}
					  
					  $category_id=$line[0];
					  if(isset($products[$line[2]]))
					  	$product_id=$products[$line[2]];
					  else
					  	continue;
					  $catpromap=$this->db->query("SELECT * from ".DB_PREFIX."product_to_category where product_id=".$product_id." and category_id=".$category_id)->rows;

					  /*if($prev_catid!=$category_id)
					  	$this->db->query("UPDATE ".DB_PREFIX."product_to_category set sort_order=999 where category_id=".$category_id);
					  echo $product_id.",".$category_id.",".$line[3]."<br>";*/

					  if(count($catpromap))
					  	$this->db->query("UPDATE ".DB_PREFIX."product_to_category set sort_order=".$line[3]." where product_id=".$product_id." and category_id=".$category_id);
					  else
					  	$this->db->query("INSERT into ".DB_PREFIX."product_to_category set product_id=".$product_id.", category_id=".$category_id.", sort_order=".$line[3]);

					  $prev_catid=$category_id;
					  
					}

				} else {
					$error = 1;
				}
			}
		} else {
			$error = 1;
		}
		$url = "tool/upload_data/uploadProMap&success=".$success."&error=".$error;
		$this->response->redirect($this->url->link($url, 'token=' . $this->session->data['token']));
	}

	public function uploadProMapDown(){
		error_reporting(0);
		$storagename = "product-mapping.csv";

		$rows=$this->db->query("SELECT * from ".DB_PREFIX."category_multiparent order by id")->rows;

		$catpro=array();
		foreach($rows as $row){
			$parent="";
			if($row['parent_id']!=0){
				$parent=$this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$row['parent_id']."'")->row['keyword'];
				$parent.="/";
			}

			$child=$this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$row['category_id']."'")->row['keyword'];
			$url=$parent.$child;

			if($url=="" || $url=='/') continue;

			$catpro[$row['id']]=$url;
		}

		$p2cs=$this->db->query("SELECT p2c.*, p.sku FROM ".DB_PREFIX."product_to_category p2c, ".DB_PREFIX."product p where p2c.product_id=p.product_id order by p2c.category_id,p2c.sort_order")->rows;

		$promapdata="Category ID,Category URL,Product SKU,Sort Order\r\n"; 
		foreach($p2cs as $p2c){
			$url=$catpro[$p2c['category_id']];
			$promapdata.='"'.$p2c['category_id'].'","'.$url.'","'.$p2c['sku'].'","'.$p2c['sort_order'].'"'."\r\n";

		}
		
		header('HTTP/1.1 200 OK');
		header('Cache-Control: no-cache, must-revalidate');
		header("Pragma: no-cache");
		header("Expires: 0");
		header("Content-type: text/csv");
		header("Content-Disposition: attachment; filename=$storagename");
		echo $promapdata;
		exit;
		
	}

	public function uploadProMapCatDown(){
		error_reporting(0);
		$storagename = "category-data.csv";
		$rows=$this->db->query("SELECT * from ".DB_PREFIX."category_multiparent order by id")->rows;

		$catdata="Category ID,Category Name,Category URL\r\n";
		foreach($rows as $row){
			$parent="";
			if($row['parent_id']!=0){
				$parent=$this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$row['parent_id']."'")->row['keyword'];
				$parent.="/";
			}

			$child=$this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$row['category_id']."'")->row['keyword'];
			$url=$parent.$child;
			if($url=='' || $url=='/')
				continue;

			$catdata.='"'.$row['id'].'","'.$row['title'].'","'.$url.'"'."\r\n";
		}
		
		header('HTTP/1.1 200 OK');
		header('Cache-Control: no-cache, must-revalidate');
		header("Pragma: no-cache");
		header("Expires: 0");
		header("Content-type: text/csv");
		header("Content-Disposition: attachment; filename=$storagename");
		echo $catdata;
		exit;
		
	}

	public function uploadProMapSampleDown(){
		header('HTTP/1.1 200 OK');
		header('Cache-Control: no-cache, must-revalidate');
		header("Pragma: no-cache");
		header("Expires: 0");
		header("Content-type: text/csv");
		header("Content-Disposition: attachment; filename=product_mapping.csv");
		readfile(DIR_SYSTEM. 'data/sample/product_mapping.csv');
		exit;
		
	}


	public function uploadCatmeta(){
		$data = array();
		$data['heading_title'] = "Update Category Meta & Footer Text";
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['error_warning'] = false;
		$data['success'] = false;
		if(isset($_GET['error']) && $_GET['error'] == 1){
			$data['error_warning'] = true;
		}
		if(isset($_GET['success']) && $_GET['success'] == 1){
			$data['success'] = true;
		}
		$data['action'] = $this->url->link('tool/upload_data/uploadCatmetaUp', 'token=' . $this->session->data['token'] , true);
		$data['download'] = $this->url->link('tool/upload_data/uploadCatmetaDown', 'token=' . $this->session->data['token'] , true);
		$data['downloadreport'] = $this->url->link('tool/upload_data/downloadCatmetaUp', 'token=' . $this->session->data['token'] , true);
		$this->response->setOutput($this->load->view('tool/upload_catmeta', $data));
	}

	public function downloadCatmetaUp(){
		$data = $this->db->query("SELECT * from ".DB_PREFIX."category_multiparent order by id asc")->rows;
		$all = array();
		foreach ($data as $value) {
			$url = '/';
			if($value['parent_id'] > 0){
				$d = $this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$value['parent_id']."'")->row;
				$url .= $d['keyword'].'/';
			}

			if($value['category_id'] > 0){
				$d = $this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$value['category_id']."'")->row;
				$url .= $d['keyword'];
			}
			$all[] = array(
				'url' => $url,
				'title' => $value['title'],
				'meta_title' => $value['meta_title'],
				'meta_description' => $value['meta_description'],
				'meta_keyword' => $value['meta_keyword'],
				'description' => $value['description']
			);
		}
		//echo "<pre />"; print_r($all); die();
		header('Content-Type: text/csv; charset=utf-8');
		header('Content-Disposition: attachment; filename=category_meta_footer_text_'.date("d-m-Y").'.csv');
		$output = fopen('php://output', 'w');
		fputcsv($output, array('URLs', 'H1 Tags', 'Meta Title', 'Meta Descriptions', 'Meta Keywords', 'Footer Text'));
		if (count($all) > 0) {
		    foreach ($all as $al) {
		        fputcsv($output, $al);
		    }
		}
	}

	public function uploadCatmetaUp(){
		$error = 0;
		$success = 0;
		if(isset($_FILES["file"])) {
			if ($_FILES["file"]["error"] > 0) {
				$error = 1;
			}
			else {
				$storagename = "catmeta.csv";
				if(move_uploaded_file($_FILES["file"]["tmp_name"], DIR_UPLOAD_TMP. $storagename)){
					$success = 1;

					$file = fopen(DIR_UPLOAD_TMP. $storagename, 'r');
					$skipfirst=true;
					$counter=1;
					//echo "<pre>";
					while (($line = fgetcsv($file)) !== FALSE) {
					  if($skipfirst){$skipfirst=false; continue;}
					  $cats=explode("/",$line[0]);
					  array_shift($cats);
					  if(count($cats)==2){
					  	$parent_query=$this->db->query("SELECT query from ".DB_PREFIX."url_alias where keyword='".$cats[0]."'")->row;
					  	if(!isset($parent_query['query'])) continue;
					  	$parent_id=explode("=",$parent_query['query'])[1];
					  	$child_query=$this->db->query("SELECT query from ".DB_PREFIX."url_alias where keyword='".$cats[1]."'")->row;
					  	if(!isset($child_query['query'])) continue;
					  	$child_id=explode("=",$child_query['query'])[1];
					  } else {
					  	$parent_id=0;
					  	$child_query=$this->db->query("SELECT query from ".DB_PREFIX."url_alias where keyword='".$cats[0]."'")->row;
					  	if(!isset($child_query['query'])) continue;
					  	$child_id=explode("=",$child_query['query'])[1];
					  }

					  $check=$this->db->query("select * from ".DB_PREFIX."category_multiparent where parent_id=".$parent_id." and category_id=".$child_id);
					  if(count($check->rows)==0)
					  	$this->db->query("INSERT INTO ".DB_PREFIX."category_multiparent set parent_id=".$parent_id.", category_id=".$child_id);
					  

					  //echo "select * from ".DB_PREFIX."category_multiparent where parent_id=".$parent_id." and category_id=".$child_id.";<br>";
					  if(trim($line[1])=="")
					  	$this->db->query("UPDATE ".DB_PREFIX."category_multiparent set description='".$this->db->escape($line[5])."' where parent_id=".$parent_id." and category_id=".$child_id);
					  else if(trim($line[5])!="")
					  	$this->db->query("UPDATE ".DB_PREFIX."category_multiparent set title='".$this->db->escape($line[1])."', meta_title='".$this->db->escape($line[2])."', meta_description='".$this->db->escape(utf8_encode($line[3]))."', meta_keyword='".$this->db->escape($line[4])."', description='".$this->db->escape($line[5])."' where parent_id=".$parent_id." and category_id=".$child_id);
					  else
					  	$this->db->query("UPDATE ".DB_PREFIX."category_multiparent set title='".$this->db->escape($line[1])."', meta_title='".$this->db->escape($line[2])."', meta_description='".$this->db->escape($line[3])."', meta_keyword='".$this->db->escape($line[4])."' where parent_id=".$parent_id." and category_id=".$child_id);
					}

				} else {
					$error = 1;
				}
			}
		} else {
			$error = 1;
		}
		$url = "tool/upload_data/uploadCatmeta&success=".$success."&error=".$error;
		$this->response->redirect($this->url->link($url, 'token=' . $this->session->data['token']));
	}

	public function uploadCatmetaDown(){
		header('HTTP/1.1 200 OK');
		header('Cache-Control: no-cache, must-revalidate');
		header("Pragma: no-cache");
		header("Expires: 0");
		header("Content-type: text/csv");
		header("Content-Disposition: attachment; filename=catmeta.csv");
		readfile(DIR_SYSTEM. 'data/sample/catmeta.csv');
		exit;
		
	}




	
}
?>