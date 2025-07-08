<?php
class ControllerCustomscriptCustomscript2 extends Controller {
	public function index(){
		echo "index";
	} 
	
	public function updateCorrectOrderedCustomerId(){
		$sql = "select order_id, telephone, payment_mobile, shipping_phone,  email, payment_email, firstname, lastname, customer_id from oc_order order by order_id desc";
		$orders=$this->db->query($sql)->rows;

		$cusSql = "SELECT customer_id, telephone, email from oc_customer";
		$customers=$this->db->query($cusSql)->rows;
		
		$allCustomersEmail = array();
		$this->load->model('account/customer');
		

		foreach ($customers as $key => $value) {
			$allCustomersEmail[strtolower(trim($value['email']))] = $value['customer_id'];
		}

		$updated = 0;
		$inserted = 0;
        $tmp = 0;
        $tmp1 = 0;
        $tmp2 = 0;
		foreach ($orders as $key => $value) {
			$orderEmail = strtolower(trim($value['email']));

			if(isset($allCustomersEmail[$orderEmail])){
				if($allCustomersEmail[$orderEmail] == $value['customer_id']){
                    $tmp1++;
                } else {
                    $sql = "UPDATE oc_order SET customer_id = '".$allCustomersEmail[$orderEmail]."' WHERE order_id = ".$value['order_id'];
			        $this->db->query($sql);
                    $tmp2++;
                    $updated++;
                }
			} else {
                $tmp++;
            }

			
			
			//$cusSql = "SELECT customer_id, telephone, email from oc_customer WHERE (telephone = '".$value['telephone']."')";

			// $cusSql = "SELECT customer_id, telephone, email from oc_customer WHERE (telephone = '".$value['telephone']."' OR telephone = '".$value['payment_mobile']."' OR email = '".$value['email']."' OR email = '".$value['payment_email']."')";
			// $customer=$this->db->query($cusSql)->row;

			// if(!$customer){
			// 	$registerData = [];
			// 	$registerData['firstname'] = $value['firstname'] ." ".$value['lastname'];
			// 	$registerData['email'] = $value['email'];
			// 	$registerData['telephone'] = $value['telephone'];
			// 	$registerData['password'] = 123456;
			// 	$customer_id = $this->model_account_customer->addCustomer($registerData, 1);	
			// 	$sql = "UPDATE oc_order SET customer_id = '".$customer_id."' WHERE order_id = ".$value['order_id'];
			// 	$this->db->query($sql);
			// 	//echo "New Customer OrderID: ".$value['order_id'].", CustomerId: ".$customer_id."<br>";
			// 	$inserted++;
			// } else {
			// 	//echo "Old Customer OrderID: ".$value['order_id'].' | CustomerId: '.$customer['customer_id'].'<br>';
			// 	$sql = "UPDATE oc_order SET customer_id = '".$customer['customer_id']."' WHERE order_id = ".$value['order_id'];
			// 	$this->db->query($sql);
			// 	$updated++;
			// }
		}
        //select email, count(email), GROUP_CONCAT(customer_id), GROUP_CONCAT(date_added) from oc_customer group by email having count(email) > 1
        // SELECT 
        // c.customer_id AS customer_table_id, 
        // c.email AS customer_table_email, 
        // c.telephone AS customer_table_telephone, 
        // o.order_id, 
        // o.email AS order_table_email, 
        // o.telephone AS order_table_telephone, 
        // o.customer_id AS order_table_customer_id 
        // FROM 
        // oc_customer c 
        // INNER JOIN oc_order o ON c.email = o.email 
        // WHERE 
        // c.customer_id != o.customer_id
        echo "temp: ".$tmp."<br> temp1: ".$tmp1."<br> temp2: ".$tmp2;
        echo "<br>";
		echo "Updated: ".$updated."<br> Inserted: ".$inserted;

	}
}
?>