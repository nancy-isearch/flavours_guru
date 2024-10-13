<?php
class ControllerMailOrder extends Controller {
	public function index() {
		$this->load->model('checkout/mailer');
		try {
			$orders = $this->model_checkout_mailer->getAllPncOrder();
			$menu = $this->model_checkout_mailer->getInfoDescription(37);
			foreach ($orders as $order) {
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				$mail->setTo($order['email']);

				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender(html_entity_decode('Flavours Guru', ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode(sprintf('Payment of Rs '.round($order['total']).'.00 at Flavours Guru has failed.'), ENT_QUOTES, 'UTF-8'));
				
				$data['menu'] = $menu['description'];
				
				$data['order'] = $order;

				$mail->setHtml($this->load->view('mail/pnc_mail', $data));
				//$mail->setText($msg);
				$mail->send();
			}
		} catch(Exception $e) {
			echo 'Message: ' .$e->getMessage();
		}
	}


	public function followup() {
		$this->load->model('checkout/mailer');
		try {
			$orders = $this->model_checkout_mailer->getAllFollowup();
			$menu = $this->model_checkout_mailer->getInfoDescription(37);
			foreach ($orders as $order) {
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				$mail->setTo($order[0]['email']);

				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender(html_entity_decode('Flavours Guru', ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode(sprintf('Payment of Rs '.round($order[0]['total']).'.00 at Flavours Guru has failed.'), ENT_QUOTES, 'UTF-8'));
				
				$data['menu'] = $menu['description'];
				
				$data['order'] = $order;

				$mail->setHtml($this->load->view('mail/followup_mail', $data));
				//$mail->setText($msg);
				$mail->send();
			}
		} catch(Exception $e) {
			echo 'Message: ' .$e->getMessage();
		}
	}

	public function assignVendor(){
		$sql = "select p.shipping_info, o.order_id from oc_order o inner join oc_order_product p on o.order_id = p.order_id where o.order_status_id = 2 and o.vendor_id = 0 and CHAR_LENGTH(p.shipping_info) > 20";
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
