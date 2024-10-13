<?php
class Controllercommonresponse extends Controller {
    public function index() {
        $this->load->model('checkout/order');
        $this->load->language('common/Zaakpay');
        $data['button_confirm'] = $this->language->get('button_confirm');
        $data['button_continue'] = $this->language->get('button_continue');
        $data['heading_title'] = $this->language->get('heading_title');
        $data['continue'] = HTTP_SERVER . 'index.php?route=common/home';

        $secret_key = $this->config->get('Zaakpay_secret_key');
        if (isset($_REQUEST['orderId'])) {
            //require('checksum.php');

            $response = array();

            $order_id_time = $_REQUEST['orderId'];
            $orderId = explode('.', $_REQUEST['orderId']);
            //$order_id = (int)Checksum::sanitizedParam($order_id[0]);
            $orderId=$orderId[0];
            $response['orderId']=$orderId;
            $response['responseCode']=$_REQUEST['responseCode'];
            $response['responseDescription']=$_REQUEST['responseDescription'];
            $response['checksum']=$_REQUEST['checksum'];
            $data['response']=$response;

            $order_info = $this->model_checkout_order->getOrder(70);
//$response_variables= array();
            $all = Controllercommonresponse::getAllParams();
            $bool = 0;
            $bool = Controllercommonresponse::verifyChecksum($response['checksum'], $all, $secret_key);
            /*$myFile = "c:\/response.txt";
            $fh = fopen($myFile, 'w') or die("can't open file");
            fwrite($fh, $orderId.'\n');
            fclose($fh);*/
            echo "this is boolena".$bool;
            $order_info['tracking']='null';
            $order_info['marketing']='null';
            $order_info['customer_group_id']='null';
            $order_info['marketing_id']='null';
            if ($bool==1)
            {

                if ($response['responseCode']=='100')
                {
// $order_info = $this->getOrder($order_id);
//ModelCheckoutOrder::update($orderId,5);
//print_r($order_info);
//$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '5', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");

//$this->model_checkout_order->confirm($response['orderId'], $this->config->get('cod_order_status_id'));
                    echo "responsecode is 100";
                    if (isset($this->session->data['order_id'])) {
                        $this->cart->clear();
                        echo "clear";
                        unset($this->session->data['shipping_method']);
                        unset($this->session->data['shipping_methods']);
                        unset($this->session->data['payment_method']);
                        unset($this->session->data['payment_methods']);
                        unset($this->session->data['guest']);
                        unset($this->session->data['comment']);
                        unset($this->session->data['order_id']);
                        unset($this->session->data['coupon']);
                    }

		
//$order_info = $this->model_checkout_order->getOrder($response['orderId']);
                    $this->model_checkout_order->addOrder($order_info);
			$status=$this->model_checkout_order->addOrderHistory($response['orderId'], 2);	
		echo "var".$status."--".$order_info."--".$response['orderid'];
                    $data['responseMsg']='<div style="width:965px;float:left;padding:5px;margin:10px 0px;background-color:#66CCFF;color:#000000;-webkit-border-radius:5px;-moz-border-radius:5px;-o-border-radius:5px;border-radius:5px;" class="box-box"><p><center>Thank you for shopping with us. Your account has been charged and your transaction is successful. We will be shipping your order to you soon.</center></p></div><br/><br/>';
		
                }
                else
                {
//$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '10', date_modified = NOW() WHERE order_id = '" . (int)$orderId . "'");

                    $this->model_checkout_order->addOrder($order_info);
			$this->model_checkout_order->addOrderHistory($response['orderid'], 8);
                    $data['responseMsg']='<div style="width:965px;float:left;padding:5px;margin:10px 0px;background-color:#66CCFF;color:#000000;-webkit-border-radius:5px;-moz-border-radius:5px;-o-border-radius:5px;border-radius:5px;" class="box-box"><p><center>OOPS!!'.$response['responseDescription'].'.</center><p/></div><br/><br/><h2> ';
                }
            }
            else
            {
                //$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '10', date_modified = NOW() WHERE order_id = '" . (int)$orderId . "'");



                $this->model_checkout_order->addOrder($order_info);
                $data['responseMsg']='<div style="width:965px;float:left;padding:5px;margin:10px 0px;background-color:#66CCFF;color:#000000;-webkit-border-radius:5px;-moz-border-radius:5px;-o-border-radius:5px;border-radius:5px;" class="box-box"><p><center>Security Error. Illegal access detected.</center><p/></div><br/><br/><h2> ';
            }
            /*if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/response.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/common/response.tpl';
            } else {
                $this->template = 'default/template/common/response.tpl';
            }*/


            $data['header'] = $this->load->controller('common/header');
            $data['footer'] = $this->load->controller('common/footer');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $this->response->setOutput($this->load->view('common/response', $data));
            //return $this->load->view('common/response', $data);
        }

    }
    function calculateChecksum($secret_key, $all) {
        $hash = hash_hmac('sha256', $all , $secret_key);
        $checksum = $hash;
        return $checksum;
    }

    function getAllParams() {
        //ksort($_POST);
        $all = '';
        $checksumsequence= array("amount","bank","bankid",
                                 "cardId","cardScheme","cardToken","cardhashid","doRedirect","orderId","paymentMethod","paymentMode","responseCode",
                                 "responseDescription");
        foreach( $checksumsequence as $seq)    {
            /*$myFile = "c:\/testFile.txt";
            $fh = fopen($myFile, 'a') or die("can't open file");
            fwrite($fh, $key.'=>'.$value);
            fclose($fh);*/
            if (array_key_exists($seq, $_POST)) {
                if ($seq != 'checksum') {
                    $all .= $seq;
                    $all.= "=";
                    if ($seq == 'returnUrl') {
                        $all .= $_POST[$seq];
                    } else {
                        $all .= $_POST[$seq];
                    }
                    $all .= "&";
                }
            }
        }
        echo $all;
        return $all;
    }


    function verifyChecksum($checksum, $all, $secret) {
        $cal_checksum = Controllercommonresponse::calculateChecksum($secret, $all);
        $bool = 0;
        if ($checksum == $cal_checksum)    {
            $bool = 1;
        }

        return $bool;
    }

    function sanitizedParam($param) {
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
