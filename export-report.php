<?php
set_time_limit(0); // Allow script to run indefinitely
ini_set("memory_limit","-1"); // Set memory limit to unlimited
// Database credentials
$host = "localhost"; 
$user = "npffwsymrc"; 
$pass = "mqJ5gVeBQ4"; 
$db   = "npffwsymrc"; 

// Create DB connection
$mysqli = new mysqli("localhost", $user, $pass, $db);
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Step 1: Get all customers
$customers = $mysqli->query("SELECT customer_id, firstname, lastname, email FROM oc_customer order by customer_id");

// Open CSV file
$fp = fopen("customer_orders.csv", "w");
fputcsv($fp, ["Customer ID", "Name", "Email", "Total Orders", "Total Amount", "Last Order Date"]);

// Step 2: For each customer, fetch order summary
while ($cust = $customers->fetch_assoc()) {
    $cid = (int)$cust['customer_id'];
    echo "Processing customer ID: $cid\n";
    $sql = "
        SELECT COUNT(*) as total_orders,
               SUM(total) as total_amount,
               MAX(date_added) as last_order
        FROM oc_order
        WHERE customer_id = $cid
    ";
    $result = $mysqli->query($sql)->fetch_assoc();

    fputcsv($fp, [
        $cid,
        $cust['firstname'] . " " . $cust['lastname'],
        $cust['email'],
        $result['total_orders'] ?? 0,
        $result['total_amount'] ?? 0,
        $result['last_order'] ?? ''
    ]);
}

fclose($fp);
echo "Export completed successfully!";