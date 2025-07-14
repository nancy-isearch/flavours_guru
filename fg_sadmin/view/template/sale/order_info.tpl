<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $invoice; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info"><i class="fa fa-print"></i></a> <a href="<?php echo $shipping; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></a> <a href="<?php echo $edit; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a> <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
            <?php /*if ($comment) {*/ ?>
            <table class="table table-bordered">
              <thead>
                <tr>
                  <td><?php echo "Special Instruction" ?></td>
                  <td></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-danger"><strong><?php echo $special_instruction; ?></strong></td>
                  <td>
                    <a href="index.php?route=sale/order/edit_special_instruction&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-info"><i class="fa fa-edit"></i></a>
                  </td>
                </tr>
              </tbody>
            </table>
            <?php /*}*/ ?>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> <?php echo $text_order_detail; ?></h3>
          </div>
          <table class="table">
            <tbody>
              <tr>
                <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $text_store; ?>" class="btn btn-info btn-xs"><i class="fa fa-shopping-cart fa-fw"></i></button></td>
                <td><a href="<?php echo $store_url; ?>" target="_blank"><?php echo $store_name; ?></a></td>
              </tr>
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $text_date_added; ?>" class="btn btn-info btn-xs"><i class="fa fa-calendar fa-fw"></i></button></td>
                <td><?php echo $date_added; ?></td>
              </tr>
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $text_payment_method; ?>" class="btn btn-info btn-xs"><i class="fa fa-credit-card fa-fw"></i></button></td>
                <td><?php echo $payment_method; ?></td>
              </tr>
              <?php if ($shipping_method) { ?>
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $text_shipping_method; ?>" class="btn btn-info btn-xs"><i class="fa fa-truck fa-fw"></i></button></td>
                <td><?php echo $shipping_method; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_customer_detail; ?></h3>
          </div>
          <table class="table">
            <tr>
              <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $text_customer; ?>" class="btn btn-info btn-xs"><i class="fa fa-user fa-fw"></i></button></td>
              <td><?php if ($customer) { ?>
                <a href="<?php echo $customer; ?>" target="_blank"><?php echo $firstname; ?> <?php echo $lastname; ?></a>
                <?php } else { ?>
                <?php echo $firstname; ?> <?php echo $lastname; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><button data-toggle="tooltip" title="<?php echo $text_customer_group; ?>" class="btn btn-info btn-xs"><i class="fa fa-group fa-fw"></i></button></td>
              <td><?php echo $customer_group; ?></td>
            </tr>
            <tr>
              <td><button data-toggle="tooltip" title="<?php echo $text_email; ?>" class="btn btn-info btn-xs"><i class="fa fa-envelope-o fa-fw"></i></button></td>
              <td><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></td>
            </tr>
            <tr>
              <td><button data-toggle="tooltip" title="<?php echo $text_telephone; ?>" class="btn btn-info btn-xs"><i class="fa fa-phone fa-fw"></i></button></td>
              <td><?php echo $telephone_with_code; ?></td>
            </tr>
          </table>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-cog"></i> <?php echo $text_option; ?></h3>
          </div>
          <table class="table">
            <tbody>
              <tr>
                <td><?php echo $text_invoice; ?></td>
                <td id="invoice" class="text-right"><?php echo $invoice_no; ?></td>
                <td style="width: 1%;" class="text-center"><?php if (!$invoice_no) { ?>
                  <button id="button-invoice" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_generate; ?>" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>
                  <?php } else { ?>
                  <button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-refresh"></i></button>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $text_reward; ?></td>
                <td class="text-right"><?php echo $reward; ?></td>
                <td class="text-center"><?php if ($customer && $reward) { ?>
                  <?php if (!$reward_total) { ?>
                  <button id="button-reward-add" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_reward_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
                  <?php } else { ?>
                  <button id="button-reward-remove" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_reward_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>
                  <?php } ?>
                  <?php } else { ?>
                  <button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $text_affiliate; ?>
                  <?php if ($affiliate) { ?>
                  (<a href="<?php echo $affiliate; ?>"><?php echo $affiliate_firstname; ?> <?php echo $affiliate_lastname; ?></a>)
                  <?php } ?></td>
                <td class="text-right"><?php echo $commission; ?></td>
                <td class="text-center"><?php if ($affiliate) { ?>
                  <?php if (!$commission_total) { ?>
                  <button id="button-commission-add" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_commission_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
                  <?php } else { ?>
                  <button id="button-commission-remove" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_commission_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>
                  <?php } ?>
                  <?php } else { ?>
                  <button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
                  <?php } ?> </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <?php if($is_admin_order == 1) {
          $admn = 'Yes (' . $added_by . ')';
        } else {
          $admn = 'No';
        } ?>
        <h3 class="panel-title"><i class="fa fa-info-circle"></i> <?php echo $text_order; ?> | Admin Order: <?php echo $admn ?> </h3>
      </div>
      <div class="panel-body">
        <table class="table table-bordered">
          <thead>
            <tr>
              <td style="width: 50%;" class="text-left"><?php echo $text_payment_address; ?> 
              <button type="button" class="btn btn-info btn-xs payment_address" style="float: right;">Update Payment Details</button></td>
              <?php if ($shipping_method) { ?>
              <td style="width: 50%;" class="text-left"><?php echo $text_shipping_address; ?><button type="button" class="btn btn-info btn-xs shipping_address" style="float: right;">Update Shipping Details</button></td>
              <?php } ?>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="text-left"><?php echo $payment_address; ?></td>
              <?php if ($shipping_method) { ?>
              <td class="text-left"><?php echo $shipping_address; ?></td>
              <?php } ?>
            </tr>
          </tbody>
        </table>
        <table class="table table-bordered" id="protable">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_product; ?></td>
              <td class="text-left">Image</td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-left">Shipping Info</td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-left" style="width: 10%;"><?php echo "PP Price"; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <td>Update Price</td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { //echo "<pre />"; print_r($product); die(); ?>
            <tr>
              <td class="text-left"><?php echo $product['name']; ?>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                <?php if ($option['type'] != 'file') { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo str_replace('/-', "'", $option['value']); ?></small>
                <?php } else { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <a href="<?php echo $option['href']; ?>"><?php echo $option['value']; ?></a></small>
                <?php } ?>
                <?php } ?>
                <?php if(isset($product['option']) && !empty($product['option'])){ ?>
                  <br>
                  <button type="button" class="btn btn-info btn-xs update_product_options" order_product_id='<?php echo $product['order_product_id']; ?>' main_product_id = '<?php echo $product['product_id']; ?>' optionInfo = '<?php echo json_encode($product['option']) ?>' style="float: left;">Update Product Option</button>
                <?php } ?>

                <br><br><p><strong>Product Propertites:</strong><br>
                      <?php foreach ($product['attributes'] as $attribute_group) { ?>
                      <?php foreach ($attribute_group['attribute'] as $attribute) {
                        echo $attribute['name'].': '.$attribute['text'].'<br>';
                      }?>
                      <?php } ?>
                </td>
              <td class="text-left"><a href="<?php echo $product['image']; ?>" target="_blank"><img src="<?php echo $product['image']; ?>" width="120"></a></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-left">
                <?php 
                  $shipInfo = json_decode($product['shipping_info']); 
                  if(json_last_error()) { 
                    if($product['shipping_info']!='NULL'){
                      $tmparray=explode(",",$product['shipping_info']);
                      $shipInfo=array(
                          'City'=>$tmparray[0],
                          'Shipping Date'=>$tmparray[1],
                          'Shipping Time'=>$tmparray[2]
                        );
                    } else {
                      $shipInfo=array();
                    }
                  }  
                  foreach ($shipInfo as $key => $value) {
                    if($key == 'Shipping Date'){
                      $value = date('d-F-Y', strtotime($value));
                    }
                    echo $key." - ".$value."<br>";
                  } ?>
                  <br><br>
                  <?php if($shipInfo){ ?>
                    <button type="button" class="btn btn-info btn-xs update_shipping_info" order_product_id='<?php echo $product['order_product_id']; ?>' main_product_id = '<?php echo $product['product_id']; ?>' shipInfo = '<?php echo json_encode($shipInfo) ?>' style="float: left;">Update Shipping Info</button>
                  <?php } ?>
                  
              </td>
              <td class="text-right" style="font-size: 20px;font-weight: 700;color: #ff0000"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-left"><input type="text" name="" pp="<?php echo $product['order_product_id']; ?>" class="form-control pp_price" value="<?php echo $product['pp_price']; ?>"></td>
              <td class="text-right"><?php echo $product['total']; ?></td>
              <td><form method="post" action="index.php?route=sale/order/updateproductprice&token=<?php echo $token; ?>"><input type="text" name="price" style="width: 60px;" placeholder="Price"><br><select name="type"><option>+</option><option>-</option></select><input type="hidden" name="order_product_id" value="<?php echo $product['order_product_id']; ?>"><input type="hidden" name="order_id" value="<?php echo $order_id; ?>"><br><button type="submit" class="btn-xs btn btn-info">Submit</button></form></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><a href="<?php echo $voucher['href']; ?>"><?php echo $voucher['description']; ?></a></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
            </tr>
            <?php } ?>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="8" class="text-right"><?php echo $total['title']; ?></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
            <tr><td colspan="9" class="text-right"><button type="button" class="btn btn-xs btn-primary add_pp_price">Add PP Price</button></td></tr>
          </tbody>
        </table>
        <?php /*if ($comment) {*/ ?>
        <table class="table table-bordered">
          <thead>
            <tr>
              <?php /*<td><?php echo $text_comment; ?></td>*/ ?>
              <td><?php echo "Occasion" ?></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <?php /*<td><?php echo $comment; ?></td>*/ ?>
              <td><?php echo $occasion; ?></td>
            </tr>
          </tbody>
        </table>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td><?php echo "Message on Card" ?></td>
              <td><?php echo "Special Instruction" ?></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><?php echo $card_message; ?></td>
              <td><?php echo $special_instruction; ?></td>
            </tr>
          </tbody>
        </table>
        <?php /*}*/ ?>
      </div>
    </div>
    <?php
    date_default_timezone_set('Asia/Kolkata');
    $inputTime = strtotime($date_added_raw);
    $currentTime = time();
     ?>
    
    <div class="panel panel-default" <?php echo (($currentTime - $inputTime) < 60) ? "style='display: none;'" : '' ?>>
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-comment-o"></i> <?php echo $text_history; ?></h3>
      </div>
      <div class="panel-body">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-history" data-toggle="tab"><?php echo $tab_history; ?></a></li>
          <li><a href="#tab-additional" data-toggle="tab"><?php echo $tab_additional; ?></a></li>
          <?php foreach ($tabs as $tab) { ?>
          <li><a href="#tab-<?php echo $tab['code']; ?>" data-toggle="tab"><?php echo $tab['title']; ?></a></li>
          <?php } ?>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-history">
            <div id="history"></div>
            <br />
            <fieldset>
              <legend><?php echo $text_history_add; ?></legend>
              <form class="form-horizontal">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                  <div class="col-sm-10">
                    <select name="order_status_id" id="input-order-status" class="form-control order_status_update">
                      <?php foreach ($order_statuses as $order_statuses) { ?>
                      <?php if ($order_statuses['order_status_id'] == $order_status_id) { ?>
                      <option value="<?php echo $order_statuses['order_status_id']; ?>" selected="selected"><?php echo $order_statuses['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $order_statuses['order_status_id']; ?>"><?php echo $order_statuses['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group assigntovendor" style="display: none;">
                  <label class="col-sm-2 control-label" for="input-order-status">Assign Vendor</label>
                  <div class="col-sm-10">
                    <select name="vendor_id" id="input-vendor_id" class="form-control">
                      <option value="0">Please Select Vendor</option>
                      <?php foreach ($vendors as $vendor) { ?>
                      <?php if ($vendor['user_id'] == $vendor_id) { ?>
                      <option value="<?php echo $vendor['user_id']; ?>" selected="selected"><?php echo $vendor['firstname'].' '.$vendor['lastname']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $vendor['user_id']; ?>"><?php echo $vendor['firstname'].' '.$vendor['lastname']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-override"><span data-toggle="tooltip" title="<?php echo $help_override; ?>"><?php echo $entry_override; ?></span></label>
                  <div class="col-sm-10">
                    <input type="checkbox" name="override" value="1" id="input-override" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-notify"><?php echo $entry_notify; ?></label>
                  <div class="col-sm-10">
                    <input type="checkbox" name="notify" value="1" id="input-notify" checked="checked" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                  <div class="col-sm-10">
                    <textarea name="comment" rows="8" id="input-comment" class="form-control"></textarea>
                  </div>
                </div>
              </form>
            </fieldset>
            <div class="text-right">
              <button id="button-history" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_history_add; ?></button>
            </div>
          </div>
          <div class="tab-pane" id="tab-additional">
            <?php if ($account_custom_fields) { ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_account_custom_field; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($account_custom_fields as $custom_field) { ?>
                  <tr>
                    <td><?php echo $custom_field['name']; ?></td>
                    <td><?php echo $custom_field['value']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <?php } ?>
            <?php if ($payment_custom_fields) { ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_payment_custom_field; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($payment_custom_fields as $custom_field) { ?>
                  <tr>
                    <td><?php echo $custom_field['name']; ?></td>
                    <td><?php echo $custom_field['value']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <?php } ?>
            <?php if ($shipping_method && $shipping_custom_fields) { ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_shipping_custom_field; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($shipping_custom_fields as $custom_field) { ?>
                  <tr>
                    <td><?php echo $custom_field['name']; ?></td>
                    <td><?php echo $custom_field['value']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <?php } ?>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td colspan="2"><?php echo $text_browser; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><?php echo $text_ip; ?></td>
                    <td><?php echo $ip; ?></td>
                  </tr>
                  <?php if ($forwarded_ip) { ?>
                  <tr>
                    <td><?php echo $text_forwarded_ip; ?></td>
                    <td><?php echo $forwarded_ip; ?></td>
                  </tr>
                  <?php } ?>
                  <tr>
                    <td><?php echo $text_user_agent; ?></td>
                    <td><?php echo $user_agent; ?></td>
                  </tr>
                  <tr>
                    <td><?php echo $text_accept_language; ?></td>
                    <td><?php echo $accept_language; ?></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <?php foreach ($tabs as $tab) { ?>
          <div class="tab-pane" id="tab-<?php echo $tab['code']; ?>"><?php echo $tab['content']; ?></div>
          <?php } ?>
        </div>
      </div>
    </div>
    

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bell"></i> Order Update History</h3>
      </div>
      <div class="panel-body">
        <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>Event</th>
                    <th>Data</th>
                    <th>Added By</th>
                    <th>Added At</th>
                  </tr>
                </thead>
                <tbody>
                	<?php foreach ($updateHistory as $key => $value) { ?>
                		<tr>
                			<td><?php echo $value['event'] ?></td>
                			<td><?php $dd = json_decode($value['data']); 
                			foreach ($dd as $key => $value1) {
                				echo $key.' - '.$value1.'<br>';
                			} ?></td>
                			<td><?php echo $value['name'] ?></td>
                			<td><?php echo date('d-m-Y H:i', strtotime($value['added_at'])) ?></td>
                		</tr>
                	<?php } ?>
                </tbody>
        </table>
      </div>
    </div>


    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bell"></i> Add Complaint</h3>
      </div>
      <div class="panel-body">
        <div class="row" id="tab-history">
            <fieldset>
              <form class="form-horizontal">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status">Complaint Type</label>
                  <div class="col-sm-10">
                    <select name="order_complaint_id" id="input-order-complaint" class="form-control order_status_update">
                      <option value="0">Please select</option>
                      <option value="1">Non Delivery</option>
                      <option value="2">Late Delivery</option>
                      <option value="3">Partial Delivery</option>
                      <option value="4">No Cake Message</option>
                      <option value="5">Quality Issue</option>
                      <option value="6">Broken Delivery</option>
                      <option value="7">Design Issue</option>
                      <option value="8">Wrong Cake Message</option>
                      <option value="9">Wrong Flavour</option>
                      <option value="11">Broken/Melted delivery</option>
                      <option value="12">Behaviour issue</option>
                      <option value="13">False Updation</option>
                      <option value="14">Hygeine Issue</option>
                      <option value="15">Less Weight</option>
                      <option value="16">Card Message Missing</option>
                      <option value="17">Early Delivery</option>
                      <option value="18">Colour Complaint</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-comment">Detail</label>
                  <div class="col-sm-10">
                    <textarea name="complaint_comment" rows="8" id="input-comment" class="form-control"></textarea>
                  </div>
                </div>
              </form>
            </fieldset>
            <div class="text-right">
              <button id="button-complaint" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> Add Complaint</button>
            </div>
          </div>
      </div>
    </div>

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bell"></i> Ticket</h3>
      </div>
      <div class="panel-body">
        <div class="row" id="tab-history">
            <fieldset>
              <form class="form-horizontal">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status">Issue Type</label>
                  <div class="col-sm-10">
                    <select name="ticket_issue_type" id="input-order-complaint" class="form-control order_status_update">
                      <?php foreach ($ticketTypes as $ticketKey => $ticketType) { ?>
                      	<option value="<?php echo $ticketKey ?>"><?php echo $ticketType ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-comment">Issue Detail</label>
                  <div class="col-sm-10">
                    <textarea name="issue_detail" rows="8" id="input-comment" class="form-control"></textarea>
                  </div>
                </div>
              </form>
            </fieldset>
            <div class="text-right">
              <button id="button-ticket" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> Create Ticket</button>
            </div>
          </div>
      </div>
      <div class="panel-body">
      	<div class="row">
      		<table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left">Ticket Id</td>
                  <td class="text-left">Issue Type</td>
                  <td class="text-left">Issue Details</td>
                  <td class="text-left">Vendor</td>
                  <td class="text-left">Created</td>
                  <td class="text-left">Status</td>
                </tr>
              </thead>
              <tbody>
                <?php if ($tickets) { ?>
                <?php foreach ($tickets as $ticket) { ?>
                <tr>
                  <td class="text-left"><?php echo $ticket['ticketDetails']['id']; ?></td>
                  <td class="text-left"><?php echo $ticketTypes[$ticket['ticketDetails']['issue_type']]; ?></td>
                  <td class="text-left">
                    <?php echo $ticket['ticketDetails']['issue_detail']; ?>
                      <br><br>
                      
                      <?php $c = 0; foreach ($ticket['ticketComments'] as $key => $value) {
                        if($c == 0){
                          echo "<b>Comments:</b><br>";
                        }
                        if($c > 0){
                          echo "<br><br>";
                        }
                        echo $value['comment']." ---- ".ucfirst($adminUsers[$value['added_by']]['username']) .' | '.date('d/m/Y h:i:a', strtotime($value['date_added']));
                        $c++;

                      } ?>
                    </td>
                  <td class="text-left"><?php echo ucfirst($adminUsers[$vendor_id]['username']); ?></td>
                  <td class="text-left"><?php echo date('d/m/Y', strtotime($ticket['ticketDetails']['created_at'])); ?></td>
                  <td class="text-left"><?php echo $ticketStatues[$ticket['ticketDetails']['status']]; ?></td>
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
      </div>
    </div>

  </div>




<div id="paymentAddress" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close closepopup">&times;</button>
        <h4 class="modal-title">Update Payment Address</h4>
      </div>
      <div class="modal-body">
        <form method="post" action="index.php?route=sale/order/updatepaymentaddress&token=<?php echo $token; ?>">
        	<div class="col-sm-12">
              <div class="form-group">
                <label class="control-label" for="input-order-id">Mr/Mrs</label>
                <select class="select-name-before form-control" name="payment_mr_mrs">
	                <option value="Mr" <?php echo ($paddress['payment_mr_mrs'] == 'Mr') ? 'selected' : '' ?>>Mr</option>
	                <option value="Ms" <?php echo ($paddress['payment_mr_mrs'] == 'Ms') ? 'selected' : '' ?>>Ms</option>
	                <option value="Mrs" <?php echo ($paddress['payment_mr_mrs'] == 'Mrs') ? 'selected' : '' ?>>Mrs</option>
	                <option value="Other" <?php echo ($paddress['payment_mr_mrs'] == 'Other') ? 'selected' : '' ?>>Other</option>
	            </select>

                <label class="control-label" for="input-order-id">Firstname</label>
                <input type="text" name="payment_firstname" value="<?php echo $paddress['payment_firstname']; ?>" placeholder="payment_firstname" class="form-control">

                <label class="control-label" for="input-order-id">Email</label>
                <input type="text" name="payment_email" value="<?php echo $paddress['payment_email']; ?>" placeholder="payment_email" class="form-control">

                <label class="control-label" for="input-order-id">Phone Code</label>
                <input type="text" name="payment_phone_code" value="<?php echo $paddress['payment_phone_code']; ?>" placeholder="payment_phone_code" class="form-control">

                <label class="control-label" for="input-order-id">Mobile</label>
                <input type="text" name="payment_mobile" value="<?php echo $paddress['payment_mobile']; ?>" placeholder="payment_mobile" class="form-control">
                <input type="hidden" name="order_id" value="<?php echo $order_id; ?>">
                <button class="btn btn-info btn-sm">Submit</button>
              </div>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default closepopup">Close</button>
      </div>
    </div>

  </div>
</div>

<div id="shippingAddress" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close closepopup">&times;</button>
        <h4 class="modal-title">Update Shipping Address</h4>
      </div>
      <div class="modal-body">
        <form method="post" action="index.php?route=sale/order/updateshippingaddress&token=<?php echo $token; ?>">
        	<div class="col-sm-12">
              <div class="form-group">
                <label class="control-label" for="input-order-id">Mr/Mrs</label>
                <select class="select-name-before form-control" name="shipping_mr_mrs">
	                <option value="Mr" <?php echo ($saddress['shipping_mr_mrs'] == 'Mr') ? 'selected' : '' ?>>Mr</option>
	                <option value="Ms" <?php echo ($saddress['shipping_mr_mrs'] == 'Ms') ? 'selected' : '' ?>>Ms</option>
	                <option value="Mrs" <?php echo ($saddress['shipping_mr_mrs'] == 'Mrs') ? 'selected' : '' ?>>Mrs</option>
	                <option value="Other" <?php echo ($saddress['shipping_mr_mrs'] == 'Other') ? 'selected' : '' ?>>Other</option>
	            </select>

                <label class="control-label" for="input-order-id">Firstname</label>
                <input type="text" name="shipping_firstname" value="<?php echo $saddress['shipping_firstname']; ?>" placeholder="shipping_firstname" class="form-control">

                <label class="control-label" for="input-order-id">Phone Code</label>
                <input type="text" name="shipping_phone_code" value="<?php echo $saddress['shipping_phone_code']; ?>" placeholder="shipping_phone_code" class="form-control">

                <label class="control-label" for="input-order-id">Mobile</label>
                <input type="text" name="shipping_phone" value="<?php echo $saddress['shipping_phone']; ?>" placeholder="shipping_phone" class="form-control">

                <label class="control-label" for="input-order-id">Address</label>
                <input type="text" name="shipping_address_1" value="<?php echo $saddress['shipping_address_1']; ?>" placeholder="shipping_address_1" class="form-control">

                <label class="control-label" for="input-order-id">City</label>
                <input type="text" name="shipping_city" value="<?php echo $saddress['shipping_city']; ?>" placeholder="shipping_city" class="form-control">

                <label class="control-label" for="input-order-id">Pincode</label>
                <input type="text" name="shipping_postcode" value="<?php echo $saddress['shipping_postcode']; ?>" placeholder="shipping_postcode" class="form-control">
                <input type="hidden" name="order_id" value="<?php echo $order_id; ?>">
                <button class="btn btn-info btn-sm">Submit</button>
              </div>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default closepopup">Close</button>
      </div>
    </div>

  </div>
</div>


<div id="updateProductOptionInfo" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close closepopup">&times;</button>
        <h4 class="modal-title">Update Product Options</h4>
      </div>
      <div class="modal-body">
        <form method="post" action="index.php?route=sale/order/updateproductoptioninfo&token=<?php echo $token; ?>">
          <div class="col-sm-12">
              <div class="form-group">
                <div class="weight">
                  <label class="control-label" for="input-order-id">Weight</label>
                  <select class="form-control weightselect" name="weight">
                    
                  </select>
                </div>
                

                <div class="flavour">
                  <label class="control-label" for="input-order-id">Flavour</label>
                  <select class="form-control flavourselect" name="flavour">
                    
                  </select>
                </div>

                <div class="cakemessage">
                  <label class="control-label" for="input-order-id">Cake Message</label>
                  <input type="text" name="cakemessage" placeholder="Cake Message" class="form-control">  
                  <input type="hidden" name="cakemessageid" class="cakemessageid" value="">
                </div>

                <div class="uploadimage">
                  <label class="control-label" for="input-order-id">Upload Image</label>
                  <input type="file" name="image">
                </div>
                

              
                <input type="hidden" name="order_id" value="<?php echo $order_id; ?>">
                <input type="hidden" name="order_product_id" value="" class="optionorderproduct">
                <input type="hidden" name="product_id" value="" class="optionproduct">
                <button class="btn btn-info btn-sm">Submit</button>
              </div>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default closepopup">Close</button>
      </div>
    </div>

  </div>
</div>


<div id="updateShippingInfo" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close closepopup">&times;</button>
        <h4 class="modal-title">Update Shipping Info</h4>
      </div>
      <div class="modal-body">
        <form method="post" action="index.php?route=sale/order/updateproductshippinginfo&token=<?php echo $token; ?>">
        	<div class="col-sm-12">
              <div class="form-group">
                <label class="control-label" for="input-order-id">Pincode &nbsp;&nbsp; (<strong class="shippin"></strong>)</label>
                <input type="text" name="pincode" placeholder="Pincode" class="form-control popuppincode"> <button type="button" class="btn btn-info btn-xs fetch_details_popup">Fetch Details</button>

                <br><br>

                <label class="control-label" for="input-order-id">Shipping City &nbsp;&nbsp; (<strong class="shipcity"></strong>)</label>
                <input type="text" name="city" class="citypopup form-control">

                <label class="control-label" for="input-order-id">Shipping Date &nbsp;&nbsp; (<strong class="shipdate"></strong>)</label>
                <input type="date" name="date" placeholder="Shipping Date" class="form-control">

                <label class="control-label" for="input-order-id">Shipping Type &nbsp;&nbsp; (<strong class="shiptype"></strong>)</label>
                <select class="form-control typepopup" name="type">
                	<option value="">Please Select</option>
                	<?php foreach ($shipPopup['type'] as $key => $value) { ?>
                		<option value="<?php echo $value['name']; ?>"><?php echo $value['name'] .' - Rs.'.$value['shipping_charge']; ?></option>
                	<?php } ?>
                </select>

                <label class="control-label" for="input-order-id">Shipping Time &nbsp;&nbsp; (<strong class="shiptime"></strong>)</label>
                <select class="form-control timepopup" name="slots">
                	<option value="">Please Select</option>
                	
                </select>

                <input type="hidden" name="order_id" value="<?php echo $order_id; ?>">
                <input type="hidden" name="order_product_id" value="" class="shipproduct">
                <input type="hidden" name="ship_price" value="" class="shipprice">
                <button class="btn btn-info btn-sm">Submit</button>
              </div>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default closepopup">Close</button>
      </div>
    </div>

  </div>
</div>



  <script type="text/javascript">


  	$('.payment_address').click(function(){
  		$('#paymentAddress').addClass('in');
		$('#paymentAddress').show();
	})

	$('.shipping_address').click(function(){
  		$('#shippingAddress').addClass('in');
		$('#shippingAddress').show();
	})

  $('.update_product_options').click(function(){
    $('#updateProductOptionInfo').addClass('in');
    $('#updateProductOptionInfo').show();
    $('#updateProductOptionInfo').find('.weight').hide();
    $('#updateProductOptionInfo').find('.flavour').hide();
    $('#updateProductOptionInfo').find('.cakemessage').hide(); 
    $('#updateProductOptionInfo').find('.uploadimage').hide(); 
    var j = $(this).attr('optionInfo');
    order_product_id = $(this).attr('order_product_id');
    main_product_id = $(this).attr('main_product_id');
    
    $('.optionorderproduct').val(order_product_id);
    $('.optionproduct').val(main_product_id);
    $.ajax({
      url: 'index.php?route=sale/order/getProductOptions&token=<?php echo $token; ?>',
      type: 'post',
      data: 'product_id='+main_product_id,
      dataType: 'json',
      success: function(data) {
        console.log(data);
        for(var i in data){
          var html = "<option value=''>Please Select</option>";
          if(data[i]['option_id'] == "1"){
            for(var j in data[i]['product_option_value']){
              html += '<option value='+data[i]['product_option_value'][j]['product_option_value_id']+'>'+data[i]['product_option_value'][j]['name']+' + '+data[i]['product_option_value'][j]['price']+'</option>';
            }
            $('.weightselect').html(html);
            $('#updateProductOptionInfo').find('.weight').show();
          }

          html = "<option value=''>Please Select</option>";
          if(data[i]['option_id'] == "5"){
            for(var j in data[i]['product_option_value']){
              html += '<option value='+data[i]['product_option_value'][j]['product_option_value_id']+'>'+data[i]['product_option_value'][j]['name']+'</option>';
            }
            $('.flavourselect').html(html);
            $('#updateProductOptionInfo').find('.flavour').show();
          }

          if(data[i]['option_id'] == "13"){
           $('#updateProductOptionInfo').find('.cakemessage').show();
           $('#updateProductOptionInfo').find('.cakemessageid').val(data[i]['product_option_id']); 
          }

          if(data[i]['option_id'] == "7"){
           //$('#updateProductOptionInfo').find('.uploadimage').show(); 
          }

        }

      }
    })
  })

  $('.fetch_details_popup').click(function(){
    var popuppincode = $('.popuppincode').val();
    $('.typepopup').html('');
    $.ajax({
      url: '/index.php?route=product/product/getPincodesList',
      type: 'post',
      data: 'pins='+popuppincode+'&proId='+main_product_id,
      dataType: 'json',
      success: function(data) {
        $('.citypopup').val(data[0].name);
        $.ajax({
          url: '/index.php?route=product/product/getShippingTypeForPro',
          type: 'post',
          data: 'proId='+main_product_id+'&cid='+data[0].shipping_cities_id+'&delDate=<?php echo date("Y-m-d", strtotime('tomorrow')) ?>',
          dataType: 'json',
          success: function(data) {
            var html = '<option value="">Please Select</option>';
            for(var i in data){
              html += '<option value="'+data[i].name+'" id="'+data[i].id+'" price="'+data[i].usePrice+'">'+data[i].name+' - '+data[i].price+'</option>';
            }
            $('.typepopup').html(html);
          }
        })
      }
    })
  })

  $('.typepopup').change(function(){
    var typepopup = $(this).find(":selected").attr('id');
    $('.shipprice').val($(this).find(":selected").attr('price'));
    $('.timepopup').html('');
    $.ajax({
      url: '/index.php?route=product/product/getDatesTimeForPro',
      type: 'post',
      data: 'shippingType='+typepopup,
      dataType: 'json',
      success: function(data) {
        var html = '<option value="">Please Select</option>';
        for(var i in data.timeslot){
          html += '<option value="'+data.timeslot[i].timeslot_from+' - '+data.timeslot[i].timeslot_to+'">'+data.timeslot[i].timeslot_from+' - '+data.timeslot[i].timeslot_to+'</option>';
        }
        $('.timepopup').html(html);
      }
    })
  })
  var order_product_id = '';
  var main_product_id = '';
	$('.update_shipping_info').click(function(){
		$('#updateShippingInfo').addClass('in');
		$('#updateShippingInfo').show();
		var j = $(this).attr('shipInfo');
		order_product_id = $(this).attr('order_product_id');
    main_product_id = $(this).attr('main_product_id');
		j = JSON.parse(j);
		console.log(j);
		var a = j['City'];
		var b = j['Shipping Date'];
		var c = j['Shipping Type'];
		var d = j['Shipping Time'];
    var e = j['Pincode'];
		$('.shipcity').html(a);
		$('.shipdate').html(b);
		$('.shiptype').html(c);
		$('.shiptime').html(d);
    $('.shippin').html(e);
		$('.shipproduct').val(order_product_id);
	})

  	$('.closepopup').click(function(){
  		$('.modal.fade').removeClass('in');
  		$('.modal.fade').hide();
  	})

  	
$(document).delegate('#button-ip-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=user/api/addip&token=<?php echo $token; ?>&api_id=<?php echo $api_id; ?>',
		type: 'post',
		data: 'ip=<?php echo $api_ip; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#button-ip-add').button('loading');
		},
		complete: function() {
			$('#button-ip-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-invoice', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/createinvoiceno&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#button-invoice').button('loading');
		},
		complete: function() {
			$('#button-invoice').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['invoice_no']) {
				$('#invoice').html(json['invoice_no']);

				$('#button-invoice').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-reward-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/addreward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-reward-add').button('loading');
		},
		complete: function() {
			$('#button-reward-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-reward-add').replaceWith('<button id="button-reward-remove" data-toggle="tooltip" title="<?php echo $button_reward_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-reward-remove', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/removereward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-reward-remove').button('loading');
		},
		complete: function() {
			$('#button-reward-remove').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-reward-remove').replaceWith('<button id="button-reward-add" data-toggle="tooltip" title="<?php echo $button_reward_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-commission-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/addcommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-commission-add').button('loading');
		},
		complete: function() {
			$('#button-commission-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-commission-add').replaceWith('<button id="button-commission-remove" data-toggle="tooltip" title="<?php echo $button_commission_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-commission-remove', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/removecommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-commission-remove').button('loading');
		},
		complete: function() {
			$('#button-commission-remove').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-commission-remove').replaceWith('<button id="button-commission-add" data-toggle="tooltip" title="<?php echo $button_commission_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

var token = '';

// Login to the API
$.ajax({
	url: '<?php echo $catalog; ?>index.php?route=api/login',
	type: 'post',
	dataType: 'json',
	data: 'key=<?php echo $api_key; ?>',
	crossDomain: true,
	success: function(json) {
		$('.alert').remove();

        if (json['error']) {
    		if (json['error']['key']) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['key'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    		}

            if (json['error']['ip']) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['ip'] + ' <button type="button" id="button-ip-add" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> <?php echo $button_ip_add; ?></button></div>');
    		}
        }

        if (json['token']) {
			token = json['token'];
		}
	},
	error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});

$('#history').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#history').load(this.href);
});

$('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

$('.order_status_update').click(function(){
	var status = $(this).val();
	if(status == 14){
		$('.assigntovendor').show();	
	} else {
		$('.assigntovendor').hide();
	}
})

$('.add_pp_price').click(function(){
  var ppp = [];
  $('.pp_price').each(function(){
    aa = {};
    aa.id = $(this).attr('pp');
    aa.price = $(this).val();
    ppp.push(aa);
  })
  $.ajax({
    url: 'index.php?route=sale/order/addPPPrice&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'ppp=' + JSON.stringify(ppp),
    success: function(json) {
      $('#protable').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> PP Price have been added successfully</div>');
    }
  });
})

if($('.order_status_update').val() == 14){
  $('.assigntovendor').show();
}

$('#button-history').on('click', function() {
	/*
	if (typeof verifyStatusChange == 'function'){
		if (verifyStatusChange() == false){
			return false;
		} else{
			addOrderInfo();
		}
	} else{
		addOrderInfo();
	}*/

  if(parseInt($('select[name=\'order_status_id\']').val()) == 14){
    if(parseInt($('select[name=\'vendor_id\']').val()) < 1){
      alert("Please select vendor");
      return;
    }
  }
  
	$.ajax({
		url: 'index.php?route=sale/order/addOrderHistory&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + ($('input[name=\'notify\']').prop('checked') ? 1 : 0) + '&vendor_id=' + encodeURIComponent($('select[name=\'vendor_id\']').val())+ '&vendor_name=' + encodeURIComponent($('select[name=\'vendor_id\'] option:selected').text()) + '&override=' + ($('input[name=\'override\']').prop('checked') ? 1 : 0) + '&append=' + ($('input[name=\'append\']').prop('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('#button-history').button('loading');
		},
		complete: function() {
			$('#button-history').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#history').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

				$('#history').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('textarea[name=\'comment\']').val('');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});


$('#button-complaint').on('click', function() {

  $.ajax({
    url: 'index.php?route=sale/order/addOrderComplaint&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'order_complaint_id=' + encodeURIComponent($('select[name=\'order_complaint_id\']').val()) + '&detail=' + encodeURIComponent($('textarea[name=\'complaint_comment\']').val()),
    beforeSend: function() {
      $('#button-complaint').button('loading');
    },
    complete: function() {
      $('#button-complaint').button('reset');
    },
    success: function(json) {
      $('.alert').remove();

      alert("Complaint added successfully");
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('#button-ticket').on('click', function() {

  $.ajax({
    url: 'index.php?route=sale/order/addOrderTicket&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'issue_type=' + encodeURIComponent($('select[name=\'ticket_issue_type\']').val()) + '&issue_detail=' + encodeURIComponent($('textarea[name=\'issue_detail\']').val()),
    beforeSend: function() {
      $('#button-ticket').button('loading');
    },
    complete: function() {
      $('#button-ticket').button('reset');
    },
    success: function(json) {
      $('.alert').remove();

      alert("Ticket added successfully");
      window.location.reload();
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('#button-assign-vendor').on('click', function() {
  $.ajax({
    url: 'index.php?route=sale/order/assignOrderVendor&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>&order_id=<?php echo $order_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'vendor_id=' + encodeURIComponent($('select[name=\'vendor_id\']').val()),
    beforeSend: function() {
      $('#button-assign-vendor').button('loading');
    },
    complete: function() {
      $('#button-assign-vendor').button('reset');
    },
    success: function(json) {
      $('.alert').remove();

      if (json['success']) {

        $('#assignVendor').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

function changeStatus(){
	var status_id = $('select[name="order_status_id"]').val();

	$('#openbay-info').remove();

	$.ajax({
		url: 'index.php?route=extension/openbay/getorderinfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
		dataType: 'html',
		success: function(html) {
			$('#history').after(html);
		}
	});
}

function addOrderInfo(){
	var status_id = $('select[name="order_status_id"]').val();

	$.ajax({
		url: 'index.php?route=extension/openbay/addorderinfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
		type: 'post',
		dataType: 'html',
		data: $(".openbay-data").serialize()
	});
}

$(document).ready(function() {
	changeStatus();
});

$('select[name="order_status_id"]').change(function(){
	changeStatus();
});
//--></script> 
</div>
<?php echo $footer; ?> 
