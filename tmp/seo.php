<?php
error_reporting(1);
ini_set("display_errors", 1);

$file = fopen('remaining.csv', 'r');
echo "<pre>";
$skipfirst=true;
while (($line = fgetcsv($file)) !== FALSE) {
  if($skipfirst){$skipfirst=false; continue;}
  echo "update oc_category_multiparent set description='".htmlspecialchars(addslashes($line[2]))."' where parent_id=".$line[0]." and category_id=".$line[1].";<br>";
}
