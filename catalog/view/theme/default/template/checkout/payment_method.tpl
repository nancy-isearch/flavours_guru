<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p class="payment-msg"><?php /* echo $text_payment_method; */ ?>Payment</p>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="radio">
  <label class="payment-option-radio">
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <input type="radio" name="payment_method" class="paytm-radio" value="<?php echo $payment_method['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
    <?php echo $payment_method['title']; ?>
    <?php //echo $payment_method['Paytm']; ?>
    <?php if ($payment_method['terms']) { ?>
    (<?php echo $payment_method['terms']; ?>)
    <?php } ?>
  </label>
</div>
<?php } ?>
<?php } ?>
<p style="display: none"><strong><?php echo $text_comments; ?></strong></p>
<p style="display: none">
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<?php if ($text_agree) { ?>
<div class="buttons">
  <div class="payment-option">
    <input style="margin-top: 10px;" type="button" value="MAKE PAYMENT" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
    <div class="terms-condition-text" style="font-size: 14px;"><?php echo $text_agree; ?>
      <?php if ($agree) { ?>
      <input type="checkbox" name="agree" value="1" checked="checked" />
      <?php } else { ?>
      <input type="checkbox" name="agree" value="1" checked="checked" />
      <?php } ?>
      &nbsp;
    </div>
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<?php } ?>
