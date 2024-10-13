<?php
class ControllerSitemapIndex extends Controller {
	public function category(){
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

		header('Content-type: application/xml');
		$output = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
  		$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

  		$output.="<url>";
			$output.="<loc>".HTTPS_SERVER."</loc>";
			$output.="<priority>1</priority>";
			$output.="<changefreq>daily</changefreq>";
		$output.="</url>";
		$priority_cat=array("birthday/gifts","birthday/flowers","birthday/cakes","birthday/chocolates","birthday/gift-hampers","anniversary/gifts","anniversary/flowers","anniversary/cakes","anniversary/gift-hampers");
  		foreach($catpro as $cat_url){
  			$output.="<url>";
  				$output.="<loc>".HTTPS_SERVER.$cat_url."</loc>";
  				$output.="<priority>".(count(explode("/",$cat_url))==1 || in_array($cat_url, $priority_cat)?0.9:0.8)."</priority>";
  				$output.="<changefreq>daily</changefreq>";
  			$output.="</url>";
  		}
  		$output.="</urlset>";

  		echo $output;
	}

	public function product(){
		error_reporting(0);
		$products=$this->db->query("SELECT product_id from ".DB_PREFIX."product where status=1 order by product_id")->rows;

		header('Content-type: application/xml');
		$output = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
  		$output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

  		foreach($products as $product){
  			$output.="<url>";
  				$output.="<loc>".$this->url->link('product/product','product_id=' . $product['product_id'])."</loc>";
  				$output.="<priority>0.5</priority>";
  				$output.="<changefreq>weekly</changefreq>";
  			$output.="</url>";
  		}
  		$output.="</urlset>";

  		echo $output;
	}

}