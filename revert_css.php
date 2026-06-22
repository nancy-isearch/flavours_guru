<?php

// Re-generate city_scoped.css from the original style.css
$cssPath = 'd:/xampp-28-04/htdocs/testsite/city page html/assets/css/style.css';
$css = file_get_contents($cssPath);

// Scope global selectors
$css = str_replace('*,*::before,*::after{box-sizing:border-box}', '.city-page-main *, .city-page-main *::before, .city-page-main *::after {box-sizing:border-box;}', $css);
$css = str_replace('body{', '.city-page-main {', $css);
$css = preg_replace('/html\{.*?\}/', '', $css);
$css = str_replace('img{max-width:100%;display:block}', '.city-page-main img{max-width:100%;display:block}', $css);
$css = str_replace('a{color:inherit;text-decoration:none}', '.city-page-main a{color:inherit;text-decoration:none}', $css);
$css = str_replace('ul{margin:0;padding:0;list-style:none}', '.city-page-main ul{margin:0;padding:0;list-style:none}', $css);
$css = str_replace('button{cursor:pointer}', '.city-page-main button{cursor:pointer}', $css);
$css = str_replace('h1,h2,h3{margin:0;line-height:1.15}', '.city-page-main h1, .city-page-main h2, .city-page-main h3{margin:0;line-height:1.15}', $css);

// Rename conflicting classes
$css = str_replace('.container{', '.c-container{', $css);
$css = str_replace('.container ', '.c-container ', $css);
$css = str_replace('.container.', '.c-container.', $css);

$css = str_replace('.btn{', '.c-btn{', $css);
$css = str_replace('.btn-', '.c-btn-', $css);
$css = str_replace('.btn--', '.c-btn--', $css);
$css = str_replace('.btn:', '.c-btn:', $css);
$css = str_replace('.btn.', '.c-btn.', $css);

// Fix relative image paths
$css = str_replace("url('../images/", "url('/city%20page%20html/assets/images/", $css);

// Save scoped CSS, reverting the rem/em and max-width changes
$newCssPath = 'd:/xampp-28-04/htdocs/testsite/catalog/view/theme/default/stylesheet/city_scoped.css';
file_put_contents($newCssPath, $css);

echo "Reverted CSS successfully!";
