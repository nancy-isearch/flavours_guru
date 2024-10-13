<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
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
    <h3 class="orderSummry">This is your Order Summary.</h3>    
	    <div class="col-sm-12">
		    <div class="row">
				    <div class="order_summer_sucess">
				    	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-hover">
				           <tr>
				            <th scope="col">Order Details</th>
				            <th scope="col">&nbsp;</th>
				           </tr>
				     			        <tr>
				                    <td><b>Order ID:</b> #<?php echo $Userdetails['order_id'];?><br>
				                        <b>Order Date:</b> <?php echo $Userdetails['date_added'];?><br>
				                        <b>Payment Method:</b> <?php echo $Userdetails['payment_method'];?><br></td>
				                    <td> <b>E-mail:</b> <?php echo $Userdetails['email'];?><br>
				                         <b>Telephone:</b> <?php echo $Userdetails['telephone'];?><br>
				                          </td> 
				      		      	</tr>
					 </table> 
				    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-hover">
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
				          <b><?php echo  $Userdetails['shipping_country'];?></b><br></td>

				     </tr>
				  </table>
				    </div>
		    </div> 

	    </div>
    	 <table class="table table-bordered table-hover">
          <thead>
            <tr>
              
              <td class="text-left">Image</td>
              <td class="text-right">Name</td>
              <td class="text-left">Quantity</td>
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
              <td class="text-left"><?php echo $order['shipping_price']; ?></td>
              <td class="text-right"> <?php echo $order['price']; ?></td>
              <td class="text-left"><?php echo $order['total']; ?></td> 
            </tr>
           <?php } ?>  
           <tr >
              
              <td colspan="5" class="text-right">Sub-Total:</td>
              <td class="text-left"><?php echo $Alltotal; ?></td> 
            </tr>    
            <tr>
              <td class="text-right"></td>
              <td class="text-left"></td>
              <td class="text-right"></td> 
              <td class="text-right"></td> 
              <td class="text-right">Total:</td>
              <td class="text-left"><?php echo $Alltotal; ?></td> 
            </tr>         
            </tbody>
        </table>  
     <?php } else { ?>
    
<!-- end order summary detail  -->  
    <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?>
   </div>
    <?php echo $column_right; ?></div>
  <?php } ?>
  </div>  </div>
 </div>
</div>
<?php echo $footer; ?>