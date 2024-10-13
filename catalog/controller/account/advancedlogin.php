<?php 
class ControllerAccountadvancedlogin extends Controller {
	private $error = array();

	public function index() {

		if ($this->customer->isLogged()) {
			if ($this->config->get('advancedlogin_redirect_advurl')) {
				$this->response->redirect($this->session->data['advurl']);
			}
			else
			{
				$this->response->redirect($this->url->link('account/account', '', 'SSL'));
			}
		}

		

		if(!isset($this->advancedlogin)){		
			require_once(DIR_SYSTEM . 'vendor/facebook-sdk-v5/src/Facebook/autoload.php');

			$this->advancedlogin = new Facebook\Facebook([
				'app_id'  => $this->config->get('advancedlogin_apikey'),
				'app_secret' => $this->config->get('advancedlogin_apisecret'),
				'default_graph_version' => 'v2.5',
			]);

		}

		$helper = $this->advancedlogin->getRedirectLoginHelper();
		try {
		  $accessToken = $helper->getAccessToken();
		} catch(Facebook\Exceptions\FacebookResponseException $e) {
		  // When Graph returns an error
		  echo 'Graph returned an error: ' . $e->getMessage();
		  exit;
		} catch(Facebook\Exceptions\FacebookSDKException $e) {
		  // When validation fails or other local issues
			echo "<pre />"; print_r($e);
		  echo 'Facebook SDK returned an error: ' . $e->getMessage();
		  exit;
		}

			$this->advancedlogin->setDefaultAccessToken($accessToken);

			try {
			  $response = $this->advancedlogin->get('/me');
			  $userNode = $response->getGraphUser();
			  
			} catch(Facebook\Exceptions\FacebookResponseException $e) {
			  // When Graph returns an error
			  echo 'Graph returned an error: ' . $e->getMessage();
			  exit;
			} catch(Facebook\Exceptions\FacebookSDKException $e) {
			  // When validation fails or other local issues
			  echo 'Facebook SDK returned an error: ' . $e->getMessage();
			  exit;
			}

			$fbuser_profile=$this->advancedlogin->get('/me?fields=id,name,email')->getGraphUser();
			/*echo $_SESSION['advurl'];
			echo "<pre />"; print_r($_SESSION);  echo "--"; print_r($response); echo "--"; print_r($userNode); echo "--";
			print_r($fbuser_profile);
			die;*/

		if (!isset($fbuser_profile['verified'])){
			$fbuser_profile['verified']=1;
		}
		if($fbuser_profile['id'] && $fbuser_profile['email'] && $fbuser_profile['verified']){
			$this->load->model('account/customer');

			$email = $fbuser_profile['email'];
			$password = $this->get_password($fbuser_profile['id']);

			if($this->customer->login($email, $password)){
				if ($this->config->get('advancedlogin_redirect_advurl')) {
					$this->response->redirect($_SESSION['advurl']);
				}
				else
				{
					$this->response->redirect($this->url->link('account/account', '', 'SSL'));
				}

			}

			$email_query = $this->db->query("SELECT `email` FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(strtolower($email)) . "'");

			if($email_query->num_rows){
				$this->model_account_customer->editPassword($email, $password);
				if($this->customer->login($email, $password)){
					if ($this->config->get('advancedlogin_redirect_advurl')) {
						$this->response->redirect($_SESSION['advurl']);
					}
					else
					{
						$this->response->redirect($this->url->link('account/account', '', 'SSL'));
					}
					
				}
			}
			else{
				

				$this->request->post['email'] = $email;

				$add_data=array();
				$add_data['email'] = $fbuser_profile['email'];
				$add_data['password'] = $password;
				$add_data['firstname'] = isset($fbuser_profile['name']) ? $fbuser_profile['name'] : '';
				$add_data['lastname'] = isset($fbuser_profile['last_name']) ? $fbuser_profile['last_name'] : '';

				
				$this->load->model('account/advancedlogin');

				$this->model_account_advancedlogin->register($add_data, 1);
				

				if($this->customer->login($email, $password)){
					unset($this->session->data['guest']);
					if ($this->config->get('advancedlogin_redirect_advurl')) {
						$this->response->redirect($_SESSION['advurl']);
					}
					else
					{
						$this->response->redirect($this->url->link('account/success', '', 'SSL'));
					}
				}
			}

		}

		$this->response->redirect($this->url->link('account/account', '', 'SSL'));

	}

	private function get_password($str) {
		$password = $this->config->get('advancedlogin_pwdsecret') ? $this->config->get('advancedlogin_pwdsecret') : 'fb';
		$password.=substr($this->config->get('advancedlogin_apisecret'),0,3).substr($str,0,3).substr($this->config->get('advancedlogin_apisecret'),-3).substr($str,-3);
		return strtolower($password);
	}

	private function clean_decode($data) {
		if (is_array($data)) {
			foreach ($data as $key => $value) {
				unset($data[$key]);
				$data[$this->clean_decode($key)] = $this->clean_decode($value);
			}
		} else { 
			$data = htmlspecialchars_decode($data, ENT_COMPAT);
		}

		return $data;
	}	  
}
?>