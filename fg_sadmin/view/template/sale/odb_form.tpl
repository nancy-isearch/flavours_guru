<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="tab-pane" id="tab-data">
              <div class="form-group col-sm-12">
                <table class="table table-bordered">
                  <tr>
                    <td><strong>ODB Id</strong></td>
                    <td><?php echo $odb_info['oid']; ?></td>
                  </tr>
                  <tr>
                    <td><strong>Order Id</strong></td>
                    <td><a href="<?php echo $odb['order_link'] ?>"><?php echo $odb_info['order_id']; ?></a></td>
                  </tr>
                  <tr>
                    <td><strong>Customer Name</strong></td>
                    <td><?php echo $odb_info['payment_firstname']; ?></td>
                  </tr>
                  <tr>
                    <td><strong>Customer Email</strong></td>
                    <td><?php echo $odb_info['payment_email']; ?></td>
                  </tr>
                  <tr>
                    <td><strong>Customer Phone</strong></td>
                    <td><?php echo $odb_info['payment_mobile']; ?></td>
                  </tr>
                  <tr>
                    <td><strong>Order Total</strong></td>
                    <td><?php echo $odb_info['total']; ?></td>
                  </tr>
                  <tr>
                    <td><strong>Order Date</strong></td>
                    <td><?php echo $odb_info['date_added']; ?></td>
                  </tr>
                  <tr>
                    <td><strong>Shipping Date</strong></td>
                    <td><?php echo $odb_info['date_forshipping']; ?></td>
                  </tr>
                  <tr>
                    <td><strong>Status</strong></td>
                    <td><?php echo $statuses[$odb_info['odstatus']]; ?></td>
                  </tr>
                  <tr>
                    <td><strong>Assigned To</strong></td>
                    <td><?php echo $adminusers[$odb_info['odcreated_by']]; ?></td>
                  </tr>
                </table>
                <?php if(count($odb_comments) > 0){ ?>
                  <table class="table table-bordered">
                    <tr>
                      <th>Comment</th>
                      <th>Status</th>
                      <th>Date Added</th>
                      <th>Added By</th>
                    </tr>
                    <?php for ($i=0; $i < count($odb_comments); $i++) { ?>
                      <tr>
                        <td><?php echo $odb_comments[$i]['comment'] ?></td>
                        <td><?php echo $statuses[$odb_comments[$i]['status']] ?></td>
                        <td><?php echo $odb_comments[$i]['date_added'] ?></td>
                        <td><?php echo $adminusers[$odb_comments[$i]['added_by']] ?></td>
                      </tr>  
                    <?php } ?>
                  </table>
                <?php } ?>
              </div>
             </div>
            </div>
            <div style="clear: both; border: 1px dotted #ccc;"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-state">Add Comment</label>
              <div class="col-sm-10">
                <textarea class="form-control" name="comment"></textarea>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-state">Status</label>
              <div class="col-sm-10">
                <select class="form-control" name="status">
                  <option value="">Please Select</option>
                  <?php foreach ($statuses as $key => $value) { ?>
                    <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-12" style="text-align: right;">
                <input type="hidden" name="id" value="<?php echo $odb_info['oid']; ?>">
                <button class="btn btn-primary" type="Submit">Submit</button>
              </div>
            </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
  <script type="text/javascript"><!--
// Manufacturer
$('input[name=\'country\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=shipping/cities/country_autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					countries_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
          return {
            label: item['name'],
						value: item['countries_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'country\']').val(item['label']);
		$('input[name=\'country_id\']').val(item['value']);
	}
});

$('input[name=\'state\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=shipping/cities/state_autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request)+'&country_id=' +  encodeURIComponent($("#country_id").val()),
      dataType: 'json',
      success: function(json) {
        json.unshift({
          countries_id: 0,
          name: '<?php echo $text_none; ?>'
        });

        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['zone_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'state\']').val(item['label']);
    $('input[name=\'state_id\']').val(item['value']);
    
  }
});

</script>
  
  
  
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>
