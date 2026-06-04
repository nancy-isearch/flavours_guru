<?php
$headerFile = 'd:/xampp-28-04/htdocs/testsite/catalog/view/theme/default/template/common/header.tpl';
$content = file_get_contents($headerFile);
$content = str_replace('loading="lazy" decoding="async"', '', $content);
$content = str_replace(' fetchpriority="low"', '', $content);
file_put_contents($headerFile, $content);

$homeFile = 'd:/xampp-28-04/htdocs/testsite/catalog/view/theme/default/template/common/home.tpl';
$homeContent = file_get_contents($homeFile);
// For the hero banner
$homeContent = str_replace(
    '<img loading="lazy" decoding="async" class="img-responsive main-banner-border" src="catalog/view/theme/default/image/Home/new-images/birthday-cake-desk.webp" alt="birthday cake" fetchpriority="high" loading="eager" decoding="async">',
    '<img class="img-responsive main-banner-border" src="catalog/view/theme/default/image/Home/new-images/birthday-cake-desk.webp" alt="birthday cake" fetchpriority="high">',
    $homeContent
);
$homeContent = str_replace(
    '<img class="img-responsive main-banner-border" src="catalog/view/theme/default/image/Home/new-images/anniversary-cake-desk.webp" alt="anniversary cake" loading="lazy" decoding="async">',
    '<img class="img-responsive main-banner-border" src="catalog/view/theme/default/image/Home/new-images/anniversary-cake-desk.webp" alt="anniversary cake">',
    $homeContent
);
$homeContent = str_replace(
    '<img class="img-responsive main-banner-border" src="catalog/view/theme/default/image/Home/new-images/designer-cake-desk.webp" alt="birthday cake" loading="lazy" decoding="async">',
    '<img class="img-responsive main-banner-border" src="catalog/view/theme/default/image/Home/new-images/designer-cake-desk.webp" alt="birthday cake">',
    $homeContent
);

file_put_contents($homeFile, $homeContent);
echo "Fixed header.tpl and home.tpl hero banners.\n";
?>
