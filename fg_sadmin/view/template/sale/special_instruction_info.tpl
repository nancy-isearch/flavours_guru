<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"> <a href="<?php echo $edit; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a> <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-info-circle"></i> <?php echo $text_order; ?></h3>
          </div>
          <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="" class="form-horizontal">
              <input type="hidden" name="order_id" value="<?php echo $order_info['order_id']; ?>">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-special_instruction">Special Instruction</label>
                <div class="col-sm-10">
                  <input name="special_instruction" id="input-special_instruction" value="<?php echo $special_instruction; ?>" class="form-control" />
                </div>
              </div>

              <?php /* ?><div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment">Comment</label>
                <div class="col-sm-10">
                  <input name="comment" id="input-comment" value="<?php echo $comment; ?>" class="form-control" />
                </div>
              </div><?php */ ?>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-message_on_card">Message on Card</label>
                <div class="col-sm-10">
                  <input name="card_message" id="input-message_on_card" value="<?php echo $card_message; ?>" class="form-control" />
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-occasion">Occasion</label>
                <div class="col-sm-10">
                  <input name="occasion" id="input-occasion" value="<?php echo $occasion; ?>" class="form-control" />
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-transid">Transaction ID</label>
                <div class="col-sm-10">
                  <input name="trans_id" id="input-transid" value="<?php echo $custom_field ?>" class="form-control" />
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-payment_method">Payment Method</label>
                <div class="col-sm-10">
                  <select class="form-control" name="payment_method">
                    <option>Please Select</option>
                    <option value="upi_bank">UPI/Bank</option>
                    <option value="razorpay">Razorpay</option>
                    <option value="payment_due">Payment Due</option>
                  </select>
                </div>
              </div>

              <div class="text-right">
                <button type="submit" data-toggle="tooltip" title="Save Changes" class="btn btn-primary">Save Changes</button>
              </div>

            </form>
          </div>
        </div>
      </div>
    </div>

  </div>
  
</div>
<?php echo $footer; ?> 
