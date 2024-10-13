<?php
class ModelAccountCustomer extends Model {
	public function addCustomer($data) {
		if (isset($data['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($data['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $data['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$this->load->model('account/customer_group');

		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "', store_id = '" . (int)$this->config->get('config_store_id') . "', language_id = '" . (int)$this->config->get('config_language_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', email = '" . trim($this->db->escape($data['email'])) . "', telephone = '" . trim($this->db->escape($data['telephone'])) . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "',ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '" . (int)!$customer_group_info['approval'] . "', date_added = NOW()");
		/*$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "', store_id = '" . (int)$this->config->get('config_store_id') . "', language_id = '" . (int)$this->config->get('config_language_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['account']) ? json_encode($data['custom_field']['account']) : '') . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '" . (int)!$customer_group_info['approval'] . "', date_added = NOW()");*/
		$customer_id = $this->db->getLastId();
			/* lastname = '" . $this->db->escape($data['lastname']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', */
	/*	$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($data['firstname']) . "',  company = '" . $this->db->escape($data['company']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['address']) ? json_encode($data['custom_field']['address']) : '') . "'");*/
 
		$address_id = $this->db->getLastId();
		$address_id = 0;

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");

		$this->load->language('mail/customer');

		$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

		$message = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

		if (!$customer_group_info['approval']) {
			$message .= $this->language->get('text_login') . "\n";
		} else {
			$message .= $this->language->get('text_approval') . "\n";
		}

		$message .= $this->url->link('account/login', '', true) . "\n\n";
		$message .= $this->language->get('text_services') . "\n\n";
		$message .= $this->language->get('text_thanks') . "\n";
		$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')."\n";
		$message .= "www.flavoursguru.com";


		$mailbody='<div style="width: 680px; font-family:Georgia,Times New Roman,Times,serif; font-size:16px; line-height: 21px; color:#444">
			<div style=" width:100%; float:left; text-align:center; padding-top:15px; border-top:3px solid #ddd;">
				<a href="'.HTTP_SERVER.'">
					<img src="'.HTTP_SERVER.'image/catalog/images/logo.png" style="margin-bottom: 20px; width:200px; border:none;" />
				</a>
			</div>';
		$mailbody.=nl2br($message);
		$mailbody.='<div style="border:1px solid #ddd; font-family:Georgia,Times New Roman,Times,serif; margin-top: 20px">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td width="10">&nbsp;</td>
							<td width="100%" align="center"><table width="100%">
								<tbody><tr>
									<td align="right"><a href="tel:+91 8130961414" style="font-size:18px; font-weight:400; color:#565656; font-family:Georgia, Times New Roman, Times, serif; text-decoration:none;">
										<img src="'.HTTP_SERVER.'image/catalog/images/need-help.png" alt="" style="width:100%; max-width:150px;"></a></td>
										<td align="left" valign="top"><a href="tel:+91 8130961414" style="font-size:16px; font-weight:400; line-height:30px; color:#565656; font-family:Georgia, Times New Roman, Times, serif; text-decoration:none;">+91 8130961414</a></td>
									</tr>
								</tbody></table></td>
								<td width="10">&nbsp;</td>
							</tr>
					</tbody>
				</table>
			</div>

		</div>';

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($data['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject($subject);
		$mail->setHtml($mailbody);
		$mail->send();

		// Send to main admin email if new account email is enabled
		if (in_array('account', (array)$this->config->get('config_mail_alert'))) {
			$message  = $this->language->get('text_signup') . "\n\n";
			$message .= $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n";
			$message .= $this->language->get('text_firstname') . ' ' . $data['firstname'] . "\n";
			/*$message .= $this->language->get('text_lastname') . ' ' . $data['lastname'] . "\n";*/
			$message .= $this->language->get('text_customer_group') . ' ' . $customer_group_info['name'] . "\n";
			$message .= $this->language->get('text_email') . ' '  .  $data['email'] . "\n";
			$message .= $this->language->get('text_telephone') . ' ' . $data['telephone'] . "\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($this->language->get('text_new_customer'), ENT_QUOTES, 'UTF-8'));
			$mail->setText($message);
			$mail->send();

			// Send to additional alert emails if new account email is enabled
			$emails = explode(',', $this->config->get('config_alert_email'));

			foreach ($emails as $email) {
				if (utf8_strlen($email) > 0 && filter_var($email, FILTER_VALIDATE_EMAIL)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}

		return $customer_id;
	}

	public function editCustomer($data) {
		$customer_id = $this->customer->getId();

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape($data['firstname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? json_encode($data['custom_field']) : '') . "' WHERE customer_id = '" . (int)$customer_id . "'");
	}

	public function editPassword($email, $password) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "', code = '' WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function editCode($email, $code) {
		$this->db->query("UPDATE `" . DB_PREFIX . "customer` SET code = '" . $this->db->escape($code) . "' WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function editNewsletter($newsletter) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET newsletter = '" . (int)$newsletter . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row;
	}

	public function getCustomerByEmail($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function getCustomerByCode($code) {
		$query = $this->db->query("SELECT customer_id, firstname, lastname, email FROM `" . DB_PREFIX . "customer` WHERE code = '" . $this->db->escape($code) . "' AND code != ''");

		return $query->row;
	}

	public function getCustomerByToken($token) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE token = '" . $this->db->escape($token) . "' AND token != ''");

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = ''");

		return $query->row;
	}

	public function getTotalCustomersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}

	public function getRewardTotal($customer_id) {
		$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}

	public function getIps($customer_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_ip` WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->rows;
	}

	public function addLoginAttempt($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_login WHERE email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

		if (!$query->num_rows) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_login SET email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', total = 1, date_added = '" . $this->db->escape(date('Y-m-d H:i:s')) . "', date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "'");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "customer_login SET total = (total + 1), date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "' WHERE customer_login_id = '" . (int)$query->row['customer_login_id'] . "'");
		}
	}

	public function getLoginAttempts($email) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function deleteLoginAttempts($email) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "customer_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function saveOtp($mobile, $otp) {
		$this->db->query("UPDATE `" . DB_PREFIX . "otp` SET status = '0' WHERE mobile = '" . $this->db->escape($mobile) . "'");
		$this->db->query("INSERT INTO " . DB_PREFIX . "otp SET otp = '" . $this->db->escape($otp) . "', mobile = '" . $this->db->escape($mobile) . "', status = 1, created_on = '" . time() . "', expired_on = '" . (time() + 600) . "'");
	}

	public function validateEmail($email) {
		$query = $this->db->query("SELECT customer_id, firstname, lastname, email, telephone FROM `" . DB_PREFIX . "customer` WHERE email = '" . $this->db->escape($email) . "' ");
		return $query->row;
	}

	public function validateEmailMobile($input) {
		$query = $this->db->query("SELECT customer_id, firstname, lastname, email, telephone FROM `" . DB_PREFIX . "customer` WHERE email = '" . $this->db->escape($input) . "'");
		return $query->row;
	}

	public function validateMobile($input) {
		$query = $this->db->query("SELECT customer_id, firstname, lastname, email, telephone FROM `" . DB_PREFIX . "customer` WHERE telephone = '" . $this->db->escape($input) . "'");
		return $query->row;
	}

	public function verifyOTP($mobile, $otp) {
		$query = $this->db->query("SELECT id, otp FROM `" . DB_PREFIX . "otp` WHERE mobile = '" . $this->db->escape($mobile) . "' AND otp = '". $this->db->escape($otp) ."' AND status = 1 ");
		if($query->row)
			return 1;
		else
			return 0;
	}

	public function sendSMSOTP($mobile, $otp) {
		$mobile = urlencode("91".$mobile);
		$message = "Dear Customer, Your OTP for login to www.flavoursguru.com is ".$otp.". Please do not share this with anyone for security reasons. Team FlavoursGuru";
		//$smsURL = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=NUdMWd6QgkeeTMHfWiPQlQ&senderid=SMSTST&channel=1&DCS=0&flashsms=0&number=$mobile&text=$message";
		$smsURL = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=NUdMWd6QgkeeTMHfWiPQlQ&senderid=FLGURU&channel=Trans&DCS=0&flashsms=0&number=".$mobile."&text=".urlencode($message)."&route=1";
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $smsURL);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$j = curl_exec($ch); 
		curl_close($ch);
		$smsResp = json_decode($j); 
		return $j;
	}

	public function sendEmailOTP($email, $otp) {
		$message = "$otp is Your one time password (OTP) for Flavours Guru account. This will be valid for 10 mins.";

		$mailbody='<div style="width: 680px; font-family:Georgia,Times New Roman,Times,serif; font-size:16px; line-height: 21px; color:#444">
			<div style=" width:100%; float:left; text-align:center; padding-top:15px; border-top:3px solid #ddd;">
				<a href="'.HTTP_SERVER.'">
					<img src="'.HTTP_SERVER.'image/catalog/images/logo.png" style="margin-bottom: 20px; width:200px; border:none;" />
				</a>
			</div>';
		$mailbody.=nl2br($message);
		$mailbody.='<div style="border:1px solid #ddd; font-family:Georgia,Times New Roman,Times,serif; margin-top: 20px">
				
			</div>
		</div>';

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($email);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject('OTP Flavours Guru');
		$mail->setHtml($mailbody);
		if($mail->send())
			return 1;
		else
			return 0;
	}
}
