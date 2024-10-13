<?php
class ModelHcategoryCategory extends Model {

	public function get_first_cat_data(){

	$result = $this->db->query("SELECT ocp.product_id ,ocp.image, ocp.price , ocpd.name, ocd.name as catname , ocd.category_id FROM ".DB_PREFIX."product as ocp INNER JOIN ".DB_PREFIX."product_description as ocpd ON ocpd.product_id = ocp.product_id INNER JOIN ".DB_PREFIX."product_to_category as ocptc ON ocp.product_id = ocptc.product_id JOIN oc_category_description ocd ON ocd.category_id=ocptc.category_id WHERE ocptc.category_id=250 LIMIT 4");

		echo "SELECT ocp.product_id ,ocp.image, ocp.price , ocpd.name, ocd.name as catname , ocd.category_id FROM ".DB_PREFIX."product as ocp INNER JOIN ".DB_PREFIX."product_description as ocpd ON ocpd.product_id = ocp.product_id INNER JOIN ".DB_PREFIX."product_to_category as ocptc ON ocp.product_id = ocptc.product_id JOIN oc_category_description ocd ON ocd.category_id=ocptc.category_id WHERE ocptc.category_id=250 LIMIT 4"; die();

		return $result->rows;
	}

	public function get_second_cat_data(){

		$result = $this->db->query("SELECT ocp.product_id ,ocp.image, ocp.price , ocpd.name, ocd.name as catname , ocd.category_id  FROM ".DB_PREFIX."product as ocp INNER JOIN ".DB_PREFIX."product_description as ocpd ON ocpd.product_id = ocp.product_id INNER JOIN ".DB_PREFIX."product_to_category as ocptc ON ocp.product_id = ocptc.product_id JOIN oc_category_description ocd ON ocd.category_id=ocptc.category_id WHERE ocptc.category_id=160 LIMIT 4");

		return $result->rows;
	}

	public function get_third_cat_data(){

		$result = $this->db->query("SELECT  ocp.product_id ,ocp.image, ocp.price , ocpd.name, ocd.name as catname ,ocd.category_id FROM  ".DB_PREFIX."product as ocp INNER JOIN ".DB_PREFIX."product_description as ocpd ON ocpd.product_id = ocp.product_id INNER JOIN ".DB_PREFIX."product_to_category as ocptc ON ocp.product_id = ocptc.product_id JOIN oc_category_description ocd ON ocd.category_id=ocptc.category_id WHERE ocptc.category_id=161 LIMIT 4");

		return $result->rows;
	}

	public function get_fourth_cat_data(){

		$result = $this->db->query("SELECT  ocp.product_id ,ocp.image, ocp.price , ocpd.name, ocd.name as catname ,ocd.category_id FROM ".DB_PREFIX."product as ocp INNER JOIN ".DB_PREFIX."product_description as ocpd ON ocpd.product_id = ocp.product_id INNER JOIN ".DB_PREFIX."product_to_category as ocptc ON ocp.product_id = ocptc.product_id JOIN oc_category_description ocd ON ocd.category_id=ocptc.category_id WHERE ocptc.category_id=162 LIMIT 4");

		return $result->rows;
	}

	public function get_fifth_cat_data(){

		$result = $this->db->query("SELECT  ocp.product_id ,ocp.image, ocp.price , ocpd.name, ocd.name as catname , ocd.category_id FROM ".DB_PREFIX."product as ocp INNER JOIN ".DB_PREFIX."product_description as ocpd ON ocpd.product_id = ocp.product_id INNER JOIN ".DB_PREFIX."product_to_category as ocptc ON ocp.product_id = ocptc.product_id JOIN oc_category_description ocd ON ocd.category_id=ocptc.category_id WHERE ocptc.category_id=163 LIMIT 4");

		return $result->rows;
	}

	public function get_cat_data($category_id){
		$result=$this->db->query("SELECT p.product_id, p.image, p.price, pd.name, cd.name as catname, cd.category_id from ".DB_PREFIX."product p, ".DB_PREFIX."product_description pd, ".DB_PREFIX."product_to_category p2c, ".DB_PREFIX."category_description cd, ".DB_PREFIX."category_multiparent cm where p.product_id=pd.product_id and p.product_id=p2c.product_id and p2c.category_id=cm.id and cm.category_id=cd.category_id AND cd.category_id=".$category_id." limit 4");
		return $result->rows;
	}
	

}
