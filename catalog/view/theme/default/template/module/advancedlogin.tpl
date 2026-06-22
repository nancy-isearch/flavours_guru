<?php if ($hideadl == 0) { ?>
<div class="social_icons">
 <!-- <h3>Login with Facebook<?php // echo $fbheading; ?></h3> -->
<div class="box-content"> 

<div class="social_iconcol" style="float:left; text-align: right; "> <?php $_SESSION['advurl'] = "https://www.flavoursguru.com/index.php?route=checkout/checkout"; ?>	<a class="box-advancedloginf" href="<?php echo $advancedlogin_url; ?>"><img loading="lazy" decoding="async"alt="" src="<?php echo $fbbutton; ?>"/></a></div>
 
 </div>
 
 <!-- <h3>Login with Google<?php // echo $fbheading; ?></h3> -->
  <div class="box-content"> 
<!--<div class="social_iconcol" style="float:left; text-align: right; "> <?php //$_SESSION['advurl'] = "https://www.flavoursguru.com/index.php?route=checkout/checkout"; ?>	<a class="box-advancedloginf" href="<?php //echo $advancedlogin_url; ?>"><img loading="lazy" decoding="async"alt="" src="<?php //echo $fbbutton; ?>"/></a></div>-->

<div class="social_iconcol" style="float:left; text-align: right;"><a class="box-advancedloging" href="<?php echo $advancedlogin_furl; ?>"><img loading="lazy" decoding="async"alt="" src="<?php echo $gbutton; ?>"/></a></div>
 </div>
 </div>

<?php } ?>
