<div class="panel panel-default">
  
  <div id="collapse-coupon" class="panel-collapse collapse" style="display: block;">
    <div class="panel-body">
      <label class="col-sm-2 control-label" for="input-coupon"><?php echo $entry_coupon; ?>wewe</label>
      <div class="input-group">
        <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" />
        <span class="input-group-btn">
        <input type="button" value="<?php echo $button_coupon; ?>" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>" style="background-color: #303339;border-color: #303339;"  class="btn btn-primary" />
        <input type="button" value="Remove Coupon" id="button-coupon-remove" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary rmv" style="display: none;" />
        </span>222</div>
      <script type="text/javascript">
      function couponCheckoutFunc(){
      	/*var couponVal = "<?php // echo $coupon1; ?>";
      if(couponVal == ""){
      	alert('1');
      	$('#button-coupon').show();
		$('#button-coupon-remove').hide();
      } else {
      	alert('2');
      	$('#button-coupon').hide();
		$('#button-coupon-remove').show();
      }*/
		$('#button-coupon').on('click', function() {
			$.ajax({
				url: 'index.php?route=extension/total/coupon/couponCheckout',
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
					$('.alert').remove();

					if (json['error']) {
						$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}

					if (json['redirect']) {
						$('#button-coupon').hide();
						$('#button-coupon-remove').show();
						$('.breadcrumb').after('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> Coupon applied successfully.<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

						$('html, body').animate({ scrollTop: 0 }, 'slow');
						jQuery('#button-guest-shipping').trigger('click');
						jQuery('#button-shipping-address').trigger('click');
						
					}
				}
			});
		});

		$('#button-coupon-remove').on('click', function() {
			$.ajax({
				url: 'index.php?route=extension/total/coupon/removeCcouponCheckout',
				type: 'post',
				dataType: 'json',
				beforeSend: function() {
					$('#button-coupon-remove').button('loading');
				},
				complete: function() {
					$('#button-coupon-remove').button('reset');
				},
				success: function(json) {
					$('.alert').remove();

					if (json['msg'] == 1) {
						$('#input-coupon').val('');
						$('#button-coupon').show();
						$('#button-coupon-remove').hide();
						$('.breadcrumb').after('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i>Applied coupon has been removed successfully.<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

						$('html, body').animate({ scrollTop: 0 }, 'slow');
						jQuery('#button-guest-shipping').trigger('click');
						jQuery('#button-shipping-address').trigger('click');
					}

					if (json['msg'] == 0) {
						$('#button-coupon').hide();
						$('#button-coupon-remove').show();
						$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Unable to remove coupon.<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

						$('html, body').animate({ scrollTop: 0 }, 'slow');
						jQuery('#button-guest-shipping').trigger('click');
						jQuery('#button-shipping-address').trigger('click');
					}


					
				}
			});
		})
      }
//--></script>
    </div>
  </div>
</div>
