<?php
require_once('config.php');
$db = new mysqli(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($db->connect_error) {
    die("Connection failed: " . $db->connect_error);
}

$sql = "CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "blog_cards (
    blog_id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    feature_image VARCHAR(255) DEFAULT NULL,
    author VARCHAR(100) NOT NULL,
    publish_date DATE NOT NULL,
    blog_link VARCHAR(255) NOT NULL,
    display_page VARCHAR(100) NOT NULL,
    status TINYINT(1) NOT NULL DEFAULT 1,
    sort_order INT(3) NOT NULL DEFAULT 0,
    PRIMARY KEY (blog_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";

if ($db->query($sql) === TRUE) {
    echo "Table created successfully\n";

    // Add permissions to top administrator (user_group_id = 1)
    $query = $db->query("SELECT permission FROM " . DB_PREFIX . "user_group WHERE user_group_id = 1");
    if ($query->num_rows > 0) {
        $row = $query->fetch_assoc();
        $permissions = json_decode($row['permission'], true);
        if (!in_array('catalog/blog_card', $permissions['access'])) {
            $permissions['access'][] = 'catalog/blog_card';
            $permissions['modify'][] = 'catalog/blog_card';
            $new_perm = json_encode($permissions);
            $db->query("UPDATE " . DB_PREFIX . "user_group SET permission = '" . $db->real_escape_string($new_perm) . "' WHERE user_group_id = 1");
            echo "Permissions added successfully\n";
        } else {
            echo "Permissions already exist\n";
        }
    }
} else {
    echo "Error creating table: " . $db->error;
}
$db->close();
?>
