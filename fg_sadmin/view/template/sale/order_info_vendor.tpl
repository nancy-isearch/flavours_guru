<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $shipping; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-info-circle"></i> <?php echo $text_order; ?></h3>
          </div>
          <div class="panel-body">
            <?php /*if ($comment) {*/ ?>
            <table class="table table-bordered">
              <thead>
                <tr>
                  <td><?php echo "Special Instruction" ?></td>
                  <td></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-danger"><strong><?php echo $special_instruction; ?></strong></td>
                  <td>
                    <a href="index.php?route=sale/vendororder/edit_special_instruction&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-info"><i class="fa fa-edit"></i></a>
                  </td>
                </tr>
              </tbody>
            </table>
            <?php /*}*/ ?>
          </div>
        </div>
      </div>
    </div>

    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-info-circle"></i> <?php echo $text_order; ?></h3>
        <?php if($order_status_id == 14){ ?>
          <button class="btn btn-success btn-xs order_status_btn" value="15" style="font-size: 15px;"><strong>Accept Order</strong></button>
        <?php } ?>

        <?php if($order_status_id == 15){ ?>
          <button class="btn btn-success btn-xs order_status_btn" value="5" style="font-size: 15px;"><strong>Ready for Dispatch</strong></button>
        <?php } ?>

        <?php if($order_status_id == 17 && $customised_cake == 1 && $customised_cake_approved == 1){ ?>
          <button class="btn btn-success btn-xs order_status_btn_1" style="font-size: 15px;  background: #873636; border: #873636;"><strong>Assign Delivery Boy</strong></button>
          <button class="btn btn-success btn-xs order_status_btn" value="6" style="font-size: 15px;"><strong>Out for Delivery</strong></button>
        <?php } ?>

        <?php if($order_status_id == 5 && $customised_cake == 0){ ?>
          <button class="btn btn-success btn-xs order_status_btn_1" style="font-size: 15px;  background: #873636; border: #873636;"><strong>Assign Delivery Boy</strong></button>
              <button class="btn btn-success btn-xs order_status_btn" value="6" style="font-size: 15px;"><strong>Out for Delivery</strong></button>
            <?php } ?>

        <?php if($order_status_id == 6){ ?>
          <button class="btn btn-success btn-xs order_status_btn" value="7" style="font-size: 15px;"><strong>Delivered</strong></button>
          <button class="btn btn-success btn-xs order_status_btn" value="10" style="font-size: 15px; background: #eb0000; border: #eb0000;"><strong>Delivery Attempted</strong></button>
        <?php } ?>
      </div>
      <div class="panel-body">
        <table class="table table-bordered">
          <thead>
            <tr>
              <?php if ($shipping_method) { ?>
              <td style="width: 50%;" class="text-left"><?php echo $text_shipping_address; ?></td>
              <?php } ?>
            </tr>
          </thead>
          <tbody>
            <tr>
              <?php if ($shipping_method) { ?>
              <td class="text-left"><?php echo $shipping_address; ?>
                <br><br><?php if($disclose_sender_details != 1){ ?><strong>Sender Name:</strong> <?php echo $payment_address; ?><?php } ?>
              </td>
              <?php } ?>
            </tr>
          </tbody>
        </table>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_product; ?></td>
              <td class="text-left">Image</td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-left">Shipping Info</td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right">Price</td>
            </tr>
          </thead>
          <tbody>
            <?php $totalPP = 0; ?>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                <?php if ($option['type'] != 'file') { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } else { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <a href="<?php echo $option['href']; ?>"><?php echo $option['value']; ?></a></small>
                <?php } ?>
                <?php } ?>
                <br><br><p><strong>Product Propertites:</strong><br>
                      <?php foreach ($product['attributes'] as $attribute_group) { ?>
                      <?php foreach ($attribute_group['attribute'] as $attribute) {
                        echo $attribute['name'].': '.$attribute['text'].'<br>';
                      }?>
                      <?php } ?>
              </td>
              <td class="text-left"><a href="<?php echo $product['image']; ?>" target="_blank"><img src="<?php echo $product['image']; ?>" width="120"></a></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-left">
                <?php 
                  $shipInfo = json_decode($product['shipping_info']); 
                  if(json_last_error()) { 
                    if($product['shipping_info']!='NULL'){
                      $tmparray=explode(",",$product['shipping_info']);
                      $shipInfo=array(
                          'City'=>$tmparray[0],
                          'Shipping Date'=>$tmparray[1],
                          'Shipping Time'=>$tmparray[2]
                        );
                    } else {
                      $shipInfo=array();
                    }
                  }  
                  foreach ($shipInfo as $key => $value) {
                    echo $key." - ".$value."<br>";
                  } ?>
              </td>
              <td class="text-right" style="font-size: 20px;font-weight: 700;color: #ff0000"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['pp_price']; $totalPP = $totalPP + $product['pp_price']; ?></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><a href="<?php echo $voucher['href']; ?>"><?php echo $voucher['description']; ?></a></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
            </tr>
            <?php } ?>
            <tr>
              <td colspan="4" class="text-right">Total</td>
              <td class="text-right"><?php echo $totalPP; ?></td>
            </tr>
          </tbody>
        </table>
        <?php /*if ($comment) {*/ ?>
        <table class="table table-bordered">
          <thead>
            <tr>
              <?php /*<td><?php echo $text_comment; ?></td>*/ ?>
              <td><?php echo "Occasion" ?></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <?php /*<td><?php echo $comment; ?></td>*/ ?>
              <td><?php echo $occasion; ?></td>
            </tr>
          </tbody>
        </table>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td><?php echo "Message on Card" ?></td>
              <td><?php echo "Special Instruction" ?></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><?php echo $card_message; ?></td>
              <td><?php echo $special_instruction; ?></td>
            </tr>
          </tbody>
        </table>
        <?php /*}*/ ?>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-comment-o"></i> <?php echo $text_history; ?></h3>
      </div>
      <div class="panel-body">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-history" data-toggle="tab"><?php echo $tab_history; ?></a></li>
          <li><a href="#tab-additional" data-toggle="tab"><?php echo $tab_additional; ?></a></li>
          <?php foreach ($tabs as $tab) { ?>
          <li><a href="#tab-<?php echo $tab['code']; ?>" data-toggle="tab"><?php echo $tab['title']; ?></a></li>
          <?php } ?>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-history">
            <div id="history"></div>
            
          </div>
          <div class="tab-pane" id="tab-additional">
            <?php if ($account_custom_fields) { ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_account_custom_field; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($account_custom_fields as $custom_field) { ?>
                  <tr>
                    <td><?php echo $custom_field['name']; ?></td>
                    <td><?php echo $custom_field['value']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <?php } ?>
            <?php if ($payment_custom_fields) { ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_payment_custom_field; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($payment_custom_fields as $custom_field) { ?>
                  <tr>
                    <td><?php echo $custom_field['name']; ?></td>
                    <td><?php echo $custom_field['value']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <?php } ?>
            <?php if ($shipping_method && $shipping_custom_fields) { ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_shipping_custom_field; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($shipping_custom_fields as $custom_field) { ?>
                  <tr>
                    <td><?php echo $custom_field['name']; ?></td>
                    <td><?php echo $custom_field['value']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <?php } ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_browser; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><?php echo $text_ip; ?></td>
                    <td><?php echo $ip; ?></td>
                  </tr>
                  <?php if ($forwarded_ip) { ?>
                  <tr>
                    <td><?php echo $text_forwarded_ip; ?></td>
                    <td><?php echo $forwarded_ip; ?></td>
                  </tr>
                  <?php } ?>
                  <tr>
                    <td><?php echo $text_user_agent; ?></td>
                    <td><?php echo $user_agent; ?></td>
                  </tr>
                  <tr>
                    <td><?php echo $text_accept_language; ?></td>
                    <td><?php echo $accept_language; ?></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <?php foreach ($tabs as $tab) { ?>
          <div class="tab-pane" id="tab-<?php echo $tab['code']; ?>"><?php echo $tab['content']; ?></div>
          <?php } ?>
        </div>
      </div>
    </div>

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bell"></i> Add Ticket</h3>
      </div>
      <div class="panel-body">
        <div class="row" id="tab-history">
            <fieldset>
              <form class="form-horizontal">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status">Issue Type</label>
                  <div class="col-sm-10">
                    <select name="ticket_issue_type" id="input-order-complaint" class="form-control order_status_update">
                      <option value="0">Please select</option>
                      <option value="1">Non Delivery</option>
                      <option value="2">Late Delivery</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-comment">Issue Detail</label>
                  <div class="col-sm-10">
                    <textarea name="issue_detail" rows="8" id="input-comment" class="form-control"></textarea>
                  </div>
                </div>
              </form>
            </fieldset>
            <div class="text-right">
              <button id="button-ticket" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> Create Ticket</button>
            </div>
          </div>
      </div>
    </div>
    
  </div>

  <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="font-size: 20px; color: #d10000; font-weight: 700;">ALERT!</h4>
      </div>
      <div class="modal-body form-horizontal">
        <div class="form-group assigntovendor" style="display: none;">
          <label class="col-sm-4 control-label" for="input-order-status">Assign Delivery Boy</label>
          <div class="col-sm-8">
            <select name="boy_id" id="input-boy_id" class="form-control">
              <option value="0">Please Select Delivery Boy</option>
              <?php foreach ($boys as $vendor) { ?>
              <?php if ($vendor['user_id'] == $boy_id) { ?>
              <option value="<?php echo $vendor['user_id']; ?>" selected="selected"><?php echo $vendor['firstname'].' '.$vendor['lastname']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $vendor['user_id']; ?>"><?php echo $vendor['firstname'].' '.$vendor['lastname']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <hr>
        </div>
        <?php if($customised_cake == 1){ ?>
          <div style="font-size: 15px;line-height: 30px; display: none;" class="popupmsg1">
            This is the customized cake. Discuss with below to understand further.<br>
            Agent Name: <?php echo $added_by['name'] ?><br>
            Agent Phone: <?php echo $added_by['phone'] ?><br>
          </div>

          <div style="font-size: 15px;line-height: 30px;border-top: 1px dotted;padding-top: 20px;display: none;" class="popupmsg2">
            Share the image of final product in group for approval.<br>
            Agent Name: <?php echo $added_by['name'] ?><br>
            Agent Phone: <?php echo $added_by['phone'] ?><br>
          </div>

        <?php } ?>
        <div style="font-size: 15px;line-height: 30px; display: none;" class="popupmsg11">
          Please Check Special instruction if there is any.
        </div>

        <div style="font-size: 15px;line-height: 30px;border-top: 1px dotted;padding-top: 20px;display: none;" class="popupmsg22">
            Check Cake Message and add on products properly before dispatch.
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary popupsubmit">Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="font-size: 20px; color: #d10000; font-weight: 700;">ALERT!</h4>
      </div>
      <div class="modal-body form-horizontal">
        <div class="form-group assigntovendor">
          <label class="col-sm-4 control-label" for="input-order-status">Assign Delivery Boy</label>
          <div class="col-sm-8">
            <select name="boy_id1" id="input-boy_id" class="form-control">
              <option value="0">Please Select Delivery Boy</option>
              <?php foreach ($boys as $vendor) { ?>
              <?php if ($vendor['user_id'] == $boy_id) { ?>
              <option value="<?php echo $vendor['user_id']; ?>" selected="selected"><?php echo $vendor['firstname'].' '.$vendor['lastname']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $vendor['user_id']; ?>"><?php echo $vendor['firstname'].' '.$vendor['lastname']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <hr>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary popupsubmit1">Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


  <script type="text/javascript"><!--
$(document).delegate('#button-ip-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=user/api/addip&token=<?php echo $token; ?>&api_id=<?php echo $api_id; ?>',
		type: 'post',
		data: 'ip=<?php echo $api_ip; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#button-ip-add').button('loading');
		},
		complete: function() {
			$('#button-ip-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-invoice', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/vendororder/createinvoiceno&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#button-invoice').button('loading');
		},
		complete: function() {
			$('#button-invoice').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['invoice_no']) {
				$('#invoice').html(json['invoice_no']);

				$('#button-invoice').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-reward-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/vendororder/addreward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-reward-add').button('loading');
		},
		complete: function() {
			$('#button-reward-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-reward-add').replaceWith('<button id="button-reward-remove" data-toggle="tooltip" title="<?php echo $button_reward_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-reward-remove', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/vendororder/removereward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-reward-remove').button('loading');
		},
		complete: function() {
			$('#button-reward-remove').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-reward-remove').replaceWith('<button id="button-reward-add" data-toggle="tooltip" title="<?php echo $button_reward_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-commission-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/vendororder/addcommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-commission-add').button('loading');
		},
		complete: function() {
			$('#button-commission-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-commission-add').replaceWith('<button id="button-commission-remove" data-toggle="tooltip" title="<?php echo $button_commission_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-commission-remove', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/vendororder/removecommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-commission-remove').button('loading');
		},
		complete: function() {
			$('#button-commission-remove').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-commission-remove').replaceWith('<button id="button-commission-add" data-toggle="tooltip" title="<?php echo $button_commission_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

var token = '';

// Login to the API
$.ajax({
	url: '<?php echo $catalog; ?>index.php?route=api/login',
	type: 'post',
	dataType: 'json',
	data: 'key=<?php echo $api_key; ?>',
	crossDomain: true,
	success: function(json) {
		$('.alert').remove();

        if (json['error']) {
    		if (json['error']['key']) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['key'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    		}

            if (json['error']['ip']) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['ip'] + ' <button type="button" id="button-ip-add" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> <?php echo $button_ip_add; ?></button></div>');
    		}
        }

        if (json['token']) {
			token = json['token'];
		}
	},
	error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});

$('#history').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#history').load(this.href);
});

$('#history').load('index.php?route=sale/vendororder/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

$('.order_status_update').click(function(){
  var status = $(this).val();
  if(status == 5){
    $('.assigntovendor').show();  
  } else {
    $('.assigntovendor').hide();
  }
})

if($('.order_status_update').val() == 5){
  $('.assigntovendor').show();
}

$('.order_status_btn_1').click(function(){
  $('#myModal1').show();
  $('#myModal1').addClass('in');
})

$('.popupsubmit1').click(function(){
  var boy_id = $('select[name=\'boy_id1\']').val();
  var boy_name = $('select[name=\'boy_id1\'] option:selected').text();
  $.ajax({
    url: 'index.php?route=sale/vendororder/addOrderDeliveryBoy&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'boy_id=' + encodeURIComponent(boy_id)+ '&boy_name=' + encodeURIComponent(boy_name),
    beforeSend: function() {
      $('#button-history').button('loading');
    },
    complete: function() {
      $('#button-history').button('reset');
    },
    success: function(json) {
      alert('Order status updated successfully!');
      location.reload();
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
})

$('.order_status_btn').click(function(){
  var order_status_val = $(this).val();
  var custom_cake = <?php echo $customised_cake ?>;
  if(parseInt(order_status_val) == 15){
    if(custom_cake == 1){
      $('.popupmsg1').show();
    } else {
    	$('.popupmsg11').show();
    }
    $('#myModal').show();
    $('#myModal').addClass('in');
  }

  if(parseInt(order_status_val) == 5){
    if(custom_cake == 1){
      $('.popupmsg2').show();
    } else {
    	$('.popupmsg22').show();
    }
    $('.assigntovendor').show();
    $('#myModal').show();
    $('#myModal').addClass('in');
  }

  if(parseInt(order_status_val) == 6){
    updateStatus(order_status_val, 0, '');
  }

  if(parseInt(order_status_val) == 7){
    updateStatus(order_status_val, 0, '');
  }

  if(parseInt(order_status_val) == 10){
    updateStatus(order_status_val, 0, '');
  }
})

$('.popupsubmit').click(function(){
  var order_status_val = $('.order_status_btn').val();
  var boy_id = $('select[name=\'boy_id\']').val();
  var boy_name = $('select[name=\'boy_id\'] option:selected').text();
  updateStatus(order_status_val, boy_id, boy_name);
})

function updateStatus(order_status_val, boy_id, boy_name){
  $.ajax({
    url: 'index.php?route=sale/vendororder/addOrderHistory&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'order_status_id=' + encodeURIComponent(order_status_val) + '&notify=1&boy_id=' + encodeURIComponent(boy_id)+ '&boy_name=' + encodeURIComponent(boy_name) + '&override=0&append=0&comment=' + encodeURIComponent(''),
    beforeSend: function() {
      $('#button-history').button('loading');
    },
    complete: function() {
      $('#button-history').button('reset');
    },
    success: function(json) {
      alert('Order status updated successfully!');
      location.reload();
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}
$('#button-history').on('click', function() {
	/*
	if (typeof verifyStatusChange == 'function'){
		if (verifyStatusChange() == false){
			return false;
		} else{
			addOrderInfo();
		}
	} else{
		addOrderInfo();
	}*/

	$.ajax({
    url: 'index.php?route=sale/vendororder/addOrderHistory&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + ($('input[name=\'notify\']').prop('checked') ? 1 : 0) + '&boy_id=' + encodeURIComponent($('select[name=\'boy_id\']').val())+ '&boy_name=' + encodeURIComponent($('select[name=\'boy_id\'] option:selected').text()) + '&override=' + ($('input[name=\'override\']').prop('checked') ? 1 : 0) + '&append=' + ($('input[name=\'append\']').prop('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
    beforeSend: function() {
      $('#button-history').button('loading');
    },
    complete: function() {
      $('#button-history').button('reset');
    },
    success: function(json) {
      $('.alert').remove();

      if (json['error']) {
        $('#history').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }

      if (json['success']) {
        $('#history').load('index.php?route=sale/vendororder/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

        $('#history').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

        $('textarea[name=\'comment\']').val('');
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('#button-ticket').on('click', function() {

  $.ajax({
    url: 'index.php?route=sale/ticket/addOrderTicket&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'issue_type=' + encodeURIComponent($('select[name=\'ticket_issue_type\']').val()) + '&issue_detail=' + encodeURIComponent($('textarea[name=\'issue_detail\']').val()),
    beforeSend: function() {
      $('#button-ticket').button('loading');
    },
    complete: function() {
      $('#button-ticket').button('reset');
    },
    success: function(json) {
      $('.alert').remove();

      alert("Ticket added successfully");
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

function changeStatus(){
	var status_id = $('select[name="order_status_id"]').val();

	$('#openbay-info').remove();

	$.ajax({
		url: 'index.php?route=extension/openbay/getorderinfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
		dataType: 'html',
		success: function(html) {
			$('#history').after(html);
		}
	});
}

function addOrderInfo(){
	var status_id = $('select[name="order_status_id"]').val();

	$.ajax({
		url: 'index.php?route=extension/openbay/addorderinfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
		type: 'post',
		dataType: 'html',
		data: $(".openbay-data").serialize()
	});
}

$(document).ready(function() {
	changeStatus();
});

$('select[name="order_status_id"]').change(function(){
	changeStatus();
});
//--></script> 
</div>
<?php echo $footer; ?> 
