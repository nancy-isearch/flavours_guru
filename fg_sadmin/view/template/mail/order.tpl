<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> <?php echo $title; ?> </title>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<div style="width: 680px;"><div style=" width:100%; float:left; text-align:center; padding-top:15px; border-top:3px solid #ddd;"><a href="<?php echo $store_url; ?>" title=" <?php echo $store_name; ?>"><img src="https://www.flavoursguru.com/image/logo.png" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; width:200px; border:none;" /></a></div>
<tr>
  <td style="border-top:1px solid #fff" width="620">
     <table width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#495461">
  <tbody>
    <tr>
      <td style="border-bottom:2px solid #fff;border-right:1px solid #fff;font-weight:normal;font-size:15px;height:27px" width="34%" align="center"><a href="https://www.flavoursguru.com/birthday/" style="text-decoration:none;color:#fff" target="_blank">BIRTHDAY</a></td>
      <td style="border-bottom:2px solid #fff;border-right:1px solid #fff;font-weight:normal;font-size:15px;height:27px" width="33%" align="center"><a href="https://www.flavoursguru.com/anniversary/" style="text-decoration:none;color:#fff" target="_blank">ANNIVERSARY</a></td>
      <td style="border-bottom:2px solid #fff;font-weight:normal;font-size:15px;height:27px" width="34%" align="center"><a href="https://www.flavoursguru.com/wedding/" style="text-decoration:none;color:#fff" target="_blank">WEDDING</a></td>
    </tr>

    <tr>
    <td style="border-bottom:1px solid #fff;border-right:1px solid #fff;font-weight:normal;font-size:15px;height:27px" width="33%" align="center"><a href="https://www.flavoursguru.com/kids/" style="text-decoration:none;color:#fff" target="_blank">CAKE FOR KIDS</a></td>
    <td style="border-bottom:1px solid #fff;border-right:1px solid #fff;font-weight:normal;font-size:15px;height:27px" width="34%" align="center"><a href="https://www.flavoursguru.com/custom-theme-cakes/" style="text-decoration:none;color:#fff" target="_blank">THEME CAKES</a></td>
    <td style="border-bottom:1px solid #fff;font-weight:normal;font-size:15px;height:27px" width="33%" align="center"><a href="https://www.flavoursguru.com/fusion-cakes/" style="text-decoration:none;color:#fff" target="_blank">FUSION CAKES</a></td>
  </tr>
  
</tbody></table>
 </td>
</tr>
  <p style="margin-top: 0px; margin-bottom: 20px; font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo $text_greeting; ?> </p>
   <?php if ($customer_id) { ?>
  
   <?php } ?>
  
  
      <tr>
    <td><table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody><tr>
  <td width="10">&nbsp;</td>
    <td style="font-family:Georgia,'Times New Roman',Times,serif; font-size:14px"align="left">We’re hereby sharing your order details to make it easy for you to remember what you ordered.</td>
    <td width="10">&nbsp;</td>
  </tr>
</tbody></table>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td><table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody><tr>
    <td width="10">&nbsp;</td>
    <td>
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
        
       
      </table></td>
    <td width="10">&nbsp;</td>
  </tr>
  <tr>
    <td width="10">&nbsp;</td>
    <td>&nbsp;</td>
    <td width="10">&nbsp;</td>
  </tr>
</tbody></table>
</td>
  </tr>
  <tr>
   
    <td><table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody><tr>
    <td width="10">&nbsp;</td>
    <td align="center"><a href="https://www.flavoursguru.com/index.php?route=ordertrack/ordertrack" target="_blank" style="text-decoration:none; color:#fff; font-size:15px; width:12px;"><img src="https://flavoursguru.com/image/catalog/images/track-your-order.jpg"></a></td>
    <td width="10">&nbsp;</td>
  </tr>
</tbody></table>
</td>
  </tr>
  <tr>
    <td height="7"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <p>&nbsp;</p>
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222; font-family:Georgia,'Times New Roman',Times,serif;" colspan="2"><?php echo $text_order_detail; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"><b><?php echo $text_order_id; ?></b> <?php echo $order_id; ?><br />
          <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?><br />
          <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
          <?php if ($shipping_method) { ?>
          <!-- <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?> -->
          <?php } ?></td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; font-family:Georgia,'Times New Roman',Times,serif; padding: 7px;"><b><?php echo $text_email; ?></b> <?php echo $email; ?><br />
          <b><?php echo $text_telephone; ?></b> <?php echo $telephone; ?><br />
          <!-- <b>  $text_ip; </b>   $ip; <br />
          <b>  $text_order_status; </b>   $order_status; <br /> --></td>
      </tr>
    </tbody>
  </table>
 
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <!-- Sender Detail -->
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; font-family:Georgia,'Times New Roman',Times,serif; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"> <?php echo $text_payment_address; ?></td>

          <?php if ($shipping_address) { ?>
          <!-- Recipient Detail -->
            <td style="font-size: 16px; border-right: 1px solid #DDDDDD; font-family:Georgia,'Times New Roman',Times,serif; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"> <?php echo $text_shipping_address; ?> </td>
         <?php } ?>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; font-family:Georgia,'Times New Roman',Times,serif; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $payment_address; ?></td>

         <?php if ($shipping_address) { ?>
           <td style="font-size: 16px;  border-right: 1px solid #DDDDDD; font-family:Georgia,'Times New Roman',Times,serif; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"> <?php echo $shipping_address; ?> </td>
          <?php } ?>
      </tr>
    </tbody>
  </table>
 <?php 
   $txt = explode('_',$comment);
  if (isset($txt[0]) && !empty($txt[0]) || isset($txt[1]) && !empty($txt[1])) { 
      
  ?>
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; font-family:Georgia,'Times New Roman',Times,serif; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo 'Gift Message'; ?></td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; font-family:Georgia,'Times New Roman',Times,serif; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;"><?php echo 'Occasion'; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; font-family:Georgia,'Times New Roman',Times,serif; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;">  <?php echo $txt[0]; ?> </td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; font-family:Georgia,'Times New Roman',Times,serif; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"> <?php echo $txt[1]; ?></td>
      </tr>
    </tbody>
  </table>
   <?php } ?>
  <table style="border-collapse: collapse; width: 100%; font-family:Georgia,'Times New Roman',Times,serif; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222; font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo $text_product; ?></td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222; font-family:Georgia,'Times New Roman',Times,serif;">  <?php echo $text_quantity; ?> </td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222; font-family:Georgia,'Times New Roman',Times,serif;">  <?php echo 'Shipping Info'; ?> </td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222; font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo 'Shipping Price'; ?> </td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222; font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo $text_price; ?> </td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222; font-family:Georgia,'Times New Roman',Times,serif;"><?php echo $text_total; ?> </td>
      </tr>
    </thead>
    <tbody>
            <?php foreach ($products as $product) { ?>
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;">  <?php echo $product['name']; ?>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?></td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px font-family:Georgia,'Times New Roman',Times,serif;;"> <?php echo $product['quantity']; ?></td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"> <?php  $shipInfo = json_decode($product['shipping_info']); foreach ($shipInfo as $key => $value) {
                  echo $key." - ".str_replace('u20b9','',$value)."<br>";
                }  ?></td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;">  <?php  echo $product['shipping_price'];  ?>  </td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo $product['price']; ?> </td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"><?php echo $voucher['description']; ?> </td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"></td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;">1</td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo $voucher['amount']; ?></td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
   <?php foreach ($totals as $total) { ?> 
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;" colspan="5"><b> <?php echo $total['title']; ?>:</b></td>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo $total['text']; ?> </td>
      </tr>
      <?php } ?>

      <?php foreach ($products as $product) { ?>
      <?php foreach ($product['option'] as $option) { ?>
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;" colspan="1"><b> <?php echo $option['name']; ?> :</b></td>

        <td colspan="5" style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo $option['value']; ?> </td>
      </tr>
      <?php } ?>
      <?php } ?>

      <?php 
         $txt1 = explode('_',$comment11);
        if (isset($txt1[2]) && !empty($txt1[2])) { 
          $card_message1 = $txt1[2];
        } else {
          $card_message1 = '';
        } 

        if (isset($txt1[3]) && !empty($txt1[3])) { 
          $special_instruction1 = $txt1[3];
        } else {
          $special_instruction1 = '';
        }  
        ?>

      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;" colspan="1"><b> Message on Card </b></td>

        <td colspan="5" style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo $card_message1; ?> </td>
      </tr>
      <tr>
        <td style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;" colspan="1"><b> Special Instruction </b></td>

        <td colspan="5" style="font-size: 16px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px; font-family:Georgia,'Times New Roman',Times,serif;"> <?php echo $special_instruction1; ?> </td>
      </tr>

    </tfoot>
  </table>
  <tr>
    <td><table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody><tr>
    <td width="10">&nbsp;</td>
    <td valign="top"><a target="_blank" href="https://www.flavoursguru.com/valentines.php">
<img alt="Designer christmas cake delivery all across !" src="https://flavoursguru.com/image/catalog/banner/next15.png" id="_x0000_i1030" class="banner" width="100%" border="0"></a></td>
    <td width="10">&nbsp;</td>
  </tr>
</tbody></table>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody><tr>
    <td width="10">&nbsp;</td>
    <td><strong>Thanks!</strong></td>
    <td width="10">&nbsp;</td>
  </tr>
</tbody></table>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <!--FOOTER-->
    <tr>
    <td><table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody><tr>
    <td width="10">&nbsp;</td>
    <td><span style="color:#000000;"><strong>Team Flavoursguru</strong></span><br> <a href=""https://www.flavoursguru.com/" style="text-decoration:none" target="_blank">www.flavorsguru.com</a></td>
     <td width="50%" align="right"><a href="https://salesiq.zoho.com/signaturesupport.ls?widgetcode=c02c4a4ca6ecef3ba2db96f8d2f38bf4e8cc14e5a50e99157a41f3b3b0174878ffa5c993dbbd8f58c1d52fddd9cc18d3" target="_blank"><img src="https://flavoursguru.com/image/catalog/images/signature.png"></a></td>  
  <td width="10">&nbsp;</td>
  </tr>
</tbody></table>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="text-align:center; font-weight:normal; font-size:11px; background:#FFC0CB" height="30"><table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody><tr>
  <td width="10">&nbsp;</td>
    <td style="font-weight:normal; font-size:16px; color:#000000; padding:14px 0;" width="100%" align="centre">NEED HELP? Check these<br><a href="https://www.flavoursguru.com/faq" style="text-decoration:none" target="_blank">FAQs <span style="color:#000000;">or </span></a><a href="https://www.flavoursguru.com/contact" style="text-decoration:none" target="_blank">Contact Us</a></td>

   <td width="10">&nbsp;</td>
  </tr>
</tbody></table>
</td>
  </tr>
  <tr>
  <td>&nbsp;</td>
  </tr>
  <?php /*<p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_footer; ?> </p>*/ ?>
   
 
 <p style="font-family:Georgia,'Times New Roman',Times,serif; font-size:18px">Points to Remember-
    <ul>
      <li>Actual product may a vary bit as its a hand made thing.</li>
      <li>Delivery Can be delayed in case uncertain circumstances like rainfall.</li>
    <li>Non edible items can be used on or inside the cake depending upon the design. wooden stick are also used to support the cake.</li>
      <li>Few Dark colors specially Red and Blue leave stain on skin and clothes. Might taste slightly bitter than a regular color cake. Above all the color used is 100% safe and food grade.</li>
      <li>Please keep the cake in room temperature for 30-60 mins before consuming for better taste.</li>
    <li>Fondant is little sticky and sweet which is made out of sugar and its taste shouldnt be compared as that of regular cream cake.</li>
    </ul>
  </p>
</div>
</body>
</html>


