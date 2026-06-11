<?php
$directory = 'd:/xampp-28-04/htdocs/testsite';
$extensions = ['php', 'tpl', 'css', 'js', 'html'];
$pattern = '/(catalog\/view\/theme\/default\/image\/[^\s"\'<>]+?)\.(jpg|jpeg|png|gif)/i';
$replacement = '$1.webp';

function processDirectory($dir, $extensions, $pattern, $replacement) {
    $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($dir, RecursiveDirectoryIterator::SKIP_DOTS),
        RecursiveIteratorIterator::SELF_FIRST
    );
    $count = 0;
    foreach ($iterator as $file) {
        if ($file->isFile()) {
            $ext = strtolower($file->getExtension());
            if (in_array($ext, $extensions)) {
                $content = file_get_contents($file->getPathname());
                if (preg_match($pattern, $content)) {
                    $newContent = preg_replace($pattern, $replacement, $content);
                    if ($newContent !== null && $newContent !== $content) {
                        file_put_contents($file->getPathname(), $newContent);
                        echo "Updated: " . $file->getPathname() . "\n";
                        $count++;
                    }
                }
            }
        }
    }
    echo "Total files updated: $count\n";
}

echo "Starting replacement...\n";
processDirectory($directory, $extensions, $pattern, $replacement);
echo "Done.\n";
