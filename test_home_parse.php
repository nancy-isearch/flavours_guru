<?php
$home_html = file_get_contents('d:/xampp-28-04/htdocs/testsite/catalog/view/theme/default/template/common/home.tpl');
$home_html_clean = preg_replace('/<\?php\s*\/\*.*?\*\/\s*\?>/is', '', $home_html);
$home_html_clean = preg_replace('/<!--.*?-->/is', '', $home_html_clean);

$data = array();
libxml_use_internal_errors(true);
$dom = new DOMDocument();
$dom->loadHTML($home_html_clean);
$xpath = new DOMXPath($dom);

$q_nodes = $xpath->query('//div[contains(@class, "home-header-tab")]//ul/li/a');
foreach ($q_nodes as $node) {
	$href = $node->getAttribute('href');
	$img_node = $xpath->query('.//img', $node)->item(0);
	if (!$img_node) continue;
	$img = $img_node->getAttribute('src');
	$p_node = $xpath->query('./following-sibling::p', $node)->item(0);
	$title = $p_node ? trim(strip_tags($p_node->nodeValue)) : '';
	$data['home_quickcats'][] = array('href' => $href, 'img' => $img, 'title' => $title);
}

$b_nodes = $xpath->query('//div[contains(@class, "main-banner-slide")]//div[contains(@class, "banner-slide")]/a');
foreach ($b_nodes as $node) {
	$href = $node->getAttribute('href');
	$img_nodes = $xpath->query('.//img[contains(@class, "hidden-xs") or not(contains(@class, "visible-xs"))]', $node);
	$img = '';
	if ($img_nodes->length > 0) {
		$img = $img_nodes->item(0)->getAttribute('src');
	}
	if ($img && $href) {
		$data['home_banners'][] = array('href' => $href, 'img' => $img);
	}
}

print_r($data);
