<?php

$dir = new RecursiveDirectoryIterator('d:/xampp-28-04/htdocs/testsite/catalog/view/theme/default/template');
$ite = new RecursiveIteratorIterator($dir);
$files = new RegexIterator($ite, '/^.+\.(tpl|twig)$/i', RecursiveRegexIterator::GET_MATCH);

$count = 0;
foreach($files as $file) {
    $path = $file[0];
    $content = file_get_contents($path);
    $originalContent = $content;

    // Pattern to match <img> tags
    $pattern = '/<img\s+([^>]+)>/i';
    
    $content = preg_replace_callback($pattern, function($matches) {
        $attrs = $matches[1];
        
        // Skip if it already has loading="lazy" or loading="eager"
        if (stripos($attrs, 'loading=') !== false) {
            return $matches[0];
        }

        // We want to add: loading="lazy" decoding="async" fetchpriority="low"
        // Let's insert it before the closing bracket
        return '<img ' . $attrs . ' loading="lazy" decoding="async" fetchpriority="low">';
    }, $content);

    if ($content !== $originalContent) {
        file_put_contents($path, $content);
        echo "Updated: " . $path . "\n";
        $count++;
    }
}

echo "Total files updated: " . $count . "\n";
