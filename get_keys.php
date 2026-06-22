<?php
$cache_dir = 'd:/xampp-28-04/htdocs/testsite/system/storage/cache/home/';
$files = glob($cache_dir . '*.cache');
if ($files) {
    $c = unserialize(file_get_contents($files[0]));
    $prod = current($c['products_by_sku']);
    print_r(array_keys($prod));
} else {
    echo "No cache file found.";
}
