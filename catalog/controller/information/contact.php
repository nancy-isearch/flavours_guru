<?php
class ControllerInformationContact extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('information/contact');

		$this->document->setTitle($this->language->get('heading_title'));

		/*if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			$mail->setTo('sharique@flavoursguru.com');

			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
		//	$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode(sprintf('Enquiry Form', $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			$msg = '<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" style="width:450px; border-top:1px solid #efefef; border-right:1px solid #efefef;">
				<tr>
				   <th style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle">Name</td>
				   <td style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle">'.$this->request->post['name'].'</td>
				 </tr>
				 <tr>
				   <th style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle" scope="col">Order No.</th>
				   <td style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle" scope="col">'.$this->request->post['orderNo'].'</th>
				 </tr>
				 <tr>
				   <th style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle">Mobile No.</td>
				   <td style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle">'.$this->request->post['phone'].'</td>
				 </tr> 
				 <tr>
				   <th style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif;border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle">message</td>
				   <td style="padding:5px; font-size:13px; font-family:Arial, Helvetica, sans-serif; border-bottom:1px solid #efefef; border-left:1px solid #efefef;" align="left" valign="middle">'.$this->request->post['enquiry'].'</td>
				 </tr>
				</table>';
			$mail->setHtml($msg); 
			//$mail->setText($msg);
			$mail->send();

			 $this->response->redirect($this->url->link('information/contact/success'));
		}*/

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/contact')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_location'] = $this->language->get('text_location');
		$data['text_store'] = $this->language->get('text_store');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_telephone'] = $this->language->get('text_telephone');
		$data['text_fax'] = $this->language->get('text_fax');
		$data['text_open'] = $this->language->get('text_open');
		$data['text_comment'] = $this->language->get('text_comment');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_enquiry'] = $this->language->get('entry_enquiry');

		$data['button_map'] = $this->language->get('button_map');

		if (isset($this->error['orderNo'])) {
			$data['error_orderNo'] = $this->error['orderNo'];
		} else {
			$data['error_orderNo'] = '';
		}

		if (isset($this->error['phone'])) {
			$data['error_phone'] = $this->error['phone'];
		} else {
			$data['error_phone'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['enquiry'])) {
			$data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$data['error_enquiry'] = '';
		}

		$data['button_submit'] = $this->language->get('button_submit');

		$data['action'] = $this->url->link('information/contact', '', true);
		$data['link'] = $this->url->link('ordertrack/ordertrack','',true);
		$this->load->model('tool/image');

		if ($this->config->get('config_image')) {
			$data['image'] = $this->model_tool_image->resize($this->config->get('config_image'), $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
		} else {
			$data['image'] = false;
		}

		$data['store'] = $this->config->get('config_name');
		$data['address'] = nl2br($this->config->get('config_address'));
		$data['geocode'] = $this->config->get('config_geocode');
		$data['geocode_hl'] = $this->config->get('config_language');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['fax'] = $this->config->get('config_fax');
		$data['open'] = nl2br($this->config->get('config_open'));
		$data['comment'] = $this->config->get('config_comment');

		$data['locations'] = array();

		$this->load->model('localisation/location');

		foreach((array)$this->config->get('config_location') as $location_id) {
			$location_info = $this->model_localisation_location->getLocation($location_id);

			if ($location_info) {
				if ($location_info['image']) {
					$image = $this->model_tool_image->resize($location_info['image'], $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
				} else {
					$image = false;
				}

				$data['locations'][] = array(
					'location_id' => $location_info['location_id'],
					'name'        => $location_info['name'],
					'address'     => nl2br($location_info['address']),
					'geocode'     => $location_info['geocode'],
					'telephone'   => $location_info['telephone'],
					'fax'         => $location_info['fax'],
					'image'       => $image,
					'open'        => nl2br($location_info['open']),
					'comment'     => $location_info['comment']
				);
			}
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} else {
			$data['name'] = $this->customer->getFirstName();
		}
		if (isset($this->request->post['orderNo'])) {
			$data['orderNo'] = $this->request->post['orderNo'];
		} else {
			$data['orderNo'] = '';
		}
		if (isset($this->request->post['phone'])) {
			$data['phone'] = $this->request->post['phone'];
		} else {
			$data['phone'] = '';
		}
		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = $this->customer->getEmail();
		}

		if (isset($this->request->post['enquiry'])) {
			$data['enquiry'] = $this->request->post['enquiry'];
		} else {
			$data['enquiry'] = '';
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
			$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
		} else {
			$data['captcha'] = '';
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/contact', $data));
	}

	protected function validate() {
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
			$this->error['enquiry'] = $this->language->get('error_enquiry');
		}

		if (empty($this->request->post['phone'])) {
			$this->error['phone'] = 'Phone number is required';
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		return !$this->error;
	}

	public function success() {
		$this->load->language('information/contact');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/contact')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_message'] = $this->language->get('text_success');

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success', $data));
	}

	public function franchise() {
		//echo "<pre />"; print_r($_POST);

		if(isset($_POST) && !empty($_POST)){
			$name = $_POST['name'];
			$email = $_POST['email'];
			$mobile = $_POST['mobile'];
			$city = $_POST['city'];

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			//$mail->setTo('sharique@flavoursguru.com');
			$mail->setTo($email);

			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			$mail->AddAttachment(DIR_IMAGE.'FG_Franchise_Proposal.pdf', '', $encoding = 'base64', $type = 'application/pdf');

		
			$mail->setSubject('Flavoursguru Franchise Programme');
			$msg = '<p>Dear '.$name.',</p> <p>Thanks for showing interest in our franchise programme. <br> Based on your request, please find attached the Flavoursguru Franchise proposal for your reference. Should you need any further information/clarification, please get in touch with us on WhatsApp or call at +91-8130961414.</p><p>Flowerly yours,<br>Team Flavoursguru<br>www.flavoursguru.com</p>';
			$mail->setHtml($msg); 
			//$mail->setText($msg);
			$mail->send();



			$mail1 = new Mail();
			$mail1->protocol = $this->config->get('config_mail_protocol');
			$mail1->parameter = $this->config->get('config_mail_parameter');
			$mail1->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail1->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail1->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail1->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail1->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			$mail1->setTo('sharique@flavoursguru.com');
			//$mail1->setTo('udit.niec@gmail.com');

			$mail1->setFrom($this->config->get('config_email'));
			$mail1->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			$mail1->setSubject('Flavoursguru Franchise Programme');
			$msg = '<table><tr><td>Name</td><td>'.$name.'</td></tr><tr><td>Email</td><td>'.$email.'</td></tr><tr><td>Mobile</td><td>'.$mobile.'</td></tr><tr><td>City</td><td>'.$city.'</td></tr></table>';
			$mail1->setHtml($msg); 
			//$mail->setText($msg);
			$mail1->send();

			echo "<script>alert('Thank you for your interest. Our team will call you soon.')</script>";
			echo "<script>window.location.href = 'https://www.flavoursguru.com/franchise-programme';</script>";
		}
	}

	public function bakinginstitute() {
		if(isset($_POST) && !empty($_POST)){
			$name = $_POST['name'];
			$email = $_POST['email'];
			$mobile = $_POST['mobile'];
			$city = $_POST['city'];

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			//$mail->setTo('sharique@flavoursguru.com');
			$mail->setTo($email);

			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			//$mail->AddAttachment(DIR_IMAGE.'FG_Franchise_Proposal.pdf', '', $encoding = 'base64', $type = 'application/pdf');

		
			$mail->setSubject('Flavoursguru Institute of Baking');
			$msg = '<p>Dear '.$name.',</p> <p>Thank You for your interest in Flavoursguru Institute of Baking. <br> You can expect a call back from our head counselor who should be able help you choose the course which suits you best and will guide you with all your queries. <br>Alternatively you can call us on +91 8130961414.<br><br>Team Flavoursguru<br>www.flavoursguru.com</p>';
			$mail->setHtml($msg); 
			//$mail->setText($msg);
			$mail->send();



			$mail1 = new Mail();
			$mail1->protocol = $this->config->get('config_mail_protocol');
			$mail1->parameter = $this->config->get('config_mail_parameter');
			$mail1->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail1->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail1->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail1->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail1->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			$mail1->setTo('sharique@flavoursguru.com');
			//$mail1->setTo('udit.niec@gmail.com');

			$mail1->setFrom($this->config->get('config_email'));
			$mail1->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			$mail1->setSubject('Flavoursguru Institute of Baking');
			$msg = '<table><tr><td>Name</td><td>'.$name.'</td></tr><tr><td>Email</td><td>'.$email.'</td></tr><tr><td>Mobile</td><td>'.$mobile.'</td></tr><tr><td>City</td><td>'.$city.'</td></tr></table>';
			$mail1->setHtml($msg); 
			//$mail->setText($msg);
			$mail1->send();

			echo "<script>alert('Thank You for showing Interest in FGIB. One of the members from our conceling team will connect with you very shortly.')</script>";
			echo "<script>window.location.href = 'https://www.flavoursguru.com/baking-institute';</script>";
		}
	}
}
