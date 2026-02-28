<?php
// e:\project\git\flavoursguru.com\system\library\fgcommon.php
class Fgcommon {
    protected $db;

    public function __construct($registry) {
        $this->db = $registry->get('db');
    }

    // Example generic function usable everywhere
    public function slugify($text) {
        $text = html_entity_decode($text, ENT_QUOTES, 'UTF-8');
        $text = strtolower(trim($text));
        $text = preg_replace('/[^a-z0-9]+/i', '-', $text);
        return trim($text, '-');
    }

    // Example with DB usage (optional)
    public function getSettingValue($key) {
        $query = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = '" . $this->db->escape($key) . "' LIMIT 1");
        return $query->num_rows ? $query->row['value'] : null;
    }
}
