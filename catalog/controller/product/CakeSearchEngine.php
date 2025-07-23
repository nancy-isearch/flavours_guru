<?php

class CakeSearchEngine {
    private array $products = [];
    private array $synonyms = [];
    private array $stopWords = [
        'cake', 'cakes', 'birthday', 'order', 'online', 'the', 'a',
        'and', 'for', 'of', 'to', 'buy', 'get', 'send', 'gift',
        'delivery', 'delivered', 'best', 'make', 'more',
        'with', 'your', 'my', 'by', 'shop', 'shopping', 'product'
    ];
    private float $scoreThreshold = 0.5;

    public function __construct(array $products, array $synonyms = []) {
        $this->products = $products;
        $this->synonyms = $synonyms;
    }

    public function search(string $query, int $useName, int $useDescription, int $useTags): array {
        $query = $this->normalize($query);
        $query = $this->applySynonyms($query);
        $tokens = explode(' ', $query);
        $filteredTokens = array_values(array_filter($tokens, fn($w) => !in_array($w, $this->stopWords)));

        if (empty($filteredTokens)) {
            $filteredTokens = ['cake']; // fallback token
        }

        $results = [];
        foreach ($this->products as $product) {
            $title = isset($product['title']) ? strtolower($product['title']) : '';
            $description = isset($product['description']) ? strtolower($product['description']) : '';
            $tags = '';
            if (isset($product['tags'])) {
                $tags = is_array($product['tags']) ? implode(' ', $product['tags']) : strtolower($product['tags']);
            }

            $score = 0;

            foreach ($filteredTokens as $token) {

                if($useName == 1){
                    // Title (highest weight)
                    foreach (explode(' ', $title) as $word) {
                        $levDist = levenshtein($token, $word);
                        if ($levDist == 0) $score += 10; // exact match bonus
                        elseif ($levDist <= 2) $score += 5;
                        if (soundex($token) === soundex($word)) $score += 3;
                    }
                }

                if($useTags == 1){
                    // Tags (medium-high weight)
                    foreach (explode(' ', $tags) as $word) {
                        $levDist = levenshtein($token, $word);
                        if ($levDist == 0) $score += 6;
                        elseif ($levDist <= 2) $score += 3;
                        if (soundex($token) === soundex($word)) $score += 2;
                    }
                }
                
                if($useDescription == 1){
                    // Description (lower weight)
                    foreach (explode(' ', $description) as $word) {
                        $levDist = levenshtein($token, $word);
                        if ($levDist == 0) $score += 4;
                        elseif ($levDist <= 2) $score += 2;
                        if (soundex($token) === soundex($word)) $score += 1;
                    }
                }
            }

            if ($score > 0) {
                $results[] = ['product' => $product, 'score' => $score];
            }
        }

        usort($results, fn($a, $b) => $b['score'] <=> $a['score']);
        return $results;
    }

    private function normalize(string $input): string {
        $input = mb_strtolower($input, 'UTF-8');
        $input = preg_replace('/[^\p{L}\p{N}\s]+/u', '', $input);
        $input = preg_replace('/\s+/', ' ', trim($input));
        return $input;
    }

    private function applySynonyms(string $query): string {
        foreach ($this->synonyms as $variant => $canonical) {
            $query = preg_replace("/\b{$variant}\b/i", $canonical, $query);
        }
        return $query;
    }
}
?>