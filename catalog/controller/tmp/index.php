<?php
class ControllerTmpIndex extends Controller {

	public function indexold(){
		/*$file = fopen('/var/www/html/tmp/product_to_category_new.csv', 'r');
		echo "<pre>";
		$skipfirst=true;
		$counter=1;
		while (($line = fgetcsv($file)) !== FALSE) {
		  if($skipfirst){$skipfirst=false; continue;}
		  //print_r($line);
		  $rows=$this->db->query("SELECT * from oc_product_to_category where category_id=".$line[0]." and product_id=".$line[1])->rows;
		  if(count($rows)){
			$this->db->query("UPDATE oc_product_to_category set sort_order=".$line[2]." where category_id=".$line[0]." and product_id=".$line[1]);
		  } else {
		  	$this->db->query("INSERT into oc_product_to_category set product_id=".$line[1].", category_id=".$line[0].", sort_order=".$line[2]);
		  }

		  
		}

		echo 'done';*/

	}

	public function index(){
		$rows=$this->db->query("SELECT * from ".DB_PREFIX."category_multiparent order by id")->rows;

		echo "<table><tr><th>ID</th><th>Parent</th><th>Category</th><th>Title</th><th>URL</th></tr>";
		foreach($rows as $row){
			$parent="";
			if($row['parent_id']!=0){
				$parent=$this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$row['parent_id']."'")->row['keyword'];
				$parent.="/";
			}

			$child=$this->db->query("SELECT keyword from ".DB_PREFIX."url_alias where query='category_id=".$row['category_id']."'")->row['keyword'];
			$url=$parent.$child;

			echo "<tr>";
			echo "<td>".$row['id']."</td>";
			echo "<td>".$row['parent_id']."</td>";
			echo "<td>".$row['category_id']."</td>";
			echo "<td>".$row['title']."</td>";
			echo "<td>".$url."</td>";
			echo "</tr>";
		}

		echo "</table>";
	}

	public function catpro(){

		error_reporting(0);

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

		echo "<table><tr><th>Category ID</th><th>URL</th><th>SKU</th><th>Sort Order</th></tr>"; 
		foreach($p2cs as $p2c){
			$url=$catpro[$p2c['category_id']];
			echo "<tr>";
			echo "<td>".$p2c['category_id']."</td>";
			echo "<td>".$url."</td>";
			echo "<td>".$p2c['sku']."</td>";
			echo "<td>".$p2c['sort_order']."</td>";
			echo "</tr>";


		}

		echo "</table>";


	}


	public function productmap(){
		$file = fopen('/var/www/html/tmp/product_mapping_25aug.csv', 'r');
		$skipfirst=true;
		$counter=1;

		$rows=$this->db->query("SELECT product_id, sku from ".DB_PREFIX."product")->rows;
		$products=array();
		foreach($rows as $row)
			$products[$row['sku']]=$row['product_id'];

		$prev_catid=0;
		while (($line = fgetcsv($file)) !== FALSE) {
		  if($skipfirst){$skipfirst=false; continue;}
		  
		  $category_id=$line[0];
		  if(isset($products[$line[2]]))
		  	$product_id=$products[$line[2]];
		  else
		  	continue;
		  $catpromap=$this->db->query("SELECT * from ".DB_PREFIX."product_to_category where product_id=".$product_id." and category_id=".$category_id)->rows;

		  if($prev_catid!=$category_id)
		  	$this->db->query("UPDATE ".DB_PREFIX."product_to_category set sort_order=999 where category_id=".$category_id);
		  echo $product_id.",".$category_id.",".$line[3]."<br>";
		  if(count($catpromap))
		  	$this->db->query("UPDATE ".DB_PREFIX."product_to_category set sort_order=".$line[3]." where product_id=".$product_id." and category_id=".$category_id);
		  else
		  	$this->db->query("INSERT into ".DB_PREFIX."product_to_category set product_id=".$product_id.", category_id=".$category_id.", sort_order=".$line[3]);

		  $prev_catid=$category_id;
		  
		}

		echo 'done';
	}

	public function updatecatmeta()
	{
		$file = fopen('/var/www/html/tmp/catmeta_25aug.csv', 'r');
		$skipfirst=true;
		$counter=1;
		echo "<pre>";
		while (($line = fgetcsv($file)) !== FALSE) {
		  if($skipfirst){$skipfirst=false; continue;}
		  $cats=explode("/",$line[0]);
		  //echo $line[0]."<br>";
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

		  /*if($parent_id!=248 || $child_id!=82)
		  	continue;*/

		  echo $parent_id.",".$child_id." => ";
		  $check=$this->db->query("select * from ".DB_PREFIX."category_multiparent where parent_id=".$parent_id." and category_id=".$child_id);
		  if(count($check->rows))
		  	echo "Exist<br>";
		  else{
		  	echo "Created<br>";
		  	$this->db->query("INSERT INTO ".DB_PREFIX."category_multiparent set parent_id=".$parent_id.", category_id=".$child_id);
		  }
		  	

		  if(trim($line[1])=="")
		  	$this->db->query("UPDATE ".DB_PREFIX."category_multiparent set description='".$this->db->escape($line[5])."' where parent_id=".$parent_id." and category_id=".$child_id);
		  else if(trim($line[5])!="")
		  	$this->db->query("UPDATE ".DB_PREFIX."category_multiparent set title='".$this->db->escape($line[1])."', meta_title='".$this->db->escape($line[2])."', meta_description='".$this->db->escape(utf8_encode($line[3]))."', meta_keyword='".$this->db->escape($line[4])."', description='".$this->db->escape($line[5])."' where parent_id=".$parent_id." and category_id=".$child_id);
		  else
		  	$this->db->query("UPDATE ".DB_PREFIX."category_multiparent set title='".$this->db->escape($line[1])."', meta_title='".$this->db->escape($line[2])."', meta_description='".$this->db->escape($line[3])."', meta_keyword='".$this->db->escape($line[4])."' where parent_id=".$parent_id." and category_id=".$child_id);
		  
		  //break;
		}
	}

	public function showurlid()
	{
		$file = fopen('/var/www/html/tmp/file/newurl.csv', 'r');
		$skipfirst=true;
		$counter=1;
		echo "<pre>";
		while (($line = fgetcsv($file)) !== FALSE) {
		  //if($line[0]!='/birthday/heart-shaped-cakes') continue;
		  $cats=explode("/",$line[0]);
		  array_shift($cats);

		  if(count($cats)==2){
		  	$parent_query=$this->db->query("SELECT query from ".DB_PREFIX."url_alias where keyword='".$cats[0]."'")->row;
		  	if(!isset($parent_query['query']))
		  		$parent_id=-1;
		  	else
		  		$parent_id=explode("=",$parent_query['query'])[1];

		  	$child_query=$this->db->query("SELECT query from ".DB_PREFIX."url_alias where keyword='".$cats[1]."'")->row;
		  	if(!isset($child_query['query']))
		  		$child_id=-1;
		  	else
		  		$child_id=explode("=",$child_query['query'])[1];
		  } else {
		  	$parent_id=0;
		  	$child_query=$this->db->query("SELECT query from ".DB_PREFIX."url_alias where keyword='".$cats[0]."'")->row;
		  	if(!isset($child_query['query']))
		  		$child_id=-1;
		  	else
		  		$child_id=explode("=",$child_query['query'])[1];
		  }

		  //if($child_id!=-1) continue;

		  //echo end($cats)/*$line[0]*/."=>".$parent_id.",".$child_id."<br>";
		  //echo ucwords(implode(" ",explode("-",end($cats))))."<br>";
		  //echo end($cats)."<br>";
		  $this->db->query("INSERT INTO ".DB_PREFIX."category_multiparent set parent_id=".$parent_id.", category_id=".$child_id);
		}

	}



	public function updateProCsv(){
		$file = fopen('/var/www/html/tmp/file/cake_mapping_corrected.csv', 'r');
		$skipfirst=true;
		$counter=1;
		echo "<pre>";
		$i = 0;
		while (($line = fgetcsv($file)) !== FALSE) {
			echo "<pre />"; print_r($line);
			$pro_id = $this->db->query("SELECT product_id from ".DB_PREFIX."product where sku='".$line[0]."'")->row;

			if(isset($pro_id['product_id'])){
				$this->db->query("UPDATE `oc_product` SET `mpn` = '".$line[2]."', `location` = '".$line[3]."' WHERE `oc_product`.`product_id` = '".$pro_id['product_id']."'");

				$this->db->query("UPDATE `oc_product_description` SET `description` = '".$line[4]."' WHERE `oc_product_description`.`product_id` = '".$pro_id['product_id']."'");
			} 
		}
	}

	public function updateprodesc(){
		$file = fopen('/var/www/html/tmp/pd.csv', 'r');
		$skipfirst=true;
		echo "<pre>";
		$i = 0;
		while (($line = fgetcsv($file)) !== FALSE) {
			if($skipfirst){$skipfirst=false; continue;}
			echo "UPDATE `oc_product_description` SET `description` = '".$this->db->escape($line[1])."' WHERE `oc_product_description`.`product_id` in (SELECT product_id from oc_product where sku ='".$this->db->escape($line[0])."') <br>";
			$this->db->query("UPDATE `oc_product_description` SET `description` = '".$this->db->escape($line[1])."' WHERE `oc_product_description`.`product_id` in (SELECT product_id from oc_product where sku ='".$this->db->escape($line[0])."') ");
			//break;
		}
	}

	public function addCities(){
		$file = fopen('/var/www/html/tmp/file/cities.csv', 'r');
		$skipfirst=true;
		$counter=1;
		echo "<pre>";
		$i = 0;
		while (($line = fgetcsv($file)) !== FALSE) {
			
			$this->db->query("INSERT INTO `oc_shipping_cities` (`id`, `name`, `country`, `state`, `pincode`, `status`) VALUES (NULL, '".$line[0]."', '223', '0', '0', '1')");
			$cityId = $this->db->getLastId();

			$this->db->query("INSERT INTO `oc_shipping_citygrp_to_city` (`id`, `city_id`, `city_grp_id`) VALUES (NULL, '".$cityId."', '11')");

			echo "<br>".$i++;
			
		}
	}


	public function updateFooterText(){
		$file = fopen('/var/www/html/tmp/file/footer_text.csv', 'r');
		$skipfirst=true;
		$counter=1;
		echo "<pre>";
		$i = 0;
		while (($line = fgetcsv($file)) !== FALSE) {
			
			$this->db->query("UPDATE ".DB_PREFIX."category_multiparent set description='".$this->db->escape($line[1])."' where 	id='".$this->db->escape($line[0])."'");
			echo $i."<br>";
			$i++;
		}
	}

	public function updateCakeVariants(){
		$file = fopen('/var/www/html/tmp/file/cake_variants.csv', 'r');
		$skipfirst=true;
		$counter=1;
		echo "<pre>";
		$i = 0;
		while (($line = fgetcsv($file)) !== FALSE) {
			$this->db->query("UPDATE `oc_product` SET `mpn` = '".$line[2]."', `location` = '".$line[3]."' WHERE `oc_product`.`product_id` = '".$line[0]."'");
			$i++;
		}

		echo $i;
	}
	

}