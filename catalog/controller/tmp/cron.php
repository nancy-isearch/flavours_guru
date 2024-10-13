<?php
class ControllerTmpCron extends Controller {
	public function index(){

	}

	public function checkPayUStatus(){
		
		$this->load->model('checkout/order');
		$totalOrders = $this->db->query("SELECT order_id, currency_code, custom_field as txnId FROM `oc_order` WHERE payment_code = 'payu' AND order_status_id in (0,1) AND date(date_added) = CURRENT_DATE ORDER BY order_id DESC");
		$payu_currencies = array($this->config->get('payu_currency1'), $this->config->get('payu_currency2'),$this->config->get('payu_currency3'),$this->config->get('payu_currency4'),$this->config->get('payu_currency5'),$this->config->get('payu_currency6'));

		foreach ($totalOrders->rows as $total) {
			foreach ($payu_currencies as $index => $value) {
	        	if($value == $total['currency_code']){        	
	        	  $key = $this->config->get('payu_merchantid'.($index+1));        		
	        	  $salt = $this->config->get('payu_salt'.($index+1));
	        	}
        	}

			$key = $key;
			$salt = $salt;
			$command = "verify_payment";
			$var1 = explode(",", $total['txnId']);
			$var1 = $var1[1]; // Transaction ID


			$hash_str = $key  . '|' . $command . '|' . $var1 . '|' . $salt ;
			$hash = strtolower(hash('sha512', $hash_str));

			$r = array('key' => $key , 'hash' =>$hash , 'var1' => $var1, 'command' => $command);
			$hash;

			$qs= http_build_query($r);
			//$wsUrl = "https://test.payu.in/merchant/postservice.php?form=1";
			$wsUrl = "https://info.payu.in/merchant/postservice?form=2";
			$c = curl_init();
			curl_setopt($c, CURLOPT_URL, $wsUrl);
			curl_setopt($c, CURLOPT_POST, 1);
			curl_setopt($c, CURLOPT_POSTFIELDS, $qs);
			curl_setopt($c, CURLOPT_CONNECTTIMEOUT, 30);
			curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($c, CURLOPT_SSL_VERIFYHOST, 0);
			curl_setopt($c, CURLOPT_SSL_VERIFYPEER, 0);
			$o = curl_exec($c);
			$rslt = json_decode($o);
			
			$status = $rslt->transaction_details->$var1->status;

			$orderid = $total['order_id'];

			echo $orderid.":".$status."<br>";

			if($status == 'success'){
				$payu_captured_order_status_id = $this->config->get('payu_captured_order_status_id');
				$this->model_checkout_order->addOrderHistory($orderid, $payu_captured_order_status_id);
			} elseif($status == 'failure'){
				$payu_captured_order_status_id = $this->config->get('payu_failed_order_status_id');
				//$this->model_checkout_order->addOrderHistory($orderid, $payu_captured_order_status_id);
			} else {

			}
			
		}

		/*if(count($totalOrders->rows)){
			$file = fopen(DIR_IMAGE."catalog/test.txt","w");
			fwrite($file,$orderid);
			fclose($file);  
		}*/

	}

	public function syncPayuOrderStatus(){

		/*unmappedstatus=success&phone=9999999999&txnid=FCDA1R100870163781&hash=84e3
		35094bbcb2ddaa0f9a488eb338e143b273765d89c9dfa502402562d0b6f3c7935e28194ca92f7
		380be7c84c3695415b106dcf52cb016a15fcf6adc98d724&status=success&curl=https://www.
		abc.in/payment/handlepayuresposne&firstname=NA&card_no=519619XXXXXX5049&furl=
		https://www.abc.in/payment/handlepayuresposne&productinfo=2&mode=DC&amount=800.
		00&field4=6807112311042810&field3=6807112311042810&field2=838264&field9=SUCC
		ESS&email=NA&mihpayid=175477248&surl=https://www.ABC.in/payment/handlepayuresp
		osne&card_hash=9e88cb0573d4a826b61d808c0a870ed4a990682459b0ec9e95ea421e8e47b
		e8c&field1=42812*/

		$data=$_REQUEST;
		$this->load->model('checkout/order');
		if(isset($data['status']) && $data['status']=='success'){
			$payu_captured_order_status_id = $this->config->get('payu_captured_order_status_id');
			$this->model_checkout_order->addOrderHistory($data['txnid'], $payu_captured_order_status_id, "Updated by Payu S2S API");
		} else if(isset($data['status']) && $data['status']=='failure'){
			$payu_failed_order_status_id = $this->config->get('payu_failed_order_status_id');
			//$this->model_checkout_order->addOrderHistory($data['txnid'], $payu_failed_order_status_id, "Updated by Payu S2S API");
		}


		/*$file = fopen(DIR_APPLICATION."controller/tmp/log.txt","a");
		fwrite($file,json_encode($data));
		fclose($file);*/

	}
}


?>