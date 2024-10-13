
<?php
class ControllerextensionpaymentZaakpay extends Controller {
	public function index() {

	$this->load->language('extension/payment/Zaakpay');
    	$data['button_confirm'] = $this->language->get('button_confirm');
		$data['button_back'] = $this->language->get('button_back');		
	
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
    		$data['action'] = 'http://zaakpaystaging.centralindia.cloudapp.azure.com:8080/api/paymentTransact/V7';
		$data['merchantIdentifier'] = $this->config->get('Zaakpay_merchantIdentifier');
		$secret_key = $this->config->get('Zaakpay_secret_key');
				$merchantIdentifier = $this->config->get('Zaakpay_merchantIdentifier');
						$ip=$_SERVER['REMOTE_ADDR'];
   			$merchantIpAddress = $ip;
		$data['secret_key'] = $this->config->get('Zaakpay_secret_key');
		$data['orderId']= $this->session->data['order_id']; 
		 $orderId = $data['orderId'];		
		 $data['returnUrl']= HTTPS_SERVER . 'index.php?route=common/response';
		 $returnUrl= HTTPS_SERVER . 'index.php?route=common/response';
		
		$data['buyerEmail']  	= $order_info['email'];
		$buyerEmail = $order_info['email'];
		$data['buyerFirstName']     = $order_info['payment_firstname'];
		$buyerFirstName = $order_info['payment_firstname'];

 $data['buyerLastName']     = $order_info['payment_lastname'];
				$buyerLastName = $order_info['payment_lastname'];

 $data['buyerAddress'] 	= $order_info['payment_address_1'];
				$buyerAddress = $order_info['payment_address_1'];

$data['buyerCity']    	= $order_info['payment_city'];
				$buyerCity = $order_info['payment_city'];
$data['buyerState'] 	= $order_info['payment_zone'];
				$buyerState = $order_info['payment_zone'];
				$buyerCountry = $order_info['payment_country'];
				$buyerPincode = $order_info['payment_postcode'];
				$buyerPhoneNumber = $order_info['telephone'];
						if($this->config->get('Zaakpay_test') == "on")
						{			
						$mode='0';
						}
						else
						{			
						$mode='1';
						}
$data['buyerCountry']   = $order_info['payment_country'];
		$data['buyerPincode']= $order_info['payment_postcode'];
$data['buyerPhoneNumber'] 	= $order_info['telephone'];
$data['txnType'] 	= "1";
$data['zpPayOption'] 	= "1";
		if($this->config->get('Zaakpay_test') == "on")
			$data['mode']    			= '0';
		else
			$data['mode']    			= '1';	
$data['currency'] 	= "INR";
$data['amount'] = (int) $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false) * 100;
$data['merchantIpAddress'] = $ip;
$data['purpose'] 	= "1";
$data['productDescription']	=   $this->session->data['payment_method']['title'];
		$txnDate=date('Y-m-d');			
		$data['txnDate'] 	= date('Y-m-d');
			$amount=	(int) $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false) * 100;
			$txnType='1';
			$zpPayOption='1';
			$currency="INR";
			$purpose="1";
			$productDescription=$this->session->data['payment_method']['title'];
	/*		
if(isset($this->session->data['shipping_address_id'])){
			$shipping_address_id = $this->session->data['shipping_address_id'];	
			$shipping_address = $this->model_account_address->getAddress($shipping_address_id);
			
			$data['ShipToAddress']	= $shipping_address['address_1'].",".$shipping_address['address_2'];
			$data['ShipToCity']  	= $shipping_address['city'];
			$data['ShipToState']  	= $shipping_address['zone'];
			$data['ShipToCountry']   	= $shipping_address['country_id'];//Iso 3 char code is supported
			$data['ShipToPincode'] = $shipping_address['postcode'];
			$data['ShipToPhoneNumber']   	= $order_info['telephone'];
			$data['ShipToFirstname']	= $shipping_address['firstname'];
			$data['ShipToLastname']	= $shipping_address['lastname'];
		}
		else{
		$data['ShipToAddress']	= $order_info['payment_address_1'].",".$order_info['payment_address_2'];
			$data['ShipToCity']  	= $order_info['payment_city'];
			$data['ShipToState']  	= $order_info['payment_zone'];
			$data['ShipToCountry']   	=  $order_info['payment_country_id'];//Iso 3 char code is supported
			$data['ShipToPincode'] = $order_info['payment_postcode'];
			$data['ShipToPhoneNumber']   	=  $order_info['telephone'];
			$data['ShipToFirstname']	= $order_info['payment_firstname'];
			$data['ShipToLastname']	= $order_info['payment_lastname'];
		}
		
		
				//$product1Description = '';
				//$product2Description = '';
				//$product3Description = '';
				//$product4Description = '';
				

			if(isset($this->session->data['shipping_address_id'])){
			$shipping_address_id = $this->session->data['shipping_address_id'];	
			$shipping_address = $this->model_account_address->getAddress($shipping_address_id);
			$ShipToAddress =$shipping_address['address_1'].",".$shipping_address['address_2'];
				$ShipToCity = $shipping_address['city'];
				$ShipToState = $shipping_address['zone'];
				$ShipToCountry = $shipping_address['country'];
				$ShipToPincode = $shipping_address['postcode'];
				$ShipToPhoneNumber = $order_info['telephone'];
				$ShipToFirstname = 	$shipping_address['firstname'];
				$ShipToLastname = $shipping_address['lastname'];
		}
		else{

		$ShipToAddress	= $order_info['payment_address_1'].",".$order_info['payment_address_2'];
			$ShipToCity  	= $order_info['payment_city'];
			$ShipToState  	= $order_info['payment_zone'];
			$ShipToCountry   	=  $order_info['payment_country'];//Iso 3 char code is supported
			$ShipToPincode = $order_info['payment_postcode'];
			$ShipToPhoneNumber   	=  $order_info['telephone'];
			$ShipToFirstname	= $order_info['payment_firstname'];
			$ShipToLastname	= $order_info['payment_lastname'];
		}
			
*/

			$post_variables = Array(
"amount" => $amount, //Amount should be in paisa
"buyerAddress" => $buyerAddress,
"buyerCity" => $buyerCity,
"buyerCountry" => $buyerCountry,
"buyerEmail" => $buyerEmail,
"buyerFirstName" => $buyerFirstName,
"buyerLastName" => $buyerLastName,
"buyerPhoneNumber" => $buyerPhoneNumber,
"buyerPincode" => $buyerPincode,
"buyerState" => $buyerState,
"currency" => $currency,
"merchantIdentifier" => $merchantIdentifier,
"merchantIpAddress" => $merchantIpAddress,
"mode" => $mode,
"orderId" => $orderId,
"productDescription" => $productDescription,
"purpose" => $purpose,
"returnUrl" => $returnUrl,
"txnDate" => $txnDate,
"txnType" => $txnType,
"zpPayOption" => $zpPayOption);




/*


"ShipToState" => $ShipToState,
"ShipToAddress" => $ShipToAddress,
"ShipToCity" => $ShipToCity,
"ShipToCountry" => $ShipToCountry,

"ShipToPincode" => $ShipToPincode,
"ShipToPhoneNumber" => $ShipToPhoneNumber,
"ShipToFirstname" => $ShipToFirstname,
"ShipToLastname" => $ShipToLastname,
*/



$all = '';
foreach($post_variables as $name => $value) {

if($name !='button_confirm') 
	{
		if($name !='button_back') 
		{
			 if($name != 'action') 
			{
				 if($name != 'secret_key') 
				  { 
					if($name != 'checksum') 
					{
						if($value!=''){
						$all.=$name;
						$all.="=";		
						if ($name == 'returnUrl') 
						{
							$all .= ControllerextensionpaymentZaakpay::sanitizedURL($value);
						}
 						else 
						{
							$all .= ControllerextensionpaymentZaakpay::sanitizedParamFn($value);
						}
						$all .= "&";
						}
					}
				   }
			}
		}
	}
}

foreach($data as $name => $value) {
if($name !='button_confirm') { if($name !='button_back') { if($name != 'action') { if($name != 'secret_key') { if($name != 'checksum') {
if($name == 'returnUrl') {
$data[$name]= ControllerextensionpaymentZaakpay::sanitizedURL($value);
} else {
$data[$name]= ControllerextensionpaymentZaakpay::sanitizedParamFn($value);
}}}}}}}


if($this->config->get('Zaakpay_log') == "on")
	{			
		error_log("AllParams : ".$all);
		error_log("Secret Key : ".$secret_key);
	}
	
	$checksum = ControllerextensionpaymentZaakpay::calculateChecksum($secret_key, $all);
	$data['checksum']      	= $checksum;
	

 
	
		$this->id = 'payment';
		return $this->load->view('extension/payment/Zaakpay', $data);
		
		
		
	}
	
	function calculateChecksum($secret_key, $all) {
		$hash = hash_hmac('sha256', $all , $secret_key);
		$checksum = $hash;
		return $checksum;
	}



	function verifyChecksum($checksum, $all, $secret_key) {
		$cal_checksum = ControllerextensionpaymentZaakpay::calculateChecksum($secret_key, $all);
		$bool = 0;
		if($checksum == $cal_checksum)	{
			$bool = 1;
		}

		return $bool;
	}

	function sanitizedParamFn($param) {
		$pattern[0] = "%,%";
	        $pattern[1] = "%#%";
	        $pattern[2] = "%\(%";
       		$pattern[3] = "%\)%";
	        $pattern[4] = "%\{%";
	        $pattern[5] = "%\}%";
	        $pattern[6] = "%<%";
	        $pattern[7] = "%>%";
	        $pattern[8] = "%`%";
	        $pattern[9] = "%!%";
	        $pattern[10] = "%\\$%";
	        $pattern[11] = "%\%%";
	        $pattern[12] = "%\^%";
	        $pattern[13] = "%=%";
	        $pattern[14] = "%\+%";
	        $pattern[15] = "%\|%";
	        $pattern[16] = "%\\\%";
	        $pattern[17] = "%:%";
	        $pattern[18] = "%'%";
	        $pattern[19] = "%\"%";
	        $pattern[20] = "%;%";
	        $pattern[21] = "%~%";
	        $pattern[22] = "%\[%";
	        $pattern[23] = "%\]%";
	        $pattern[24] = "%\*%";
	        $pattern[25] = "%&%";
        	$sanitizedParam = preg_replace($pattern, "", $param);
		return $sanitizedParam;
	}

	function sanitizedURL($param) {
		$pattern[0] = "%,%";
	        $pattern[1] = "%\(%";
       		$pattern[2] = "%\)%";
	        $pattern[3] = "%\{%";
	        $pattern[4] = "%\}%";
	        $pattern[5] = "%<%";
	        $pattern[6] = "%>%";
	        $pattern[7] = "%`%";
	        $pattern[8] = "%!%";
	        $pattern[9] = "%\\$%";
	        $pattern[10] = "%\%%";
	        $pattern[11] = "%\^%";
	        $pattern[12] = "%\+%";
	        $pattern[13] = "%\|%";
	        $pattern[14] = "%\\\%";
	        $pattern[15] = "%'%";
	        $pattern[16] = "%\"%";
	        $pattern[17] = "%;%";
	        $pattern[18] = "%~%";
	        $pattern[19] = "%\[%";
	        $pattern[20] = "%\]%";
	        $pattern[21] = "%\*%";
        	$sanitizedParam = preg_replace($pattern, "", $param);
		return $sanitizedParam;
	}
}
?>

