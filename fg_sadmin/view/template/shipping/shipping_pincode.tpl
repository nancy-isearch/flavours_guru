<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
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
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
          <div class="col-sm-12">
            <label>Select City</label>
            <select class="form-control" name="city_id" required>
              <option value="">Please select</option>
              <?php foreach ($cities as $city) { ?>
                <option value="<?php echo $city['id']; ?>"><?php echo $city['name']; ?></option>
              <?php } ?>
            </select>
          </div>
          <div class="col-sm-12">&nbsp;</div>
          <div class="col-sm-12">
            <label>Upload Sheet</label>
            <input type="file" name="csv" accept=".csv">
          </div>
          <div class="col-sm-12">&nbsp;</div>
          <div class="col-sm-12">
            <button type="submit" name="upload" value="1" class="btn btn-primary">Upload Sheet</button>
            <button type="submit" name="download" value="1" class="btn btn-primary">Download Sheet</button>

            <a href="<?php echo $downloadallpincode; ?>" class="btn btn-primary">Download All Pincodes</a>
          </div>
        </form>
        
      </div>
    </div>
  </div>
  <script type="text/javascript">
$('#button-filter').on('click', function() {
	var url = 'index.php?route=shipping/cities&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
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
</script></div>
<?php echo $footer; ?>