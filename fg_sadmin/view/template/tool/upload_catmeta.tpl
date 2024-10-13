<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="Save" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="Back" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Invalid file!
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> Data uploaded successfully!
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Upload File</h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="tab-content">

                 
                
                <div class="form-group required">
                  <label class="col-sm-2 control-label" style="text-align: left; margin-top: -10px;">Select CSV File</label>
                  <div class="col-sm-10">
                    <input type="file" name="file" value="" required="required" />
                  </div>
                </div>

              </div>
            </div>
            
          </div>
          
        </form>
        <br><br>
        <a href="<?php echo $download; ?>" class="btn btn-primary">Download Meta/Footer Sample CSV </a>
        <a href="<?php echo $downloadreport; ?>" class="btn btn-primary">Download Meta/Footer Detailed Sheet </a>
        <br><br>
        <p class="alert alert-info"><strong>Note:- Please add URL in the sheet starting with /</strong></p>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>