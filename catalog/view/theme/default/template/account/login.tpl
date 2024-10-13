<?php echo $header; ?>
<div class="container top_positionn">
  <ul class="breadcrumb">
   <?php 
        $i=1; 
        $Totlbrdcum = count($breadcrumbs); 
        foreach($breadcrumbs as $breadcrumb) {  
         if($Totlbrdcum==$i){  
      ?> 
          <li><span class="" style="color: #35a8d4;"><?php echo $breadcrumb['text']; ?> </span></li>
      <?php  } else { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?> </a></li> 
      <?php } $i++; }   ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
     
        <?php /*<div class="col-sm-6">
          <div class="well">
            <h2><?php echo $text_new_customer; ?></h2>
            <p><strong><?php echo $text_register; ?></strong></p>
            <p><?php echo $text_register_account; ?></p>
            <a href="<?php echo $register; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            
        </div>*/ ?>
        <div class="register_form">
        <div class="col-sm-12">
          <div class="well-login" style="display:none;">
            <h2>Welcome to Flavours Guru</h2>
            <?php /*?><p><strong><?php echo $text_i_am_returning_customer; ?></strong></p><?php */?>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="login-email" class="form-control" readonly/>
                <a href="javascript:void(0)" class="notme" style="float:right;margin-bottom:20px;">Login with other E-Mail</a>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
              <input type="submit" value="<?php echo $button_login; ?>" class="btn check btn-primary" />
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
          </div>

          <div class="form-group otpinput" style="display: none;">
              <input type="hidden" name="hidMobile" id="hidMobile" value="">
              <p>Please Enter verification code (OTP) sent to<br> registered email id and mobile no. <span id="usermail1"></span>  <span id="userphone1"></span></p>
              <label class="control-label" for="input-otp">OTP</label>
              <input type="number" name="otp" value="" placeholder="6 digit OTP" id="input-otp" class="form-control">
              <a href="javascript:void(0)" id="resendotp" style="display: none;" class="otpsubmit">Resend OTP</a>
              <div id="otpcountdownbox" style="display: none;">Try resend OTP after (<span id="otpcountdown">60</span>) seconds</div>
              <div class="text-danger" id="input-otp-error" ></div>
              <input type="button" value="Login" class="btn check btn-primary" id="loginotp" >
          </div>

          <div class="orotp" style="display:none;margin-top: 20px;margin-bottom: 20px;height: 1px;border-bottom: solid 1px #aaa;"></div>
          <input type="button" value="Login With OTP" class="btn check btn-primary otpsubmit" style="display: none;">


          <div class="well-check" style="">
            <h2>Welcome to Flavours Guru</h2>
            <?php /*?><p><strong><?php echo $text_i_am_returning_customer; ?></strong></p><?php */?>
            
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="check-email" class="form-control" />
              </div>
              <input type="button" value="CONTINUE" class="btn check btn-primary logincontinue">
          </div>


          <div class="well-register" style="display:none;">
            <form action="<?php echo $register; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group regnameinput">
                <label class="control-label" for="input-firstname">Name</label>
                <input type="text" name="firstname" value="" placeholder="Name" id="input-regfirstname" class="form-control" />
              </div>
              <div class="form-group regemailinput">
                <label class="control-label" for="input-email">E-Mail Address</label>
                <input type="email" name="email" value="" placeholder="E-Mail Address" id="reg-email" class="form-control" />
              </div>
              <div class="form-group regphoneinput">
                <label class="control-label" for="input-telephone">Mobile</label>
                <input type="text" name="telephone" value="" placeholder="Mobile" id="input-regtelephone" class="form-control" maxlength="10" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
              </div>
              <fieldset class="passowrd-box">
                <div class="form-group newpasswordinput">
                  <label class="control-label" for="input-password">Password</label>
                  <input type="password" name="password" value="" placeholder="Password" id="input-regpassword"  class="form-control" />
                  <span class="pass_show" onclick="showHidePassword();"></span>
                </div>
              </fieldset>
              <input type="submit" value="Register" class="btn check btn-primary regsubmit" />
            </form>
          </div>


          <!--<div class="form-group reg-withus">
           Are you a new user? <a href="<?php echo $register; ?>" class="regWithUs"> Register With Us</a>
          </div>-->
        </div>
        </div>
        <div class="or_box"></div>
      	<?php echo $social_login ?>
   
      <?php echo $content_bottom; ?></div>
    <?php //echo $column_right; ?></div>
</div>
<script type="text/javascript">
  $('#input-regtelephone').keypress(function(e){ 
     if (this.value.length == 0 && e.which == 48 ){
        return false;
     }//else{
      //alert('Please enter mobile no. without 0 keypress');
     //}
  });
</script>
<?php echo $footer; ?>