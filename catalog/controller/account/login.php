<?php
class ControllerAccountLogin extends Controller {
	private $error = array();

	public function index() {
		$this->load->model('account/customer');
		// Login override for admin users
		if (!empty($this->request->get['token'])) {
			$this->customer->logout();
			$this->cart->clear();

			unset($this->session->data['order_id']);
			unset($this->session->data['payment_address']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['shipping_address']);
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['comment']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);

			$customer_info = $this->model_account_customer->getCustomerByToken($this->request->get['token']);

			if ($customer_info && $this->customer->login($customer_info['email'], '', true)) {
				// Default Addresses
				$this->load->model('account/address');

				if ($this->config->get('config_tax_customer') == 'payment') {
					$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
				}

				if ($this->config->get('config_tax_customer') == 'shipping') {
					$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
				}

				$this->response->redirect($this->url->link('account/account', '', true));
			}
		}

		if ($this->customer->isLogged()) {
			$this->response->redirect($this->url->link('account/account', '', true));
		}

		$this->load->language('account/login');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			// Unset guest
			unset($this->session->data['guest']);

			// Default Shipping Address
			$this->load->model('account/address');

			if ($this->config->get('config_tax_customer') == 'payment') {
				$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
			}

			if ($this->config->get('config_tax_customer') == 'shipping') {
				$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
			}

			// Wishlist
			if (isset($this->session->data['wishlist']) && is_array($this->session->data['wishlist'])) {
				$this->load->model('account/wishlist');

				foreach ($this->session->data['wishlist'] as $key => $product_id) {
					$this->model_account_wishlist->addWishlist($product_id);

					unset($this->session->data['wishlist'][$key]);
				}
			}

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
				);

				$this->model_account_activity->addActivity('login', $activity_data);
			}

			// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
			if (isset($this->request->post['redirect']) && $this->request->post['redirect'] != $this->url->link('account/logout', '', true) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
				$this->response->redirect(str_replace('&amp;', '&', $this->request->post['redirect']));
			} else {
				$this->response->redirect($this->url->link('account/account', '', true));
			}
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_login'),
			'href' => $this->url->link('account/login', '', true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_new_customer'] = $this->language->get('text_new_customer');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_register_account'] = $this->language->get('text_register_account');
		$data['text_returning_customer'] = $this->language->get('text_returning_customer');
		$data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
		$data['text_forgotten'] = $this->language->get('text_forgotten');

		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_password'] = $this->language->get('entry_password');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_login'] = $this->language->get('button_login');

		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];

			unset($this->session->data['error']);
		} elseif (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['action'] = $this->url->link('account/login', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['forgotten'] = $this->url->link('account/forgotten', '', true);

		// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
		if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
			$data['redirect'] = $this->request->post['redirect'];
		} elseif (isset($this->session->data['redirect'])) {
			$data['redirect'] = $this->session->data['redirect'];

			unset($this->session->data['redirect']);
		} else {
			$data['redirect'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		$data['social_login']=$this->load->controller('module/advancedlogin',array('type'=>'normal'));

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/login', $data));
	}

	protected function validate() {
		// Check how many login attempts have been made.
		$login_info = $this->model_account_customer->getLoginAttempts($this->request->post['email']);

		if ($login_info && ($login_info['total'] >= $this->config->get('config_login_attempts')) && strtotime('-1 hour') < strtotime($login_info['date_modified'])) {
			$this->error['warning'] = $this->language->get('error_attempts');
		}

		// Check if customer has been approved.
		$customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post['email']);

		if ($customer_info && !$customer_info['approved']) {
			$this->error['warning'] = $this->language->get('error_approved');
		}

		if (!$this->error) {
			$rslt = $this->customer->loginNew($this->request->post['email'], $this->request->post['password']);
			if ($rslt == 0) {
				$this->error['warning'] = 'Warning: Email does not exist!'; 
				$this->model_account_customer->addLoginAttempt($this->request->post['email']);					
			} elseif ($rslt == 2) {
				$this->error['warning'] = 'Warning: Incorrect password!'; 
				$this->model_account_customer->addLoginAttempt($this->request->post['email']);					
			} else {
				$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
			}
		}

		return !$this->error;
	}

	
	public function validateemail(){
		$response = [];
		$this->load->model('account/customer');
		$data = array();
		if (isset($this->request->post['email'])) {
			$rows = $this->model_account_customer->validateEmail($this->request->post['email']);
			if($rows) {
				$response['status'] = 1;
				$response['email'] = $this->request->post['email'];
			}
			else {
				$response['status'] = 0;
				$response['email'] = $this->request->post['email'];
			}
			echo json_encode($response);
		}	
	}

	public function sendloginotp() {
		$response = [];
		$this->load->model('account/customer');
		if(isset($this->request->post['email'])) {
			$email = $this->request->post['email'];
			$rows = $this->model_account_customer->validateEmail($this->request->post['email']);
			if($rows) {
				$mobile = $rows['telephone']; 
				$otp = rand(100000,999999);
				$this->model_account_customer->saveOtp($mobile, $otp);
				$mailSend = $this->model_account_customer->sendEmailOTP($email, $otp);
				$smsSend = $this->model_account_customer->sendSMSOTP($mobile, $otp);
				$response['status'] = 1;
				$response['email'] = $this->request->post['email'];
				$response['mobile'] = $mobile;
				//$response['smsResponse'] = $smsSend; 
				$response['message'] = "Please Enter verification code (OTP) sent to <br> $email and $mobile";
			}
			else {
				$response['status'] = 0;
				$response['email'] = $this->request->post['email'];
				$response['message'] = 'Invalid email Id';
			}
			echo json_encode($response);
		}
	}

	public function sendOtpOnRegistration() {
		$this->load->model('account/customer');
		$mobile = $this->request->post['mobile']; 
		$rows = $this->model_account_customer->validateMobile($mobile);
		if($rows) {
			$response['status'] = 0;
			$response['message'] = $mobile." number is already registered with some another account. Please enter some other number.";	
			echo json_encode($response);
			die;
		}
		$email = $this->request->post['email']; 
		$otp = rand(1000,9999);
		$this->model_account_customer->saveOtp($mobile, $otp);
		$smsSend = $this->model_account_customer->sendSMSOTP($mobile, $otp);
		$mailSend = $this->model_account_customer->sendEmailOTP($email, $otp);
		$response['status'] = 1;
		
		$parts = str_split($mobile, 2);
		$number = $parts[0] .'******'.$parts[4];
		$response['mobile'] = $number;
		$response['otp'] = $otp;
		//$response['smsResponse'] = $smsSend; 
		$response['message'] = "Please Enter verification code (OTP) sent to <br> $email and $mobile";	
		echo json_encode($response);
	}
	
	public function sendEmailMobileLoginOtp() {
		$response = [];
		$this->load->model('account/customer');
		if(isset($this->request->post['email'])) {
			$email = $this->request->post['email'];
			$rows = $this->model_account_customer->validateEmailMobile($this->request->post['email']);
			if($rows) {
				if($rows['telephone'] && !empty($rows['telephone']) && $rows['telephone'] != 'null'){
					$mobile = $rows['telephone']; 
					$otp = rand(1000,9999);
					$this->model_account_customer->saveOtp($mobile, $otp);
					$mailSend = $this->model_account_customer->sendEmailOTP($email, $otp);
					$smsSend = $this->model_account_customer->sendSMSOTP($mobile, $otp);
					$response['status'] = 1;
					$response['email'] = $this->request->post['email'];
					$parts = str_split($mobile, 2);
	  				$number = $parts[0] .'******'.$parts[4];
	  				$response['mobile'] = $number;
	  				$response['actualMobile'] = $mobile;
	  				$response['otp'] = $otp;
					//$response['smsResponse'] = $smsSend; 
					$response['message'] = "Please Enter verification code (OTP) sent to <br> $email and $mobile";
				} else {
					$response['status'] = 2;
					$response['email'] = $this->request->post['email'];
					$response['message'] = 'Mobile number not exist!';	
					$response['name'] = $rows['firstname'].' '.$rows['lastname'];	
				}
			}
			else {
				$response['status'] = 0;
				$response['email'] = $this->request->post['email'];
				$response['message'] = 'Invalid email Id!';
			}
			echo json_encode($response);
		}
	}

	public function validatelogin() {
		$response = []; 
		$this->load->model('account/customer');
		if(isset($this->request->post['registration']) && $this->request->post['registration'] == 1){
			$mobile = $this->request->post['gst_phone'];
			$otp = $this->request->post['otp'];
			$otpVerified = $this->model_account_customer->verifyOTP($mobile, $otp);
			if($otpVerified) {
				$registerData = [];
				$registerData['firstname'] = $this->request->post['gst_name'];
				$registerData['email'] = $this->request->post['gst_email'];
				$registerData['telephone'] = $this->request->post['gst_phone'];
				$registerData['telephone_code'] = $this->request->post['gst_code'];
				$registerData['password'] = $otp;
				$customer_id = $this->model_account_customer->addCustomer($registerData);
				$this->customer->login($registerData['email'], $registerData['password']);
				$response['status'] = 1;
				$response['message'] = 'Login with OTP successful.';
			} else {
				$response['status'] = 0;
				$response['message'] = 'Please enter valid OTP.';
			}
		} else if(isset($this->request->post['registration']) && $this->request->post['registration'] == 2){
			$mobile = $this->request->post['gst_phone'];
			$email = $this->request->post['gst_email'];
			$otp = $this->request->post['otp'];
			$otpVerified = $this->model_account_customer->verifyOTP($mobile, $otp);
			if($otpVerified) {
				$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE email = '" . $this->db->escape($email) . "' AND status = '1'");
				$this->db->query("UPDATE " . DB_PREFIX . "customer SET language_id = '" . (int)$this->config->get('config_language_id') . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', telephone = '".$mobile."' WHERE customer_id = '" . (int)$customer_query->row['customer_id'] . "'");

				$this->session->data['customer_id'] = $customer_query->row['customer_id'];
				$this->session->data['customer_group_id'] = $customer_query->row['customer_group_id'];

				unset($this->session->data['guest']);

				// Default Shipping Address
				$this->load->model('account/address');
				if ($this->config->get('config_tax_customer') == 'payment') {
					$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
				}
				if ($this->config->get('config_tax_customer') == 'shipping') {
					$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
				}

				// Wishlist
				if (isset($this->session->data['wishlist']) && is_array($this->session->data['wishlist'])) {
					$this->load->model('account/wishlist');
					foreach ($this->session->data['wishlist'] as $key => $product_id) {
						$this->model_account_wishlist->addWishlist($product_id);
						unset($this->session->data['wishlist'][$key]);
					}
				}

				// Add to activity log
				if ($this->config->get('config_customer_activity')) {
					$this->load->model('account/activity');
					$activity_data = array(
						'customer_id' => $this->customer->getId(),
						'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
					);
					$this->model_account_activity->addActivity('login', $activity_data);
				}
				$response['status'] = 1;
				$response['url'] = $this->url->link('account/account', '', true);
				$response['message'] = 'Login with OTP successful.';
			} else {
				$response['status'] = 0;
				$response['message'] = 'Please enter valid OTP.';
			}
		} else {
			$mobile = $this->request->post['mobile'];
			$email = $this->request->post['email'];
			$otp = $this->request->post['otp'];
			$otpVerified = $this->model_account_customer->verifyOTP($mobile, $otp);
			if($otpVerified) {
				$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE email = '" . $this->db->escape($email) . "' AND status = '1'");
				$this->db->query("UPDATE " . DB_PREFIX . "customer SET language_id = '" . (int)$this->config->get('config_language_id') . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

				$this->session->data['customer_id'] = $customer_query->row['customer_id'];
				$this->session->data['customer_group_id'] = $customer_query->row['customer_group_id'];

				unset($this->session->data['guest']);

				// Default Shipping Address
				$this->load->model('account/address');
				if ($this->config->get('config_tax_customer') == 'payment') {
					$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
				}
				if ($this->config->get('config_tax_customer') == 'shipping') {
					$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
				}

				// Wishlist
				if (isset($this->session->data['wishlist']) && is_array($this->session->data['wishlist'])) {
					$this->load->model('account/wishlist');
					foreach ($this->session->data['wishlist'] as $key => $product_id) {
						$this->model_account_wishlist->addWishlist($product_id);
						unset($this->session->data['wishlist'][$key]);
					}
				}

				// Add to activity log
				if ($this->config->get('config_customer_activity')) {
					$this->load->model('account/activity');
					$activity_data = array(
						'customer_id' => $this->customer->getId(),
						'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
					);
					$this->model_account_activity->addActivity('login', $activity_data);
				}
				$response['status'] = 1;
				$response['url'] = $this->url->link('account/account', '', true);
				$response['message'] = 'Login with OTP successful.';

				// if (isset($this->request->post['redirect']) && $this->request->post['redirect'] != $this->url->link('account/logout', '', true) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
				// 	$this->response->redirect(str_replace('&amp;', '&', $this->request->post['redirect']));
				// } else {
				// 	$this->response->redirect($this->url->link('account/account', '', true));
				// }
			} else {
				$response['status'] = 0;
				$response['message'] = 'Please enter valid OTP.';
			}
		}
		echo json_encode($response);
		
	}
	
}
