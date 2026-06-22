<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div>
    <div class="well" style="margin: 20px;">
      <div class="row">
        <form method="post" action="index.php?route=report/sale_order_detail/downloadcsv&token=<?php echo $token; ?>">
        <div class="col-sm-12">
          <div class="form-group col-sm-6">
            <label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
            <div class="input-group date">
              <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
              <span class="input-group-btn">
              <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
              </span></div>
          </div>
          <div class="form-group col-sm-6">
            <label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
            <div class="input-group date">
              <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
              <span class="input-group-btn">
              <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
              </span></div>
          </div>
        </div>
        <div class="col-sm-12">
          <button type="submit" class="btn btn-primary btn-xs pull-left" style="margin-left: 15px;"> Download CSV</button>
        </div>
        </form>
      </div>
    </div>
  </div>

  <div>
    <div class="well" style="margin: 20px;">
      <div class="row">
        <form method="post" action="index.php?route=report/sale_order_detail/downloaddeliveredordercsv&token=<?php echo $token; ?>">
        <div class="col-sm-12">
          <div class="form-group col-sm-6">
            <label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
            <div class="input-group date">
              <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
              <span class="input-group-btn">
              <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
              </span></div>
          </div>
          <div class="form-group col-sm-6">
            <label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
            <div class="input-group date">
              <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
              <span class="input-group-btn">
              <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
              </span></div>
          </div>
        </div>
        <div class="col-sm-12">
          <button type="submit" class="btn btn-primary btn-xs pull-left" style="margin-left: 15px;"> Download Delivered Order CSV</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group col-sm-6">
                <label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <div class="form-group col-sm-6">
                <label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="col-sm-12">
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-left">Date Added</td>
                <td class="text-left">Time Added</td>
                <td class="text-left">Order No.</td>
                <td class="text-left">Customer Name</td>
                <td class="text-left">Contact Number</td>
                <td class="text-left">Delivery Date</td>
                <td class="text-left">Timeslot</td>
                <td class="text-left">Shipping Type</td>
                <td class="text-left">Delivery Pin</td>
                <td class="text-left">Delivery City</td>
                <td class="text-left">Payment Mode</td>
                <td class="text-left">Transaction ID</td>
                <td class="text-left">Product Name</td>
                <td class="text-left">SKU</td>
                <td class="text-right">Quantity</td>
                <td class="text-right">Unit Price</td>
                <td class="text-right">GST</td>
                <td class="text-right">Total Amount After GST</td>
                <td class="text-right">Total Order Amount</td>
                <td class="text-right">PP</td>
                <td class="text-right">Order Total PP</td>
                <td class="text-right">Status</td>
                <td class="text-right">Vendor</td>
                <td class="text-right">Delivered Date</td>
                <td class="text-right">Delivered Time</td>
                <td class="text-right">Added by Backend?</td>
                <td class="text-right">Added By</td>
                <td class="text-right">Delivery Boy</td>
                <td class="text-right">Processed By</td>
              </tr>
            </thead>
            <tbody>
              <?php if ($orders) { ?>
              <?php foreach ($orders as $order) { ?>
              <tr>
                <td class="text-left"><?php echo $order['dateadded']; ?></td>
                <td class="text-left"><?php echo $order['timeadded']; ?></td>
                <td class="text-left"><?php echo $order['order_id']; ?></td>
                <td class="text-left"><?php echo $order['cname']; ?></td>
                <td class="text-left"><?php echo $order['telephone']; ?></td>
                <td class="text-left"><?php echo $order['ddate']; ?></td>
                <td class="text-left"><?php echo $order['dtime']; ?></td>
                <td class="text-left"><?php echo $order['dtype']; ?></td>
                <td class="text-left"><?php echo $order['shipping_postcode']; ?></td>
                <td class="text-left"><?php echo $order['dcity']; ?></td>
                <td class="text-left"><?php echo $order['payment_method']; ?></td>
                <td class="text-left"><?php echo $order['transaction_id']; ?></td>
                <td class="text-left"><?php echo $order['name']; ?></td>
                <td class="text-left"><?php echo $order['sku']; ?></td>
                <td class="text-right"><?php echo $order['quantity']; ?></td>
                <td class="text-right"><?php echo $order['price']; ?></td>
                <td class="text-right"><?php echo $order['tax']; ?></td>
                <td class="text-right"><?php echo $order['afterGst']; ?></td>
                <td class="text-right"><?php echo $order['total']; ?></td>
                <td class="text-right"><?php echo $order['pp']; ?></td>
                <td class="text-right"><?php echo $order['pp_total']; ?></td>
                <td class="text-right"><?php echo $order['status']; ?></td>
                <td class="text-right"><?php echo $order['vendor']; ?></td>
                <td class="text-right"><?php echo $order['date']; ?></td>
                <td class="text-right"><?php echo $order['time']; ?></td>
                <td class="text-left"><?php echo ($order['is_admin_order'] == 1) ? 'Yes' : 'No'; ?></td>
                <td class="text-left"><?php echo $order['added_by']; ?></td>
                <td class="text-left"><?php echo $order['boy']; ?></td>
                <td class="text-left"><?php echo $order['processing']; ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=report/sale_order_detail&token=<?php echo $token; ?>';
	
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
		
	var filter_group = $('select[name=\'filter_group\']').val();
	
	if (filter_group) {
		url += '&filter_group=' + encodeURIComponent(filter_group);
	}
	
	var filter_order_status_id = $('select[name=\'filter_order_status_id\']').val();
	
	if (filter_order_status_id != 0) {
		url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
	}	

	location = url;
});
//--></script> 
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script></div>
<?php echo $footer; ?>