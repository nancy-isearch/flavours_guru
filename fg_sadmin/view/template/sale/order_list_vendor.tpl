<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <?php /* ?><button type="submit" id="button-shipping" form="form-order" formaction="<?php echo $shipping; ?>" formtarget="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></button>
        <button type="submit" id="button-invoice" form="form-order" formaction="<?php echo $invoice; ?>" formtarget="_blank" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info"><i class="fa fa-print"></i></button>
        <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" id="button-delete" form="form-order" formaction="<?php echo $delete; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></button><?php */ ?>
      </div>
      <h1><?= $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?= $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?= $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?= $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-order-id"><?= $entry_order_id; ?></label>
                <input type="text" name="filter_order_id" value="<?= $filter_order_id; ?>" placeholder="<?= $entry_order_id; ?>" id="input-order-id" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-customer"><?= $entry_customer; ?></label>
                <input type="text" name="filter_customer" value="<?= $filter_customer; ?>" placeholder="<?= $entry_customer; ?>" id="input-customer" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-email"><?= $entry_email; ?></label>
                <input type="text" class="form-control" value="<?= $filter_email ?>" name="filter_email" placeholder="<?= $entry_email ?>" id="input-email" />
              </div>
            </div>

            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-phone"><?= $entry_phone; ?></label>
                <input type="text" class="form-control" value="<?= $filter_phone ?>" name="filter_phone" placeholder="<?= $entry_phone ?>" id="input-phone" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-order-status"><?= $entry_order_status; ?></label>
                <select name="filter_order_status" id="input-order-status" class="form-control">
                  <option value="*"></option>
                  <?php if ($filter_order_status == '0') { ?>
                  <option value="0" selected="selected"><?= $text_missing; ?></option>
                  <?php } else { ?>
                  <option value="0"><?= $text_missing; ?></option>
                  <?php } ?>
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $filter_order_status) { ?>
                  <option value="<?= $order_status['order_status_id']; ?>" selected="selected"><?= $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?= $order_status['order_status_id']; ?>"><?= $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <!-- <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-total"><?= $entry_total; ?></label>
                <input type="text" name="filter_total" value="<?= $filter_total; ?>" placeholder="<?= $entry_total; ?>" id="input-total" class="form-control" />
              </div>
            </div> -->

            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-city"><?= $entry_city; ?></label>
                <input type="text" name="filter_city" value="<?= $filter_city; ?>" placeholder="<?= $entry_city; ?>" id="input-city" class="form-control" />
              </div>
            </div>

            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-date-added"><?= $entry_date_added; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?= $filter_date_added; ?>" placeholder="<?= $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
            
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-date-delivery">Order Shipping Date</label>
                <div class="input-group date">
                  <input type="text" name="filter_date_delivery" value="<?= $filter_date_delivery; ?>" placeholder="Order Shipping Date" data-date-format="YYYY-MM-DD" id="input-date-delivery" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
            
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-date-delivery">Order Shipping Slot</label>
                <div class="input-group date">
                  <input type="text" name="filter_slot_delivery" value="<?= $filter_slot_delivery; ?>" placeholder="Order Shipping Slot" id="input-slot-delivery" class="form-control" />
                </div>
              </div>
            </div>

            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-order-status">Customised Order</label>
                <select name="filter_order_custom" id="input-order-custom" class="form-control">
                  <option value="">No</option>
                  <option value="1" <?php echo $filter_order_custom == 1 ? 'selected' : '' ?>>Yes</option>
                </select>
              </div>
            </div>

            <div class="col-sm-3">
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?= $button_filter; ?></button>
            </div>

          </div>
        </div>
        <form method="post" action="" enctype="multipart/form-data" id="form-order">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-right"><?php if ($sort == 'o.order_id') { ?>
                    <a href="<?= $sort_order; ?>" class="<?= strtolower($order); ?>"><?= $column_order_id; ?></a>
                    <?php } else { ?>
                    <a href="<?= $sort_order; ?>"><?= $column_order_id; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?= $sort_customer; ?>" class="<?= strtolower($order); ?>"><?= $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?= $sort_customer; ?>"><?= $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><a href="javascript:void(0)">Delivery City</a></td>
                    <td class="text-left"><a href="javascript:void(0)">Delivery Pincode</a></td>
                  <td class="text-left"><?php if ($sort == 'order_status') { ?>
                    <a href="<?= $sort_status; ?>" class="<?= strtolower($order); ?>"><?= $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?= $sort_status; ?>"><?= $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_added') { ?>
                    <a href="<?= $sort_date_added; ?>" class="<?= strtolower($order); ?>"><?= $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?= $sort_date_added; ?>"><?= $column_date_added; ?></a>
                    <?php } ?></td>

                  <!-- <td class="text-left"><?php if ($sort == 'o.date_modified') { ?>
                    <a href="<?= $sort_date_modified; ?>" class="<?= strtolower($order); ?>"><?= $column_date_modified; ?></a>
                    <?php } else { ?>
                    <a href="<?= $sort_date_modified; ?>"><?= $column_date_modified; ?></a>
                    <?php } ?></td> -->

                  <td class="text-left"><a href="javascript:void(0)">Delivery Date</a></td>

                    <td class="text-left"><a href="javascript:void(0)">Delivery Slot</a></td>

                  <td class="text-right"><?= $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($orders) { ?>
                <?php foreach ($orders as $order) {// echo '<pre>';print_r($order);?>
                <tr bgcolor="<?=$order['rowcolor']?>">
                  <td class="text-center"><?php if (in_array($order['order_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?= $order['order_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?= $order['order_id']; ?>" />
                    <?php } ?>
                    <input type="hidden" name="shipping_code[]" value="<?= $order['shipping_code']; ?>" /></td>
                  <td class="text-right" width="10%"><?php if($order['custom'] == 1){ ?>
                    <i class="fa fa-flag"></i>
                  <?php } ?> <?= $order['order_id']; ?></td>
                  <td class="text-left"><?= $order['customer']; ?></td>
                  <td class="text-left"><?= $order['city']; ?></td>
                  <td class="text-left"><?= $order['shipping_postcode']; ?></td>
                  <td class="text-left"><?= $order['order_status']; ?></td>
                  <td class="text-left"><?= $order['date_added']; ?></td>
                  <!-- <td class="text-left"><?= $order['date_modified']; ?></td> -->
                  <td class="text-left"><?= $order['date_forshipping']; ?></td>
                  <td class="text-left"><?= $order['slot_forshipping']; ?></td>
                  <td class="text-right"><a href="<?= $order['view']; ?>" data-toggle="tooltip" title="<?= $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <?php /* ?><a href="<?= $order['edit']; ?>" data-toggle="tooltip" title="<?= $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a><?php */ ?></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?= $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?= $pagination; ?></div>
          <div class="col-sm-6 text-right"><?= $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
  url = 'index.php?route=sale/vendororder&token=<?= $token; ?>';

  var filter_order_id = $('input[name=\'filter_order_id\']').val();

  if (filter_order_id) {
    url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
  }

  var filter_customer = $('input[name=\'filter_customer\']').val();

  if (filter_customer) {
    url += '&filter_customer=' + encodeURIComponent(filter_customer);
  }

  var filter_order_status = $('select[name=\'filter_order_status\']').val();

  if (filter_order_status != '*') {
    url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
  }

  var filter_order_custom = $('select[name=\'filter_order_custom\']').val();

  if (filter_order_custom) {
    url += '&filter_order_custom=' + encodeURIComponent(filter_order_custom);
  }

  var filter_total = $('input[name=\'filter_total\']').val();

  if (filter_total) {
    url += '&filter_total=' + encodeURIComponent(filter_total);
  }

  var filter_date_added = $('input[name=\'filter_date_added\']').val();

  if (filter_date_added) {
    url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
  }

  var filter_date_modified = $('input[name=\'filter_date_modified\']').val();

  if (filter_date_modified) {
    url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
  }

  var filter_date_delivery = $('input[name=\'filter_date_delivery\']').val();

  if (filter_date_delivery) {
    url += '&filter_date_delivery=' + encodeURIComponent(filter_date_delivery);
  }

  var filter_slot_delivery = $('input[name=\'filter_slot_delivery\']').val();

  if (filter_slot_delivery) {
    url += '&filter_slot_delivery=' + encodeURIComponent(filter_slot_delivery);
  }

  var filter_email = $('input[name=\'filter_email\']').val();

  if (filter_email) {
    url += '&filter_email=' + encodeURIComponent(filter_email);
  }

  var filter_phone = $('input[name=\'filter_phone\']').val();

  if (filter_phone) {
    url += '&filter_phone=' + encodeURIComponent(filter_phone);
  }

  var filter_city = $('input[name=\'filter_city\']').val();

  if (filter_city) {
    url += '&filter_city=' + encodeURIComponent(filter_city);
  }


  location = url;
});
//--></script> 
  <script type="text/javascript"><!--
$('input[name=\'filter_customer\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=customer/customer/autocomplete&token=<?= $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['customer_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'filter_customer\']').val(item['label']);
  }
});
//--></script> 
  <script type="text/javascript"><!--
$('input[name^=\'selected\']').on('change', function() {
  $('#button-shipping, #button-invoice').prop('disabled', true);

  var selected = $('input[name^=\'selected\']:checked');

  if (selected.length) {
    $('#button-invoice').prop('disabled', false);
  }

  for (i = 0; i < selected.length; i++) {
    if ($(selected[i]).parent().find('input[name^=\'shipping_code\']').val()) {
      $('#button-shipping').prop('disabled', false);

      break;
    }
  }
});

$('#button-shipping, #button-invoice').prop('disabled', true);

$('input[name^=\'selected\']:first').trigger('change');

// IE and Edge fix!
$('#button-shipping, #button-invoice').on('click', function(e) {
  $('#form-order').attr('action', this.getAttribute('formAction'));
});

$('#button-delete').on('click', function(e) {
  $('#form-order').attr('action', this.getAttribute('formAction'));
  
  if (confirm('<?= $text_confirm; ?>')) {
    $('#form-order').submit();
  } else {
    return false;
  }
});
//--></script> 
  <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
  <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
  <script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});


$(document).ready(function(){
  $('#input-order-id,#input-customer,#input-total,#input-city,#input-date-added,#input-date-modified,#input-date-delivery,#input-slot-delivery').keyup(function(ev){
    if (ev.which == 13) {
      $('#button-filter').trigger('click');
    }
  })
  $('#input-order-status').change(function(ev){
    $('#button-filter').trigger('click');
  })
});
//--></script>
</div>
<?= $footer; ?> 