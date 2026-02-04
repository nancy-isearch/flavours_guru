<!DOCTYPE HTML>
<script>
  fbq('track', 'Purchase', {
    value: 1.0,
    currency: 'INR',
  });
</script>
<?php echo $header; ?>
<style type="text/css">
  .sumrytabl thead td{
    background: #219652;
  }
  .order_placed_id{
    display: none;
  }
  body{
    background: #F5F7F9;
  }
  .place-order-success{
    max-width: 872px;
    margin: auto;
    background: #FFFFFF;
    border-radius:24px;
    min-height: 500px;
    padding: 25px 10px;
    margin-bottom: 30px;
  }
  .btm-card-band{
    width: 100%;
    padding: 10px 14px;
    background: #FEE7EA;
    color: #F65F73;
    font-size: 16px;
  }
  .rec-snd-left-img-col{
    width: 40px;
  }
  .checkout-success .table tr td:first-child {
    text-align: left !important;
  }
  .cart_table tr:last-child td{
    border-bottom: 0 !important;
    padding-bottom: 0;
  }
  .btm-card-cart{
    min-height: initial;
  }
  .qty-bg-col{
    width: 23px;
    height: 23px;
    border-radius: 4px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #E4F4E3;
    font-size: 16px;
    font-weight: 500;
    color: #4BB543;
    margin-right: 5px;
  }
  .font-size-18{
    font-size: 18px;
  }
  .cart_table tr td{
    font-weight: 400;
  }
  .table>tbody>tr>td{
    padding: 10px;
  }
  .cart_table tr th:first-child, .cart_table tr td:first-child {
    padding-left: 0;
    padding-right: 0;
  }
  .font-size-16{
    font-size: 16px;
  }
  .cart_table tr:first-child td {
    border-top: 0 !important;
    padding-top: 0;
  }
  .succ-prd-dtl tr:last-child{
  	display: none;
  }
  @media screen and (max-width: 767px){
    .place-order-success{
      width: 100%;
      border-radius: initial;
      padding: 0;
    }
    body{
      background: #ffffff;
    }
    .cart-img-thumb{
      padding-left: 0;
    }
  }
</style>
<div class="container top_positionn">
  <div class="place-order-success">
    <div class="text-center mb-30">
      <img src="catalog/view/theme/default/image/ord-success-icon.svg" alt="" class="mb-15">
      <h1 class="section-title"><?php echo $heading_title; ?></h1>
    </div>
    <div class="display-flex flex-wrap">
      <div class="col-md-6 col-xs-12 xs-pl-0 xs-pr-0">
        <div class="btm-card-cart mb-15">
          <div class="btm-card-band text-center mb-15">
            <p class="mb-0 font-weight-600">Order Details</p>
          </div>
          <table class="table cart_table mb-0">
            <tr>
              <td class="text-left">Order ID</td>
              <td class="text-right"><?php echo $Userdetails['order_id'];?></td>
            </tr>
            <tr>
              <td class="text-left">Order Date:</td>
              <td class="text-right"><?php echo $Userdetails['date_added'];?></td>
            </tr>
            <tr>
              <td class="text-left">E-mail</td>
              <td class="text-right"><?php echo $Userdetails['email'];?></td>
            </tr>
            <tr>
              <td class="text-left">Telephone</td>
              <td class="text-right"><?php echo $Userdetails['telephone'];?></td>
            </tr>
          </table>
        </div>
        <div class="btm-card-cart mb-15">
          <div class="btm-card-band text-center mb-15">
            <p class="mb-0 font-weight-600">Sender Detail</p>
          </div>
          <div class="display-flex mb-15">
            <div class="rec-snd-left-img-col">
              <img class="img-responsive" src="catalog/view/theme/default/image/sender-icon.svg" alt="">
            </div>
            <div style="width: calc(100% - 40px);" class="p-l-15">
              <p class="font-size-14 font-weight-600 mb-5"><?php echo $Userdetails['payment_firstname'];?></p>
              <p class="font-size-14 font-weight-400 mb-5"><?php echo $Userdetails['payment_email'];?>m</p>
              <p class="font-size-14 font-weight-400 mb-0"><?php echo $Userdetails['payment_mobile'];?></p>
            </div>
          </div>
          <div class="btm-card-band text-center mb-15">
            <p class="mb-0 font-weight-600">Recipient Detail</p>
          </div>
          <div class="display-flex mb-0">
            <div class="rec-snd-left-img-col">
              <img class="img-responsive" src="catalog/view/theme/default/image/recipient-icon.svg" alt="">
            </div>
            <div style="width: calc(100% - 40px);" class="p-l-15">
              <p class="font-size-14 font-weight-600 mb-5"><?php echo $Userdetails['shipping_firstname'].' '.$Userdetails['shipping_lastname'];?></p>
              <p class="font-size-14 font-weight-400 mb-0"><?php echo $Userdetails['shipping_address_1'].' '.$Userdetails['shipping_address_2'];?> <?php echo $Userdetails['shipping_city'];?> <?php echo $Userdetails['shipping_postcode'];?> <?php echo $Userdetails['shipping_zone'];?> <?php echo $Userdetails['shipping_country'];?> </p>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-xs-12 xs-pl-0 xs-pr-0">
        <?php
          function isJson($string) {
            json_decode($string);
            return json_last_error() === JSON_ERROR_NONE;
          }
          ?>
        <?php  foreach($orders as $order) { ?>
        <div class="btm-card-cart mb-15">
          <div class="mb-15 display-flex align-items-center">
            <div class="cart-img-thumb text-left">
              <img src="<?php echo $order['image']; ?>" alt="<?php echo $order['name']; ?>" title="<?php echo $order['name']; ?>" class="img-thumbnail">
            </div>
            <div class="text-left prod-title-col">
              <p class="fw-600 font-size-18"><?php echo $order['name']; ?></p>
              <p class="display-flex mb-0 align-items-center">
                <span class="qty-bg-col"><?php echo $order['qty']; ?></span> 
                <span class="fw-600 font-size-16">X <?php echo $order['price']; ?></span>
              </p>
            </div>
          </div>
          <?php if(isset($order['shipping_info']) && !empty($order['shipping_info']) && isJson($order['shipping_info'])){ ?>
            <?php  $shipInfo = json_decode($order['shipping_info']); ?>
            <?php if($shipInfo){ ?>
          <div class="btm-card-band text-center mb-15">
            <p class="mb-0 font-weight-600">Shipping Details</p>
          </div>
          <table class="table cart_table mb-0 succ-prd-dtl">
            
            <?php foreach ($shipInfo as $key => $value) { ?>
            <tr>
              <td class="text-left"><?php echo $key; ?></td>
              <td class="text-right"><?php echo str_replace('u20b9','',$value); ?></td>
            </tr>
          <?php } } ?>
            
          </table>
        <?php } ?>
        </div>

        <?php } ?>

        <div class="btm-card-cart">
          <div class="btm-card-band text-center mb-15">
            <p class="mb-0 font-weight-600">Price Details</p>
          </div>
          
          <table class="table cart_table mb-0">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-left"><?php echo $total['title'] ?></td>
              <td class="text-right"><?php echo $total['text'] ?></td> 
            </tr>
           <?php } ?>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container" style="display: none;">
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
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

     <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?> 
          <h1><?php echo $heading_title; ?></h1>
<!-- order summary detail start -->

  <?php if(isset($orderId) && !empty($orderId)){  ?>
    <h3 class="orderSummry">Order Summary</h3>    
      <div class="col-sm-12">
        <div class="row">
            <div class="order_summer_sucess">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-hover sumryDetail">
                   <tr>
                    <th scope="col">Order Details</th>
                    <th scope="col">&nbsp;</th>
                   </tr>
                          <tr>
                            <td><div class="order_placed_id"><?php echo $Userdetails['order_id'];?></div><b>Order ID: <?php echo $Userdetails['order_id'];?> </b><br>
                                <b>Order Date:</b> <?php echo $Userdetails['date_added'];?><br>
                                <b>Payment Method:</b> <?php echo $Userdetails['payment_method'];?><br></td>
                            <td> <b>E-mail:</b> <?php echo $Userdetails['email'];?><br>
                                 <b>Telephone:</b> <?php echo $Userdetails['telephone'];?><br>
                                  </td> 
                          </tr>
           </table> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-hover sumryReciepient">
              <tr>
                <th scope="col">Sender Detail</th>
                <th scope="col">Recipient Detail</th>
              </tr> 
              <tr>
            <td> 
                  <b><?php echo $Userdetails['payment_firstname'];?></b><br>
                  <b><?php echo $Userdetails['payment_email'];?></b> <br> 
                  <b><?php echo $Userdetails['payment_mobile'];?></b> <br> 
                  </td>
         
              <td><b><?php echo $Userdetails['shipping_firstname'].' '.$Userdetails['shipping_lastname'];?></b><br>
                  <b><?php echo $Userdetails['shipping_address_1'].' '.$Userdetails['shipping_address_2'];?></b> <br> 
                  <b><?php echo $Userdetails['shipping_city'];?></b> <br>
                  <b><?php echo $Userdetails['shipping_postcode'];?></b>  <br>
                  <b><?php echo $Userdetails['shipping_zone'];?></b>  <br>
                  <b><?php echo $Userdetails['shipping_country'];?></b><br></td>
                   

             </tr>
          </table>
            </div>
        </div> 

      </div>
       
      <?php      
     
        $txt = explode('_',$Userdetails['comment']);      
        if(( isset($txt[0]) && !empty($txt[0]) ) || ( isset($txt[1]) && !empty($txt[1]) ) ){ 
              
       ?>
       <table class="table table-bordered table-hover messagetabl">
          <thead>
            <tr>              
              <td class="text-left">Gift Message</td>
              <td class="text-right">Occasion</td>  
            </tr>
          </thead>
          <tbody>
             <tr>              
              <td class="text-left"><?php echo $txt[0];?></td>
              <td class="text-right"><?php echo $txt[1];?></td>  
            </tr>
          </tbody>
       </table>
      
      <?php  }  ?>

       <table class="table table-bordered table-hover sumrytabl">
          <thead>
            <tr>              
              <td class="text-left">Image</td>
              <td class="text-right">Name</td>
              <td class="text-left">Quantity</td>
              <td class="text-left">Shipping Info</td>
              <td class="text-right">Shipping Price</td>
              <td class="text-right">Price</td>
              <td class="text-right">Total</td> 
            </tr>
          </thead>
          <tbody>
            
          <?php  foreach($orders as $order) { ?>
              <tr>
         
              <td class="text-left"><img class="imgSize" width="50px"  src="<?php echo $order['image']; ?>" ></td> 
              <td class="text-right"><?php echo $order['name']; ?></td>
              <td class="text-left"><?php echo $order['qty']; ?></td>
              <td class="text-left"><?php  $shipInfo = json_decode($order['shipping_info']); foreach ($shipInfo as $key => $value) {
                  echo "<span>".$key."</span> - ".str_replace('u20b9','',$value)."<br>";
                }  ?></td>
              <td class="text-left"><?php echo $order['shipping_price']; ?></td>
              <td class="text-right"> <?php echo $order['price']; ?></td>
              <td class="text-left"><?php echo $order['total']; ?></td> 
            </tr>
           <?php } ?>   </tbody> <tfoot>
           <?php foreach ($totals as $total) { ?>
            <tr >
              <td colspan="6" class="text-right"><?php echo $total['title'] ?></td>
              <td colspan="6" class="text-left"><?php echo $total['text'] ?></td> 

            </tr>
            <?php // print_r($total);
            //$number = preg_replace('/[^0-9-.]+/', '', $total_inc_tax);
            //echo $number."_123"; 
            //echo filter_var( str_replace(",", "", $number), FILTER_SANITIZE_NUMBER_INT);
            ?>
           <?php } ?>         
           </tfoot>
        </table> 
        <?php 


        $total_tax = $totals[1]['text'];
        $total_inc_tax = $totals[2]['text']; 
        $total_tax_number = preg_replace("/[^0-9]/", "", $total_tax);
        $total_inc_tax_number = preg_replace("/[^0-9]/", "", $total_inc_tax);

         ?>  
          
          <div class="here2" style="display:none;"><?php  echo  $total_inc_tax.'_'.$total_tax; ?></div>
        <?php
        $shpng_dte = '';
          foreach($shipInfo as $key => $value){

            if( $key == "Shipping Date"){
            $shpng_dte = $value; 
          }
        }
        $shpng_dte1 = date('Y-m-d' , strtotime($shpng_dte));
        ?>
     
     <?php } else { ?> 
    <!-- end order summary detail  -->  
    <?php echo $text_message; ?>
      <div class="buttons">
        <div class=""> <a href="<?php echo $continue; ?>" class="btn btn-primary"> <?php echo $button_continue; ?> </a> </div>
      </div>
      <?php echo $content_bottom; ?>
   </div>
    <?php echo $column_right; ?> </div>
   <?php } ?>
  </div>  
  </div>
 </div>

<script src="https://apis.google.com/js/platform.js?onload=renderOptIn" async defer></script> 
<script> 
  window.renderOptIn = function() { 
    window.gapi.load('surveyoptin', function() { 
      window.gapi.surveyoptin.render( 
        { 
          // REQUIRED FIELDS 
          "merchant_id": 8438118, 
          "order_id": "<?php echo $Userdetails['order_id'];?>", 
          "email": "<?php echo $Userdetails['email'];?>", 
          "delivery_country": "IN", 
          "estimated_delivery_date": "<?php echo $shpng_dte1;?>" 
        }); 
    }); 
  } 
</script>

<?php $allg4 = array(); foreach ($orders as $product) {
    $arr = array();
    $arr['item_id'] = $product['model'];
    $arr['item_name'] = $product['name'];
    $arr['index'] = 0;
    $arr['item_brand'] = "Flavours Guru";
    //$arr['item_category'] = $heading_title;
    $arr['price'] = (int)$product['pricen'];
    $arr['quantity'] = (int)$product['qty'];
    $allg4[] = (object)$arr;
  } ?>

<script>

<?php $itemsArray=array(); 
  foreach($orders as $order) {
      $itemsArray[]=array(
          'name'=>$order['name'],
          'price'=>(int)preg_replace("/[^0-9]/", "", $order['price']),
          'quantity'=>(int)$order['qty']
        );
  } ?>
dataLayer.push({
    'event': 'transaction',
    'ecommerce': {
        'purchase': {
            'actionField': {
                'id': '<?php echo (int)$Userdetails["order_id"]; ?>',              // Transaction ID. Required                    
                'revenue': '<?php echo (int)$orderTotal;?>',         //  Total transaction value (incl.  tax and shipping)
                'tax':'<?php echo(int) $total_tax_number; ?>',
            },
    'products': <?php echo json_encode($itemsArray) ?>,
        }
    }
});

dataLayer.push({ ecommerce: null });  // Clear the previous ecommerce object.
dataLayer.push({
  event: "purchase",
  ecommerce: {
      transaction_id: "<?php echo $Userdetails["order_id"]; ?>",
      value: <?php echo (int)$orderTotal;?>,
      tax: 0,
      shipping: <?php echo (int)$shippingTotal;?>,
      coupon: '<?php echo $coupon_applied; ?>',
      currency: "INR",
      items: <?php echo json_encode($allg4); ?>
  }
});
</script> 

<?php /*  <script>
dataLayer.push({
'event': 'transaction',
'ecommerce': {
'purchase': {
'actionField': {
'id': '<?php echo $Userdetails["order_id"]; ?>', // Transaction ID. Required
'revenue': '<?php echo $order["price"]; ?>', // Total transaction value (incl. tax and shipping)
'tax':'<?php echo $order["qty"]; ?>',
},
'products': [{ // List of productFieldObjects.
'name': '<?php echo $order["name"]; ?>', // Name or ID is required.
'price': '2799',
'quantity': '<?php echo $order["qty"]; ?>',
}] //expand this array if more product exists
}
}
});
</script> */ ?>

</div>
<?php echo $footer; ?>