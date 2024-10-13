<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">        
        <a href="<?php echo $add_new; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-seo').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-4">
              <label class="control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
              <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" class="form-control" />
            </div>
            <div class="col-sm-2">
              <div><label>&nbsp;</label></div>
              <button type="button" id="filter" class="btn btn-primary"><i class="fa fa-filter"></i> &nbsp;<?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-seo">             
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th style="width: 1px;" class="text-center">
                    <input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
                  </th>
                  <th>
                    <?php if ($sort == 'query') { ?>
                    <a href="<?php echo $sort_query; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_url; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_query; ?>"><?php echo $column_url; ?></a>
                    <?php } ?>                  
                  </th>
                  <th>
                    <?php if ($sort == 'keyword') { ?>
                    <a href="<?php echo $sort_keyword; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_seo_url; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_keyword; ?>"><?php echo $column_seo_url; ?></a>
                    <?php } ?>
                  </th>
                  <th><?php echo $column_action; ?></th>
                </tr>
              </thead>
              <tbody>
                <?php if($seo_urls){ ?>
                <?php foreach ($seo_urls as $key => $seo_url) {?>
                <tr>
                  <td>
                    <?php if (in_array($seo_url['url_alias_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $seo_url['url_alias_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $seo_url['url_alias_id']; ?>" />
                    <?php } ?>
                  </td>
                  <td>
                    <a href="<?php echo $seo_url['query']; ?>" target="_blank"><?php echo $seo_url['query']; ?></a>
                  </td>
                  <td>
                    <a href="<?php echo $seo_url['keyword']; ?>" target="_blank"><?php echo $seo_url['keyword']; ?></a>                  
                  </td>
                  <td>
                    <a href="<?php echo $edit.'&url_alias_id='.$seo_url['url_alias_id']; ?>" class="btn btn-success btn-s" data-toggle="tooltip" title="<?php echo $button_edit; ?>"><i class="fa fa-edit"></i></a>
                    <a  onclick="confirm('<?php echo $text_confirm; ?>') ? location.href='<?php echo $delete.'&url_alias_id='.$seo_url['url_alias_id']; ?>' : false;" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger btn-s" data-toggle="tooltip" title="<?php echo $button_delete; ?>"><i class="fa fa-trash"></i></a>
                  </td>
                </tr>
                <?php } ?>
                <?php }else{ ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
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
<?php echo $footer; ?>
<script>
  $('#filter').click(function(){
    var url = '<?php echo str_replace("amp;", "", $action); ?>';
    var keyword = $('input[name="keyword"]').val();
    if(keyword){
      window.location = url+'&keyword='+keyword;
    }else{
      window.location = url;
    }
  });
</script>