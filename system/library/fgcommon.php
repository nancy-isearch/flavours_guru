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

    public function assignVendor($order_id){
        $sql = "select p.shipping_info, o.order_id from oc_order o inner join oc_order_product p on o.order_id = p.order_id where o.order_id = " . $order_id . " and o.vendor_id = 0 and CHAR_LENGTH(p.shipping_info) > 20";
		$orders=$this->db->query($sql)->rows;

        $file=fopen(DIR_SYSTEM.'data/pin-vendor.csv', 'r');
		$pins = array();
		$tmp = true;
		while (($line = fgetcsv($file)) !== FALSE) {
			if($tmp){
				$tmp = false;
				continue;
			}
			$pins[$line[0]] = $line[1];
		}
        
        foreach ($orders as $order) {
			$shipInfo = (array)json_decode($order['shipping_info']); 
			if($shipInfo && isset($shipInfo['Pincode'])){
				$pincode = $shipInfo['Pincode'];
				$vendor_id = $pins[$pincode];
				$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = 14, vendor_id = '" . (int)$vendor_id . "' WHERE order_id = '" . (int)$order['order_id'] . "'");
				$vendorDetail = $this->db->query("SELECT * FROM oc_user WHERE user_id = '".$vendor_id."'")->row;

				if(!empty($vendorDetail['phone'])){
					$vendorMsg = "Dear Partner, A new order ".$order['order_id']." is allocated for delivery on ".$shipInfo['Shipping Date'].". check your panel for details. Team www.flavoursguru.com";
					$path = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=NUdMWd6QgkeeTMHfWiPQlQ&senderid=FLGURU&channel=Trans&DCS=0&flashsms=0&number=91".$vendorDetail['phone']."&text=".urlencode($vendorMsg)."&route=1";
					$ch = curl_init($path);
					curl_setopt($ch, CURLOPT_HEADER, 0);
					curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
					$rlt = curl_exec($ch);
					curl_close($ch);
				}
			}
		}
    }
}
