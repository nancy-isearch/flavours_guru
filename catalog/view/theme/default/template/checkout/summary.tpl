<style type="text/css">
	.input-group .form-control[name^=quantity]{
		background: none;
		border:0;
	}
	.panel-default>.panel-heading+.panel-collapse>.panel-body{
		padding-top: 15px;
	}
	.img-thumbnail{
		border:0;
	}
</style>
<div class="table-responsive">
	<div class="visible-xs product_edit">
		<a href="/cart">
			<span class="edit_info_checkout">Edit</span>
		</a>
	</div>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"> 
  <input type="hidden" name="redirect" value="redirect">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-left"></td>
        <td class="text-left"><?php echo $column_name; ?></td>
        <td class="text-left hide-mob"><?php echo $column_quantity; ?></td>
        <td class="text-left"><?php echo 'Shipping Info'; ?></td>
        <?php /* <td class="text-left"><?php echo 'Shipping Price'; ?></td> */ ?>
        <td class="text-left"><?php echo $column_price; ?></td>
        <td class="text-left hide-mob">Action</td>

        <?php /* <td class="text-left"><?php echo $column_total; ?></td> */ ?>
        
      </tr>
    </thead>
    <tbody class="position-relative">
      <?php 
        $shippingPrice = 0; 
        foreach($products as $product) { 
          $shippingPrice = $shippingPrice + str_replace('₹','',$product['shiPrice']);
      ?>
      <tr>
        <td class="text-center img-thumb-col"><?php if ($product['thumb']) { ?>
          <a <?php /* ?> href="<?php echo $product['href']; ?>" <?php */ ?>><img loading="lazy" decoding="async"src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
          <?php } ?>
        </td>
        <td class="text-left prod-title-col"><a <?php /* ?> href="<?php echo $product['href']; ?>" <?php */ ?>><?php echo $product['name']; ?> - <span><?= $product['actualPrice']; ?></span></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          <small> <?php echo $option['name']; ?> - <?php echo $option['value']; ?></small>
          <?php } ?>
          <?php if($product['recurring']) { ?>
          <br />
          <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
          <?php } ?>
          <p style="font-size: 85%;margin-bottom: 0;" class="visible-xs">Qty. : <?php echo $product['quantity']; ?></p>
        </td>
        
        <?php /* <td class="text-right"><?php echo $product['quantity']; ?></td> */ ?>


        <td class="text-left hide-mob"><div class="input-group btn-block" style="max-width: 200px;">
          <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" readonly />
          <!--<span class="input-group-btn">
          <button type="submit" data-toggle="tooltip" title="Update" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
          <button type="button" data-toggle="tooltip" title="Remove" class="btn btn-danger" onclick="cart.remove('<?php echo $product['cart_id']; ?>'); setTimeout(function(){location.reload(true);},1000);"><i class="fa fa-times-circle"></i></button>
          </span>-->
          </div>
        </td>
        <?php $shipInfo = json_decode($product['shipping_info']); ?>
        <td class="text-left shiping_info <?php echo ($shipInfo) ? "main-pro" : "add-on-prod" ?>"><?php  foreach ($shipInfo as $key => $value) {
                  echo "<span>".$key."</span>"." - ".str_replace('u20b9','',$value)."<br>";
                }  ?></td>
        <?php /* <td class="text-right"><?php echo $product['shiPrice']; ?></td> */ ?>
        <td class="text-left price_info hide-mob"><?php echo $product['actualPrice']; ?></td>
         <?php /* <td class="text-right"><?php echo $product['total']; ?></td> */ ?>
         <td class="text-right hide-mob">
           <a href="/cart" style="text-decoration: underline;color: #404040">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M1.76977 18.0517H3.24459L14.1582 7.13809L12.7129 5.66328L1.76977 16.6064V18.0517ZM17.9337 5.84025L13.9517 1.88776L15.2496 0.589924C15.6625 0.196641 16.1691 0 16.7692 0C17.3686 0 17.8649 0.196641 18.2582 0.589924L19.4675 1.79927C19.8018 2.15322 19.9788 2.57089 19.9984 3.05227C20.0181 3.53444 19.851 3.94266 19.497 4.27695L17.9337 5.84025ZM16.6654 7.13809L3.98199 19.8215H0V15.8395L12.6834 3.1561L16.6654 7.13809ZM13.4208 6.40068L12.7129 5.66328L14.1582 7.13809L13.4208 6.40068Z" fill="#404040"/>
            </svg>
           </a>
         </td>
          
      </tr> 
      <?php } ?> 
      <?php foreach ($vouchers as $voucher) { ?>  
      <tr>
        <td class="text-left"><?php echo $voucher['description']; ?> </td>
        <td class="text-left"></td>
        <td class="text-right">1</td>
        <td class="text-right"><?php echo $voucher['amount']; ?></td>
        <td class="text-right"><?php echo $voucher['amount']; ?></td>
        
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>

      <?php /* <tr>
        <td colspan="5" class="text-right"><strong>Shipping Price:</strong></td>
        <td colspan="5"  class="text-right">₹<?php echo $shippingPrice; ?></td>
      </tr> */ ?>

      <?php foreach ($totals as $total) { ?>
      <tr class="mob-invoice-data">
        <td colspan="5" class="text-right invoice-data"><strong><?php echo $total['title']; ?>:</strong></td>
        <td colspan="5"  class="text-right invoice-data"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>
</form>

  <div class="coupon-box">
    <?php echo $coupon_data ?>
    <ul class="breadcrumb">
    </ul>
  </div>
</div>


<button type="button" style="margin-top: 15px;float: right; display:none;" id="summary-btn" class="btn btn-primary">Proceed to pay</button>
