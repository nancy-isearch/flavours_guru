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
        <div style="display: none;">
          <div class="well">
            <div class="row">
              <form method="post" action="index.php?route=sale/complaint/downloadcsv&token=<?php echo $token; ?>">
              <div class="col-sm-12">
                <div class="form-group col-sm-6">
                  <label class="control-label" for="input-date-start">Date Start</label>
                  <div class="input-group date">
                    <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="Date Start" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
                <div class="form-group col-sm-6">
                  <label class="control-label" for="input-date-end">Date End</label>
                  <div class="input-group date">
                    <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="Date End" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
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
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left">Ticket Id</td>
                  <td class="text-left">Order No.</td>
                  <td class="text-left">Issue Type</td>
                  <td class="text-left">Issue Details</td>
                  <td class="text-left">Vendor</td>
                  <td class="text-left">Created</td>
                  <td class="text-left">Status</td>
                  <td class="text-left">Action</td>
                </tr>
              </thead>
              <tbody>
                <?php if ($tickets) { ?>
                <?php foreach ($tickets as $ticket) { ?>
                <tr>
                  <td class="text-left"><?php echo $ticket['id']; ?></td>
                  <td class="text-left"><a href="<?php echo $ticket['order_link']; ?>"><?php echo $ticket['order_id']; ?></a></td>
                  <td class="text-left"><?php echo $issuesType[$ticket['issue_type']]; ?></td>
                  <td class="text-left">
                    <?php echo $ticket['issue_detail']; ?>
                      <br><br>
                      
                      <?php $c = 0; foreach ($ticket['comments'] as $key => $value) {
                        if($c == 0){
                          echo "<b>Comments:</b><br>";
                        }
                        if($c > 0){
                          echo "<br><br>";
                        }
                        echo $value['comment']." - ".ucfirst($adminusers[$value['added_by']]);
                        $c++;

                      } ?>
                    </td>
                  <td class="text-left"><?php echo ucfirst($adminusers[$ticket['vendor_id']]); ?></td>
                  <td class="text-left"><?php echo date('d/m/Y', strtotime($ticket['ccreated_at'])); ?></td>
                  <td class="text-left"><?php echo $statuses[$ticket['status']]; ?></td>
                  <td class="text-left">
                    <input type="hidden" class="id_hidden" value="<?php echo $ticket['id']; ?>">
                    

                    <select class="form-control add_status">
                      <option value="">Please Select Status</option>
                      <?php foreach ($statuses as $key => $value) { ?>
                        <option value="<?php echo $key; ?>" <?php echo ($ticket['status'] == $key) ? 'selected' : '' ?>><?php echo $value; ?></option>
                      <?php } ?>
                    </select>
                    <br>
                    Comment:
                    <textarea name="details" class="form-control add_comment"></textarea>
                    <button class="btn btn-primary btn-xs add_btn" style="float: right;" type="button">Add</button>
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
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
$('#button-filter').on('click', function() {
	var url = 'index.php?route=sale/followup&token=<?php echo $token; ?>';

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
    var comment = $(this).parent().find('.add_comment').val();
    var status = $(this).parent().find('.add_status').val();
    var id = $(this).parent().find('.id_hidden').val();
    $.ajax({
      url: 'index.php?route=sale/ticket/savecomment&token=<?php echo $token; ?>',
      method : 'POST',
      data: {comment: comment, id: id, status:status},
      success: function(json) {
        alert('Ticket updated successfully!');
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