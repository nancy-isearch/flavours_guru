<?php
class ControllerCustomscriptCustomscript1 extends Controller {
	public function guestOrders(){
		$sql = "select order_id, telephone, payment_mobile, shipping_phone,  email, payment_email, firstname, lastname from oc_order where (customer_id = 0 OR customer_id is NULL OR customer_id = '') order by order_id desc LIMIT 20000";
		$orders=$this->db->query($sql)->rows;

		$cusSql = "SELECT customer_id, telephone, email from oc_customer";
		$customers=$this->db->query($cusSql)->rows;
		$allCustomers = array();
		$allCustomersEmail = array();
		$this->load->model('account/customer');
		foreach ($customers as $key => $value) {
			$allCustomers[$value['telephone']] = $value['customer_id'];
		}

		foreach ($customers as $key => $value) {
			$allCustomersEmail[$value['email']] = $value['customer_id'];
		}

		$mobileFound = array();
		$tmp = 0;
		$tmp1 = 0;
		$tmp2 = 0;
		$tmp3 = 0;
		$tmp4 = 0;
		$updated = 1;
		$inserted = 1;
		foreach ($orders as $key => $value) {
			// if($updated > 20000){
			// 	break;
			// }
			// $found = false;
			// if(isset($allCustomers[$value['telephone']])){
			// 	$tmp++;
			// 	$found = true;
			// }

			//  if(isset($allCustomers[$value['payment_mobile']])){
			// 	$tmp1++;
			// 	continue;
			// } 

			// if(!$found && isset($allCustomersEmail[$value['email']])){
			// 	$tmp2++;
			// 	$found = true;
			// }

			/* if(isset($allCustomersEmail[$value['payment_email']])){
				$tmp3++;
				continue;
			} */

			
			/* if(isset($allCustomers[$value['shipping_phone']])){
				$tmp4++;
				continue;
			} */
			
			//$cusSql = "SELECT customer_id, telephone, email from oc_customer WHERE (telephone = '".$value['telephone']."')";

			$cusSql = "SELECT customer_id, telephone, email from oc_customer WHERE (telephone = '".$value['telephone']."' OR telephone = '".$value['payment_mobile']."' OR email = '".$value['email']."' OR email = '".$value['payment_email']."')";
			$customer=$this->db->query($cusSql)->row;

			if(!$customer){
				$registerData = [];
				$registerData['firstname'] = $value['firstname'] ." ".$value['lastname'];
				$registerData['email'] = $value['email'];
				$registerData['telephone'] = $value['telephone'];
				$registerData['password'] = 123456;
				$customer_id = $this->model_account_customer->addCustomer($registerData, 1);	
				$sql = "UPDATE oc_order SET customer_id = '".$customer_id."' WHERE order_id = ".$value['order_id'];
				$this->db->query($sql);
				//echo "New Customer OrderID: ".$value['order_id'].", CustomerId: ".$customer_id."<br>";
				$inserted++;
			} else {
				//echo "Old Customer OrderID: ".$value['order_id'].' | CustomerId: '.$customer['customer_id'].'<br>';
				$sql = "UPDATE oc_order SET customer_id = '".$customer['customer_id']."' WHERE order_id = ".$value['order_id'];
				$this->db->query($sql);
				$updated++;
			}
		}
		echo "Updated: ".$updated."<br> Inserted: ".$inserted;
		// echo "Total Guest Orders: ".count($orders)."<br>";
		// echo "Customer Found from telephone: ".$tmp."<br>";
		// echo "Customer Found from payment_mobile: ".$tmp1."<br>";
		// echo "Customer Found from email: ".$tmp2."<br>";
		// echo "Customer Found from payment_email: ".$tmp3."<br>";
		// echo "Remaining Guest Orders: ".(count($orders) - $tmp - $tmp1 - $tmp2 - $tmp3)."<br>"."<br>";

		// echo "Customer Found from shipping_phone: ".$tmp4."<br>";
	}
}
?>