<?php echo $header; ?>
<div class="container top_positionn">
  <ul class="breadcrumb">
    <?php 
        $i=1; 
        $Totlbrdcum = count($breadcrumbs); 
        foreach($breadcrumbs as $breadcrumb) {  
         if($Totlbrdcum==$i){  
      ?> 
          <li><span class="" style="color: #35a8d4;"><?php echo $breadcrumb['text']; ?> </span></li>
      <?php  } else { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?> </a></li> 
      <?php } $i++; }   ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2 class='order-title'><?php echo $heading_title; ?> <span class="pull-right" style="font-size: 13px; display: inline-block;  margin-top: 15px;"><a href="javascript:void(0)" class="prnt_in">Print Invoice</a></span></h2>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" colspan="2"><?php echo $text_order_detail; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left" style="width: 50%;"><?php if ($invoice_no) { ?>
              <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
              <?php } ?>
              <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
              <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
              <td class="text-left" style="width: 50%;"><?php if ($payment_method) { ?>
              <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
              <?php } ?>
              <?php if ($shipping_method) { ?>
              <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
              <?php } ?></td>
          </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" style="width: 50%; vertical-align: top;"><?php echo $text_payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left" style="width: 50%; vertical-align: top;"><?php echo $text_shipping_address; ?></td>
            <?php } ?>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left"><?php echo $shipping_address; ?></td>
            <?php } ?>
          </tr>
        </tbody>
      </table>
      <?php 
        $txt = explode('_',$comment);
        if (isset($txt[0]) && !empty($txt[0]) || isset($txt[1]) && !empty($txt[1])) {  
      ?>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo 'Gift Message'; ?></td>
            <td class="text-left"><?php echo 'Occasion'; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $txt[0]; ?></td>
            <td class="text-left"><?php echo $txt[1]; ?></td>
          </tr>
        </tbody>
      </table>
      <?php } ?>

      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_name; ?></td>
              <!-- <td class="text-left"><?php echo $column_model; ?></td> -->
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo 'Shipping Info'; ?></td>
              <td class="text-right"><?php echo 'Shipping Price'; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <?php /* if ($products) { ?>
              <td style="width: 20px;"></td>
              <?php } */ ?>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-left"><?php echo $product['name']; ?>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?></td>
              <!-- <td class="text-left"><?php echo $product['model']; ?></td> -->
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-left">
                <?php 
                  $shipInfo = json_decode($product['shipping_info']); 
                  if(json_last_error()) {
                    if($product['shipping_info']!='NULL' && !empty($product['shipping_info'])){
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
                    echo $key." - ".str_replace('u20b9','',$value)."<br>";
                  } ?>

             </td>
              <td class="text-right"><?php echo $product['shipping_price']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['total']; ?></td>
              <?php /* ?><td class="text-right" style="white-space: nowrap;"><?php if ($product['reorder']) { ?>
                <a href="<?php echo $product['reorder']; ?>" data-toggle="tooltip" title="<?php echo $button_reorder; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></a>
                <?php } ?>
                <a href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a></td><?php */?>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><?php echo $voucher['description']; ?></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <?php /* if ($products) { ?>
              <td></td>
              <?php }*/ ?>
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="4"></td>
              <td class="text-right"><b><?php echo $total['title']; ?></b></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
              <?php /*if ($products) { ?>
              <td></td>
              <?php }*/ ?>
            </tr>
            <?php } ?>
          </tfoot>
        </table>
      </div>
     
      <?php if ($histories) { ?>
      <h3><?php echo $text_history; ?></h3>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($histories) { ?>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td class="text-left"><?php echo $history['date_added']; ?></td>
            <td class="text-left"><?php echo $history['status']; ?></td>
            <td class="text-left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>
      <div class="buttons clearfix">
        <div class=""><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
  $('.prnt_in').click(function(){
    var printContents = document.getElementById('content').innerHTML;
    var originalContents = document.body.innerHTML;
     document.body.innerHTML = printContents;
     window.print();
     document.body.innerHTML = originalContents;  
  })
  
</script>
<?php echo $footer; ?>