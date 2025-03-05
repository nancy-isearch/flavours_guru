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
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        
        <div class="well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group col-sm-6">
                <label class="control-label" for="input-name">Customer Name</label>
                <input type="text" name="customer_name" value="<?php echo $customer_name; ?>" placeholder="Customer Name" id="input-name" class="form-control" />
              </div>
              <div class="form-group col-sm-6">
                <label class="control-label" for="input-name">Customer Email</label>
                <input type="text" name="customer_email" value="<?php echo $customer_email; ?>" placeholder="Customer Email" id="input-name" class="form-control" />
              </div>
              <div class="form-group col-sm-6">
                <label class="control-label" for="input-name">Customer Phone</label>
                <input type="text" name="customer_phone" value="<?php echo $customer_phone; ?>" placeholder="Customer Phone" id="input-name" class="form-control" />
              </div>
              <div class="form-group col-sm-6">
                <label class="control-label" for="input-name">Status</label>
                <select class="form-control" name="status" id="status">
                  <option value="">Please Select</option>
                  <?php foreach ($statuses as $key => $value) { ?>
                    <option value="<?php echo $key; ?>" <?php echo ($status == $key) ? 'selected' : '' ?>><?php echo $value; ?></option>
                  <?php } ?>
                </select>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left">ODB ID</td>
                  <td class="text-left">Order ID</td>
                  <td class="text-left">Customer Name</td>
                  <td class="text-left">Customer Email</td>
                  <td class="text-left">Customer Phone</td>
                  <td class="text-left">Order Total</td>
                  <td class="text-left">Order Date</td>
                  <td class="text-left">Shipping Date</td>
                  <td class="text-left">OD Status</td>
                  <td class="text-left">Action</td>
                </tr>
              </thead>
              <tbody>
                <?php if ($odbs) { ?>
                <?php foreach ($odbs as $odb) { ?>
                <tr>
                  <td class="text-left"><?php echo $odb['oid']; ?></td>
                  <td class="text-left"><a href="<?php echo $odb['order_link'] ?>"><?php echo $odb['order_id']; ?></a></td>
                  <td class="text-left"><?php echo $odb['customer_name']; ?></td>
                  <td class="text-left"><?php echo $odb['customer_email']; ?></td>
                  <td class="text-left"><?php echo $odb['customer_phone']; ?></td>
                  <td class="text-left"><?php echo round($odb['order_total']); ?></td>
                  <td class="text-left"><?php echo $odb['date_added']; ?></td>
                  <td class="text-left"><?php echo $odb['date_forshipping']; ?></td>
                  <td class="text-left"><?php echo (empty($odb['odstatus'])) ? "Not Started Yet" : $statuses[$odb['odstatus']]; ?></td>
                  <td class="text-right">
                    <?php if(empty($odb['odstatus'])){ ?>
                    <input type="hidden" class="id_hidden" value="<?php echo $odb['order_id']; ?>">
                    <button class="btn btn-primary btn-sm self_assign" type="button">Start</button>
                  <?php } else { ?>
                    <a href="<?php echo $odb['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
                  <?php } ?>
                    </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        <div class="row">
          <div class="col-sm-6 text-left" style="display: none;"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
$('#button-filter').on('click', function() {
	var url = 'index.php?route=sale/odb&token=<?php echo $token; ?>';

	var customer_name = $('input[name=\'customer_name\']').val();

	if (customer_name) {
		url += '&customer_name=' + encodeURIComponent(customer_name);
	}

  var customer_email = $('input[name=\'customer_email\']').val();

  if (customer_email) {
    url += '&customer_email=' + encodeURIComponent(customer_email);
  }

  var customer_phone = $('input[name=\'customer_phone\']').val();

  if (customer_phone) {
    url += '&customer_phone=' + encodeURIComponent(customer_phone);
  }

  var status = $('#status').val();
  if (status) {
    url += '&status=' + encodeURIComponent(status);
  }

	location = url;
});
</script>
  <script type="text/javascript">
$('input[name=\'filter_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=shipping/cities/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
        response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_name\']').val(item['label']);
	}
});
</script>
<script type="text/javascript">
  $('.add_btn').click(function(){
    var id = $(this).prev().prev().prev().val();
    var comment = $(this).prev().prev().val();
    var status = $(this).prev().val();
    $.ajax({
      url: 'index.php?route=sale/odb/savecomment&token=<?php echo $token; ?>',
      method : 'POST',
      data: {comment: comment, id: id, status:status},
      success: function(json) {
        alert('Comment added successfully!');
      }
    });
  })
  $('.self_assign').click(function(){
    var id = $(this).parent().find('.id_hidden').val();
    $.ajax({
      url: 'index.php?route=sale/odb/selfassign&token=<?php echo $token; ?>',
      method : 'POST',
      data: {id: id},
      success: function(json) {
        var json = JSON.parse(json)
        if(json.status == 1){
          alert('Already started!');  
        } else if(json.status == 2){
          alert('Self started successfully!');  
        } else {
          alert('Order is already placed for this lead!');
        }
        
        location.reload();
      }
    });
  })
</script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});
//--></script>
</div>
<?php echo $footer; ?>