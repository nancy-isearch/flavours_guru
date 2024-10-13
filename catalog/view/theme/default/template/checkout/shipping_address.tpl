<style type="text/css">
      .mess-label{
        padding-left: 0px !important;
        padding-right: 0px !important;
      }

      .mess-form{
        margin-top: 32px !important;
      }

      .gueast-name-input{
        width: calc(100% - 65px);
      }

      .select-name-before{
        width: 65px;
      }

      .display-flex{
        display: flex;
      }

      .width-100-per{
        width: 100%;
      }

</style>
<?php
  if($customer_group_id == 2){
    $stl = 'style="display: none;"';
  } else {
    $stl = '';
  }
?>
    <?php if($city && $customer_group_id != 2) { ?>
      <script>
           //$('#existing').show();
           $("#input-shipping-city").attr("readonly","readonly").attr("pointer-events","readonly");;
      </script> 
    <?php } ?>
    <?php if($postcode && $customer_group_id != 2) { ?>
      <script>
           $("#input-shipping-postcode").attr("readonly","readonly").attr("pointer-events","readonly");
      </script> 
    <?php } ?>

<form class="form-horizontal col-md-12 col-sm-12 col-xs-12 p-r-0 p-l-0">
  <div class="col-sm-7 rec-col-1">
  <legend>Delivery Address</legend>
  <?php if ($addresses) { ?>
  <div class="radio"  id="existing" <?php echo $stl; ?>>
    <label>
      <input type="radio" name="shipping_address" id="ex_shipping_address"  value="existing" checked="checked" />
      <?php echo $text_address_existing; ?></label>
  </div>
  <div id="shipping-existing" <?php echo $stl; ?>>
    <select name="address_id" class="form-control">
      <?php $skip = true;
      foreach ($addresses as $address) { 
       if( (strtolower($city) == strtolower($address['city'])) || ( isset($address['postcode']) && !empty($address['postcode'] && $postcode==$address['postcode'])) ){
         $skip = false;
      ?>
      <?php if ($address['address_id'] == $address_id) { ?>
      <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
      <?php } else { ?>
      <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
      <?php } ?>
      <?php }  } 
      if($skip){ ?>
        <option value="">Select from your address book</option> 
        <script type="text/javascript">
          $('#existing,#shipping-existing').hide(); 
          $('#ex_shipping_address').prop('checked', false);       
          $('#new').prop('checked', true);

          $('#new').hide();
         $('#shipping-new').show();
        </script>
     <?php   } ?>
    </select>
  </div>
  <div class="radio" id="new" <?php echo $stl; ?>>
    <label>
      <input type="radio" name="shipping_address" value="new" id="new"/>
      <?php echo $text_address_new; ?></label>
  </div>
  <?php } ?>
  <br />
  <div id="shipping-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-firstname"><?php echo $entry_firstname; ?></label>
      <div class="col-sm-10">
        <div class="display-flex width-100-per">
          <select class="select-name-before form-control">
            <option value="Mr">Mr</option>
            <option value="Ms">Ms</option>
            <option value="Mrs">Mrs</option>
            <option value="Other">Other</option>
          </select>
          <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-shipping-firstname" class="form-control" />
        </div>
      </div>
    </div>
    <?php /*<div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-lastname"><?php echo $entry_lastname; ?></label>
      <div class="col-sm-10">
        <input type="text" name="lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-shipping-lastname" class="form-control" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-shipping-company"><?php echo $entry_company; ?></label>
      <div class="col-sm-10">
        <input type="text" name="company" value="" placeholder="<?php echo $entry_company; ?>" id="input-shipping-company" class="form-control" />
      </div>
    </div>*/ ?>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-address-1"><?php echo $entry_address_1; ?></label>
      <div class="col-sm-10">
        <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-shipping-address-1" class="form-control" />
      </div>
    </div>
    <?php /*<div class="form-group">
      <label class="col-sm-2 control-label" for="input-shipping-address-2"><?php echo $entry_address_2; ?></label>
      <div class="col-sm-10">
        <input type="text" name="address_2" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-shipping-address-2" class="form-control" />
      </div>
    </div>*/ ?>

    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-phone">Phone</label>
      <div class="col-sm-10">
        <input type="number" name="phone" value="<?php echo $phone; ?>"  placeholder="Phone" maxlength="10"  id="input-shipping-phone" class="form-control phone-enter" inputmode='decimal' pattern='[0–9]*' /> 
        <span id="error" style="color:red"></span>
      </div>
    </div>

    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-city"><?php echo $entry_city; ?></label>
      <div class="col-sm-10">
        <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-shipping-city" class="form-control" />
      </div>
    </div>
 

    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-shipping-postcode"><?php echo $entry_postcode; ?></label>
      <div class="col-sm-10">
        <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-shipping-postcode" class="form-control" pattern='[0–9]*' />
        <span id="errorpostcodeMsg"></span>
      </div>
    </div>
    <div class="form-group required" style="display: none;">
      <label class="col-sm-2 control-label" for="input-shipping-country"><?php echo $entry_country; ?></label>
      <div class="col-sm-10">
        <select name="country_id" id="input-shipping-country" class="form-control">
          
          <?php foreach ($countries as $country) { ?>
          <?php if ($country['country_id'] == $country_id) { ?>
          <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group required" style="display: none;">
      <label class="col-sm-2 control-label" for="input-shipping-zone"><?php echo $entry_zone; ?></label>
      <div class="col-sm-10">
        <select name="zone_id" id="input-shipping-zone" class="form-control">
        </select>
      </div>
    </div>
    <?php foreach ($custom_fields as $custom_field) { ?>
    <?php if ($custom_field['location'] == 'address') { ?>
    <?php if ($custom_field['type'] == 'select') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
      <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
      <div class="col-sm-10">
        <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
          <?php } ?>
        </select>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'radio') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
      <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
      <div class="col-sm-10">
        <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="radio">
            <label>
              <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'checkbox') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
      <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
      <div class="col-sm-10">
        <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
          <div class="checkbox">
            <label>
              <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
              <?php echo $custom_field_value['name']; ?></label>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'text') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
      <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
      <div class="col-sm-10">
        <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'textarea') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
      <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
      <div class="col-sm-10">
        <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'file') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
      <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
      <div class="col-sm-10">
        <button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
        <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'date') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
      <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
      <div class="col-sm-10">
        <div class="input-group date">
          <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'time') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
      <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
      <div class="col-sm-10">
        <div class="input-group time">
          <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    <?php } ?>
    <?php if ($custom_field['type'] == 'datetime') { ?>
    <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
      <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
      <div class="col-sm-10">
        <div class="input-group datetime">
          <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    <?php } ?>
    <?php } ?>
    <?php } ?>
  </div>
  
  </div>
  <div class="col-sm-5 rec-col-2 mess-form">
    <!-- <legend>Cake Message</legend> -->
    <?php /* <label class="col-sm-2 control-label mess-label" for="input-shipping-firstname">Cake Message</label>
    <input type="text" name="gift_message" class="form-control gift_message" maxlength="30" value="<?php echo $gift_message; ?>">
    <div class='message-limit'>Maximum Character Limit <span>30</span></div> */ ?>
    
      <label class="mess-label">Occasion</label><br/>
      <select name="occasion" class="occasion-drop form-control">
        <option value="" <?php if($occasion == ''){echo 'selected = selected'; }else{}?> >Select Occasion</option>
        <option value="Birthday" <?php if($occasion ==  'Birthday'){echo 'selected = selected'; }else{}?>>Birthday</option>
        <option value="Anniversary" <?php if($occasion == 'Anniversary'){echo 'selected = selected'; }else{}?>>Anniversary</option>
        <option value="Love and Romace" <?php if($occasion == 'Love and Romace'){echo 'selected = selected'; }else{}?>>Love and Romace</option>
        <option value="Sorry" <?php if($occasion == 'Sorry'){echo 'selected = selected'; }else{}?>>Sorry</option>
        <option value="Congratulation" <?php if($occasion == 'Congratulation'){echo 'selected = selected'; }else{}?>>Congratulation</option>
        <option value="Just like That" <?php if($occasion == 'Just like That'){echo 'selected = selected'; }else{}?>>Just like That</option>
        <option value="Wedding" <?php if($occasion == 'Wedding'){echo 'selected = selected'; }else{}?>>Wedding</option>
        <option value="Bachelorette" <?php if($occasion == 'Bachelorette'){echo 'selected = selected'; }else{}?>>Bachelorette</option>
        <option value="Others" <?php if($occasion == 'Others'){echo 'selected = selected'; }else{}?>>Others</option>
      </select>
    <label class="col-sm-2 control-label mess-label" for="card_message">Message on card</label>
    <input type="text" name="card_message" class="form-control card_message" maxlength="250" value="<?php echo $gift_message; ?>">

    <label class="col-sm-2 control-label mess-label" for="special_instruction">Special instruction</label>
    <input type="text" name="special_instruction" class="form-control special_instruction" maxlength="100" value="<?php echo $gift_message; ?>">
    <div class="sender_detail_col col-md-12 col-sm-12 col-xs-12">
      <h3>Sender Details</h3>
      <div class="form-group required col-xs-6" style="margin-bottom: 5px;">
        <label style="font-size:12px" class="col-sm-1 control-label" for="input-shipping-address-1">Sender Name</label>
        <div class="col-sm-12">
          <input type="text" name="sender_name" value="<?php echo $sender_name; ?>" placeholder="Sender Name" id="input-shipping-sender-name" class="form-control" />
        </div>
      </div>
      <div class="form-group required col-xs-6" style="margin-bottom: 5px;">
        <label style="font-size:12px" class="col-sm-1 control-label" for="input-shipping-address-1">Sender Phone</label>
        <div class="col-sm-12">
          <input type="phone" name="sender_phone" value="<?php echo $sender_phone; ?>" placeholder="Sender Phone" id="input-shipping-sender-phone" class="form-control" inputmode='decimal' pattern='[0–9]*' />
        </div>
      </div>
      <div class="form-group required" style="clear: both;">
        <label style="font-size:12px" class="col-sm-1 control-label" for="input-shipping-address-1">Sender Email</label>
        <div class="col-sm-12">
          <input type="text" name="sender_email" value="<?php echo $sender_email; ?>" placeholder="Sender Email" id="input-shipping-sender-email" class="form-control" />
        </div>
      </div>
    </div>
<div class="buttons clearfix">
    <div class="">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-address" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
    </div>
  </div>
  <div class="coupon-box">
                <?php // echo $coupon_data ?>
              </div>
  </div>
</form>
<script>
jQuery(document).ready(function(){
  var text_limit=30;
  jQuery('.gift_message').keydown(function(){
    var text_length=jQuery(this).val().length;
    if (text_length >= text_limit) {
        var max = jQuery('.gift_message').val();
        jQuery('.gift_message').val(max.substr(0, text_limit));
    }
    var text_length=jQuery(this).val().length;
    jQuery(".message-limit span").html(text_limit-text_length);
  })
})
</script>
<script type="text/javascript"><!--
$('input[name=\'shipping_address\']').on('change', function() {
	if (this.value == 'new') {
		$('#shipping-existing').hide();
		$('#shipping-new').show();
	} else {
		$('#shipping-existing').show();
		$('#shipping-new').hide();
	}
});
//--></script>
<script type="text/javascript"><!--
$('#collapse-shipping-address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#collapse-shipping-address .form-group').length-2) {
		$('#collapse-shipping-address .form-group').eq(parseInt($(this).attr('data-sort'))+2).before(this);
	}

	if ($(this).attr('data-sort') > $('#collapse-shipping-address .form-group').length-2) {
		$('#collapse-shipping-address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('#collapse-shipping-address .form-group').length-2) {
		$('#collapse-shipping-address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#collapse-shipping-address .form-group').length-2) {
		$('#collapse-shipping-address .form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('#collapse-shipping-address button[id^=\'button-shipping-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input[name^=\'custom_field\']').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
$('input[type=number]').keypress(function(e){ 
     if (this.value.length == 0 && e.which == 48 ){
        return false;
     }
  });
//--></script>
<script type="text/javascript"><!--
$('#collapse-shipping-address select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#collapse-shipping-address select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#collapse-shipping-address input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#collapse-shipping-address input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#collapse-shipping-address select[name=\'zone_id\']').html(html);
      $('#collapse-shipping-address select[name=\'zone_id\']').val('1475');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#collapse-shipping-address select[name=\'country_id\']').trigger('change');
//--></script>
<script type="text/javascript">
        
           $('#input-shipping-postcode').keypress(function(e) {
             var a = [];
               var k = e.which;
				a.push(8);
               for (i = 48; i < 58; i++)
                   a.push(i);

               if (!(a.indexOf(k)>=0))
                   e.preventDefault();
           });
       

 
$(document).ready(function(){
$("#input-shipping-postcode").focusout(function(){
   var textLength = $(this).val().length;
   if(textLength>6 || textLength<6){
    /* console.log("Please enter 10 digit valid number");*/
     $("#errortelephoneMsg").text("Please enter 10 digit valid number").addClass("text-danger");
     return false;
   }
   
 }); 
}); 

$(".phone-enter").on('keyup',function(e){
    this.value = this.value.replace(/[^0-9\.]/g,'');
    this.value = this.value.slice(0, 10) + "";

    var phoneno = /^\d{10}$/;
    var inputtxt = $(".phone-enter").val().trim();
    if(inputtxt.length>1)
    if(!inputtxt.match(phoneno))
    {
      $("#error").html('Please enter 10 digit number');
      $('#button-shipping-address').attr('disabled',true);
      return false;
    }else{

      $("#error").empty();
      $('#button-shipping-address').attr('disabled',false);
    }
  });

</script>
<script type="text/javascript">
  /*$('.phone-enter').keyup(function () { 
    this.value = this.value.replace(/[^0-9\.]/g,'');
});*/
</script>   

<?php 
 if($customer_group_id){ ?>
  <script type="text/javascript">
     $( 'input[name="shipping_address"]:radio:last' ).click();
  </script>
 <?php }

?>