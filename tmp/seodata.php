<?php
/*$file = fopen('images.csv', 'r');
echo "<pre>";
while (($line = fgetcsv($file)) !== FALSE) {
  if(!file_exists("image/".$line[1]))
  	echo $line[0].'<br>';
}
fclose($file);*/

error_reporting(1);
ini_set("display_errors", 1);

$file = fopen('seo_data2.csv', 'r');
echo "<pre>";
$skipfirst=true;
while (($line = fgetcsv($file)) !== FALSE) {
  if($skipfirst){$skipfirst=false; continue;}
  //print_r(addslashes($line[3])); break;
  echo "update oc_category_multiparent set title='".addslashes($line[2])."', description='".htmlspecialchars(addslashes($line[3]))."', meta_title='".addslashes($line[4])."', meta_description='".addslashes($line[5])."', meta_keyword='".addslashes($line[6])."' where parent_id=".$line[0]." and category_id=".$line[1].";<br>";
}
