<?php
$file = fopen('images.csv', 'r');
echo "<pre>";
while (($line = fgetcsv($file)) !== FALSE) {
  if(!file_exists("../image/".$line[1]))
  	echo $line[0].','.$line[1].'<br>';
}
fclose($file);
