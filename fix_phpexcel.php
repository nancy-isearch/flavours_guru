<?php

$dir = 'D:\xampp-21-07\htdocs\testsite\system\PHPExcel\Classes';

function fixCurlyBraces($path) {
    $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($path, RecursiveDirectoryIterator::SKIP_DOTS)
    );

    foreach ($iterator as $file) {
        if ($file->getExtension() === 'php') {
            $content = file_get_contents($file->getPathname());
            
            // Regex to find $variable{offset} and replace with $variable[offset]
            $newContent = preg_replace('/\$([a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*)\{([^}]+)\}/', '\$$1[$2]', $content);
            
            if ($newContent !== null && $newContent !== $content) {
                file_put_contents($file->getPathname(), $newContent);
                echo "Fixed: " . $file->getPathname() . "\n";
            }
        }
    }
}

fixCurlyBraces($dir);
echo "Done!\n";
