<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-locality" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-locality" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab">General</a></li>
            <li><a href="#tab-faq" data-toggle="tab">FAQ</a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-category">Parent Category / City</label>
            <div class="col-sm-10">
              <select name="category_id" id="input-category" class="form-control">
                <option value="0">--- Select Category ---</option>
                <?php foreach ($categories as $category) { ?>
                <?php if ($category['category_id'] == $category_id) { ?>
                <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-area-name">Area Name</label>
            <div class="col-sm-10">
              <input type="text" name="area_name" value="<?php echo $area_name; ?>" placeholder="Area Name" id="input-area-name" class="form-control" />
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-region-name">Region Name</label>
            <div class="col-sm-10">
              <input type="text" name="region_name" value="<?php echo $region_name; ?>" placeholder="Region Name" id="input-region-name" class="form-control" />
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pin-code">Pin Code</label>
            <div class="col-sm-10">
              <input type="text" name="pin_code" value="<?php echo $pin_code; ?>" placeholder="Pin Code" id="input-pin-code" class="form-control" />
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order">Sort Order</label>
            <div class="col-sm-10">
              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="Sort Order" id="input-sort-order" class="form-control" />
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status">Status</label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected">Enabled</option>
                <option value="0">Disabled</option>
                <?php } else { ?>
                <option value="1">Enabled</option>
                <option value="0" selected="selected">Disabled</option>
                <?php } ?>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image">Locality Banner Image</label>
            <div class="col-sm-10">
              <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
            </div>
          </div>

          <hr/>
          <h4>Locality SEO and Content</h4>

          <ul class="nav nav-tabs" id="language">
            <?php foreach ($languages as $language) { ?>
            <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <?php foreach ($languages as $language) { ?>
            <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="locality_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($locality_description[$language['language_id']]) ? $locality_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                <div class="col-sm-10">
                  <textarea name="locality_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($locality_description[$language['language_id']]) ? $locality_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                <div class="col-sm-10">
                  <textarea name="locality_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($locality_description[$language['language_id']]) ? $locality_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                <div class="col-sm-10">
                  <textarea name="locality_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" data-toggle="summernote" class="form-control summernote"><?php echo isset($locality_description[$language['language_id']]) ? $locality_description[$language['language_id']]['description'] : ''; ?></textarea>
                </div>
              </div>
            </div>
            <?php } ?>
            </div>
          </div>
          <div class="tab-pane" id="tab-faq">
            <div class="table-responsive">
              <table id="faq" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left">Question</td>
                    <td class="text-left">Answer</td>
                    <td class="text-right">Sort Order</td>
                    <td></td>
                  </tr>
                </thead>
                <tbody>
                  <?php $faq_row = 0; ?>
                  <?php if (isset($locality_faqs)) { ?>
                  <?php foreach ($locality_faqs as $locality_faq) { ?>
                  <tr id="faq-row<?php echo $faq_row; ?>">
                    <td class="text-left"><input type="text" name="locality_faq[<?php echo $faq_row; ?>][question]" value="<?php echo $locality_faq['question']; ?>" placeholder="Question" class="form-control" /></td>
                    <td class="text-left"><textarea name="locality_faq[<?php echo $faq_row; ?>][answer]" rows="3" placeholder="Answer" class="form-control"><?php echo $locality_faq['answer']; ?></textarea></td>
                    <td class="text-right"><input type="text" name="locality_faq[<?php echo $faq_row; ?>][sort_order]" value="<?php echo $locality_faq['sort_order']; ?>" placeholder="Sort Order" class="form-control" /></td>
                    <td class="text-left"><button type="button" onclick="$('#faq-row<?php echo $faq_row; ?>').remove();" data-toggle="tooltip" title="Remove" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                  </tr>
                  <?php $faq_row++; ?>
                  <?php } ?>
                  <?php } ?>
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="3"></td>
                    <td class="text-left"><button type="button" onclick="addFaq();" data-toggle="tooltip" title="Add FAQ" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                  </tr>
                </tfoot>
              </table>
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
$('#language a:first').tab('show');

var faq_row = <?php echo isset($faq_row) ? $faq_row : 0; ?>;

function addFaq() {
	html  = '<tr id="faq-row' + faq_row + '">';
	html += '  <td class="text-left"><input type="text" name="locality_faq[' + faq_row + '][question]" value="" placeholder="Question" class="form-control" /></td>';
	html += '  <td class="text-left"><textarea name="locality_faq[' + faq_row + '][answer]" rows="3" placeholder="Answer" class="form-control"></textarea></td>';
	html += '  <td class="text-right"><input type="text" name="locality_faq[' + faq_row + '][sort_order]" value="" placeholder="Sort Order" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#faq-row' + faq_row + '\').remove();" data-toggle="tooltip" title="Remove" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#faq tbody').append(html);

	faq_row++;
}
//--></script></div>
<?php echo $footer; ?>
