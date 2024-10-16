<?php
class ModelSaleOrder extends Model {
	public function deleteOrder($order_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_product` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_option` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_voucher` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_history` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE `or`, ort FROM `" . DB_PREFIX . "order_recurring` `or`, `" . DB_PREFIX . "order_recurring_transaction` `ort` WHERE order_id = '" . (int)$order_id . "' AND ort.order_recurring_id = `or`.order_recurring_id");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "affiliate_transaction` WHERE order_id = '" . (int)$order_id . "'");

		// Delete voucher data as well
		$this->db->query("DELETE FROM `" . DB_PREFIX . "voucher` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "voucher_history` WHERE order_id = '" . (int)$order_id . "'");
	}	

	public function addOrderHistory($order_id, $order_status_id, $comment = '', $notify = false, $override = false, $vendor_id){
		if($order_status_id == 14){
			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '" . (int)$order_status_id . "', vendor_id = '" . (int)$vendor_id . "', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");
			$this->db->query("INSERT " . DB_PREFIX . "order_vendor SET vendor_id = '" . $vendor_id . "', order_id = '" . (int)$order_id . "', created_by = '".$this->user->getId()."', created_at = NOW()");		
		} else {
			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '" . (int)$order_status_id . "', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" . (int)$order_id . "', order_status_id = '" . (int)$order_status_id . "', notify = '" . (int)$notify . "', created_by = '".$this->user->getId()."', comment = '" . $this->db->escape($comment) . "', date_added = NOW()");

		$order_info = $this->getOrder($order_id);
		//echo "<pre />"; print_r($order_info);
		if ($order_status_id == 2) {
				// Check for any downloadable products
				$download_status = false;
	
				$order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
				
				foreach ($order_product_query->rows as $order_product) {
					// Check if there are any linked downloads
					$product_download_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "product_to_download` WHERE product_id = '" . (int)$order_product['product_id'] . "'");
	
					if ($product_download_query->row['total']) {
						$download_status = true;
					}
				}
				
				// Load the language for any mails that might be required to be sent out
				$language = new Language($order_info['language_code']);
				$language->load($order_info['language_code']);
				$language->load('mail/order');
				
				$order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . (int)$order_info['language_id'] . "'");
	
				if ($order_status_query->num_rows) {
					$order_status = $order_status_query->row['name'];
				} else {
					$order_status = '';
				}
	
				$subject = sprintf($language->get('text_new_subject'), html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8'), $order_id);
	
				// HTML Mail
				$data = array();
	
				$data['title'] = sprintf($language->get('text_new_subject'), $order_info['store_name'], $order_id);
	
				$data['text_greeting'] = "<h3>Hi $order_info[payment_firstname]! Your order #$order_id is confirmed.</h3> <br> Thank You for making us part of the celebration. <br> Please be assured that your order will be delivered within the chosen time slot on selected date.";
				$data['text_link'] = $language->get('text_new_link');
				$data['text_download'] = $language->get('text_new_download');
				$data['text_order_detail'] = $language->get('text_new_order_detail');
				$data['text_instruction'] = $language->get('text_new_instruction');
				$data['text_order_id'] = $language->get('text_new_order_id');
				$data['text_date_added'] = $language->get('text_new_date_added');
				$data['text_payment_method'] = $language->get('text_new_payment_method');
				$data['text_shipping_method'] = $language->get('text_new_shipping_method');
				$data['text_email'] = $language->get('text_new_email');
				$data['text_telephone'] = $language->get('text_new_telephone');
				$data['text_ip'] = $language->get('text_new_ip');
				$data['text_order_status'] = $language->get('text_new_order_status');
				$data['text_payment_address'] = $language->get('text_new_payment_address');
				$data['text_shipping_address'] = $language->get('text_new_shipping_address');
				$data['text_product'] = $language->get('text_new_product');
				$data['text_model'] = $language->get('text_new_model');
				$data['text_quantity'] = $language->get('text_new_quantity');
				$data['text_price'] = $language->get('text_new_price');
				$data['text_total'] = $language->get('text_new_total');
				$data['text_footer'] = $language->get('text_new_footer');
	
				$data['logo'] = $this->config->get('config_url') . 'image/' . $this->config->get('config_logo');
				$data['store_name'] = $order_info['store_name'];
				$data['store_url'] = $order_info['store_url'];
				$data['customer_id'] = $order_info['customer_id'];
				$data['link'] = $order_info['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_id;
	
				if ($download_status) {
					$data['download'] = $order_info['store_url'] . 'index.php?route=account/download';
				} else {
					$data['download'] = '';
				}
	
				$data['order_id'] = $order_id;
				$data['date_added'] = date($language->get('date_format_short'), strtotime($order_info['date_added']));
				$data['payment_method'] = $order_info['payment_method'];
				$data['shipping_method'] = $order_info['shipping_method'];
				$data['email'] = $order_info['email'];
				$data['telephone'] = $order_info['telephone'];
				$data['ip'] = $order_info['ip'];
				$data['order_status'] = $order_status;
	
				if ($comment && $notify) {
					$data['comment'] = nl2br($comment);
				} else {
					$data['comment'] = '';
				}
	
				if ($order_info['payment_address_format']) {
					$format = $order_info['payment_address_format'];
				} else {
					$format = '{firstname}' . "\n" . '{email}' . "\n" . '{mobile}' /*. "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}'*/;
				}
	
				$find = array(
					'{firstname}',
					'{email}',
					'{mobile}'
					/*'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'*/
				);
	
				$replace = array(
					'firstname' => $order_info['payment_firstname'],
					'email'  => $order_info['payment_email'],
					'mobile'   => $order_info['payment_mobile']
					/*'address_1' => $order_info['payment_address_1'],
					'address_2' => $order_info['payment_address_2'],
					'city'      => $order_info['payment_city'],
					'postcode'  => $order_info['payment_postcode'],
					'zone'      => $order_info['payment_zone'],
					'zone_code' => $order_info['payment_zone_code'],
					'country'   => $order_info['payment_country']*/
				);
	
				$data['payment_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
	
				if ($order_info['shipping_address_format']) {
					$format = $order_info['shipping_address_format'];
				} else {
					$format = '{firstname} {lastname}' . "\n" . '{shipping_phone}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
				}
	
				$find = array(
					'{firstname}',
					'{lastname}',
					'{shipping_phone}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
				);
	
				$replace = array(
					'firstname' => $order_info['shipping_firstname'],
					'lastname'  => $order_info['shipping_lastname'],
					'shipping_phone'   => $order_info['shipping_phone'],
					'company'   => $order_info['shipping_company'],
					'address_1' => $order_info['shipping_address_1'],
					'address_2' => $order_info['shipping_address_2'],
					'city'      => $order_info['shipping_city'],
					'postcode'  => $order_info['shipping_postcode'],
					'zone'      => $order_info['shipping_zone'],
					'zone_code' => $order_info['shipping_zone_code'],
					'country'   => $order_info['shipping_country']
				);
	
				$data['shipping_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
	
				$this->load->model('tool/upload');
	
				// Products
				$data['products'] = array();
	
				foreach ($order_product_query->rows as $product) {
					$option_data = array();
	
					$order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$product['order_product_id'] . "'");
	
					foreach ($order_option_query->rows as $option) {
						if ($option['type'] != 'file') {
							$value = $option['value'];
						} else {
							$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
	
							if ($upload_info) {
								$value = $upload_info['name'];
							} else {
								$value = '';
							}
						}
	
						$option_data[] = array(
							'name'  => $option['name'],
							'value' => $value
						);
					}
	
					$data['products'][] = array(
						'name'     => $product['name'],
						'model'    => $product['model'],
						'option'   => $option_data,
						'quantity' => $product['quantity'],
						'shipping_info' => $product['shipping_info'],
						'shipping_price'  =>$this->currency->format($product['shipping_price'], $order_info['currency_code'], $order_info['currency_value']),
						'price'    => $this->currency->format(($product['price']-$product['shipping_price']) + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
						'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value'])
					);
				}
	
				// Vouchers
				$data['vouchers'] = array();
	
				$order_voucher_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");
	
				foreach ($order_voucher_query->rows as $voucher) {
					$data['vouchers'][] = array(
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']),
					);
				}
	
				// Order Totals
				$data['totals'] = array();
				
				$order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order ASC");
	
				foreach ($order_total_query->rows as $total) {
					if($total['title']!='Free Shipping'){
					$data['totals'][] = array(
						'title' => $total['title'],
						'text'  => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']),
					);
				  }
				}
	
				// Text Mail
				$text  = sprintf($language->get('text_new_greeting'), html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8')) . "\n\n";
				$text .= $language->get('text_new_order_id') . ' ' . $order_id . "\n";
				$text .= $language->get('text_new_date_added') . ' ' . date($language->get('date_format_short'), strtotime($order_info['date_added'])) . "\n";
				$text .= $language->get('text_new_order_status') . ' ' . $order_status . "\n\n";
	
				if ($comment && $notify) {
					$text .= $language->get('text_new_instruction') . "\n\n";
					$text .= $comment . "\n\n";
				}
	
				// Products
				$text .= $language->get('text_new_products') . "\n";
	
				foreach ($order_product_query->rows as $product) {
					$text .= $product['quantity'] . 'x ' . $product['name'] . ' (' . $product['model'] . ') ' . html_entity_decode($this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";
	
					$order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . $product['order_product_id'] . "'");
	
					foreach ($order_option_query->rows as $option) {
						if ($option['type'] != 'file') {
							$value = $option['value'];
						} else {
							$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
	
							if ($upload_info) {
								$value = $upload_info['name'];
							} else {
								$value = '';
							}
						}
	
						$text .= chr(9) . '-' . $option['name'] . ' ' . (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value) . "\n";
					}
				}
	
				foreach ($order_voucher_query->rows as $voucher) {
					$text .= '1x ' . $voucher['description'] . ' ' . $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']);
				}
	
				$text .= "\n";
	
				$text .= $language->get('text_new_order_total') . "\n";
	
				foreach ($order_total_query->rows as $total) {
					$text .= $total['title'] . ': ' . html_entity_decode($this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";
				}
	
				$text .= "\n";
	
				if ($order_info['customer_id']) {
					$text .= $language->get('text_new_link') . "\n";
					$text .= $order_info['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_id . "\n\n";
				}
	
				if ($download_status) {
					$text .= $language->get('text_new_download') . "\n";
					$text .= $order_info['store_url'] . 'index.php?route=account/download' . "\n\n";
				}

				// Comment
				if ($order_info['comment']) { 
					$text .= $language->get('text_new_comment') . "\n\n";
					$text .= $order_info['comment'] . "\n\n";
					$data['comment'] = $order_info['comment'];
				} else {
					$data['comment'] = '';
				}
	 			$data['comment11'] = $order_info['comment'];

	 			//echo "<pre />"; print_r($data);

				$text .= $language->get('text_new_footer') . "\n\n";

				$customeLibrary = new Custom($this->registry);
				$customeLibrary->sendOrderSuccessNotification($order_id);
				
				/*$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				
				if(isset($order_info['payment_email']) && !empty($order_info['payment_email'])){
					$sendemailuser = $order_info['payment_email'];
				} else if (isset($order_info['email']) && !empty($order_info['email'])){
					$sendemailuser = $order_info['email'];
				} else {
					$sendemailuser = 'udit.niec@gmail.com';
				}

				$mail->setTo($sendemailuser);
				//$mail->setTo('udit.niec@gmail.com');
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender(html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));

				$mail->setHtml($this->load->view('mail/order', $data));
				$mail->setText($text);
				$mail->send();*/
	
				// Admin Alert Mail
				if (in_array('order', (array)$this->config->get('config_mail_alert'))) {
					$subject = sprintf($language->get('text_new_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'), $order_id);
	
					// HTML Mail
					$data['text_greeting'] = $language->get('text_new_received');
	
					if ($comment) {
						if ($order_info['comment']) {
							$data['comment'] = nl2br($comment) . '<br/><br/>' . $order_info['comment'];
						} else {
							$data['comment'] = nl2br($comment);
						}
					} else {
						if ($order_info['comment']) {
							$data['comment'] = $order_info['comment'];
						} else {
							$data['comment'] = '';
						}
					}
	
					$data['text_download'] = '';
	
					$data['text_footer'] = '';
	
					$data['text_link'] = '';
					$data['link'] = '';
					$data['download'] = '';
	
					// Text
					$text  = $language->get('text_new_received') . "\n\n";
					$text .= $language->get('text_new_order_id') . ' ' . $order_id . "\n";
					$text .= $language->get('text_new_date_added') . ' ' . date($language->get('date_format_short'), strtotime($order_info['date_added'])) . "\n";
					$text .= $language->get('text_new_order_status') . ' ' . $order_status . "\n\n";
					$text .= $language->get('text_new_products') . "\n";
	
					foreach ($order_product_query->rows as $product) {
						$text .= $product['quantity'] . 'x ' . $product['name'] . ' (' . $product['model'] . ') ' . html_entity_decode($this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";
	
						$order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . $product['order_product_id'] . "'");
	
						foreach ($order_option_query->rows as $option) {
							if ($option['type'] != 'file') {
								$value = $option['value'];
							} else {
								$value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
							}
	
							$text .= chr(9) . '-' . $option['name'] . ' ' . (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value) . "\n";
						}
					}
	
					foreach ($order_voucher_query->rows as $voucher) {
						$text .= '1x ' . $voucher['description'] . ' ' . $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']);
					}
	
					$text .= "\n";
	
					$text .= $language->get('text_new_order_total') . "\n";
	
					foreach ($order_total_query->rows as $total) {
						$text .= $total['title'] . ': ' . html_entity_decode($this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";
					}
	
					$text .= "\n";
	
					if ($order_info['comment']) {
						$text .= $language->get('text_new_comment') . "\n\n";
						$text .= $order_info['comment'] . "\n\n";
					}

					$mailbody='<div style="width: 680px; font-family:Georgia,Times New Roman,Times,serif; font-size:17px; line-height: 21px; color:#444">
					<div style=" width:100%; float:left; text-align:center; padding-top:15px; border-top:3px solid #ddd;">
						<a href="'.HTTPS_CATALOG.'">
							<img src="'.HTTPS_CATALOG.'image/catalog/images/logo.png" style="margin-bottom: 20px; width:200px; border:none;" />
						</a>
					</div>';
					$mailbody.=nl2br($text);
					$mailbody.='<div style="border:1px solid #ddd; font-family:Georgia,Times New Roman,Times,serif; margin-top: 20px">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td width="10">&nbsp;</td>
										<td width="100%" align="center"><table width="100%">
											<tbody><tr>
												<td align="right"><a href="tel:+91 8130961414" style="font-size:18px; font-weight:400; color:#565656; font-family:Georgia, Times New Roman, Times, serif; text-decoration:none;">
													<img src="'.HTTPS_CATALOG.'image/catalog/images/need-help.png" alt="" style="width:100%; max-width:150px;"></a></td>
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
					$custom_mail = 'sharique@flavoursguru.com';
					$mail->setTo($custom_mail);
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender(html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8'));
					$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
					$mail->setHtml($this->load->view('mail/order', $data));
					$mail->setHtml($mailbody);
					$mail->send();
	
					// Send to additional alert emails
					$emails = explode(',', $this->config->get('config_alert_email'));
	
					foreach ($emails as $email) {
						if ($email && filter_var($email, FILTER_VALIDATE_EMAIL)) {
							$mail->setTo($email);
							$mail->send();
						}
					}
				}
			}


			if ($order_status_id > 2 && $notify) {
				$language = new Language($order_info['language_code']);
				$language->load($order_info['language_code']);
				$language->load('mail/order');
	
				$subject = sprintf($language->get('text_update_subject'), html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8'), $order_id);
				//echo "<pre />"; print_r($order_info);
				//$message  = $language->get('text_update_order') . ' ' . $order_id . "\n";
				$message = '';
				$message .= "Hi ".$order_info['payment_firstname']."!\n\n";
				//$message .= $language->get('text_update_date_added') . ' ' . date($language->get('date_format_short'), strtotime($order_info['date_added'])) . "\n\n";
	
				$order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . (int)$order_info['language_id'] . "'");
	
				if ($order_status_query->num_rows) {
					/*$message .= $language->get('text_update_order_status') . "\n\n";
					$message .= $order_status_query->row['name'] . "\n\n";*/
					$message .= "Your order ".$order_id." is ".$order_status_query->row['name'].".\n\n";
				}
	
				if ($order_info['customer_id']) {
					$message .= $language->get('text_update_link') . "\n";
					$message .= $order_info['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_id . "\n\n";
				}
	
				if ($comment) {
					$message .= $language->get('text_update_comment') . "\n\n";
					$message .= strip_tags($comment) . "\n\n";
				}
	
				$message .= $language->get('text_update_footer');

				$message .= "\n\nThanks, \nFlavours Guru, \nwww.flavoursguru.com";

				$mailbody='<div style="width: 680px; font-family:Georgia,Times New Roman,Times,serif; font-size:16px; line-height: 21px; color:#444">
				<div style=" width:100%; float:left; text-align:center; padding-top:15px; border-top:3px solid #ddd;">
					<a href="'.HTTPS_CATALOG.'">
						<img src="'.HTTPS_CATALOG.'image/catalog/images/logo.png" style="margin-bottom: 20px; width:200px; border:none;" />
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
											<td align="right"><a href="tel:+91 8130961414" style="font-size:16px; font-weight:400; color:#565656; font-family:Georgia, Times New Roman, Times, serif; text-decoration:none;">
												<img src="'.HTTPS_CATALOG.'image/catalog/images/need-help.png" alt="" style="width:100%; max-width:150px;"></a></td>
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
				if(isset($order_info['payment_email']) && !empty($order_info['payment_email'])){
					$sendemailuser = $order_info['payment_email'];
				} else if (isset($order_info['email']) && !empty($order_info['email'])){
					$sendemailuser = $order_info['email'];
				} else {
					$sendemailuser = 'udit.niec@gmail.com';
				}
				$mail->setTo($sendemailuser);
				//$mail->setTo('udit.niec@gmail.com');
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender(html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
				$mail->setHtml($mailbody);
				$mail->send();
			}
	}

	public function addOrderComplaint($order_id, $order_complaint_id, $detail){
		$this->db->query("INSERT INTO `" . DB_PREFIX . "order_complaint` SET order_id = '" . $order_id . "', complaint_type = '".$order_complaint_id."', detail = '".$detail."', status=1, created_by = '".$this->user->getId()."', created_at=NOW()");
	}

	public function addPPPrice($orderProductId, $pp){
		$this->db->query("UPDATE `" . DB_PREFIX . "order_product` SET pp_price = '" . $pp . "', pp_added_by = '".$this->user->getId()."', pp_added_at = NOW() WHERE order_product_id = '" . (int)$orderProductId . "'");
	}
	
	public function getOrder($order_id) {
		$order_query = $this->db->query("SELECT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM " . DB_PREFIX . "customer c WHERE c.customer_id = o.customer_id) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS order_status FROM `" . DB_PREFIX . "order` o WHERE o.order_id = '" . (int)$order_id . "'");

		if ($order_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['payment_country_id'] . "'");

			if ($country_query->num_rows) {
				$payment_iso_code_2 = $country_query->row['iso_code_2'];
				$payment_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$payment_iso_code_2 = '';
				$payment_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['payment_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$payment_zone_code = $zone_query->row['code'];
			} else {
				$payment_zone_code = '';
			}

			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['shipping_country_id'] . "'");

			if ($country_query->num_rows) {
				$shipping_iso_code_2 = $country_query->row['iso_code_2'];
				$shipping_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$shipping_iso_code_2 = '';
				$shipping_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['shipping_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$shipping_zone_code = $zone_query->row['code'];
			} else {
				$shipping_zone_code = '';
			}

			$reward = 0;

			$order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

			foreach ($order_product_query->rows as $product) {
				$reward += $product['reward'];
			}
			
			if ($order_query->row['affiliate_id']) {
				$affiliate_id = $order_query->row['affiliate_id'];
			} else {
				$affiliate_id = 0;
			}

			$this->load->model('marketing/affiliate');

			$affiliate_info = $this->model_marketing_affiliate->getAffiliate($affiliate_id);

			if ($affiliate_info) {
				$affiliate_firstname = $affiliate_info['firstname'];
				$affiliate_lastname = $affiliate_info['lastname'];
			} else {
				$affiliate_firstname = '';
				$affiliate_lastname = '';
			}

			$this->load->model('localisation/language');

			$language_info = $this->model_localisation_language->getLanguage($order_query->row['language_id']);

			if ($language_info) {
				$language_code = $language_info['code'];
			} else {
				$language_code = $this->config->get('config_language');
			}

			$added_by = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '".$order_query->row['added_by']."'")->row;	

			return array(
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_id'                => $order_query->row['store_id'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],
				'customer_id'             => $order_query->row['customer_id'],
				'customer'                => $order_query->row['customer'],
				'customer_group_id'       => $order_query->row['customer_group_id'],
				'mr_mrs'          	      => $order_query->row['mr_mrs'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'email'                   => $order_query->row['email'],
				'telephone'               => $order_query->row['telephone'],
				'fax'                     => $order_query->row['fax'],
				'custom_field'            => json_decode($order_query->row['custom_field'], true),
				'payment_mr_mrs'  	      => $order_query->row['payment_mr_mrs'],
				'payment_firstname'       => $order_query->row['payment_firstname'],
				'payment_lastname'        => $order_query->row['payment_lastname'],
				'payment_email'       => $order_query->row['payment_email'],
				'payment_phone_code'       => $order_query->row['payment_phone_code'],
				'payment_mobile'       => $order_query->row['payment_mobile'],
				'payment_company'         => $order_query->row['payment_company'],
				'payment_address_1'       => $order_query->row['payment_address_1'],
				'payment_address_2'       => $order_query->row['payment_address_2'],
				'payment_postcode'        => $order_query->row['payment_postcode'],
				'payment_city'            => $order_query->row['payment_city'],
				'payment_zone_id'         => $order_query->row['payment_zone_id'],
				'payment_zone'            => $order_query->row['payment_zone'],
				'payment_zone_code'       => $payment_zone_code,
				'payment_country_id'      => $order_query->row['payment_country_id'],
				'payment_country'         => $order_query->row['payment_country'],
				'payment_iso_code_2'      => $payment_iso_code_2,
				'payment_iso_code_3'      => $payment_iso_code_3,
				'payment_address_format'  => $order_query->row['payment_address_format'],
				'payment_custom_field'    => json_decode($order_query->row['payment_custom_field'], true),
				'payment_method'          => $order_query->row['payment_method']."<br>".$order_query->row['custom_field'],
				'payment_code'            => $order_query->row['payment_code'],
				'shipping_mr_mrs'         => $order_query->row['shipping_mr_mrs'],
				'shipping_firstname'      => $order_query->row['shipping_firstname'],
				'shipping_lastname'       => $order_query->row['shipping_lastname'],
				'shipping_company'        => $order_query->row['shipping_company'],
				'shipping_address_1'      => $order_query->row['shipping_address_1'],
				'shipping_address_2'      => $order_query->row['shipping_address_2'],
				'shipping_postcode'       => $order_query->row['shipping_postcode'],
				'shipping_city'           => $order_query->row['shipping_city'],
				'shipping_phone_code'     => $order_query->row['shipping_phone_code'],
				'shipping_phone'           => $order_query->row['shipping_phone'],
				'shipping_zone_id'        => $order_query->row['shipping_zone_id'],
				'shipping_zone'           => $order_query->row['shipping_zone'],
				'shipping_zone_code'      => $shipping_zone_code,
				'shipping_country_id'     => $order_query->row['shipping_country_id'],
				'shipping_country'        => $order_query->row['shipping_country'],
				'shipping_iso_code_2'     => $shipping_iso_code_2,
				'shipping_iso_code_3'     => $shipping_iso_code_3,
				'shipping_address_format' => $order_query->row['shipping_address_format'],
				'shipping_custom_field'   => json_decode($order_query->row['shipping_custom_field'], true),
				'shipping_method'         => $order_query->row['shipping_method'],
				'shipping_code'           => $order_query->row['shipping_code'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'reward'                  => $reward,
				'order_status_id'         => $order_query->row['order_status_id'],
				'order_status'            => $order_query->row['order_status'],
				'affiliate_id'            => $order_query->row['affiliate_id'],
				'affiliate_firstname'     => $affiliate_firstname,
				'affiliate_lastname'      => $affiliate_lastname,
				'commission'              => $order_query->row['commission'],
				'language_id'             => $order_query->row['language_id'],
				'language_code'           => $language_code,
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'ip'                      => $order_query->row['ip'],
				'forwarded_ip'            => $order_query->row['forwarded_ip'],
				'user_agent'              => $order_query->row['user_agent'],
				'accept_language'         => $order_query->row['accept_language'],
				'date_added'              => $order_query->row['date_added'],
				'date_modified'           => $order_query->row['date_modified'],
				'vendor_id'           => $order_query->row['vendor_id'],
				'is_admin_order'           => $order_query->row['is_admin_order'],
				'custom_field'           => $order_query->row['custom_field'],
				'disclose_sender_details'           => $order_query->row['disclose_sender_details'],
				'added_by' => $added_by['firstname'].' '.$added_by['lastname']
			);
		} else {
			return;
		}
	}

	public function getOrders($data = array()) {
		/*$sql = "SELECT o.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, o.shipping_city AS city, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS order_status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified FROM `" . DB_PREFIX . "order` o";*/
		$sql = "SELECT o.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, o.shipping_city AS city, o.affiliate_id, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS order_status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified, o.date_forshipping, o.slot_forshipping, o.shipping_postcode, o.vendor_id, o.added_by FROM `" . DB_PREFIX . "order` o";

		if (isset($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
			//$sql .= " WHERE o.order_id > '0'";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND o.firstname LIKE '%" . $this->db->escape($data['filter_customer']) . "%' OR o.email LIKE '" . $this->db->escape($data['filter_customer']) . "%' OR o.telephone LIKE '" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$sql .= " AND o.email = '" . $this->db->escape($data['filter_email']) . "'";
		}

		if (!empty($data['filter_phone'])) {
			$sql .= " AND o.telephone = '" . $this->db->escape($data['filter_phone']) . "'";
		}

		if (!empty($data['filter_order_custom']) && $data['filter_order_custom'] == 1) {
			$sql .= " AND o.affiliate_id = '1'";
		}

		if (!empty($data['filter_city'])) {
			$sql .= " AND o.shipping_city LIKE '%" . $this->db->escape($data['filter_city']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(o.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(o.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_order_vendor'])) {
			$sql .= " AND vendor_id = '" . $this->db->escape($data['filter_order_vendor']) . "'";
		}

		if (!empty($data['filter_date_delivery'])) {
			$sql .= " AND o.date_forshipping = '" . $this->db->escape(date('Y-m-d', strtotime($data['filter_date_delivery']))) . "'";
		}

		if (!empty($data['filter_slot_delivery'])) {
			$sql .= " AND o.slot_forshipping = '" . $this->db->escape($data['filter_slot_delivery']) . "'";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
		}

		$sort_data = array(
			'o.order_id',
			'customer',
			'order_status',
			'o.date_added',
			'o.date_modified',
			'o.total'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY o.order_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		//echo $sql; die;
		$query = $this->db->query($sql);	

		$allOrders = $query->rows;
		/*$a = array();
		$b = array();
		$rt = array();
		if(isset($data['filter_date_delivery']) && !empty($data['filter_date_delivery'])){
			$query1 = $this->db->query("SELECT order_id FROM `" . DB_PREFIX . "order_delivery_date` WHERE delivery_date = '" . $data['filter_date_delivery'] . "'");
			$oo = $query1->rows;
			foreach ($oo as $o) {
				$a[] = $o['order_id'];
			}
		}

		if(isset($data['filter_slot_delivery']) && !empty($data['filter_slot_delivery'])){
			$query1 = $this->db->query("SELECT order_id FROM `" . DB_PREFIX . "order_delivery_slot` WHERE slot = '" . $data['filter_slot_delivery'] . "'");	
			$slots = $query1->rows;
			foreach ($slots as $value) {
				$b[] = $value['order_id'];
			}
		}
		if(!empty($a) && !empty($b)){
			$rt = array_unique(array_intersect($a,$b));	
		}
		
		if(count($rt) > 0){
			$orders = array();
			foreach ($allOrders as $order) {
				if((in_array($order['order_id'], $rt))){
					$orders[] = $order;
				}
			}
		} elseif (count($a) > 0) {
			$orders = array();
			foreach ($allOrders as $order) {
				if((in_array($order['order_id'], $a))){
					$orders[] = $order;
				}
			}
		} elseif (count($b) > 0) {
			$orders = array();
			foreach ($allOrders as $order) {
				if((in_array($order['order_id'], $b))){
					$orders[] = $order;
				}
			}
		} else {
			$orders = $allOrders;
		}

		$alo = array();
		foreach ($orders as $order) {
			$alo[] = $order['order_id'];
		}

		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_delivery_slot WHERE order_id IN ('" . implode("','", $alo) . "')");
		$slots = $query->rows;
		$slt = array();
		foreach ($slots as $value) {
			$slt[$value['order_id']][] = $value['slot'];
		}


		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_delivery_date WHERE order_id IN ('" . implode("','", $alo) . "')");
		$dates = $query->rows;

		$dts = array();
		foreach ($dates as $value) {
			$dts[$value['order_id']][] = date('d-F-Y', strtotime($value['delivery_date']));
		}

		$allO = array();
		foreach ($orders as $value) {
			$value['delivery_dates'] = '';
			if(isset($dts[$value['order_id']]) && !empty($dts[$value['order_id']])){
				$value['delivery_dates'] = implode(', ', $dts[$value['order_id']]);
			}

			$value['delivery_slots'] = '';
			if(isset($slt[$value['order_id']]) && !empty($slt[$value['order_id']])){
				$value['delivery_slots'] = implode(', ', $slt[$value['order_id']]);
			}

			$allO[] = $value;
		} */
		//echo "<pre />"; print_r($allO); die();
		return $allOrders;
	}

	public function getOrderProducts($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getProductImage($product_id) {
		$query = $this->db->query("SELECT image FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id . "'");

		return $query->row;
	}

	public function getVendors() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_group_id = '14' AND status=1");

		return $query->rows;
	}

	public function getOrderOptions($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");

		return $query->rows;
	}

	public function getOrderVouchers($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getOrderVoucherByVoucherId($voucher_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_voucher` WHERE voucher_id = '" . (int)$voucher_id . "'");

		return $query->row;
	}

	public function getOrderTotals($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");

		return $query->rows;
	}

	public function getTotalOrders($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order`";

		if (isset($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE order_status_id > '0'";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$sql .= " AND o.email = '" . $this->db->escape($data['filter_email']) . "'";
		}

		if (!empty($data['filter_phone'])) {
			$sql .= " AND o.telephone = '" . $this->db->escape($data['filter_phone']) . "'";
		}

		if (!empty($data['filter_order_custom']) && $data['filter_order_custom'] == 1) {
			$sql .= " AND o.affiliate_id = '1'";
		}

		if (!empty($data['filter_city'])) {
			$sql .= " AND o.shipping_city LIKE '%" . $this->db->escape($data['filter_city']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND total = '" . (float)$data['filter_total'] . "'";
		}

		if (!empty($data['filter_order_vendor'])) {
			$sql .= " AND vendor_id = '" . $this->db->escape($data['filter_order_vendor']) . "'";
		}

		if (!empty($data['filter_date_delivery'])) {
			$sql .= " AND o.date_forshipping = '" . $this->db->escape(date('Y-m-d', strtotime($data['filter_date_delivery']))) . "'";
		}

		if (!empty($data['filter_slot_delivery'])) {
			$sql .= " AND o.slot_forshipping = '" . $this->db->escape($data['filter_slot_delivery']) . "'";
		}

		$query = $this->db->query($sql);
		return $query->row['total'];

		/* $rt = array();
		$a =  array();
		$b =  array();
		if(isset($data['filter_date_delivery']) && !empty($data['filter_date_delivery'])){
			$query1 = $this->db->query("SELECT order_id FROM `" . DB_PREFIX . "order_delivery_date` WHERE delivery_date = '" . $data['filter_date_delivery'] . "'");	
			$dates = $query1->rows;
			foreach ($dates as $value) {
				$a[] = $value['order_id'];
			}
		}

		if(isset($data['filter_slot_delivery']) && !empty($data['filter_slot_delivery'])){
			$query1 = $this->db->query("SELECT order_id FROM `" . DB_PREFIX . "order_delivery_slot` WHERE slot = '" . $data['filter_slot_delivery'] . "'");	
			$slots = $query1->rows;
			foreach ($slots as $value) {
				$b[] = $value['order_id'];
			}
		}
		if(!empty($a) && !empty($b)){
			$rt = array_unique(array_intersect($a,$b));	
		}		
		//print_r($rt); die();
		if(count($rt) > 0){
			return count($rt);
		} elseif (count($a) > 0) {
			return count($a);
		} elseif (count($b) > 0) {
			return count($b);
		} else {
			return $query->row['total'];
		} */
	}

	public function getTotalOrdersByStoreId($store_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE store_id = '" . (int)$store_id . "'");

		return $query->row['total'];
	}

	public function getTotalOrdersByOrderStatusId($order_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id = '" . (int)$order_status_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalOrdersByProcessingStatus() {
		$implode = array();

		$order_statuses = $this->config->get('config_processing_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE " . implode(" OR ", $implode));

			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function getTotalOrdersByCompleteStatus() {
		$implode = array();

		$order_statuses = $this->config->get('config_complete_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE " . implode(" OR ", $implode) . "");

			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function getTotalOrdersByLanguageId($language_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE language_id = '" . (int)$language_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalOrdersByCurrencyId($currency_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE currency_id = '" . (int)$currency_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function createInvoiceNo($order_id) {
		$order_info = $this->getOrder($order_id);

		if ($order_info && !$order_info['invoice_no']) {
			$query = $this->db->query("SELECT MAX(invoice_no) AS invoice_no FROM `" . DB_PREFIX . "order` WHERE invoice_prefix = '" . $this->db->escape($order_info['invoice_prefix']) . "'");

			if ($query->row['invoice_no']) {
				$invoice_no = $query->row['invoice_no'] + 1;
			} else {
				$invoice_no = 1;
			}

			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET invoice_no = '" . (int)$invoice_no . "', invoice_prefix = '" . $this->db->escape($order_info['invoice_prefix']) . "' WHERE order_id = '" . (int)$order_id . "'");

			return $order_info['invoice_prefix'] . $invoice_no;
		}
	}

	public function getOrderHistories($order_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT oh.date_added, os.name AS status, oh.comment, oh.notify, oh.created_by FROM " . DB_PREFIX . "order_history oh LEFT JOIN " . DB_PREFIX . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int)$order_id . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY oh.date_added ASC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getAllAdminUsers(){
		$query = $this->db->query("SELECT * from oc_user");
		$users = $query->rows;
		$allUsers = array();
		foreach ($users as $user) {
			$allUsers[$user['user_id']] = $user;
		}	
		return $allUsers;
	}

	public function getTotalOrderHistories($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}

	public function getTotalOrderHistoriesByOrderStatusId($order_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_history WHERE order_status_id = '" . (int)$order_status_id . "'");

		return $query->row['total'];
	}

	public function getEmailsByProductsOrdered($products, $start, $end) {
		$implode = array();

		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . (int)$product_id . "'";
		}

		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op ON (o.order_id = op.order_id) WHERE (" . implode(" OR ", $implode) . ") AND o.order_status_id <> '0' LIMIT " . (int)$start . "," . (int)$end);

		return $query->rows;
	}

	public function getTotalEmailsByProductsOrdered($products) {
		$implode = array();

		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . (int)$product_id . "'";
		}

		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op ON (o.order_id = op.order_id) WHERE (" . implode(" OR ", $implode) . ") AND o.order_status_id <> '0'");

		return $query->row['email'];
	}

	public function editOrderSpecialInstruction($order_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "order SET comment = '" . $data['new_comment'] . "', custom_field = '". $data['trans_id'] ."', payment_method = '" . $this->db->escape($data['payment_method']) . "' WHERE order_id = '" . (int)$order_id . "'");
	}

	public function assignOrderVendor($order_id, $vendor_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "order SET vendor_id = '" . $vendor_id . "' WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("INSERT " . DB_PREFIX . "order_vendor SET vendor_id = '" . $vendor_id . "', order_id = '" . (int)$order_id . "', created_by = '".$this->user->getId()."', created_at = NOW()");
	}	

	public function getAllTimeSlot(){
		$slots = $this->db->query("SELECT * FROM `oc_timeslot_shipping` order by timeslot_from asc")->rows;
		$out = array();
		foreach ($slots as $key => $value) {
			$all[] = $value['timeslot_from'].' - '.$value['timeslot_to'];
		}
		return $all;
	}

	public function getOrderFromSku($sku) {
		$query = $this->db->query("select p.product_id, pd.name, p.sku, p.price, p.image, p.tax_class_id from oc_product p, oc_product_description pd where p.product_id = pd.product_id and p.sku = '".$sku."'");
		$pro = $query->row;
		$pro['options'] = $this->getProductOptions($pro['product_id']);
		return $pro;
	}	

	public function getProductOptions($product_id) {
		$product_option_data = array();

		$product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND po.option_id = 1 ORDER BY o.sort_order");

		foreach ($product_option_query->rows as $product_option) {
			$product_option_value_data = array();

			$product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$product_id . "' AND pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");

			foreach ($product_option_value_query->rows as $product_option_value) {
				$product_option_value_data[] = array(
					'product_option_value_id' => $product_option_value['product_option_value_id'],
					'option_value_id'         => $product_option_value['option_value_id'],
					'name'                    => $product_option_value['name'],
					'image'                   => $product_option_value['image'],
					'quantity'                => $product_option_value['quantity'],
					'subtract'                => $product_option_value['subtract'],
					'price'                   => $product_option_value['price'],
					'price_prefix'            => $product_option_value['price_prefix'],
					'weight'                  => $product_option_value['weight'],
					'weight_prefix'           => $product_option_value['weight_prefix']
				);
			}
			$product_option_data = array(
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['name'],
				'type'                 => $product_option['type'],
				'value'                => $product_option['value'],
				'required'             => $product_option['required']
			);
		}

		return $product_option_data;
	}

	public function saveOrderAdmin($data, $imagePro) {
		//echo "<pre />"; print_r($imagePro); die();

		$comment = '';

		$customized = 0;

		if(isset($data['occasion']) && !empty($data['occasion'])){
			$comment .= '_'.$data['occasion'];
		} else {
			$comment .= '_';
		}

		if(isset($data['message_card']) && !empty($data['message_card'])){
			$comment .= '_'.$data['message_card'];
		} else {
			$comment .= '_';
		}

		if(isset($data['special_instruction']) && !empty($data['special_instruction'])){
			$comment .= '_'.$data['special_instruction'];
		} else {
			$comment .= '_';
		}
		$subtotal = 0;
		for ($i=0; $i < count($data['product_id']); $i++) {
			if($data['product_id'][$i] == 8826 || $data['product_id'][$i] == 9357){
				$customized  = 1;
			}
			$productDetails = $this->db->query("SELECT * FROM oc_product p, oc_product_description d WHERE p.product_id = d.product_id AND  p.product_id = '".$data['product_id'][$i]."'")->row;
			$productPrice = $data['selectedTypePrice1'][$i] + $data['price'][$i];
			$productPriceTotal = $productPrice * $data['qty'][$i];
			$subtotal = $subtotal + $productPriceTotal;
			if(isset($data['addon'][$i]) && !empty($data['addon'][$i])){
				$addPros = json_decode(html_entity_decode($data['addon'][$i]));
				foreach ($addPros as $key => $value) {
					$productDetails = $this->db->query("SELECT * FROM oc_product p, oc_product_description d WHERE p.product_id = d.product_id AND  p.product_id = '".$key."'")->row;

					$productPrice = $productDetails['price'];
					$productPriceTotal = $productPrice * $value->qty;
					$subtotal = $subtotal + $productPriceTotal;
				}
			}
		}
		
		$slot_forshipping = '';
		$date_forshipping = '';
		$this->db->query("INSERT INTO `" . DB_PREFIX . "order` SET invoice_prefix = '" . $this->db->escape($data['invoice_prefix']) . "', store_id = '" . (int)$data['store_id'] . "', store_name = '" . $this->db->escape($data['store_name']) . "', store_url = '" . $this->db->escape($data['store_url']) . "', customer_id = '0', customer_group_id = '1', firstname = '" . $this->db->escape($data['sender_name']) . "', lastname = '', email = '" . $this->db->escape($data['sender_email']) . "', telephone = '" . $this->db->escape($data['sender_phone']) . "', fax = '', custom_field = 'transaction_id: " . $this->db->escape($data['transaction_id']) . "', payment_firstname = '" . $this->db->escape($data['sender_name']) . "', payment_lastname = '', payment_email= '" . $this->db->escape($data['sender_email']) . "', payment_mobile= '" . $this->db->escape($data['sender_phone']) . "', payment_company = '', payment_address_1 = '', payment_address_2 = '', payment_city = '', payment_postcode = '', payment_country = '', payment_country_id = '', payment_zone = '', payment_zone_id = '', payment_address_format = '', payment_custom_field = '[]', payment_method = '" . $this->db->escape($data['payment_method']) . "', payment_code = '" . $this->db->escape($data['payment_method']) . "', shipping_firstname = '" . $this->db->escape($data['receiver_name']) . "', shipping_lastname = '', shipping_company = '', shipping_address_1 = '" . $this->db->escape($data['receiver_address']) . "', shipping_address_2 = '', shipping_phone = '" . $this->db->escape($data['receiver_phone']) . "', shipping_city = '', shipping_postcode = '" . $this->db->escape($data['receiver_pincode']) . "', shipping_country = 'India', shipping_country_id = '99', shipping_zone = 'Delhi', shipping_zone_id = '1475', shipping_address_format = '', shipping_custom_field = '[]', shipping_method = 'Free Shipping', shipping_code = 'free.free', comment = '" .  $this->db->escape($comment) . "', total = '0', affiliate_id = '".$customized."', commission = '0.00', marketing_id = '0', tracking = '', language_id = '1', currency_id = '4', currency_code = 'INR', currency_value = '1.00000000', ip = '" . $this->db->escape($data['ip']) . "', forwarded_ip = '" .  $this->db->escape($data['forwarded_ip']) . "', user_agent = '" . $this->db->escape($data['user_agent']) . "', accept_language = '" . $this->db->escape($data['accept_language']) . "', mr_mrs = '" . $this->db->escape($data['sender_mr_mrs']) . "', phone_code = '+91', payment_mr_mrs = '" . $this->db->escape($data['sender_mr_mrs']) . "', payment_phone_code = '+91', shipping_mr_mrs = '" . $this->db->escape($data['receiver_mr_mrs']) . "', shipping_phone_code = '+91', date_added = NOW(), date_modified = NOW()". ", date_forshipping = '', is_admin_order = 1, added_by = '".$this->user->getId()."'");

		$order_id = $this->db->getLastId();
		$receipntcity = '';

		$ttax = 0;
		$dis = 0;
		if(isset($data['discount']) && !empty($data['discount'])){
			$dis = $data['discount'];
		}

		$shipCity = '';

		for ($i=0; $i < count($data['product_id']); $i++) { 
			$productDetails = $this->db->query("SELECT * FROM oc_product p, oc_product_description d WHERE p.product_id = d.product_id AND  p.product_id = '".$data['product_id'][$i]."'")->row;
			$productPrice = $data['selectedTypePrice1'][$i] + $data['price'][$i];
			$productPriceTotal = $productPrice * $data['qty'][$i];
			
			$aa1 = ($productPriceTotal / $subtotal) * 100;
      		$aa2 = ($aa1 / 100) * $dis;
      		$aa3 = $productPriceTotal - $aa2;
      		$productTax = 0;
	      	if($productDetails['tax_class_id'] == 9){
	        	$ttax = $ttax + ((18 * $aa3) / 100);
	        	$productTax = ((18 * $aa3) / 100);
	      	}

			$shippingInfo = array();
			$shippingInfo['Pincode'] = $data['selectedPincode'][$i];
			$shippingInfo['City'] = $data['citynew'][$i];
			$shippingInfo['Shipping Date'] = date('d-m-Y', strtotime($data['selectedDate1'][$i]));
			$shippingInfo['Shipping Type'] = $data['selectedType1'][$i];
			$shippingInfo['Shipping Time'] = $data['selectedTime1'][$i];
			$shipCity = $shippingInfo['City'];

			$this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET order_id = '" . (int)$order_id . "', product_id = '" . (int)$data['product_id'][$i] . "', name = '" . $this->db->escape($productDetails['name']) . "', model = '" . $this->db->escape($productDetails['model']) . "', quantity = '" . (int)$data['qty'][$i] . "', price = '" . (float)$productPrice  . "', total = '" . (float)$productPriceTotal . "', tax = '" . (float)$productTax . "', reward = '0', shipping_info = '" . json_encode($shippingInfo) . "', shipping_price = '" . $data['selectedTypePrice1'][$i] . "'");
			$order_product_id = $this->db->getLastId();

			$shippingdateforadminfilter = $data['selectedDate1'][$i];
			$shippingdateforadminfiltertime = $data['selectedTime1'][$i];
			$shippingdateforadminfilter1 = date("Y-m-d", strtotime($shippingdateforadminfilter));

			$slot_forshipping = $shippingdateforadminfiltertime;
			$date_forshipping = $shippingdateforadminfilter1;
			//$this->db->query("INSERT INTO " . DB_PREFIX . "order_delivery_date SET order_id = '" . (int)$order_id . "', 	delivery_date = '" . $this->db->escape($shippingdateforadminfilter1) . "'");
			//$this->db->query("INSERT INTO " . DB_PREFIX . "order_delivery_slot SET order_id = '" . (int)$order_id . "', 	slot = '" . $this->db->escape($shippingdateforadminfiltertime) . "'");

			if(isset($data['flavour'][$i]) && !empty($data['flavour'][$i])){
				$productFlavourDetails = $this->db->query("SELECT * FROM oc_product_option_value p WHERE p.product_id = '".$data['product_id'][$i]."' AND p.option_id = 5 AND p.option_value_id = '".$data['flavour'][$i]."'")->row;

				$flavourNeed = $this->db->query("SELECT * FROM oc_option_value_description p WHERE p.option_value_id = '".$data['flavour'][$i]."'")->row;
				$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', product_option_id = '" . (int)$productFlavourDetails['product_option_id'] . "', product_option_value_id = '" . (int)$productFlavourDetails['product_option_value_id'] . "', name = 'Flavor', `value` = '" . $this->db->escape($flavourNeed['name']) . "', `type` = 'select'");
			}

			if(isset($data['card_message'][$i]) && !empty($data['card_message'][$i])){
				$productCMDetails = $this->db->query("SELECT * FROM oc_product_option p WHERE p.product_id = '".$data['product_id'][$i]."' AND p.option_id = 13")->row;

				$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', product_option_id = '" . (int)$productCMDetails['product_option_id'] . "', product_option_value_id = '0', name = 'Only 30 Characters allowed', `value` = '" . $this->db->escape($data['card_message'][$i]) . "', `type` = 'textarea'");
			}

			if(isset($data['weight'][$i]) && !empty($data['weight'][$i])){
				$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', product_option_id = '" . (int)$data['product_option_id'][$i] . "', product_option_value_id = '".$data['product_option_value_id'][$i]."', name = 'Weight', `value` = '" . $this->db->escape($data['weight'][$i]) . "', `type` = 'radio'");
			}

			if(isset($imagePro[$i]['name']) && !empty($imagePro[$i]['name'])){
				$productCMDetails = $this->db->query("SELECT * FROM oc_product_option p WHERE p.product_id = '".$data['product_id'][$i]."' AND p.option_id = 7")->row;

				$this->db->query("INSERT INTO `" . DB_PREFIX . "upload` SET `name` = '" . $this->db->escape($imagePro[$i]['name']) . "', `filename` = '" . $this->db->escape($imagePro[$i]['filename']) . "', `code` = '" . $this->db->escape($imagePro[$i]['code']) . "', `date_added` = NOW()");

				$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', product_option_id = '" . (int)$productCMDetails['product_option_id'] . "', product_option_value_id = '0', name = 'Upload Image', `value` = '".$imagePro[$i]['code']."', `type` = 'file'");
			}

		}

		for ($i=0; $i < count($data['product_id']); $i++) {
			if(isset($data['addon'][$i]) && !empty($data['addon'][$i])){
				$addPros = json_decode(html_entity_decode($data['addon'][$i]));
				foreach ($addPros as $key => $value) {
					$productDetails = $this->db->query("SELECT * FROM oc_product p, oc_product_description d WHERE p.product_id = d.product_id AND  p.product_id = '".$key."'")->row;

					$productPrice = $productDetails['price'];
					$productPriceTotal = $productPrice * $value->qty;
					
					$aa1 = ($productPriceTotal / $subtotal) * 100;
		      		$aa2 = ($aa1 / 100) * $dis;
		      		$aa3 = $productPriceTotal - $aa2;
		      		$productTax = 0;
			      	if($productDetails['tax_class_id'] == 9){
			        	$ttax = $ttax + ((18 * $aa3) / 100);
			        	$productTax = ((18 * $aa3) / 100);
			      	}

					$shippingInfo = array();

					$this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET order_id = '" . (int)$order_id . "', product_id = '" . (int)$productDetails['product_id'] . "', name = '" . $this->db->escape($productDetails['name']) . "', model = '" . $this->db->escape($productDetails['model']) . "', quantity = '" . (int)$value->qty . "', price = '" . (float)$productPrice  . "', total = '" . (float)$productPriceTotal . "', tax = '" . (float)$productTax . "', reward = '0', shipping_info = '" . json_encode($shippingInfo) . "', shipping_price = '0'");
					$order_product_id = $this->db->getLastId();
				}
			}
		}

		$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = 'sub_total', title = 'Sub-Total', `value` = '" . (float)$subtotal . "', sort_order = '1'");
		$shipping = 0;
		$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = 'shipping', title = 'Free Shipping', `value` = '" . (float)$shipping . "', sort_order = '3'");
		$discount = 0;
		if(isset($data['discount']) && !empty($data['discount'])){
			$discount = $data['discount'];
			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = 'coupon', title = 'Coupon (Backend Order)', `value` = '-" . (float)$discount . "', sort_order = '4'");
		}
		$subtotalmain = $subtotal - $discount;
		$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = 'tax', title = 'GST (18%)', `value` = '" . (float)$ttax . "', sort_order = '4'");
		$ttotal = $subtotalmain + $ttax;
		$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = 'total', title = 'Total', `value` = '" . (float)$ttotal . "', sort_order = '9'");
		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET shipping_city = '".$shipCity."' , total = '".$ttotal."', slot_forshipping = '".$slot_forshipping."', date_forshipping = '".$date_forshipping."' WHERE order_id = '".$order_id."'");
		
	}

	public function getShipingDetails(){
		$city = $this->db->query("SELECT DISTINCT(display_name) FROM oc_shipping_cities WHERE status = 1")->rows;
		$type = $this->db->query("SELECT name, shipping_charge FROM oc_shipping_type WHERE active = 1")->rows;
		$slots = $this->db->query("SELECT * FROM oc_timeslot_shipping WHERE status = 1")->rows;
		return array('city' => $city, 'type' => $type, 'slots' => $slots);
	}

	public function updateShippingAddress($data) {
		$orderDeatils = $this->getOrder($data['order_id']);
		$saveData = array();
		$saveData['mr_mrs'] = $orderDeatils['shipping_mr_mrs'];
		$saveData['name'] = $orderDeatils['shipping_firstname'];
		$saveData['address'] = $orderDeatils['shipping_address_1'];
		$saveData['phone_code'] = $orderDeatils['shipping_phone_code'];
		$saveData['mobile'] = $orderDeatils['shipping_phone'];
		$saveData['city'] = $orderDeatils['shipping_city'];
		$saveData['postcode'] = $orderDeatils['shipping_postcode'];

		$this->db->query("INSERT INTO " . DB_PREFIX . "order_update_history SET order_id = '" . $data['order_id'] . "', event = 'ShippingAddress', data = '".json_encode($saveData)."', `added_by` = '" . $this->user->getId() . "', added_at=NOW()");

		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET shipping_mr_mrs='".$data['shipping_mr_mrs']."', shipping_firstname='".$data['shipping_firstname']."', shipping_address_1='".$data['shipping_address_1']."', shipping_phone_code='".$data['shipping_phone_code']."', shipping_phone='".$data['shipping_phone']."', shipping_city='".$data['shipping_city']."', shipping_postcode='".$data['shipping_postcode']."' WHERE order_id = '".$data['order_id']."'");
	}


	public function updatePaymentAddress($data) {
		$orderDeatils = $this->getOrder($data['order_id']);
		$saveData = array();
		$saveData['mr_mrs'] = $orderDeatils['payment_mr_mrs'];
		$saveData['name'] = $orderDeatils['payment_firstname'];
		$saveData['email'] = $orderDeatils['payment_email'];
		$saveData['phone_code'] = $orderDeatils['payment_phone_code'];
		$saveData['mobile'] = $orderDeatils['payment_mobile'];
		$saveData['city'] = $orderDeatils['shipping_city'];
		$saveData['postcode'] = $orderDeatils['shipping_postcode'];

		$this->db->query("INSERT INTO " . DB_PREFIX . "order_update_history SET order_id = '" . $data['order_id'] . "', event = 'ShippingAddress', data = '".json_encode($saveData)."', `added_by` = '" . $this->user->getId() . "', added_at=NOW()");

		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET payment_mr_mrs='".$data['payment_mr_mrs']."', payment_firstname='".$data['payment_firstname']."', payment_email='".$data['payment_email']."', payment_phone_code='".$data['payment_phone_code']."', payment_mobile='".$data['payment_mobile']."' WHERE order_id = '".$data['order_id']."'");
	}

	public function updateProductShippingInfo($data){

		//echo "<pre />"; print_r($data); die();
		$olddd = $this->db->query("SELECT shipping_info, price, shipping_price, quantity, product_id, order_id FROM oc_order_product WHERE order_product_id = '".$data['order_product_id']."'")->row;

		$oldPrice = $olddd['price'] - $olddd['shipping_price'];
		$newPrice = ($oldPrice + $data['ship_price']) * $olddd['quantity'];

		

		$dd = (array)json_decode($olddd['shipping_info']);

		$dd['Old Product Price'] = $oldPrice;
		$dd['Old Ship Price'] = $olddd['shipping_price'];
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "order_update_history SET order_id = '" . $data['order_id'] . "', order_product_id = '" . $data['order_product_id'] . "', event = 'ProductShippingInfo', data = '".json_encode($dd)."', `added_by` = '" . $this->user->getId() . "', added_at=NOW()");
		
		$saveData = array();
		$saveData['Pincode'] = $data['pincode'];
		$saveData['City'] = $data['city'];
		$saveData['Shipping Date'] = $data['date'];
		$saveData['Shipping Type'] = $data['type'];
		$saveData['Shipping Time'] = $data['slots'];

		$shipCity = $data['city']; 
		$slot_forshipping = $data['slots'];
		$date_forshipping = date("Y-m-d", strtotime($data['date']));

		$productDetails = $this->db->query("SELECT * FROM oc_product WHERE product_id = '".$olddd['product_id']."'")->row;
		
		if(!empty($productDetails) && $productDetails['tax_class_id'] == 9){
			$tax = ($newPrice*(18/100));
		} else {
			$tax = 0;
		}
		//echo $newPrice.'---'.$tax; die();

		$this->db->query("UPDATE oc_order_product set shipping_price = '".$data['ship_price']."', price = '".$newPrice."', shipping_info = '".json_encode($saveData)."', total = '".($newPrice) ."', tax = '".$tax."' WHERE order_product_id = '".$data['order_product_id']."'");
		//echo "<pre />"; print_r($dd); print_r($data); die();

		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET shipping_city = '".$shipCity."', slot_forshipping = '".$slot_forshipping."', date_forshipping = '".$date_forshipping."' WHERE order_id = '".$olddd['order_id']."'");
		$this->calculateTotalAgain($olddd['order_id']);
	}

	public function updateproductprice($data){
		$olddd = $this->db->query("SELECT shipping_info, price, shipping_price, quantity, product_id, order_id FROM oc_order_product WHERE order_product_id = '".$data['order_product_id']."'")->row;
		$oldPrice = $olddd['price'];
		if($data['type'] == '+'){
			$newPrice = $oldPrice + $data['price'];
		} else {
			$newPrice = $oldPrice - $data['price'];
		}
		$newPrice1 = $newPrice;
		$newPrice = $newPrice * $olddd['quantity'];

		$productDetails = $this->db->query("SELECT * FROM oc_product WHERE product_id = '".$olddd['product_id']."'")->row;
		
		if(!empty($productDetails) && $productDetails['tax_class_id'] == 9){
			$tax = ($newPrice*(18/100));
		} else {
			$tax = 0;
		}

		$this->db->query("UPDATE oc_order_product set price = '".$newPrice1."', total = '".($newPrice) ."', tax = '".$tax."' WHERE order_product_id = '".$data['order_product_id']."'");

		$saveData = array();
		$saveData['Old Price'] = $oldPrice;
		$saveData['New Price'] = $newPrice1;

		$this->db->query("INSERT INTO " . DB_PREFIX . "order_update_history SET order_id = '" . $data['order_id'] . "', order_product_id = '" . $data['order_product_id'] . "', event = 'ProductPrice', data = '".json_encode($saveData)."', `added_by` = '" . $this->user->getId() . "', added_at=NOW()");

		$this->calculateTotalAgain($data['order_id']);
	}

	private function calculateTotalAgain($order_id){
		$allProducts = $this->db->query("SELECT * FROM oc_order_product WHERE order_id = '".$order_id."'")->rows;
		$allTotal = $this->db->query("SELECT * FROM oc_order_total WHERE order_id = '".$order_id."'")->rows;
		$this->db->query("DELETE FROM  oc_order_delivery_slot WHERE order_id = '".$order_id."'");
		$this->db->query("DELETE FROM  oc_order_delivery_date WHERE order_id = '".$order_id."'");
		$subtotal = 0;
		$taxtotal = 0;
		$discount = 0;
		foreach ($allProducts as $pro) {
			$dd = (array)json_decode($pro['shipping_info']);
			if(isset($dd) && !empty($dd)){
				$this->db->query("INSERT INTO oc_order_delivery_slot SET slot = '" . $dd['Shipping Time'] . "', order_id = '" . (int)$order_id . "'");
				$this->db->query("INSERT INTO oc_order_delivery_date SET delivery_date = '" . date('Y-m-d', strtotime($dd['Shipping Date'])) . "', order_id = '" . (int)$order_id . "'");
			}
			$subtotal = $pro['price'] + $subtotal;
			$taxtotal = $pro['tax'] + $taxtotal;
		}

		foreach ($allTotal as $total) {
			if($total['code'] == 'coupon'){
				$cc = explode(' ', $total['title']);
				$couponcode = str_replace('(', '', $cc[1]);
				$couponcode = str_replace(')', '', $couponcode);
				$couponDetails = $this->db->query("SELECT * from oc_coupon WHERE name = '".$couponcode."'")->row;
				if($couponDetails['type'] == 'P'){
					$discount = ($subtotal*($couponDetails['discount']/100));
				} elseif ($couponDetails['type'] == 'F') {
					$discount = $subtotal - $couponDetails['discount'];
				} else {
					$discount = 0;
				}
			}
		}
		$orderTotal = 0;
		foreach ($allTotal as $total) {
			$value = 0;

			if($total['code'] == 'sub_total'){
				$value = $subtotal;
			}

			if($total['code'] == 'coupon'){
				$value = $discount;
			}

			if($total['code'] == 'tax'){
				$value = $taxtotal;
			}

			if($total['code'] == 'total'){
				$value = $subtotal + $taxtotal - $discount;
				$orderTotal = $value;
			}
			if($value > 0){
				$this->db->query("UPDATE oc_order_total set code = '".$total['code']."', value = '".$value."' WHERE order_total_id = '".$total['order_total_id']."'");	
			}
		}
		$this->db->query("UPDATE oc_order set total = '".$orderTotal."' WHERE order_id = '".$order_id."'");

		//echo "<pre />"; print_r($allTotal);
		//echo $order_id.'-----'.$subtotal.'-----'.$taxtotal; die();
	}

	public function getOrderUpdateHistory($order_id){
		$data = $this->db->query("SELECT h.*, concat(u.firstname,' ', u.lastname) name FROM oc_order_update_history h inner join oc_user u on h.added_by = u.user_id WHERE order_id = '".$order_id."' order by id desc")->rows;
		return $data;
	}

	public function getProductOptionsInOrder($product_id){
		$product_option_data = array();
		$product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");

		foreach ($product_option_query->rows as $product_option) {
			$product_option_value_data = array();

			$product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$product_id . "' AND pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");

			foreach ($product_option_value_query->rows as $product_option_value) {
				$product_option_value_data[] = array(
					'product_option_value_id' => $product_option_value['product_option_value_id'],
					'option_value_id'         => $product_option_value['option_value_id'],
					'name'                    => $product_option_value['name'],
					'image'                   => $product_option_value['image'],
					'quantity'                => $product_option_value['quantity'],
					'subtract'                => $product_option_value['subtract'],
					'price'                   => $product_option_value['price'],
					'price_prefix'            => $product_option_value['price_prefix'],
					'weight'                  => $product_option_value['weight'],
					'weight_prefix'           => $product_option_value['weight_prefix']
				);
			}
			$product_option_data[] = array(
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['name'],
				'type'                 => $product_option['type'],
				'value'                => $product_option['value'],
				'required'             => $product_option['required']
			);
		}

		return $product_option_data;
	}

	public function updateproductoptioninfo($data){
		$saveData = array();
		if(isset($data['weight']) && !empty($data['weight'])){
			$mainWeight = $this->db->query("select pov.*, ovd.name from  oc_product_option_value pov inner join oc_option_value_description ovd on ovd.option_value_id = pov.option_value_id where product_option_value_id = '".$data['weight']."'")->row;
			$orderWeight = $this->db->query("SELECT op.price, oo.product_option_value_id, pov.price oprice, op.quantity, p.tax_class_id, oo.value FROM oc_order_product op inner join oc_order_option oo on op.order_product_id = oo.order_product_id inner join oc_product_option_value pov on oo.product_option_value_id = pov.product_option_value_id inner join oc_product p on op.product_id = p.product_id WHERE oo.order_id = '".$data['order_id']."' AND oo.order_product_id = '".$data['order_product_id']."' AND oo.product_option_id = '".$mainWeight['product_option_id']."'")->row;
			$saveData['Old Weight'] = $orderWeight['value'];
			$saveData['New Weight'] = $mainWeight['name'];
			if(isset($orderWeight) && !empty($orderWeight)){
				if($orderWeight['product_option_value_id'] != $mainWeight['product_option_value_id']){
					$newPrice = $orderWeight['price'] - $orderWeight['oprice'] + $mainWeight['price'];
					$newPrice1 = $newPrice;
					$newPrice = $newPrice * $orderWeight['quantity'];
					if(!empty($orderWeight) && $orderWeight['tax_class_id'] == 9){
						$tax = ($newPrice*(18/100));
					} else {
						$tax = 0;
					}
					
					$this->db->query("UPDATE oc_order_product set price = '".$newPrice1."', total = '".($newPrice) ."', tax = '".$tax."' WHERE order_product_id = '".$data['order_product_id']."'");
					$this->db->query("UPDATE oc_order_option SET value = '".$mainWeight['name']."', product_option_value_id = '".$mainWeight['product_option_value_id']."' WHERE order_id = '".$data['order_id']."' AND order_product_id = '".$data['order_product_id']."' AND product_option_id = '".$mainWeight['product_option_id']."'");
					$this->calculateTotalAgain($data['order_id']);
				}
			} else {
				//insert
			}
		}

		if(isset($data['flavour']) && !empty($data['flavour'])){
			$mainWeight = $this->db->query("select pov.*, ovd.name from  oc_product_option_value pov inner join oc_option_value_description ovd on ovd.option_value_id = pov.option_value_id where product_option_value_id = '".$data['flavour']."'")->row;
			$orderWeight = $this->db->query("SELECT op.price, oo.product_option_value_id, pov.price oprice, op.quantity, p.tax_class_id, oo.value FROM oc_order_product op inner join oc_order_option oo on op.order_product_id = oo.order_product_id inner join oc_product_option_value pov on oo.product_option_value_id = pov.product_option_value_id inner join oc_product p on op.product_id = p.product_id  WHERE oo.order_id = '".$data['order_id']."' AND oo.order_product_id = '".$data['order_product_id']."' AND oo.product_option_id = '".$mainWeight['product_option_id']."'")->row;
			$saveData['Old Flavour'] = $orderWeight['value'];
			$saveData['New Flavour'] = $mainWeight['name'];
			if(isset($orderWeight) && !empty($orderWeight)){
				if($orderWeight['product_option_value_id'] != $mainWeight['product_option_value_id']){
					$newPrice = $orderWeight['price'] - $orderWeight['oprice'] + $mainWeight['price'];
					$newPrice1 = $newPrice;
					$newPrice = $newPrice * $orderWeight['quantity'];
					if(!empty($orderWeight) && $orderWeight['tax_class_id'] == 9){
						$tax = ($newPrice*(18/100));
					} else {
						$tax = 0;
					}
					$this->db->query("UPDATE oc_order_product set price = '".$newPrice1."', total = '".($newPrice) ."', tax = '".$tax."' WHERE order_product_id = '".$data['order_product_id']."'");
					$this->db->query("UPDATE oc_order_option SET value = '".$mainWeight['name']."', product_option_value_id = '".$mainWeight['product_option_value_id']."' WHERE order_id = '".$data['order_id']."' AND order_product_id = '".$data['order_product_id']."' AND product_option_id = '".$mainWeight['product_option_id']."'");
					$this->calculateTotalAgain($data['order_id']);
				}
			} else {
				//insert
			}
		}
		
		if(isset($data['cakemessage']) && !empty($data['cakemessage'])){

			$cake = $this->db->query("SELECT * FROM oc_order_option WHERE order_id = '".$data['order_id']."' AND order_product_id = '".$data['order_product_id']."' AND type = 'textarea'")->row;
			$saveData['Old Cake Message'] = $cake['value'];
			$saveData['New Cake Message'] = $data['cakemessage'];
			if(isset($cake) && !empty($cake)){
				$this->db->query("UPDATE oc_order_option SET value = '".$data['cakemessage']."' WHERE order_id = '".$data['order_id']."' AND order_product_id = '".$data['order_product_id']."' AND product_option_id = '".$data['cakemessageid']."'");	
			} else {
				$this->db->query("INSERT INTO oc_order_option SET value = '".$data['cakemessage']."', order_id = '".$data['order_id']."', order_product_id = '".$data['order_product_id']."', product_option_id = '".$data['cakemessageid']."', name = 'Only 30 Characters allowed', type='textarea'");
			}
			
		}
		$this->db->query("INSERT INTO " . DB_PREFIX . "order_update_history SET order_id = '" . $data['order_id'] . "', order_product_id = '" . $data['order_product_id'] . "', event = 'ProductOptions', data = '".json_encode($saveData)."', `added_by` = '" . $this->user->getId() . "', added_at=NOW()");
		//echo "<pre />"; print_r($data); die();
	}

	public function getCustomizedOrderForApproval(){
		$orders  = $this->db->query("SELECT * FROM oc_order where marketing_id=0 AND order_status_id=5 AND affiliate_id=1")->rows;
		$all = array();
		foreach ($orders as $order) {
			$added_by = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '".$order['added_by']."'")->row;	
			$order['added_by_name'] = $added_by['firstname'].' '.$added_by['lastname'];
			$all[] = $order;
		}
		return $all;
	}

	public function approvorder($data){
		$this->db->query("UPDATE oc_order set marketing_id='1', order_status_id='17' WHERE order_id = '".$data['order_id']."'");
		$this->db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" . (int)$data['order_id'] . "', order_status_id = '17', notify = '0', created_by = '".$this->user->getId()."', comment = '', date_added = NOW()");	
	}

	public function getProductAttributes($product_id) {
		$product_attribute_group_data = array();

		$product_attribute_group_query = $this->db->query("SELECT ag.attribute_group_id, agd.name FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (a.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) WHERE pa.product_id = '" . (int)$product_id . "' AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY ag.attribute_group_id ORDER BY ag.sort_order, agd.name");

		foreach ($product_attribute_group_query->rows as $product_attribute_group) {
			$product_attribute_data = array();

			$product_attribute_query = $this->db->query("SELECT a.attribute_id, ad.name, pa.text FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE pa.product_id = '" . (int)$product_id . "' AND a.attribute_group_id = '" . (int)$product_attribute_group['attribute_group_id'] . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY a.sort_order, ad.name");

			foreach ($product_attribute_query->rows as $product_attribute) {
				$product_attribute_data[] = array(
					'attribute_id' => $product_attribute['attribute_id'],
					'name'         => $product_attribute['name'],
					'text'         => $product_attribute['text']
				);
			}

			$product_attribute_group_data[] = array(
				'attribute_group_id' => $product_attribute_group['attribute_group_id'],
				'name'               => $product_attribute_group['name'],
				'attribute'          => $product_attribute_data
			);
		}

		return $product_attribute_group_data;
	}

	public function getVendorDetails($vendor_id){
		return $this->db->query("SELECT * FROM oc_user WHERE user_id = '".$vendor_id."'")->row;
	}

	public function getMainProductFromOrder($order_id){
		return $this->db->query("SELECT * FROM oc_order_product WHERE order_id = '".$order_id."' AND shipping_info != '[]'")->row;
	}

	public function sendEmailToVendor($mailbody, $subject, $email){
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
		$sendemailuser = $vendorDetail['email'];
		$mail->setTo($email);
		//$mail->setTo('udit.niec@gmail.com');
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode('Flavoursguru', ENT_QUOTES, 'UTF-8'));
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml($mailbody);
		$mail->send();
	}

}
