<?php echo $header; ?>

<?php $allg4 = array(); foreach ($products as $product) {
    $arr = array();
    $arr['item_id'] = $product['model'];
    $arr['item_name'] = $product['name'];
    $arr['index'] = 0;
    $arr['item_brand'] = "Flavours Guru";
    //$arr['item_category'] = $heading_title;
    $arr['price'] = $product['mprice'];
    $arr['quantity'] = (int)$product['quantity'];
    $allg4[] = (object)$arr;
} ?>

<script type="text/javascript">
  dataLayer.push({ ecommerce: null });  // Clear the previous ecommerce object.
  dataLayer.push({
  event: "begin_checkout",
  ecommerce: {
    currency: "INR",
    value: <?php echo $nval; ?>,
    items: <?php echo json_encode($allg4); ?>
  }
});
</script>

<?php
 if (isset($customer_group_id) && $customer_group_id == 2) {
   $stl = 'style="display: block;"';
   $stl2 = 'style="display: none;"';
 } else {
  $stl = 'style="display: none;"';
  $stl2 = 'style="display: block;"';
 }
 ?>
 <style>
footer{position:fixed; bottom:0px; width:100%; }
#content.col-sm-12{
  display: flex;
  flex-direction: column;
  height: 100vh;
}
.checkout-checkout #accordion{margin-bottom:50px;  }
.btn.btn-primary{
  /*margin-bottom: 20px;*/
}
body{
  background-color: #ffffff;
}
header .cart, .checkout-checkout .search, .menunav{
  display: none !important;
}
.panel-heading.active{
  background:none !important;
}
.panel-group .panel.panel-default {
    border: 0;
    display: flex;
    flex-wrap: wrap;
}
.panel-default>.panel-heading{
  width: 30%;
  background:none;
}
.panel-collapse.collapse {
    width: 70%;
    position: absolute;
    right: 0;
    background-color: #ffffff;
    z-index: 1;
}
.panel{
  box-shadow: initial;
}
.panel-heading .login_step_left_col{
  border-radius: 5px;
  box-shadow: 0 11px 12px 0 rgb(0 0 0 / 10%);
  padding: 15px;
  width: 100%;
  display: flex;
  margin-right: 15px;
  margin-bottom: 15px;
  height: 80px;
}
.panel-heading.active{
  padding-right: 0;
}
.panel-heading.active .login_step_left_col{
  border-bottom: 3px solid #F65F73 !important;
  background-color: #fff !important;
  margin-right: 0px;
}
.login_step_left_col.panel-title a{
  display: flex;
  width: 100%;
}
.panel-default{
  background:none;
}
.info_svg_icon{
  width: 60px;
}
.panel_title_col{
  width: calc(100% - 60px);
}
.checkout-step{
  font-size: 12px;
  color: #888;
}
.checkout-title{
  color: #181818;
  font-size: 16px;
  font-weight: 500;
}
.panel-group{
  padding-top: 25px;
}
.panel-default>.panel-heading+.panel-collapse>.panel-body{
  border:0;
  padding-top: 0;
}
.form-parent{
  background-color: #ffffff;
  padding-bottom: 25px;
}
.show_info_after_fill_form{
  height: 80px;
  background-color: #ffffff;
  border-radius: 5px;
  box-shadow: 0 11px 12px 0 rgb(0 0 0 / 2%);
  width: 70%;
  display: flex;
  align-items: center;
  justify-content: space-evenly;
}
.checkout-closed-data{
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 80%;
}
.checkout-closed-data .checkout-closed-column-title{
  opacity: .7;
  font-size: 12px;
}
.checkout-closed-data .checkout-closed-column-value{
  font-size: 16px;
}
.edit_info_checkout{
  text-decoration: underline;
  font-size: 16px;
  font-weight: 500;
  color: #F65F73;
}
.edit_info_checkout:hover{
  color: #F65F73;
}
.login-signup-btn-1{
  border:0 !important;
  background:none !important;
  padding-right: 0 !important;
  padding-left: 0 !important;
  height: 35px !important;
  min-width: auto !important;
  margin-right: 20px !important;
}
.login-and-guest-btn-box{
  border-bottom: 0 !important;
}
.login-signup-btn-1.active{
  border-bottom: 2px solid #F65F73 !important;
  font-weight: 600;
}
.form-parent{
  padding-top: 15px;
}
.panel-heading{
  padding: 0;
  padding-right: 15px;
}
#accordion .panel.panel-default:nth-child(4n) .panel-collapse.collapse{
  position: initial;
}
#payment-method{
  width: 100%;
}
#collapse-payment-summary .coupon-box{
  max-width: 100%;
}
div#payment-method {
    background: #fff;
    padding: 0px 30px;
    width: 70%;
    margin-left: 30%;
}
.coupon-box label{
  padding-left: 0;
}
.accordion-toggle.collapsed .edit_info_checkout{
  display: block !important;
}
.sender_detail_col{
  width: 100%;
}
.form-horizontal{
  background-color: #ffffff;
  padding-bottom: 50px;
}
.qty-delete{
  background: none;
}
.rmcartitem {
  font-size: 20px;
  border: 0;
  background: none;
  margin-right: 0;
  border: 1px solid #000000;
}
.item-add-input {
  width: 45px !important;
  float: initial !important;
  text-align: center;
  margin-right: 0;
  border-left: 0 !important;
  border-right: 0 !important;
  border-color: #000000 !important;
  font-size: 14px;
  font-weight: 500;
  color: #000000;
}
.addcartitem {
  font-size: 20px;
  border: 0;
  background: none;
  border: 1px solid #000000;
  margin-right: 0;
}
.save_and_continue.text-white:hover{
  color:#ffffff 
}
.checkout-cart #accordion.panel-group {
    max-width: 100%;
    margin-bottom: 0;
}
.coupon-item{
    border:1px solid #e9eaec;
    padding: 15px;
    margin-bottom: 15px;
  }
  .coupon-item:last-child(){
    margin-bottom: 0;
  }
  .coupon-popup {
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    top: 0;
    left: 0;
    z-index: 11111;
    overflow-y: auto;
    padding: 15px;
    display: none;
}
.coupon-item-col{
  width: 700px;
  position: absolute;
  background-color: #ffffff;
  min-height: 300px;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  border-radius: 8px;
  padding:15px;
}
.view-more-coupon:hover{
  color: #f65f73;
}
@media screen and (min-width:767px){
  .login_step_left_col.panel-title .edit_info_checkout{
    display: none;
  }
  #content.col-sm-12{
    height: auto;
  }
  .show_info_after_fill_form{
    opacity: 0;
  }
  .panel-collapse.collapse + .show_info_after_fill_form{
    opacity: 1;
  }
  .sender_detail_col{
    padding-left: 0;
    padding-right: 0;
  }
  .sender_detail_col .form-group.col-xs-6{
    width: 100%;
    padding-left: 0;
    padding-right: 0;
    margin-left: 0;
    margin-right: 0;
  }
  .sender_detail_col .form-group.col-xs-6 label, .sender_detail_col .form-group.col-xs-6 .col-sm-12{
    padding-left: 0;
    padding-right: 0;
  }
  .well-register{
    margin-bottom: 40px;
  }
  .table.cart_table tr td{
    border-bottom:1px solid #E9EAEC !important;
  }
  .checkout-checkout .container.top_positionn{
    margin-top: 95px !important;
  }
}
@media screen and (max-width:767px){
  .payment-method{
    padding-right: 15px;
    padding-left: 15px;
  }
  .checkout-checkout .container.top_positionn{
    margin-top: 70px !important;
  }
  .btn.btn-primary {
    float: inherit !important;
    /*margin-top: 20px;*/
  }
  #content.col-sm-12{
    padding-top: 0px;
  }
  .panel-default>.panel-heading {
    width: 100%;
    padding-right: 0;
  }
  .panel-group .panel.panel-default{
    flex-wrap: wrap;
  }
  .panel-collapse.collapse {
    width: 100%;
    position: initial;
  }
  .panel-heading .login_step_left_col{
    box-shadow: 0 0 9px 0 rgb(0 0 0 / 10%);
    background-color: #ffffff;
  }
  .panel-heading.active .login_step_left_col{
    box-shadow: 0 0 #000;
    border-bottom: 1px solid #dcdcdc !important;
    border-radius: 0;
  }
  .form-parent, #chckout, .login-form, .login-form .col-sm-6, .register_form .col-sm-12{
    padding-left: 0;
    padding-right: 0;
  }
  .show_info_after_fill_form{
    width: 100%;
    border-radius: 0;
    height: auto;
    padding-left: 15px;
    padding-right: 15px;
    box-shadow: 0 9px 12px 0 rgb(0 0 0 / 10%);
    margin-bottom: 15px;
    padding-top: 15px;
  }
  .checkout-closed-data{
    width: 100%;
    flex-wrap: wrap;
  }
  .checkout-closed-column {
    width: 100%;
    margin-bottom: 15px;
  }
  .edit_info_checkout{
    float: right;
  }
  .checkout-closed-edit{
    display: none;
  }
  .login_step_left_col.panel-title a.accordion-toggle{
    width: 100%;
  }
  .login-and-guest-btn-box{
    margin-left: 0;
    margin-right: 0;
  }
  #content.col-sm-12{
    height: auto;
  }
  div#payment-method {
    background: #fff;
    padding: 0px 15px;
    width: 100%;
    margin-left: 0;
  }
  #collapse-payment-summary table tr {
    border: 0;
    border-bottom: 1px solid #ccc;
  }
  .table-bordered{
    border: 0;
  }
  .collapse.in + .show_info_after_fill_form{
    display: none !important;
  }
  .panel-heading.active .edit_info_checkout{
    display: none !important;
  }
  input[type="text"].form-control, select.form-control{
    height: 40px;
    font-size: 14px;
  }
  .form-group {
    margin-bottom: 20px;
  }
  #collapse-shipping-address .form-horizontal .col-sm-7 legend {
    margin-bottom: 0px;
    padding-top: 15px;
    margin-bottom: 15px;
  }
  #button-payment-method{
    background: #F65F73 !important;
    width: 100% !important;
    margin-left: 0;
    padding: 10px 12px !important;
  }
  .sender_detail_col .form-group{
    padding-left: 0;
    padding-right: 0;
    margin-left: 0;
    margin-right: 0;
  }
  .sender_detail_col .form-group .col-sm-12, .sender_detail_col .form-group label{
    padding-left: 0;
  }
  .sender_detail_col {
    background: #eee;
    margin-top: 10px;
    margin-bottom: 10px;
  }
  .sender_detail_col h3{
    margin-top: 10px;
    font-size: 14px;
  }
  .payment-option {
    margin-bottom: 0;
  }
  .checkout-checkout #accordion {
    margin-bottom: 110px;
  }
  .cart_table tr td.img-thumb-col{
    border-top: 1px solid #E9EAEC !important;
  }
  .logobox, #logo{
    margin-bottom: 0;
  }
  .coupon-item-col{
    width: 95%;
  }
  header {
    min-height: 60px;
  }
  .btm-card-cart {
    min-height: 245px;
  }
}
#button-coupon{
  display: none;
}
#remove-coupon{
  display: none;
}
</style>
<div class="container top_positionn">
  <input type="hidden" id="siturl" value='<?php echo HTTP_SERVER."image/loader.gif"; ?>'>
  <h2 style="margin: 0;"><span class="loaderEtra" id="loaderEtra" style="width:8px"></span></h2>
  <ul class="breadcrumb1" style="display: none;">
      <?php /*
        $i=1; 
        $Totlbrdcum = count($breadcrumbs); 
        foreach($breadcrumbs as $breadcrumb) {  
         if($Totlbrdcum==$i){  
      ?> 
          <li><span class="" style="color: #35a8d4;"><?php echo $breadcrumb['text']; ?> </span></li>
      <?php  } else { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?> </a></li> 
      <?php } $i++; } */  ?>
  </ul>
  <div class="row hide">
    <ul class="breadcrumb">
      <li>
        <a href="<?php echo $breadcrumb['href']; ?>"><i class="fa fa-home"></i> </a>
      </li> 
    <li><span class="" style="color: #35a8d4;">Shopping Cart </span></li>
    </ul>
  </div>
  <div class="hide back_delivery_details mb-15">
    <a href="/checkout" class=" display-flex align-items-center">
      <svg class="mr-5" xmlns="http://www.w3.org/2000/svg" width="14" height="15" viewBox="0 0 18 15" fill="none">
            <path d="M7.83077 14.2623C7.93897 14.162 8.00071 14.0251 8.00244 13.8816C8.00418 13.7382 7.94576 13.6 7.84002 13.4973L2.02867 7.86237L17.4046 8.02922C17.5561 8.03087 17.7021 7.97542 17.8104 7.87508C17.9188 7.77474 17.9806 7.63773 17.9824 7.49418C17.9841 7.35063 17.9256 7.21231 17.8197 7.10965C17.7138 7.00698 17.5692 6.94838 17.4177 6.94674L2.04176 6.77989L7.98777 1.27251C8.08991 1.17101 8.14648 1.0359 8.14556 0.895652C8.14464 0.755406 8.08631 0.620971 7.98286 0.520671C7.8794 0.420371 7.73889 0.362036 7.59094 0.357956C7.44299 0.353876 7.29914 0.40437 7.18971 0.4988L0.256719 6.91931C0.148524 7.01963 0.0867782 7.15654 0.0850447 7.29997C0.0833112 7.4434 0.141731 7.58162 0.247473 7.68426L7.02346 14.2535C7.12934 14.356 7.27383 14.4146 7.4252 14.4162C7.57657 14.4178 7.72244 14.3625 7.83077 14.2623Z" fill="#F65F73"></path>
        </svg>
        <span class="text-primary">Back</span>
    </a>    
  </div>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <!-- <h1 style="margin-top: 10px;"><?php echo $heading_title; ?></h1> -->
      <div class="checkout_col">
        <div class="shipping_progress_col">
            <div class="univ-progress-wrap ai-progress-wrap">
                <div class="progress-point-wrap display-flex align-items-center position-relative">
                    <div class="pg-point-icon process_bar_3rd_col position-relative display-flex active">
                        <span class="point-icon-single">
                          1
                        </span>
                    </div>
                    <div class="pg-point-icon process_bar_3rd_col position-relative display-flex justify-content-end" id="progress-3">
                        <span class="point-icon-single">
                          2
                        </span>
                    </div>
                    <div class="pg-point-icon process_bar_3rd_col position-relative display-flex justify-content-end">
                        <span class="point-icon-single">
                          3
                        </span>
                    </div>
                </div>
                <div class="progress-label-wrap display-flex align-items-center">
                    <div class="progress-label process-lable-3rd first-tab-login">
                        <p class="font-size-14 mb-0">Login</p>
                    </div>
                    <div class="progress-label text-center display-flex justify-content-end process-lable-3rd">
                        <p class="font-size-14 color-2F1A31">Delivery Details</p>
                    </div>
                    <div class="progress-label text-right process-lable-3rd display-flex justify-content-end">
                        <p class="font-size-14 mb-0">Review and Pay</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="checkout-nav-tabs hide">
          <ul class="nav nav-tabs custom-scroll">
            <li class="active"><a data-toggle="tab" href="#shipping-information"><span class="tab-num">1</span> Delivery Details</a></li>
            <li class="cursor-pointer-none"><a data-toggle="tab" href="#review-and-pay" id="review-and-pay-main"><span class="tab-num">2</span> Review and Pay</a></li>
          </ul>
        </div>
        <div class="tab-content checkout-tab-content">
          <div id="shipping-information" class="tab-pane in active">
            <div class="add_new_address" <?php echo ($addresses) ? "style='display: none;'" : "style='display: block;'" ?>>
              <h3>Add New Address</h3>
              <form>
                <div class="row display-flex flex-wrap">
                  <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="form-group position-relative">
                      <label>Recipient's Name <span class="text-danger">*</span></label>
                      <div class="display-flex align-items-center down-arrow-select select_gend">
                        <select class="select-input-gen form-input">
                           <option value="Mr">Mr</option>
                           <option value="Ms">Ms</option>
                           <option value="Mrs">Mrs</option>
                           <option value="Other">Other</option>
                        </select>
                        <div class="name-input-col">
                          <input type="text" class="form-input full-width firstname" name="" placeholder="Enter full name">
                        </div>
                      </div>
                      <div class="envlope-icon" style="top: 40px;">
                        <svg style="width: 16px;" width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M8 8C7.20887 8 6.43552 7.76541 5.77772 7.32588C5.11992 6.88635 4.60723 6.26164 4.30448 5.53074C4.00173 4.79983 3.92252 3.99556 4.07686 3.21964C4.2312 2.44372 4.61216 1.73098 5.17157 1.17157C5.73098 0.612165 6.44372 0.231202 7.21964 0.0768607C7.99556 -0.0774802 8.79983 0.00173314 9.53073 0.304484C10.2616 0.607234 10.8864 1.11992 11.3259 1.77772C11.7654 2.43552 12 3.20888 12 4C12 5.06087 11.5786 6.07828 10.8284 6.82843C10.0783 7.57857 9.06087 8 8 8ZM8 10C10.6703 10 16 11.3398 16 14V16H0V14C0 11.3398 5.32971 10 8 10Z" fill="#F65F73"/>
                        </svg>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="form-group position-relative">
                      <label>Mobile <span class="text-danger">*</span></label>
                      <div class="display-flex align-items-center">
                        <select class="form-input select-input-gen custom-scroll" name="phone_code" id="phone_code">
                        <option value='+91'>+91</option>
                      </select>
                        <div class="name-input-col">
                          <input type="number" name="" value="" placeholder="Enter 10 digit mobile number" id="gst_phone" class="full-width form-input phone phone-enter" inputmode='decimal' pattern='[0–9]*' />
                        </div>
                        <div class="envlope-icon" style="top: 40px;">
                          <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/phone-icon.png" alt="" style="width: 12px;">
                        </div>
                      </div>
                      <span id="error" style="color: red"></span>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="form-group position-relative">
                      <label>Recipient's Address <span class="text-danger">*</span></label>
                      <input type="text" class="form-input full-width pd-width-icon address_1" name="" placeholder="Enter Address">
                      <div class="envlope-icon" style="top: 38px;">
                        <svg style="width: 20px;height: 20px;" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M11.4701 3.84011C11.6107 3.69966 11.8013 3.62077 12.0001 3.62077C12.1988 3.62077 12.3895 3.69966 12.5301 3.84011L21.2201 12.5301C21.2887 12.6038 21.3715 12.6629 21.4635 12.7039C21.5555 12.7449 21.6549 12.7669 21.7556 12.7687C21.8563 12.7705 21.9563 12.752 22.0497 12.7142C22.1431 12.6765 22.2279 12.6204 22.2991 12.5492C22.3703 12.4779 22.4265 12.3931 22.4642 12.2997C22.5019 12.2063 22.5204 12.1063 22.5187 12.0056C22.5169 11.9049 22.4949 11.8056 22.4539 11.7136C22.4129 11.6216 22.3538 11.5388 22.2801 11.4701L13.5911 2.78011C13.3821 2.57118 13.1341 2.40544 12.8611 2.29237C12.5881 2.17929 12.2956 2.12109 12.0001 2.12109C11.7046 2.12109 11.412 2.17929 11.139 2.29237C10.8661 2.40544 10.618 2.57118 10.4091 2.78011L1.71908 11.4701C1.58253 11.6116 1.50702 11.8011 1.50882 11.9978C1.51062 12.1944 1.58959 12.3825 1.72871 12.5215C1.86783 12.6605 2.05598 12.7393 2.25263 12.7409C2.44928 12.7425 2.63869 12.6668 2.78008 12.5301L11.4701 3.84011Z" fill="#F65F73"/>
                        <path d="M12 5.43218L20.159 13.5912C20.189 13.6212 20.219 13.6492 20.25 13.6772V19.8752C20.25 20.9102 19.41 21.7502 18.375 21.7502H15C14.8011 21.7502 14.6103 21.6712 14.4697 21.5305C14.329 21.3899 14.25 21.1991 14.25 21.0002V16.5002C14.25 16.3013 14.171 16.1105 14.0303 15.9698C13.8897 15.8292 13.6989 15.7502 13.5 15.7502H10.5C10.3011 15.7502 10.1103 15.8292 9.96967 15.9698C9.82902 16.1105 9.75 16.3013 9.75 16.5002V21.0002C9.75 21.1991 9.67098 21.3899 9.53033 21.5305C9.38968 21.6712 9.19891 21.7502 9 21.7502H5.625C5.12772 21.7502 4.65081 21.5526 4.29917 21.201C3.94754 20.8494 3.75 20.3725 3.75 19.8752V13.6772C3.78111 13.6493 3.81146 13.6207 3.841 13.5912L12 5.43018V5.43218Z" fill="#F65F73"/>
                        </svg>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="form-group position-relative">
                      <label>City <span class="text-danger">*</span></label>
                      <input type="text" class="form-input full-width pd-width-icon city" name="" readonly value="<?php echo $newCity; ?>" placeholder="Enter City">
                      <div class="envlope-icon" style="top: 38px;">
                        <svg width="18" height="21" viewBox="0 0 18 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8.54 20.351L8.61 20.391L8.638 20.407C8.74903 20.467 8.87327 20.4985 8.9995 20.4985C9.12573 20.4985 9.24997 20.467 9.361 20.407L9.389 20.392L9.46 20.351C9.85112 20.1191 10.2328 19.8716 10.604 19.609C11.5651 18.9305 12.463 18.1667 13.287 17.327C15.231 15.337 17.25 12.347 17.25 8.5C17.25 6.31196 16.3808 4.21354 14.8336 2.66637C13.2865 1.11919 11.188 0.25 9 0.25C6.81196 0.25 4.71354 1.11919 3.16637 2.66637C1.61919 4.21354 0.75 6.31196 0.75 8.5C0.75 12.346 2.77 15.337 4.713 17.327C5.53664 18.1667 6.43427 18.9304 7.395 19.609C7.76657 19.8716 8.14854 20.1191 8.54 20.351ZM9 11.5C9.79565 11.5 10.5587 11.1839 11.1213 10.6213C11.6839 10.0587 12 9.29565 12 8.5C12 7.70435 11.6839 6.94129 11.1213 6.37868C10.5587 5.81607 9.79565 5.5 9 5.5C8.20435 5.5 7.44129 5.81607 6.87868 6.37868C6.31607 6.94129 6 7.70435 6 8.5C6 9.29565 6.31607 10.0587 6.87868 10.6213C7.44129 11.1839 8.20435 11.5 9 11.5Z" fill="#F65F73"/>
                        </svg>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="form-group position-relative">
                      <label>Pincode <span class="text-danger">*</span></label>
                      <input type="text" class="form-input full-width pd-width-icon postcode" readonly name="" value="<?php echo $newPin; ?>" placeholder="Enter pincode">
                      <div class="envlope-icon" style="top: 38px;">
                        <svg width="18" height="21" viewBox="0 0 18 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8.54 20.351L8.61 20.391L8.638 20.407C8.74903 20.467 8.87327 20.4985 8.9995 20.4985C9.12573 20.4985 9.24997 20.467 9.361 20.407L9.389 20.392L9.46 20.351C9.85112 20.1191 10.2328 19.8716 10.604 19.609C11.5651 18.9305 12.463 18.1667 13.287 17.327C15.231 15.337 17.25 12.347 17.25 8.5C17.25 6.31196 16.3808 4.21354 14.8336 2.66637C13.2865 1.11919 11.188 0.25 9 0.25C6.81196 0.25 4.71354 1.11919 3.16637 2.66637C1.61919 4.21354 0.75 6.31196 0.75 8.5C0.75 12.346 2.77 15.337 4.713 17.327C5.53664 18.1667 6.43427 18.9304 7.395 19.609C7.76657 19.8716 8.14854 20.1191 8.54 20.351ZM9 11.5C9.79565 11.5 10.5587 11.1839 11.1213 10.6213C11.6839 10.0587 12 9.29565 12 8.5C12 7.70435 11.6839 6.94129 11.1213 6.37868C10.5587 5.81607 9.79565 5.5 9 5.5C8.20435 5.5 7.44129 5.81607 6.87868 6.37868C6.31607 6.94129 6 7.70435 6 8.5C6 9.29565 6.31607 10.0587 6.87868 10.6213C7.44129 11.1839 8.20435 11.5 9 11.5Z" fill="#F65F73"/>
                        </svg>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <div class="shipping_info_col">
              <div class="mb-15 add_new_address_btn_col"  <?php echo ($addresses) ? "style='display: block;'" : "style='display: none;'" ?>>
                <h3 class="mb-15">Let us know where to deliver</h3>
                <div class="display-flex align-items-center cursor-pointer add_new_address_btn">
                  <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M10 0.25C4.615 0.25 0.25 4.615 0.25 10C0.25 15.385 4.615 19.75 10 19.75C15.385 19.75 19.75 15.385 19.75 10C19.75 4.615 15.385 0.25 10 0.25ZM10.75 7C10.75 6.80109 10.671 6.61032 10.5303 6.46967C10.3897 6.32902 10.1989 6.25 10 6.25C9.80109 6.25 9.61032 6.32902 9.46967 6.46967C9.32902 6.61032 9.25 6.80109 9.25 7V9.25H7C6.80109 9.25 6.61032 9.32902 6.46967 9.46967C6.32902 9.61032 6.25 9.80109 6.25 10C6.25 10.1989 6.32902 10.3897 6.46967 10.5303C6.61032 10.671 6.80109 10.75 7 10.75H9.25V13C9.25 13.1989 9.32902 13.3897 9.46967 13.5303C9.61032 13.671 9.80109 13.75 10 13.75C10.1989 13.75 10.3897 13.671 10.5303 13.5303C10.671 13.3897 10.75 13.1989 10.75 13V10.75H13C13.1989 10.75 13.3897 10.671 13.5303 10.5303C13.671 10.3897 13.75 10.1989 13.75 10C13.75 9.80109 13.671 9.61032 13.5303 9.46967C13.3897 9.32902 13.1989 9.25 13 9.25H10.75V7Z" fill="#F65F73"/>
                  </svg>
                  <span style="color: #0C1115;padding-left: 5px;">Add a new address</span>
              </div>
              </div>
              <div class="">
                <form>
                  <div class="old_address_col">
                    <div class="row mb-15">
                      <?php foreach ($addresses as $key => $caddress) {
                      	if($newPin != $caddress['postcode']){
                      		continue;
                      	}
                       ?>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="display-flex select_addrs_col">
                          <div class="mr-5 radio-checkbox" style="padding-top: 4px;">
                            <input type="radio" style="display: none;" value="<?php echo $caddress['address_id']; ?>" id="address_<?php echo $key; ?>" name="select_addres" class="selected_address">
                            <label for="address_<?php echo $key; ?>">
                              <span class="rdo-span"></span>
                            </label>
                          </div>
                          <div class="user_name_add_col">
                            <p class="font-weight-600 font-size-14"><?php echo $caddress['firstname']; ?></p>
                            <p class="font-size-12 lh-20"><?php echo $caddress['address_1']; ?>, <?php echo $caddress['city']; ?>, <?php echo $caddress['zone']; ?>, <?php echo $caddress['country']; ?>, <?php echo $caddress['postcode']; ?></p>
                          </div>
                        </div>
                        <div class="address_edit_btn display-flex align-items-center cursor-pointer" style="display: none !important;">
                          <span class="mr-5">Edit </span>
                          <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M10.8656 1.13434C10.6195 0.888251 10.2857 0.75 9.93763 0.75C9.58957 0.75 9.25576 0.888251 9.00963 1.13434L8.43113 1.71284L10.2871 3.56884L10.8656 2.99034C11.1117 2.74421 11.25 2.4104 11.25 2.06234C11.25 1.71429 11.1117 1.38048 10.8656 1.13434ZM9.75663 4.09934L7.90063 2.24334L3.70063 6.44334C3.39205 6.75176 3.16522 7.13223 3.04063 7.55034L2.64063 8.89284C2.62132 8.95763 2.61988 9.02643 2.63646 9.09196C2.65304 9.1575 2.68703 9.21733 2.73483 9.26514C2.78264 9.31294 2.84247 9.34693 2.90801 9.36351C2.97354 9.3801 3.04234 9.37866 3.10713 9.35934L4.44963 8.95934C4.86774 8.83476 5.24821 8.60792 5.55663 8.29935L9.75663 4.09934Z" fill="white"/>
                          <path d="M2.625 2.625C2.22718 2.625 1.84564 2.78304 1.56434 3.06434C1.28304 3.34564 1.125 3.72718 1.125 4.125V9.375C1.125 9.77282 1.28304 10.1544 1.56434 10.4357C1.84564 10.717 2.22718 10.875 2.625 10.875H7.875C8.27282 10.875 8.65436 10.717 8.93566 10.4357C9.21696 10.1544 9.375 9.77282 9.375 9.375V6.75C9.375 6.65054 9.33549 6.55516 9.26517 6.48484C9.19484 6.41451 9.09946 6.375 9 6.375C8.90054 6.375 8.80516 6.41451 8.73483 6.48484C8.66451 6.55516 8.625 6.65054 8.625 6.75V9.375C8.625 9.57391 8.54598 9.76468 8.40533 9.90533C8.26468 10.046 8.07391 10.125 7.875 10.125H2.625C2.42609 10.125 2.23532 10.046 2.09467 9.90533C1.95402 9.76468 1.875 9.57391 1.875 9.375V4.125C1.875 3.92609 1.95402 3.73532 2.09467 3.59467C2.23532 3.45402 2.42609 3.375 2.625 3.375H5.25C5.34946 3.375 5.44484 3.33549 5.51516 3.26517C5.58549 3.19484 5.625 3.09946 5.625 3C5.625 2.90054 5.58549 2.80516 5.51516 2.73483C5.44484 2.66451 5.34946 2.625 5.25 2.625H2.625Z" fill="white"/>
                          </svg>
                        </div>
                      </div>
                    <?php } ?>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-12">
                      <div class="form-group position-relative down-arrow-select">
                        <label>Occasion</label>
                        <select name="occasion" id="occasion" class="occasion-drop form-input full-width pd-width-icon">
                          <option value="" selected="selected">Select Occasion</option>
                          <option value="Birthday">Birthday</option>
                          <option value="Anniversary">Anniversary</option>
                          <option value="Love and Romace">Love and Romace</option>
                          <option value="Sorry">Sorry</option>
                          <option value="Congratulation">Congratulation</option>
                          <option value="Just like That">Just like That</option>
                          <option value="Wedding">Wedding</option>
                          <option value="Bachelorette">Bachelorette</option>
                          <option value="Others">Others</option>
                        </select>
                        <div class="envlope-icon" style="top: 38px;">
                          <svg width="20" height="22" viewBox="0 0 20 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M13 0.78418L12.204 1.58018C12.0467 1.73751 11.9395 1.93797 11.8961 2.1562C11.8527 2.37443 11.875 2.60063 11.9601 2.80619C12.0453 3.01176 12.1895 3.18746 12.3745 3.31107C12.5595 3.43469 12.777 3.50067 12.9995 3.50067C13.222 3.50067 13.4395 3.43469 13.6245 3.31107C13.8095 3.18746 13.9537 3.01176 14.0389 2.80619C14.124 2.60063 14.1463 2.37443 14.1029 2.1562C14.0595 1.93797 13.9523 1.73751 13.795 1.58018L13 0.78418ZM10 0.78418L9.204 1.58018C9.04667 1.73751 8.93952 1.93797 8.89612 2.1562C8.85271 2.37443 8.87499 2.60063 8.96014 2.80619C9.04529 3.01176 9.18948 3.18746 9.37449 3.31107C9.55949 3.43469 9.777 3.50067 9.9995 3.50067C10.222 3.50067 10.4395 3.43469 10.6245 3.31107C10.8095 3.18746 10.9537 3.01176 11.0389 2.80619C11.124 2.60063 11.1463 2.37443 11.1029 2.1562C11.0595 1.93797 10.9523 1.73751 10.795 1.58018L10 0.78418ZM7 0.78418L6.204 1.58018C6.04667 1.73751 5.93952 1.93797 5.89612 2.1562C5.85271 2.37443 5.87499 2.60063 5.96014 2.80619C6.04529 3.01176 6.18948 3.18746 6.37449 3.31107C6.55949 3.43469 6.777 3.50067 6.9995 3.50067C7.222 3.50067 7.43951 3.43469 7.62452 3.31107C7.80952 3.18746 7.95371 3.01176 8.03886 2.80619C8.12401 2.60063 8.14629 2.37443 8.10288 2.1562C8.05948 1.93797 7.95233 1.73751 7.795 1.58018L7 0.78418ZM7.75 6.54718C8.248 6.52718 8.748 6.51218 9.25 6.50518V5.75018C9.25 5.55127 9.32902 5.3605 9.46967 5.21985C9.61032 5.0792 9.80109 5.00018 10 5.00018C10.1989 5.00018 10.3897 5.0792 10.5303 5.21985C10.671 5.3605 10.75 5.55127 10.75 5.75018V6.50518C11.252 6.51218 11.752 6.52618 12.25 6.54718V5.75018C12.25 5.55127 12.329 5.3605 12.4697 5.21985C12.6103 5.0792 12.8011 5.00018 13 5.00018C13.1989 5.00018 13.3897 5.0792 13.5303 5.21985C13.671 5.3605 13.75 5.55127 13.75 5.75018V6.63018L14.057 6.65218C15.607 6.76918 16.75 8.07918 16.75 9.59818V10.6162C12.2633 10.1262 7.73666 10.1262 3.25 10.6162V9.59818C3.25 8.07918 4.393 6.76918 5.943 6.65218L6.25 6.63018V5.75018C6.25 5.55127 6.32902 5.3605 6.46967 5.21985C6.61032 5.0792 6.80109 5.00018 7 5.00018C7.19891 5.00018 7.38968 5.0792 7.53033 5.21985C7.67098 5.3605 7.75 5.55127 7.75 5.75018V6.54718ZM10 11.7502C7.528 11.7502 5.1 11.9342 2.726 12.2902C1.272 12.5072 0.25 13.7722 0.25 15.2062V15.5902C1.12832 15.4269 2.03592 15.5547 2.835 15.9542C3.19672 16.135 3.59558 16.2292 4 16.2292C4.40442 16.2292 4.80328 16.135 5.165 15.9542C5.73477 15.6694 6.36301 15.5211 7 15.5211C7.63699 15.5211 8.26523 15.6694 8.835 15.9542C9.19672 16.135 9.59558 16.2292 10 16.2292C10.4044 16.2292 10.8033 16.135 11.165 15.9542C11.7348 15.6694 12.363 15.5211 13 15.5211C13.637 15.5211 14.2652 15.6694 14.835 15.9542C15.1967 16.135 15.5956 16.2292 16 16.2292C16.4044 16.2292 16.8033 16.135 17.165 15.9542C17.9641 15.5547 18.8717 15.4269 19.75 15.5902V15.2062C19.75 13.7722 18.728 12.5062 17.274 12.2892C14.866 11.9296 12.4347 11.7494 10 11.7502ZM19.75 17.1312C19.114 16.94 18.4289 16.999 17.835 17.2962C17.2652 17.581 16.637 17.7293 16 17.7293C15.363 17.7293 14.7348 17.581 14.165 17.2962C13.8033 17.1152 13.4044 17.021 13 17.021C12.5956 17.021 12.1967 17.1152 11.835 17.2962C11.2652 17.581 10.637 17.7293 10 17.7293C9.36301 17.7293 8.73477 17.581 8.165 17.2962C7.8033 17.1152 7.40443 17.021 7 17.021C6.59557 17.021 6.1967 17.1152 5.835 17.2962C5.26523 17.581 4.63699 17.7293 4 17.7293C3.36301 17.7293 2.73477 17.581 2.165 17.2962C1.57106 16.999 0.886018 16.94 0.25 17.1312V19.6252C0.25 20.6612 1.09 21.5002 2.125 21.5002H17.875C18.91 21.5002 19.75 20.6602 19.75 19.6252V17.1312Z" fill="#F65F73"/>
                          </svg>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12">
                      <div class="form-group position-relative">
                        <div class="display-flex flex-nowrap justify-content-space-between">
                          <label>Message on card</label>
                          <span class="font-size-12"><span class="show_lnh_text">0</span>/250</span>
                        </div>
                        <textarea maxlength="250" rows="3" class="form-input full-width custom-scroll" id="card_msg" name="" placeholder="Type your message...."></textarea>
                      </div>
                    </div>
                    <?php /* <div class="col-md-4 col-sm-4 col-xs-12">
                      <div class="form-group position-relative">
                        <label>Special Instruction</label>
                        <input type="text" class="form-input full-width" name="" id="spl_instruction" placeholder="Special Instruction....">
                      </div>
                    </div> */ ?>
                  </div>
                  <div class="sender-detail">
                    <h3>Sender Details</h3>
                    <div class="hide_exit_sender_col">
                      <div class="row mb-15">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="select_addrs_col hide_sender_detail_col">
                            <p class="font-size-12 margin-bottom-none lh-20"><?php echo $sender_name ?>, <?php echo $sender_phone ?></p>
                            <p class="font-size-12 lh-20"><?php echo $sender_email ?></p>
                            <div class="display-flex align-items-center">
                              <input type="checkbox" name="" class="disclose_sender_details" value="1" style="margin-top: 0;margin-right: 5px;">
                              <p style="color: #BABFC3" class="font-size-12 margin-bottom-none">Don't disclose sender details.</p>
                            </div>
                          </div>
                          <div class="address_edit_btn display-flex align-items-center cursor-pointer">
                            <span class="mr-5">Edit </span>
                            <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M10.8656 1.13434C10.6195 0.888251 10.2857 0.75 9.93763 0.75C9.58957 0.75 9.25576 0.888251 9.00963 1.13434L8.43113 1.71284L10.2871 3.56884L10.8656 2.99034C11.1117 2.74421 11.25 2.4104 11.25 2.06234C11.25 1.71429 11.1117 1.38048 10.8656 1.13434ZM9.75663 4.09934L7.90063 2.24334L3.70063 6.44334C3.39205 6.75176 3.16522 7.13223 3.04063 7.55034L2.64063 8.89284C2.62132 8.95763 2.61988 9.02643 2.63646 9.09196C2.65304 9.1575 2.68703 9.21733 2.73483 9.26514C2.78264 9.31294 2.84247 9.34693 2.90801 9.36351C2.97354 9.3801 3.04234 9.37866 3.10713 9.35934L4.44963 8.95934C4.86774 8.83476 5.24821 8.60792 5.55663 8.29935L9.75663 4.09934Z" fill="white"/>
                            <path d="M2.625 2.625C2.22718 2.625 1.84564 2.78304 1.56434 3.06434C1.28304 3.34564 1.125 3.72718 1.125 4.125V9.375C1.125 9.77282 1.28304 10.1544 1.56434 10.4357C1.84564 10.717 2.22718 10.875 2.625 10.875H7.875C8.27282 10.875 8.65436 10.717 8.93566 10.4357C9.21696 10.1544 9.375 9.77282 9.375 9.375V6.75C9.375 6.65054 9.33549 6.55516 9.26517 6.48484C9.19484 6.41451 9.09946 6.375 9 6.375C8.90054 6.375 8.80516 6.41451 8.73483 6.48484C8.66451 6.55516 8.625 6.65054 8.625 6.75V9.375C8.625 9.57391 8.54598 9.76468 8.40533 9.90533C8.26468 10.046 8.07391 10.125 7.875 10.125H2.625C2.42609 10.125 2.23532 10.046 2.09467 9.90533C1.95402 9.76468 1.875 9.57391 1.875 9.375V4.125C1.875 3.92609 1.95402 3.73532 2.09467 3.59467C2.23532 3.45402 2.42609 3.375 2.625 3.375H5.25C5.34946 3.375 5.44484 3.33549 5.51516 3.26517C5.58549 3.19484 5.625 3.09946 5.625 3C5.625 2.90054 5.58549 2.80516 5.51516 2.73483C5.44484 2.66451 5.34946 2.625 5.25 2.625H2.625Z" fill="white"/>
                            </svg>
                          </div>
                        </div>
                      </div>
                  </div>
                    <div class="show_sender_details" style="display: none;">
                      <div class="row">
                      <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="form-group position-relative has-error">
                          <label>Sender Name <span class="text-danger">*</span></label>
                          <input type="text" class="form-input full-width pd-width-icon sender_name" name="" value="<?php echo $sender_name ?>" placeholder="Sender Name">
                          <div class="envlope-icon" style="top: 40px;">
                            <svg style="width: 16px;" width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M8 8C7.20887 8 6.43552 7.76541 5.77772 7.32588C5.11992 6.88635 4.60723 6.26164 4.30448 5.53074C4.00173 4.79983 3.92252 3.99556 4.07686 3.21964C4.2312 2.44372 4.61216 1.73098 5.17157 1.17157C5.73098 0.612165 6.44372 0.231202 7.21964 0.0768607C7.99556 -0.0774802 8.79983 0.00173314 9.53073 0.304484C10.2616 0.607234 10.8864 1.11992 11.3259 1.77772C11.7654 2.43552 12 3.20888 12 4C12 5.06087 11.5786 6.07828 10.8284 6.82843C10.0783 7.57857 9.06087 8 8 8ZM8 10C10.6703 10 16 11.3398 16 14V16H0V14C0 11.3398 5.32971 10 8 10Z" fill="#F65F73"></path>
                            </svg>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="form-group position-relative has-error">
                          <label>Sender Phone Number <span class="text-danger">*</span></label>
                          <input type="number" class="form-input full-width pd-width-icon sender_phone phone-enter" value="<?php echo $sender_phone ?>" name="" placeholder="Enter 10 digit mobile number">
                          <span id="error" style="color:red"></span>
                          <div class="envlope-icon" style="top: 40px;">
                            <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/phone-icon.png" alt="" style="width: 12px;">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="form-group position-relative has-error">
                          <label>Sender Email <span class="text-danger">*</span></label>
                          <input type="text" class="email-input sender_email" value="<?php echo $sender_email ?>" placeholder="Sender Email" name="">
                          <div class="envlope-icon">
                            <svg style="width: 21px;" width="52" height="39" viewBox="0 0 52 39" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M0.343895 5.97954L25.73 18.6726L51.1164 5.97938C50.9249 2.64493 48.1602 0 44.7778 0H6.68252C3.30004 0 0.535328 2.64501 0.343895 5.97954Z" fill="#F65F73"></path>
                            <path d="M51.127 13.0727L25.73 25.7712L0.333313 13.0729V31.746C0.333313 35.2526 3.17595 38.0952 6.68252 38.0952H44.7778C48.2843 38.0952 51.127 35.2526 51.127 31.746V13.0727Z" fill="#F65F73"></path>
                            </svg>
                          </div>
                        </div>
                      </div>
                    </div>
                    </div>
                  </div>
                </form>
                <button class="btn btn-continue save_and_continue text-white">Save and Continue</button>
              </div>
            </div>
          </div>
          <div id="review-and-pay" class="tab-pane fade">
            <h3>Review and Pay</h3>
            <div class="table-responsive">
             <table class="table cart_table">
                <thead class="hide-mob">
                   <tr>
                      <th>Product Info</th>
                      <th class="" style="text-align: left !important;">Shipping Details</th>
                      <th>Quantity</th>
                      <!-- <th>Shipping Charges</th> -->
                      <th style="padding-right: 0;text-align: right;">Total Price</th>
                   </tr>
                </thead>
                <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center img-thumb-col hide-mob">
                  <div class="display-flex align-items-center xs-align-items-start">
                    <div class="cart-img-thumb text-left">
                      <?php if ($product['thumb']) { ?>
                      <a <?php /* ?> href="<?= $product['href']; ?>" <?php */ ?>><img loading="lazy" decoding="async"src="<?= $product['thumb']; ?>" alt="<?= $product['name']; ?>" title="<?= $product['name']; ?>" class="img-thumbnail" /></a>
                      <?php } ?>
                    </div>
                    <div class="text-left prod-title-col">
                      <p class="mb-0"><?= $product['name']; ?> - <span class="text-primary fw-600"><?= $product['actualPrice']; ?></span></p>
                      <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                      <?php } ?>
                      <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                      <p class="mb-0"><?= $option['name']; ?>: <?= $option['value']; ?></p>
                      <?php } ?>
                      <?php } ?>
                      <?php if ($product['reward']) { ?>
                      <p class="mb-0"><?= $product['reward']; ?></p>
                      <?php } ?>
                      <?php if ($product['recurring']) { ?>
                      <span class="label label-info"><?= $text_recurring_item; ?></span> <small><?= $product['recurring']; ?></small>
                      <?php } ?>
                    </div>
                  </div>
                </td>
                <td class="hide-mob" style="text-align: left">
                  <?php $shipInfo = json_decode($product['shipping_info'], true); ?>
                  <?php if($shipInfo && is_array($shipInfo)){ ?>
                    <p class="mb-0"><?php echo date('jS-F-Y', strtotime($shipInfo['Shipping Date'])) ?>, <?php echo str_replace('u20b9', '₹', $shipInfo['Shipping Type']); ?><br> between <?php echo $shipInfo['Shipping Time'] ?>, <?php echo $shipInfo['City'] ?>-<?php echo $shipInfo['Pincode'] ?></p>
                  <?php } ?>
                </td>
                <td class="text-center img-thumb-col visible-xs xs-pl-0 pb-20" colspan="2">
                  <div class="display-flex align-items-center xs-align-items-start">
                    <div class="cart-img-thumb text-left">
                      <?php if ($product['thumb']) { ?>
                      <a <?php /* ?> href="<?= $product['href']; ?>" <?php */ ?>><img loading="lazy" decoding="async"src="<?= $product['thumb']; ?>" alt="<?= $product['name']; ?>" title="<?= $product['name']; ?>" class="img-thumbnail" /></a>
                      <?php } ?>
                    </div>
                    <div class="text-left prod-title-col">
                      <p class="mb-0"><?= $product['name']; ?> - <span class="text-primary fw-600"><?= $product['actualPrice']; ?></span></p>
                      <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                      <?php } ?>
                      <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                      <p class="mb-0"><?= $option['name']; ?>: <?= $option['value']; ?></p>
                      <?php } ?>
                      <?php } ?>
                      <?php if ($product['reward']) { ?>
                      <p class="mb-0"><?= $product['reward']; ?></p>
                      <?php } ?>
                      <?php if ($product['recurring']) { ?>
                      <span class="label label-info"><?= $text_recurring_item; ?></span> <small><?= $product['recurring']; ?></small>
                      <?php } ?>

                      <div class="visible-xs mt-20">
                        <div class="input-group btn-block display-flex align-items-center">
                          Qty: <?= $product['quantity']; ?>
                        </div>
                      </div>
                    </div>
                  </div>
                </td>
                <?php /* <td class="text-left hide-mob"><?= $product['model']; ?></td> */ ?>
                <td class="text-left quantity_before hide-mob">
                  <div class="input-group btn-block display-flex justify-content-center" style="max-width: 200px;">
                    <?= $product['quantity']; ?>
                  </div>
                </td>
                <?php /*<td class="text-left hide-mob"><?= $product['shiPrice']; ?></td> */ ?>
                <td class="text-left hide-mob"><?= $product['total']; ?></td>
              </tr>
              <?php /*<tr class="visible-xs xs-ship-price">
                <td class="p-l-15">Shipping Charges</td>
                <td class="p-r-15"><?= $product['shiPrice']; ?></td>
              </tr>
              <tr class="visible-xs xs-total-charges">
                <td class="p-l-15">Total Charges</td>
                <td class="p-r-15"><?= $product['actualPrice']; ?></td>
              </tr> */ ?>
              <tr class="visible-xs">
                <td class="p-l-15 p-r-15" style="text-align: left !important;">
                  <?php $shipInfo = json_decode($product['shipping_info'], true); ?>
                  <?php if($shipInfo && is_array($shipInfo)){ ?>
                    <p class="mb-0"><?php echo date('jS-F-Y', strtotime($shipInfo['Shipping Date'])) ?>, <?php echo str_replace('u20b9', '₹', $shipInfo['Shipping Type']); ?><br> between <?php echo $shipInfo['Shipping Time'] ?>, <?php echo $shipInfo['City'] ?>-<?php echo $shipInfo['Pincode'] ?></p>
                  <?php } ?>
                </td>
              </tr>
              
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?= $voucher['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?= $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
                <td class="text-right"><?= $voucher['amount']; ?></td>
                <td class="text-right"><?= $voucher['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
             </table>
            </div>
            <div class="row">
              <div class="col-md-6 col-sm-6 col-xs-12 xs-pl-0 xs-pr-0 checkout-cart">
                <div class="btm-card-cart">
                  <h3 class="mt-0 mb-15">Voucher Details</h3>
                  <div class="panel-group boucher-col" id="accordion">
                    <div class="panel panel-default">
                      <div class="panel-collapse full-width">
                        <div class="panel-body pr-0">
                          <label class="col-sm-2 control-label" for="input-coupon">Enter your Coupon or Gift Voucher here</label>
                          <div class="input-group mb-15">
                            <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="Enter your Coupon or Gift Voucher here" id="input-coupon" class="form-control">
                            <span class="input-group-btn">
                              <input type="button" value="Apply Coupon" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary" <?php if(!$coupon){ ?> style="display: block;" <?php  } ?> />
                              <input type="button" id="remove-coupon" value="Remove Coupon" data-loading-text="<?php echo $text_loading; ?>" <?php if($coupon){ ?> style="display: block;" <?php  } ?> class="btn btn-primary">
                            </span>
                          </div>
                          <div class="view-more-coupon text-primary pull-right cursor" style="background-color: transparent;cursor: pointer;text-decoration: underline;">View More Coupons</div>
                          <div class="coupon-popup">
                            <div class="coupon-item-col">
                              <div>
                                <h3 class="mt-0 fw-600">Apply Coupon</h3>
                                <span style="position: absolute;; cursor: pointer;right: 7px;top: 10px;" class="clspopup close-pincode-popup">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
                                <path d="M16.4673 14.9982L20.9422 10.5338C21.1381 10.3378 21.2482 10.072 21.2482 9.79492C21.2482 9.51779 21.1381 9.25201 20.9422 9.05605C20.7462 8.86009 20.4804 8.75 20.2033 8.75C19.9262 8.75 19.6604 8.86009 19.4644 9.05605L15 13.5309L10.5356 9.05605C10.3396 8.86009 10.0738 8.75 9.7967 8.75C9.51957 8.75 9.25379 8.86009 9.05783 9.05605C8.86187 9.25201 8.75178 9.51779 8.75178 9.79492C8.75178 10.072 8.86187 10.3378 9.05783 10.5338L13.5327 14.9982L9.05783 19.4627C8.96029 19.5594 8.88287 19.6745 8.83003 19.8013C8.7772 19.9281 8.75 20.0641 8.75 20.2015C8.75 20.3389 8.7772 20.4749 8.83003 20.6017C8.88287 20.7286 8.96029 20.8437 9.05783 20.9404C9.15457 21.0379 9.26967 21.1154 9.39648 21.1682C9.5233 21.221 9.65932 21.2482 9.7967 21.2482C9.93407 21.2482 10.0701 21.221 10.1969 21.1682C10.3237 21.1154 10.4388 21.0379 10.5356 20.9404L15 16.4656L19.4644 20.9404C19.5612 21.0379 19.6763 21.1154 19.8031 21.1682C19.9299 21.221 20.0659 21.2482 20.2033 21.2482C20.3407 21.2482 20.4767 21.221 20.6035 21.1682C20.7303 21.1154 20.8454 21.0379 20.9422 20.9404C21.0397 20.8437 21.1171 20.7286 21.17 20.6017C21.2228 20.4749 21.25 20.3389 21.25 20.2015C21.25 20.0641 21.2228 19.9281 21.17 19.8013C21.1171 19.6745 21.0397 19.5594 20.9422 19.4627L16.4673 14.9982Z" fill="#191A0B"></path></svg>               
                              </span>
                              </div>
                              <?php foreach($availableCoupons as $coupon) { ?>
                              <div class="coupon-item" style="">
                                <div class="display-flex mb-15 justify-content-between align-items-center">
                                  <div>
                                    <h3 class="coupon-code mb-0 mt-0 fw-600"><?= $coupon['code']; ?></h3>
                                  </div>
                                  <div>
                                    <button style="background-color: transparent;" type="button" onclick="applyCouponFromList('<?= $coupon['code']; ?>')" class="home-secondary-btn cpn-apply">Apply</button>
                                  </div>
                                </div>
                                <div>
                                  <span class="coupon-description"><?= $coupon['frontend_description']; ?></span>
                                </div>
                              </div>
                              <?php } ?>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>  
                  <p class="error coupon-error" style="display: none;"> Warning: Coupon is either invalid, expired or reached its usage limit!</p>
                  <p class="success coupon-success" style="display: none;"> Success: Your coupon discount has been applied!</p>
                </div>  
              </div>
              <div class="col-md-6 col-sm-6 col-xs-12 pull-right">
                <div class="btm-card-cart checkout-price-col" style="min-height: 190px;">
                  <h3 class="mt-0 mb-15">Price Details</h3>
                  <table class="table cart_table cart_table_total">
                  <?php /* foreach ($totals as $total) { ?>
                  <tr>
                    <td><?= $total['title']; ?></td>
                    <td class="text-right"><b><?= $total['text']; ?></b></td>
                  </tr>
                  <?php } */ ?>
                </table>
                <div class="payment-col">
                  <button type="button" class="continue_and_pay btn btn-primary full-width" style="background: #4BB543 !important;border-color:#4BB543 !important;">Pay Now</button>
                  <div id="razorpaydiv" style="display: none;"></div>
                </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
function applyCouponFromList(code){
    $('#input-coupon').val(code);
    $('#button-coupon').trigger('click');
  }
$('#remove-coupon').on('click', function() {
$('.coupon-error').hide();
$('.coupon-success').hide();
  $.ajax({
    url: 'index.php?route=extension/total/coupon/coupon',
    type: 'post',
    data: 'coupon=&removeCoupon=1',
    dataType: 'json',
    beforeSend: function() {
      $('#remove-coupon').button('loading');
    },
    complete: function() {
      $('#remove-coupon').button('reset');
    },
    success: function(json) {
      if (json['error']) {
        $('.coupon-error').html(json['error']);
        $('.coupon-error').show();
        $('#remove-coupon').show();
        $('#button-coupon').hide();
      }

      if (json['redirect']) {
        $('.coupon-success').html("Success: Coupon has been removed successfully!");
        $('.coupon-success').show();
        $('#button-coupon').show();
        $('#remove-coupon').hide();
      }

      $.ajax({
          url: 'index.php?route=checkout/checkout/getCustomTotals',
          type: 'post',
          data: "",
          dataType: 'json',
          beforeSend: function() {
        $('#button-shipping-address').button('loading');
        },
          success: function(json1) {
            console.log(JSON.stringify(json1));
            var totalHtml = "";
            var jsn = json1['totals'];
            for(var i in jsn){
              totalHtml += "<tr><td>"+jsn[i]['title']+"</td><td>"+jsn[i]['text']+"</td></tr>";
            }
            $('.cart_table_total').html(totalHtml);
            //
            $('#review-and-pay-main').trigger('click');
            $('.progress-point-wrap').addClass('active');
            $('.back_delivery_details').removeClass('hide');
          }
        })  
    }
  });
});

$('#button-coupon').on('click', function() {
$('.coupon-error').hide();
$('.coupon-success').hide();
  $.ajax({
    url: 'index.php?route=extension/total/coupon/coupon',
    type: 'post',
    data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
    dataType: 'json',
    beforeSend: function() {
      $('#button-coupon').button('loading');
    },
    complete: function() {
      $('#button-coupon').button('reset');
    },
    success: function(json) {
      if (json['error']) {
        $('.coupon-error').html(json['error']);
        $('.coupon-error').show();
        $('#button-coupon').show();
        $('#remove-coupon').hide();
      }

      if(json['redirect']) { 
        $('.coupon-success').html("Success: Your coupon discount has been applied!");
        $('.coupon-success').show();
        $('#button-coupon').hide();
        $('#remove-coupon').show();
      }
      $.ajax({
          url: 'index.php?route=checkout/checkout/getCustomTotals',
          type: 'post',
          data: "",
          dataType: 'json',
          beforeSend: function() {
        $('#button-shipping-address').button('loading');
        },
          success: function(json1) {
            console.log(JSON.stringify(json1));
            var totalHtml = "";
            var jsn = json1['totals'];
            for(var i in jsn){
              totalHtml += "<tr><td>"+jsn[i]['title']+"</td><td>"+jsn[i]['text']+"</td></tr>";
            }
            $('.cart_table_total').html(totalHtml);
            //
            $('#review-and-pay-main').trigger('click');
            $('.progress-point-wrap').addClass('active');
            $('.back_delivery_details').removeClass('hide');
          }
        })  

     
    }
  });
});

$('.continue_and_pay').click(function(){
  var elPay = $(this);
  elPay.html("Processing payment...");
  $.ajax({
        url: 'index.php?route=checkout/confirm',
        dataType: 'html',
        success: function(html) {
          if(isValidJSON(html) && hasKey(html, "redirect")){
            const obj = JSON.parse(html);
            elPay.html("Try again"+obj.redirect); 
            alert("Your session has been timeout. Please login and try again"+obj.redirect); 
            window.location = "https://www.flavoursguru.com/cart";
          } else {
            //elPay.html("Order Placed...");
            $('#razorpaydiv').html(html);
            $('.paynow').trigger('click');  
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
})

function hasKey(jsonString, key) {
    if (!isValidJSON(jsonString)) {
        return false;
    }
    
    const obj = JSON.parse(jsonString);
    return key in obj;
}

function isValidJSON(str) {
  try {
    const obj = JSON.parse(str);
    return obj && typeof obj === "object";
  } catch (e) {
      return false;
  }
}


<?php if (!$logged) { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/login',
        dataType: 'html',
        success: function(html) {
           $('#collapse-checkout-option .panel-body').html(html);

      $('#collapse-checkout-option').parent().find('.panel-heading .panel-title').html('<a href="#collapse-checkout-option" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><div class="info_svg_icon"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/user_login.svg" alt="" /></div><div class="panel_title_col"><div class="checkout-step">Step 1</div><div class="checkout-title">Login Details</div></div><span class="edit_info_checkout">Edit</span></a>');

      $('a[href=\'#collapse-checkout-option\']').trigger('click');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
<?php } else { ?>
$(document).ready(function() {
  $('.add_new_address_btn').click(function(){
    $('.add_new_address_btn_col').fadeOut();
    $('.add_new_address').fadeIn();
    $('.old_address_col').fadeOut();
  });
  $('.address_edit_btn').click(function(){
    $('.show_sender_details').fadeIn();
    $('.hide_exit_sender_col').hide();
  })

  $('.save_and_continue').click(function(){
    var address_id =  $('input[name=select_addres]:checked').val();
    var card_message = $('#card_msg').val();
    var special_instruction = $('#spl_instruction').val();
    var occasion = $('#occasion').val();
    
    if(address_id){
        var shipping_address = 'existing';  
    }
    var firstname = $('.firstname').val();
    var address_1 = $('.address_1').val();
    var city = $('.city').val();
    var phone = $('.phone').val();
    var postcode = $('.postcode').val();
    var sender_name = $('.sender_name').val();
    var sender_phone = $('.sender_phone').val();
    var sender_email = $('.sender_email').val();
    var disclose_sender_details = $('.disclose_sender_details').prop('checked');
    
    if(!firstname && !address_id){
      alert("Please select the address first or add new address");
      return
    }
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/save',
        type: 'post',
        data: "address_id=" + address_id + "&card_message="+card_message+"&special_instruction="+special_instruction+"&occasion="+occasion+"&shipping_address="+shipping_address+"&firstname=" + firstname+"&address_1=" + address_1+"&city=" + city+"&phone=" + phone+"&postcode=" + postcode+"&country_id=99&zone_id=1&sender_name="+sender_name+"&sender_phone="+sender_phone+"&sender_email="+sender_email+"&disclose_sender_details="+disclose_sender_details,
        dataType: 'json',
        beforeSend: function() {
      $('#button-shipping-address').button('loading');
      },
        success: function(json) {
          
          $.ajax({
            url: 'index.php?route=checkout/checkout/getCustomTotals',
            type: 'post',
            data: "",
            dataType: 'json',
            beforeSend: function() {
          $('#button-shipping-address').button('loading');
          },
            success: function(json1) {
              console.log(JSON.stringify(json1));
              var totalHtml = "";
              var jsn = json1['totals'];
              for(var i in jsn){
                totalHtml += "<tr><td>"+jsn[i]['title']+"</td><td>"+jsn[i]['text']+"</td></tr>";
              }
              $('.cart_table_total').html(totalHtml);
              //
              $('#review-and-pay-main').trigger('click');
              $('.progress-point-wrap').addClass('active');
              $('.back_delivery_details').removeClass('hide');
            }
          })

        }
      })
  })
    

    var cale_max_length = 250; 
    $('#card_msg').keyup(function () {
        var cakelen = cale_max_length - $(this).val().length; 
        //alert(cakelen);
        $('.show_lnh_text').text(cakelen); 
    });
});
<?php } ?>


//--></script>

<script> 
$('#input-email').blur(function(){
    alert("This input field has lost its focus.");
});
$(".phone-enter").on('keyup',function(e){
  this.value = this.value.replace(/[^0-9\.]/g,'');
  this.value = this.value.slice(0, 10) + "";
  var phoneno = /^\d{10}$/;
  var inputtxt = $(".phone-enter").val().trim();
  if(inputtxt.length>1)
  if(!inputtxt.match(phoneno))
  {
    $("#error").html('Please enter 10 digit mobile number');
  }else{

    $("#error").empty();
  }
});

$(".view-more-coupon").click(function () {
  $('.coupon-popup').fadeIn();
  $('body').css('overflow-y','hidden');
});
$(".close-pincode-popup, .cpn-apply").click(function () {
  $('.coupon-popup').fadeOut();
  $('body').css('overflow-y','auto');
});
</script>
<?php echo $footer; ?>
