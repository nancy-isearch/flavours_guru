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
      <div class="pull-right">
        <a href="<?php echo $add; ?>" data-toggle="tooltip" title="Add New" class="btn btn-primary"><i class="fa fa-plus"></i></a>
      </div>
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
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-name"><?php echo $column_category; ?></label>
                <input type="text" name="filter_name" value="<?php echo isset($filter_name) ? $filter_name : ''; ?>" placeholder="<?php echo $column_category; ?>" id="input-name" class="form-control" />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-area-name"><?php echo $column_area_name; ?></label>
                <input type="text" name="filter_area_name" value="<?php echo isset($filter_area_name) ? $filter_area_name : ''; ?>" placeholder="<?php echo $column_area_name; ?>" id="input-area-name" class="form-control" />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-pin-code"><?php echo $column_pin_code; ?></label>
                <input type="text" name="filter_pin_code" value="<?php echo isset($filter_pin_code) ? $filter_pin_code : ''; ?>" placeholder="<?php echo $column_pin_code; ?>" id="input-pin-code" class="form-control" />
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> Filter</button>
            </div>
          </div>
        </div>
        <form action="" method="post" enctype="multipart/form-data" id="form-locality">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $column_category; ?></td>
                  <td class="text-left"><?php echo $column_area_name; ?></td>
                  <td class="text-left"><?php echo $column_pin_code; ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($localities) { ?>
                <?php foreach ($localities as $locality) { ?>
                <tr>
                  <td class="text-left"><?php echo $locality['category_name']; ?></td>
                  <td class="text-left"><?php echo $locality['area_name']; ?></td>
                  <td class="text-left"><?php echo $locality['pin_code']; ?></td>
                  <td class="text-right"><a href="<?php echo $locality['edit']; ?>" data-toggle="tooltip" title="Edit Description" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
  var url = 'index.php?route=catalog/locality&token=<?php echo $token; ?>';

  var filter_name = $('input[name=\'filter_name\']').val();
  if (filter_name) {
    url += '&filter_name=' + encodeURIComponent(filter_name);
  }

  var filter_area_name = $('input[name=\'filter_area_name\']').val();
  if (filter_area_name) {
    url += '&filter_area_name=' + encodeURIComponent(filter_area_name);
  }

  var filter_pin_code = $('input[name=\'filter_pin_code\']').val();
  if (filter_pin_code) {
    url += '&filter_pin_code=' + encodeURIComponent(filter_pin_code);
  }

  location = url;
});
//--></script>
<?php echo $footer; ?>
