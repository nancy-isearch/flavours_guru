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
            <?php if($order_status_id == 17 && $customised_cake == 1 && $customised_cake_approved == 1){ ?>
              <button class="btn btn-success btn-xs order_status_btn" value="6" style="font-size: 15px;"><strong>Out for Delivery</strong></button>
            <?php } ?>

            <?php if($order_status_id == 5 && $customised_cake == 0){ ?>
              <button class="btn btn-success btn-xs order_status_btn" value="6" style="font-size: 15px;"><strong>Out for Delivery</strong></button>
            <?php } ?>

            <?php if($order_status_id == 6){ ?>
              <button class="btn btn-success btn-xs order_status_btn" value="7" style="font-size: 15px;"><strong>Delivered</strong></button>
              <button class="btn btn-success btn-xs order_status_btn" value="10" style="font-size: 15px; background: #eb0000; border: #eb0000;"><strong>Delivery Attempted</strong></button>
            <?php } ?>
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
                    <a href="index.php?route=sale/boyorder/edit_special_instruction&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-info"><i class="fa fa-edit"></i></a>
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
              <td class="text-center">Select Product</td>
              <td class="text-left"><?php echo $column_product; ?></td>
              <td class="text-left">Image</td>
              <td class="text-left">Shipping Info</td>
              <td class="text-center"><?php echo $column_quantity; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php $totalPP = 0; ?>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-center"><input type="checkbox" class="selectpro"></td>
              <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                <?php if ($option['type'] != 'file') { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } else { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <a href="<?php echo $option['href']; ?>"><?php echo $option['value']; ?></a></small>
                <?php } ?>
                <?php } ?></td>
              <td class="text-left"><a href="<?php echo $product['image']; ?>" target="_blank"><img src="<?php echo $product['image']; ?>" width="120"></a></td>
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
              <td class="text-center"><?php echo $product['quantity']; ?></td>
            </tr>
            <?php } ?>
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
		url: 'index.php?route=sale/boyorder/createinvoiceno&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
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
		url: 'index.php?route=sale/boyorder/addreward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
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
		url: 'index.php?route=sale/boyorder/removereward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
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
		url: 'index.php?route=sale/boyorder/addcommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
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
		url: 'index.php?route=sale/boyorder/removecommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
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


$('.order_status_btn').click(function(){
  var order_status_val = $(this).val();

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

function updateStatus(order_status_val, boy_id, boy_name){
	if(parseInt(order_status_val) == 6){
	    if ($('.selectpro:checked').length == $('.selectpro').length) {

	    } else {
	    	alert("Please select all products!");
	    	return;
	    }
	}
  $.ajax({
    url: 'index.php?route=sale/boyorder/addOrderHistory&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
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
	if($('select[name=\'order_status_id\']').val() == 6){
	    if ($('.selectpro:checked').length == $('.selectpro').length) {

	    } else {
	    	alert("Please select all products!");
	    	return;
	    }
	}

	$.ajax({
    url: 'index.php?route=sale/boyorder/addOrderHistory&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + ($('input[name=\'notify\']').prop('checked') ? 1 : 0) + '&vendor_id=' + encodeURIComponent($('select[name=\'vendor_id\']').val())+ '&vendor_name=' + encodeURIComponent($('select[name=\'vendor_id\'] option:selected').text()) + '&override=' + ($('input[name=\'override\']').prop('checked') ? 1 : 0) + '&append=' + ($('input[name=\'append\']').prop('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
    beforeSend: function() {
      $('#button-history').button('loading');
    },
    complete: function() {
      $('#button-history').button('reset');
    },
    success: function(json) {
      $('.alert').remove();

      if (json['error']) {
        
      }

      if (json['success']) {
        alert("Order status updated successfully!");

        $('textarea[name=\'comment\']').val('');
      }
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
