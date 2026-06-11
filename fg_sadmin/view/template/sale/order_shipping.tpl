<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
</head>
<body>
<div class="container">
  <?php foreach ($orders as $order) { ?>
  <div style="page-break-after: always;">
    <div class="logo" style="text-align: center; padding: 10px 0;">
      <img style="width: 200px;margin-bottom: 10px;" src="https://www.flavoursguru.com/catalog/view/theme/default/image/Home/FGLogoBlack.webp" alt="">
      <div style="text-align: center;font-size: 18px; display: none;">
        <strong>Delivery boy:</strong> abcdefg
      </div>
    </div>
    <h1><?php echo $text_picklist; ?> #<?php echo $order['order_id']; ?></h1>
    <table class="table table-bordered" style="display: none;">
      <thead>
        <tr>
          <td colspan="2"><?php echo $text_order_detail; ?></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><address>
            <strong><?php echo $order['store_name']; ?></strong><br />
            <?php echo $order['store_address']; ?>
            </address>
            <b><?php echo $text_telephone; ?></b> <?php echo $order['store_telephone']; ?><br />
            <?php if ($order['store_fax']) { ?>
            <b><?php echo $text_fax; ?></b> <?php echo $order['store_fax']; ?><br />
            <?php } ?>
            <b><?php echo $text_email; ?></b> <?php echo $order['store_email']; ?><br />
            <b><?php echo $text_website; ?></b> <a href="<?php echo $order['store_url']; ?>"><?php echo $order['store_url']; ?></a></td>
          <td style="width: 50%;"><b><?php echo $text_date_added; ?></b> <?php echo $order['date_added']; ?><br />
            <?php if ($order['invoice_no']) { ?>
            <b><?php echo $text_invoice_no; ?></b> <?php echo $order['invoice_no']; ?><br />
            <?php } ?>
            <b><?php echo $text_order_id; ?></b> <?php echo $order['order_id']; ?><br />
            <?php if ($order['shipping_method']) { ?>
            <b><?php echo $text_shipping_method; ?></b> <?php echo $order['shipping_method']; ?><br />
            <?php } ?></td>
        </tr>
      </tbody>
    </table>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td style="width: 50%;"><b><?php /* echo $text_shipping_address; */ ?> Shipping Detail's</b></td>
          <td style="width: 50%;"><b><?php /* echo $text_contact; */ ?></b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            
            <p>Shipping address: <?php echo $order['shipping_address'];  ?></p>
            <p>Receiver name: <?php echo $order['receiver_name'] ?></p>
            <p>Contact number: <?php echo $order['receiver_phone'] ?></p>
          </td>
          <td><?php /* echo $order['email']; */ ?><br/>
            <?php /* echo $order['telephone'];*/ ?>

            <p>Order ID: <?php echo $order['order_id']; ?></p>
            <p>Order date: <?php echo $order['date_added']; ?></p>
            <p>Sender name:  <?php echo $order['sender_name']; ?></p>
          </td>
        </tr>
      </tbody>
    </table>
    <table class="table table-bordered" style="display: none;">
      <thead>
        <tr>
          <td><b><?php echo $column_location; ?></b></td>
          <td><b><?php echo $column_reference; ?></b></td>
          <td><b><?php echo $column_product; ?></b></td>
          <td><b><?php echo $column_weight; ?></b></td>
          <td><b><?php echo $column_model; ?></b></td>
          <td class="text-right"><b><?php echo $column_quantity; ?></b></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($order['product'] as $product) { ?>
        <tr>
          <td><?php echo $product['location']; ?></td>
          <td><?php if ($product['sku']) { ?>
            <?php echo $text_sku; ?> <?php echo $product['sku']; ?><br />
            <?php } ?>
            <?php if ($product['upc']) { ?>
            <?php echo $text_upc; ?> <?php echo $product['upc']; ?><br />
            <?php } ?>
            <?php if ($product['ean']) { ?>
            <?php echo $text_ean; ?> <?php echo $product['ean']; ?><br />
            <?php } ?>
            <?php if ($product['jan']) { ?>
            <?php echo $text_jan; ?> <?php echo $product['jan']; ?><br />
            <?php } ?>
            <?php if ($product['isbn']) { ?>
            <?php echo $text_isbn; ?> <?php echo $product['isbn']; ?><br />
            <?php } ?>
            <?php if ($product['mpn']) { ?>
            <?php echo $text_mpn; ?><?php echo $product['mpn']; ?><br />
            <?php } ?></td>
          <td><?php echo $product['name']; ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?></td>
          <td><?php echo $product['weight']; ?></td>
          <td><?php echo $product['model']; ?></td>
          <td class="text-right"><?php echo $product['quantity']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
    <table class="table table-bordered">
      <thead>
        <tr>
        	<td style="width: 10%;"><b>Product Image</b></td>
          <td style="width: 40%;"><b>Product Name</b></td>
          <td style="width: 40%;"><b>Shipping Info</b></td>
          <td style="width: 10%;"><b>Quantity</b></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($order['product'] as $product) { ?>
        <tr>
        	<td><img style="width: 100%;" src="<?php echo $product['image']; ?>" alt="" /></td>
        	<td><?php echo $product['name']; ?><?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?></td>
          <td><?php 
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
                    echo $key." - ".str_replace('u20b9', '₹', $value) ."<br>";
                  } ?></td>
          <td><?php echo $product['quantity']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
    <?php if ($order['comment']) { ?>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td><b><?php /* echo $text_comment; */ ?> Message on card</b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><?php echo $order['com']['card_message']; ?></td>
        </tr>
      </tbody>
    </table>
    <?php } ?>

    <?php if ($order['comment']) { ?>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td><b><?php /* echo $text_comment; */ ?> Special Instructions</b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><?php echo $order['com']['special_instruction']; ?></td>
        </tr>
      </tbody>
    </table>
    <?php } ?>
    <div class="order_feedback_col" style="margin-bottom: 20px;">
      <label style="display: flex;align-items: center;margin-bottom: 10px;">
        <input style="width: 20px; height: 20px;margin-right: 10px;margin-top: 0" type="checkbox" name="">
        Product delivered in good condition
      </label>
      <label style="display: flex;align-items: center;margin-bottom: 10px;">
        <input style="width: 20px; height: 20px;margin-right: 10px;margin-top: 0" type="checkbox" name="">
        All product delivered
      </label>
      <label style="display: flex;align-items: center;">
        <input style="width: 20px; height: 20px;margin-right: 10px;margin-top: 0" type="checkbox" name="">
        Satisfied with experience
      </label>
    </div>
    <div style="margin-bottom: 20px;">
      <p>Customer Sign &amp; Name</p>
    </div>
    <div>
      <strong>Delivery time: </strong> 
    </div>
  </div>
  <?php } ?>
</div>
</body>
</html>
