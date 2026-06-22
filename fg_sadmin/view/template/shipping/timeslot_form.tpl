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
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-pane" id="tab-data">
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="timeslotname" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                  <?php if ($error_model) { ?>
                  <div class="text-danger"><?php echo $error_model; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-country"><span data-toggle="tooltip" title="<?php echo $help_country; ?>"><?php echo $entry_country; ?></span></label>
                <div class="col-sm-10">
                <select class="form-control" name="datefrom" id="input-country">
                  <?php   
                    if($datefrom){
                    $result = array();
                    for ($n = 0; $n < 25 * 60; $n+=30)
                    {
                        if($n <= 0){
                          continue;
                        }
                         elseif($n > 1410){
                        $result[$date] = "23:59";
                        ?> <option value="<?php echo $result[$date];?>" <?php if($dateto==$result[$date]){echo "selected";}?>><?php echo $result[$date]?></option> <?php 
                        break;
                      } else {
                        $date = sprintf('%02d:%02d', $n / 60, $n % 60);
                       $result[$date] = $date;
                        ?> <option value="<?php echo $result[$date];?>" <?php if($dateto==$result[$date]){echo "selected";}?>><?php echo $result[$date]?></option><?php
                      }                       
                    }
                  }
                  else
                  {
                    $result = array();
                    for ($n = 0; $n < 25 * 60; $n+=30)
                    {
                      if($n <= 0){
                        continue;
                      } elseif($n > 1410){
                        $result[$date] = "23:59";
                        echo "<option value=".$result[$date].">".$result[$date]."</option>";
                        break;
                      } else {
                        $date = sprintf('%02d:%02d', $n / 60, $n % 60);
                        $result[$date] = $date;
                        echo "<option value=".$result[$date].">".$result[$date]."</option>"; 
                      }
                    }
                  }
                  ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-state"><span data-toggle="tooltip" title="<?php echo $help_state; ?>"><?php echo $entry_state; ?></span></label>
                <div class="col-sm-10">
                  <select class="form-control" name="dateto" id="input-state">
                   <?php   
                    if($dateto){
                    $result = array();
                    for ($n = 0; $n < 25 * 60; $n+=30)
                    {
                        if($n <= 0){
                          continue;
                        }
                         elseif($n > 1410){
                        $result[$date] = "23:59";
                        ?> <option value="<?php echo $result[$date];?>" <?php if($dateto==$result[$date]){echo "selected";}?>><?php echo $result[$date]?></option> <?php 
                        break;
                      } else {
                        $date = sprintf('%02d:%02d', $n / 60, $n % 60);
                       $result[$date] = $date;
                        ?> <option value="<?php echo $result[$date];?>" <?php if($dateto==$result[$date]){echo "selected";}?>><?php echo $result[$date]?></option><?php
                      }                       
                    }
                  }
                  else
                  {
                    $result = array();
                    for ($n = 0; $n < 25 * 60; $n+=30)
                    {
                      if($n <= 0){
                        continue;
                      } elseif($n > 1410){
                        $result[$date] = "23:59";
                        echo "<option value=".$result[$date].">".$result[$date]."</option>";
                        break;
                      } else {
                        $date = sprintf('%02d:%02d', $n / 60, $n % 60);
                        $result[$date] = $date;
                        echo "<option value=".$result[$date].">".$result[$date]."</option>"; 
                      }
                    }
                    
                  }
                  ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
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
    
  }
});

</script>
  
  
  
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>
