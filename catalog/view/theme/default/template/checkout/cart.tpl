<?= $header; ?>

<script type="text/javascript">
  <?php $allg4 = array(); foreach ($products as $product) {
    $arr = array();
    $arr['item_id'] = $product['model'];
    $arr['item_name'] = $product['name'];
    $arr['index'] = 0;
    $arr['item_brand'] = "Flavours Guru";
    //$arr['item_category'] = $heading_title;
    $arr['price'] = $product['mprice'];
    $arr['quantity'] = (int)$product['quantity'];
    $allg4[] = (object)$arr;
  } ?>
  dataLayer.push({ ecommerce: null });  // Clear the previous ecommerce object.
  dataLayer.push({
  event: "view_cart",
  ecommerce: {
    currency: "INR",
    value: <?php echo $nval; ?>,
    items: <?php echo json_encode($allg4); ?>
  }
});
</script>

<style type="text/css">
  .item-add-input{
    width: 45px !important;
    float: initial !important;
    text-align: center;
    margin-right:0;
    border-left: 0 !important;
    border-right: 0 !important;
    border-color: #000000 !important;
    font-size: 14px;
    font-weight: 500;
    color: #000000;
  }

  .addcartitem {
    font-size: 20px;
    border: 0;
    background: none;
    border: 1px solid #000000;
    margin-right: 0;
    height: 32px;
  }

  .qty-delete{
    font-size: 14px;
    border: 0;
    background: none;
    border: 1px solid #000000;
  }

  .rmcartitem{
    font-size: 20px;
    border: 0;
    background: none;
    margin-right: 0;
    border: 1px solid #000000;
    height: 32px;
  }

  .display-flex{
    display: flex;
  }
  .alert{
    margin-left: 0;
  }
  .input-group .form-control[name^=quantity] {
    height: 32px;
  }
  .checkout-cart #accordion.panel-group{
    max-width: 100%;
    margin-bottom: 0;
  }
  .error{
  	color: #ff0000;
  }
  .success{
  	color: green;
  }
  .coupon-item{
  	border:1px solid #e9eaec;
  	padding: 15px;
  	margin-bottom: 15px;
  }
  .coupon-item:last-child(){
  	margin-bottom: 0;
  }
  .coupon-popup {
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    top: 0;
    left: 0;
    z-index: 11111;
    overflow-y: auto;
    padding: 15px;
    display: none;
}
.coupon-item-col{
	width: 700px;
	position: absolute;
	background-color: #ffffff;
	min-height: 300px;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	border-radius: 8px;
	padding:15px;
}
.view-more-coupon:hover{
	color: #f65f73;
}
#collapse-coupon .panel-body{
	padding-right: 0;
}
  @media screen and (max-width: 767px){
  	.bg-last-ft{
  		margin-bottom: 45px;
  	}
  	footer.cart-footer, .news-letter-col{
  		display: none;
  	}
  	.coupon-item-col{
  		width: 95%;
  	}
  }
</style>
<div class="container top_positionn">
  <div class="row">
    <ul class="breadcrumb">
        <?php 
          $i=1; 
          $Totlbrdcum = count($breadcrumbs); 
          foreach($breadcrumbs as $breadcrumb) {  
           if($Totlbrdcum==$i){  
        ?> 
            <li><span class="" style="color: #35a8d4;"><?= $breadcrumb['text']; ?> </span></li>
        <?php  } else { ?>
            <li><a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?> </a></li> 
        <?php } $i++; }   ?>
    </ul>
  </div>
  <div class="row">
    <?php if ($attention) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?= $attention; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?= $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?= $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
  </div>
  <div class="row"><?= $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?= $class; ?>"><?= $content_top; ?>
      <div class="page-title-band">
        <div class="row">
          <div class="col-md-6 col-sm-6 col-xs-8">
            <h3 class="titleforall mb-0 mt-0"><?= $heading_title; ?></h3>
          </div>
          <div class="col-md-6 col-sm-6 col-xs-4 text-right">
            <h3 class="titleforall mb-0 mt-0"><?php echo count($products); ?> Items</h3>
          </div>
        </div>
      </div>
      
      <form action="<?= $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
          <table class="table cart_table">
            <thead>
              <tr>
                <th>Product Info</th>
                <th class="" style="text-align: left !important;">Shipping Details</th>
                <!-- <th class="hide-mob">Quantity</th>
                <th>Model</th> -->
                <th>Total Price</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center img-thumb-col">
                  <div class="display-flex align-items-center xs-align-items-start">
                    <div class="cart-img-thumb text-left">
                      <?php if ($product['thumb']) { ?>
                      <a <?php /* ?> href="<?= $product['href']; ?>" <?php */ ?>><img loading="lazy" decoding="async"src="<?= $product['thumb']; ?>" alt="<?= $product['name']; ?>" title="<?= $product['name']; ?>" class="img-thumbnail" /></a>
                      <?php } ?>
                    </div>
                    <div class="text-left prod-title-col">
                      <p class="mb-0"><?= $product['name']; ?> - <span class="text-primary fw-600"><?= $product['actualPrice']; ?></span></p>
                      <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                      <?php } ?>
                      <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                      <p class="mb-0"><?= $option['name']; ?>: <?= $option['value']; ?></p>
                      <?php } ?>
                      <?php } ?>
                      <?php if ($product['reward']) { ?>
                      <p class="mb-0"><?= $product['reward']; ?></p>
                      <?php } ?>
                      <?php if ($product['recurring']) { ?>
                      <span class="label label-info"><?= $text_recurring_item; ?></span> <small><?= $product['recurring']; ?></small>
                      <?php } ?>
                      <div class="input-group btn-block display-flex mt-10 align-items-center" style="margin-top: 10px">
                      	<span class="m-r-15">Quantity</span>
	                    <button type="button" class="rmcartitem" cartProId="<?= $product['cart_id']; ?>">-</button>
	                    <input type="text" name="quantity[<?= $product['cart_id']; ?>]" value="<?= $product['quantity']; ?>" size="1" class="form-control item-add-input product_id_<?= $product['cart_id']; ?>" />
	                    <button type="button" class="addcartitem" cartProId="<?= $product['cart_id']; ?>">+</button>
	                    <span class="input-group-btn" style="display: none;">
	                    <button type="submit" data-toggle="tooltip" title="<?= $button_update; ?>" class="btn btn-primary submitcart"><i class="fa fa-refresh"></i></button>
	                    <button type="button" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?= $product['cart_id']; ?>'); setTimeout(function(){location.reload(true);},1000);"><i class="fa fa-times-circle"></i></button>
	                    </span>
	                  </div>
                    </div>
                  </div>
                </td>
                <td class="hide-mob" style="text-align: left">
                  
                  <?php $shipInfo = json_decode($product['shipping_info'], true); ?>
                  <?php if($shipInfo && is_array($shipInfo)){ ?>
                    <p class="mb-0"><?php echo date('jS-F-Y', strtotime($shipInfo['Shipping Date'])) ?>, <?php echo str_replace('u20b9', '₹', $shipInfo['Shipping Type']); ?><br> between <?php echo $shipInfo['Shipping Time'] ?>, <?php echo $shipInfo['City'] ?>-<?php echo $shipInfo['Pincode'] ?></p>
                  <?php } ?>
                  
                </td>
                <?php /*<td class="text-left hide-mob"><?= $product['model']; ?></td> */ ?>
                <?php /*<td class="text-left hide-mob"><?= $product['shiPrice']; ?></td> */ ?>
                <td class="text-left hide-mob"><?= $product['total']; ?></td>
                <td class="hide-mob">
                  <button type="button" style="border:0" class="qty-delete" onclick="cart.remove('<?= $product['cart_id']; ?>');">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="22" viewBox="0 0 18 22" fill="none">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M13.5 3.47795V3.70495C14.799 3.82373 16.0927 3.99454 17.378 4.21695C17.4751 4.23376 17.5678 4.26952 17.6511 4.32219C17.7343 4.37485 17.8063 4.4434 17.8631 4.52391C17.9198 4.60441 17.9601 4.69531 17.9817 4.7914C18.0033 4.88749 18.0058 4.9869 17.989 5.08395C17.9722 5.181 17.9364 5.27378 17.8838 5.35701C17.8311 5.44024 17.7626 5.51227 17.682 5.56901C17.6015 5.62575 17.5106 5.66607 17.4146 5.68768C17.3185 5.70929 17.2191 5.71176 17.122 5.69495L16.913 5.65995L15.908 18.7299C15.8501 19.4835 15.5098 20.1875 14.9553 20.701C14.4008 21.2146 13.6728 21.4999 12.917 21.5H5.08401C4.3282 21.4999 3.60026 21.2146 3.04573 20.701C2.4912 20.1875 2.15095 19.4835 2.09301 18.7299L1.08701 5.65995L0.878007 5.69495C0.78096 5.71176 0.681552 5.70929 0.58546 5.68768C0.489368 5.66607 0.398473 5.62575 0.317964 5.56901C0.15537 5.45443 0.0449542 5.27994 0.0110065 5.08395C-0.0229412 4.88795 0.0223602 4.6865 0.136945 4.52391C0.25153 4.36131 0.426012 4.2509 0.622007 4.21695C1.90727 3.99427 3.20099 3.82347 4.50001 3.70495V3.47795C4.50001 1.91395 5.71301 0.577948 7.31601 0.526948C8.43872 0.491017 9.56229 0.491017 10.685 0.526948C12.288 0.577948 13.5 1.91395 13.5 3.47795ZM7.36401 2.02595C8.45473 1.99107 9.54629 1.99107 10.637 2.02595C11.39 2.04995 12 2.68395 12 3.47795V3.59095C10.0018 3.4696 7.99817 3.4696 6.00001 3.59095V3.47795C6.00001 2.68395 6.60901 2.04995 7.36401 2.02595ZM7.00901 7.97095C7.0052 7.87246 6.98203 7.77568 6.94082 7.68614C6.89961 7.59661 6.84117 7.51606 6.76883 7.44911C6.69649 7.38216 6.61168 7.33011 6.51923 7.29594C6.42678 7.26177 6.3285 7.24614 6.23001 7.24995C6.13152 7.25376 6.03474 7.27693 5.9452 7.31814C5.85567 7.35935 5.77512 7.41779 5.70817 7.49013C5.64122 7.56246 5.58917 7.64728 5.555 7.73973C5.52083 7.83218 5.5052 7.93046 5.50901 8.02895L5.85601 17.0289C5.8637 17.2277 5.95004 17.4153 6.09604 17.5504C6.16833 17.6173 6.25309 17.6693 6.34548 17.7035C6.43787 17.7376 6.53608 17.7533 6.63451 17.7495C6.73293 17.7456 6.82964 17.7225 6.91912 17.6813C7.0086 17.6401 7.08909 17.5817 7.15599 17.5094C7.22289 17.4371 7.27491 17.3524 7.30905 17.26C7.3432 17.1676 7.35881 17.0694 7.35501 16.971L7.00901 7.97095ZM12.489 8.02895C12.4963 7.92857 12.4834 7.82773 12.4509 7.73246C12.4185 7.63719 12.3672 7.54942 12.3001 7.47439C12.233 7.39936 12.1515 7.3386 12.0604 7.29574C11.9694 7.25287 11.8706 7.22877 11.77 7.22488C11.6694 7.22098 11.5691 7.23737 11.475 7.27307C11.3809 7.30877 11.2949 7.36304 11.2222 7.43266C11.1496 7.50228 11.0916 7.58581 11.0519 7.67829C11.0122 7.77077 10.9915 7.8703 10.991 7.97095L10.644 16.971C10.6363 17.1699 10.708 17.3637 10.8432 17.5098C10.9784 17.6559 11.1661 17.7423 11.365 17.75C11.5639 17.7576 11.7577 17.686 11.9038 17.5508C12.0499 17.4156 12.1363 17.2279 12.144 17.0289L12.489 8.02895Z" fill="#BABFC3"></path>
                    </svg>
                  </button>
                </td>
              </tr>
              <tr class="visible-xs">
                <td class="p-l-15 p-r-15" style="text-align: left;" colspan="2">
                  <?php $shipInfo = json_decode($product['shipping_info'], true); ?>
                  <?php if($shipInfo && is_array($shipInfo)){ ?>
                    <p class="mb-0"><?php echo date('jS-F-Y', strtotime($shipInfo['Shipping Date'])) ?>, <?php echo str_replace('u20b9', '₹', $shipInfo['Shipping Type']); ?><br> between <?php echo $shipInfo['Shipping Time'] ?>, <?php echo $shipInfo['City'] ?>-<?php echo $shipInfo['Pincode'] ?></p>
                  <?php } ?>
          
                </td>
              </tr>
              <?php /*<tr class="visible-xs xs-total-charges">
                <td class="p-l-15">Total Charges</td>
                <td class="p-r-15"><?= $product['actualPrice']; ?></td>
              </tr> */ ?>
              <tr class="visible-xs xs-prod-ddelete">
                <td colspan="2" style="padding-top: 0;">
                  <button type="button" style="border:0" class="qty-delete display-flex align-items-center justify-content-center full-width" onclick="cart.remove('<?= $product['cart_id']; ?>');">
                    <span class="mr-5">Remove</span>
                    <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M11.75 2.73162V2.92079C12.8325 3.01978 13.9106 3.16212 14.9817 3.34746C15.0625 3.36146 15.1399 3.39126 15.2092 3.43515C15.2786 3.47904 15.3386 3.53616 15.3859 3.60326C15.4332 3.67035 15.4668 3.74609 15.4848 3.82617C15.5028 3.90624 15.5048 3.98908 15.4908 4.06996C15.4768 4.15083 15.447 4.22815 15.4031 4.29751C15.3593 4.36686 15.3021 4.42689 15.235 4.47417C15.1679 4.52146 15.0922 4.55506 15.0121 4.57307C14.932 4.59107 14.8492 4.59313 14.7683 4.57912L14.5942 4.54996L13.7567 15.4416C13.7084 16.0696 13.4248 16.6562 12.9627 17.0842C12.5006 17.5122 11.894 17.7499 11.2642 17.75H4.73667C4.10683 17.7499 3.50022 17.5122 3.03811 17.0842C2.576 16.6562 2.29246 16.0696 2.24417 15.4416L1.40584 4.54996L1.23167 4.57912C1.1508 4.59313 1.06796 4.59107 0.987883 4.57307C0.907807 4.55506 0.832061 4.52146 0.76497 4.47417C0.629475 4.37869 0.537462 4.23329 0.509172 4.06996C0.480882 3.90663 0.518634 3.73875 0.614121 3.60326C0.709608 3.46776 0.85501 3.37575 1.01834 3.34746C2.08939 3.16189 3.16749 3.01956 4.25001 2.92079V2.73162C4.25001 1.42829 5.26084 0.314957 6.59667 0.272457C7.53227 0.242514 8.46858 0.242514 9.40417 0.272457C10.74 0.314957 11.75 1.42829 11.75 2.73162ZM6.63667 1.52162C7.54561 1.49255 8.45524 1.49255 9.36417 1.52162C9.99167 1.54162 10.5 2.06996 10.5 2.73162V2.82579C8.83487 2.72466 7.16514 2.72466 5.50001 2.82579V2.73162C5.50001 2.06996 6.00751 1.54162 6.63667 1.52162ZM6.34084 6.47579C6.33767 6.39371 6.31836 6.31307 6.28402 6.23845C6.24967 6.16384 6.20097 6.09672 6.14069 6.04093C6.08041 5.98513 6.00973 5.94176 5.93269 5.91328C5.85565 5.88481 5.77375 5.87178 5.69167 5.87496C5.6096 5.87813 5.52895 5.89744 5.45433 5.93178C5.37972 5.96612 5.3126 6.01482 5.25681 6.0751C5.20102 6.13538 5.15764 6.20606 5.12917 6.28311C5.10069 6.36015 5.08767 6.44205 5.09084 6.52412L5.38001 14.0241C5.38642 14.1898 5.45837 14.3461 5.58003 14.4587C5.64027 14.5144 5.71091 14.5578 5.7879 14.5862C5.86489 14.6147 5.94673 14.6277 6.02876 14.6245C6.11078 14.6214 6.19137 14.6021 6.26593 14.5677C6.3405 14.5334 6.40757 14.4848 6.46332 14.4245C6.51908 14.3643 6.56242 14.2936 6.59088 14.2166C6.61933 14.1397 6.63235 14.0578 6.62917 13.9758L6.34084 6.47579ZM10.9075 6.52412C10.9136 6.44047 10.9028 6.35644 10.8758 6.27705C10.8487 6.19765 10.806 6.12452 10.7501 6.06199C10.6942 5.99947 10.6262 5.94884 10.5504 5.91311C10.4745 5.87739 10.3922 5.85731 10.3083 5.85406C10.2245 5.85082 10.1409 5.86448 10.0625 5.89423C9.98408 5.92397 9.91245 5.9692 9.85187 6.02722C9.79129 6.08523 9.74302 6.15484 9.70991 6.23191C9.6768 6.30898 9.65955 6.39192 9.65917 6.47579L9.37001 13.9758C9.3636 14.1416 9.4233 14.3031 9.53597 14.4248C9.64865 14.5466 9.80508 14.6185 9.97084 14.625C10.1366 14.6314 10.2981 14.5717 10.4199 14.459C10.5416 14.3463 10.6136 14.1899 10.62 14.0241L10.9075 6.52412Z" fill="#015EF7"/>
                    </svg>
                  </button>
                </td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?= $voucher['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?= $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
                <td class="text-right"><?= $voucher['amount']; ?></td>
                <td class="text-right"><?= $voucher['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12 xs-pl-0 xs-pr-0">
          <div class="btm-card-cart">
            <h3 class="mt-0 mb-15">Voucher Details</h3>
            <?php if ($modules) { ?>
             <?php /*?> <h2><?= $text_next; ?></h2>
              <p><?= $text_next_choice; ?></p><?php */?>
              <div class="panel-group boucher-col" id="accordion">
                <?php foreach ($modules as $module) { ?>
                <?= $module; ?>
                <?php break; } ?>
              </div>
              <p class="error coupon-error" style="display: none;"> Warning: Coupon is either invalid, expired or reached its usage limit!</p>
              <p class="success coupon-success" style="display: none;"> Success: Your coupon discount has been applied!</p>
              <?php } ?>
              <div class="view-more-coupon text-primary pull-right cursor" style="background-color: transparent;cursor: pointer;text-decoration: underline;">View More Coupons</div>
              <div class="coupon-popup">
              	<div class="coupon-item-col">
              		<div>
              			<h3 class="mt-0 fw-600">Apply Coupon</h3>
              			<span style="position: absolute;; cursor: pointer;right: 7px;top: 10px;" class="clspopup close-pincode-popup">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
				            <path d="M16.4673 14.9982L20.9422 10.5338C21.1381 10.3378 21.2482 10.072 21.2482 9.79492C21.2482 9.51779 21.1381 9.25201 20.9422 9.05605C20.7462 8.86009 20.4804 8.75 20.2033 8.75C19.9262 8.75 19.6604 8.86009 19.4644 9.05605L15 13.5309L10.5356 9.05605C10.3396 8.86009 10.0738 8.75 9.7967 8.75C9.51957 8.75 9.25379 8.86009 9.05783 9.05605C8.86187 9.25201 8.75178 9.51779 8.75178 9.79492C8.75178 10.072 8.86187 10.3378 9.05783 10.5338L13.5327 14.9982L9.05783 19.4627C8.96029 19.5594 8.88287 19.6745 8.83003 19.8013C8.7772 19.9281 8.75 20.0641 8.75 20.2015C8.75 20.3389 8.7772 20.4749 8.83003 20.6017C8.88287 20.7286 8.96029 20.8437 9.05783 20.9404C9.15457 21.0379 9.26967 21.1154 9.39648 21.1682C9.5233 21.221 9.65932 21.2482 9.7967 21.2482C9.93407 21.2482 10.0701 21.221 10.1969 21.1682C10.3237 21.1154 10.4388 21.0379 10.5356 20.9404L15 16.4656L19.4644 20.9404C19.5612 21.0379 19.6763 21.1154 19.8031 21.1682C19.9299 21.221 20.0659 21.2482 20.2033 21.2482C20.3407 21.2482 20.4767 21.221 20.6035 21.1682C20.7303 21.1154 20.8454 21.0379 20.9422 20.9404C21.0397 20.8437 21.1171 20.7286 21.17 20.6017C21.2228 20.4749 21.25 20.3389 21.25 20.2015C21.25 20.0641 21.2228 19.9281 21.17 19.8013C21.1171 19.6745 21.0397 19.5594 20.9422 19.4627L16.4673 14.9982Z" fill="#191A0B"></path></svg>               
				        </span>
              		</div>
	                <?php foreach($availableCoupons as $coupon) { ?>
	                <div class="coupon-item" style="">
	                	<div class="display-flex mb-15 justify-content-between align-items-center">
	                		<div>
	                			<h3 class="coupon-code mb-0 mt-0 fw-600"><?= $coupon['code']; ?></h3>
	                		</div>
	                		<div>
	                			<button style="background-color: transparent;" type="button" onclick="applyCouponFromList('<?= $coupon['code']; ?>')" class="home-secondary-btn cpn-apply">Apply</button>
	                		</div>
	                	</div>
	                	<div>
	                		<span class="coupon-description"><?= $coupon['frontend_description']; ?></span>
	                	</div>
	                </div>
	                <?php } ?>
                </div>
              </div>
          </div>  
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12 xs-pl-0 xs-pr-0">
          <div class="btm-card-cart cart-total">
            <h3 class="mt-0 mb-15">Order Summary</h3>
            <table class="table cart_table">
              <?php foreach ($totals as $total) { ?>
              <tr>
                <td><?= $total['title']; ?></td>
                <td class="text-right"><b><?= $total['text']; ?></b></td>
              </tr>
              <?php } ?>
            </table>
            <div class="buttons clearfix cart-btn-col">
              <!-- <div class="pull-left"><a href="<?= $continue; ?>" class="shopping_cart_button btn btn-default"><?= $button_shopping; ?></a></div> -->
              <div class="pull-left">
                <a href="<?= $continue; ?>" class="shopping_cart_button btn btn-default display-flex align-items-center">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M10 0.25C4.615 0.25 0.25 4.615 0.25 10C0.25 15.385 4.615 19.75 10 19.75C15.385 19.75 19.75 15.385 19.75 10C19.75 4.615 15.385 0.25 10 0.25ZM10.75 7C10.75 6.80109 10.671 6.61032 10.5303 6.46967C10.3897 6.32902 10.1989 6.25 10 6.25C9.80109 6.25 9.61032 6.32902 9.46967 6.46967C9.32902 6.61032 9.25 6.80109 9.25 7V9.25H7C6.80109 9.25 6.61032 9.32902 6.46967 9.46967C6.32902 9.61032 6.25 9.80109 6.25 10C6.25 10.1989 6.32902 10.3897 6.46967 10.5303C6.61032 10.671 6.80109 10.75 7 10.75H9.25V13C9.25 13.1989 9.32902 13.3897 9.46967 13.5303C9.61032 13.671 9.80109 13.75 10 13.75C10.1989 13.75 10.3897 13.671 10.5303 13.5303C10.671 13.3897 10.75 13.1989 10.75 13V10.75H13C13.1989 10.75 13.3897 10.671 13.5303 10.5303C13.671 10.3897 13.75 10.1989 13.75 10C13.75 9.80109 13.671 9.61032 13.5303 9.46967C13.3897 9.32902 13.1989 9.25 13 9.25H10.75V7Z" fill="#F65F73"/>
                </svg>
                <span>&nbsp; Add More Items</span>
                </a>
              </div>
              <div class="pull-right">
                <?php if($isLoggedIn){ ?>
                  <a href="/checkout" class="btn btn-primary green_btn_mob display-flex align-items-center"><svg width="22" height="20" viewBox="0 0 22 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M1.25 0.25C1.05109 0.25 0.860322 0.329018 0.71967 0.46967C0.579018 0.610322 0.5 0.801088 0.5 1C0.5 1.19891 0.579018 1.38968 0.71967 1.53033C0.860322 1.67098 1.05109 1.75 1.25 1.75H2.636C2.806 1.75 2.954 1.864 2.998 2.028L5.556 11.62C4.75257 11.8293 4.04126 12.2992 3.53349 12.9561C3.02572 13.613 2.75017 14.4197 2.75 15.25C2.75 15.664 3.086 16 3.5 16H19.25C19.4489 16 19.6397 15.921 19.7803 15.7803C19.921 15.6397 20 15.4489 20 15.25C20 15.0511 19.921 14.8603 19.7803 14.7197C19.6397 14.579 19.4489 14.5 19.25 14.5H4.378C4.53313 14.0612 4.82052 13.6813 5.20056 13.4127C5.5806 13.144 6.0346 12.9999 6.5 13H17.718C17.8585 13 17.9962 12.9605 18.1153 12.8861C18.2345 12.8117 18.3304 12.7053 18.392 12.579C19.5337 10.2361 20.5224 7.82171 21.352 5.351C21.3848 5.25326 21.397 5.14981 21.3881 5.04712C21.3791 4.94442 21.349 4.84468 21.2997 4.75413C21.2505 4.66357 21.1831 4.58415 21.1017 4.52081C21.0204 4.45747 20.9269 4.41158 20.827 4.386C15.5528 3.04115 10.122 2.40985 4.68 2.509L4.448 1.642C4.34156 1.24274 4.10621 0.889824 3.77853 0.638098C3.45086 0.386373 3.0492 0.249939 2.636 0.25H1.25ZM2.75 18.25C2.75 17.8522 2.90804 17.4706 3.18934 17.1893C3.47064 16.908 3.85218 16.75 4.25 16.75C4.64782 16.75 5.02936 16.908 5.31066 17.1893C5.59196 17.4706 5.75 17.8522 5.75 18.25C5.75 18.6478 5.59196 19.0294 5.31066 19.3107C5.02936 19.592 4.64782 19.75 4.25 19.75C3.85218 19.75 3.47064 19.592 3.18934 19.3107C2.90804 19.0294 2.75 18.6478 2.75 18.25ZM15.5 18.25C15.5 17.8522 15.658 17.4706 15.9393 17.1893C16.2206 16.908 16.6022 16.75 17 16.75C17.3978 16.75 17.7794 16.908 18.0607 17.1893C18.342 17.4706 18.5 17.8522 18.5 18.25C18.5 18.6478 18.342 19.0294 18.0607 19.3107C17.7794 19.592 17.3978 19.75 17 19.75C16.6022 19.75 16.2206 19.592 15.9393 19.3107C15.658 19.0294 15.5 18.6478 15.5 18.25Z" fill="white"/>
                  </svg>
                  <span>&nbsp; Place Order</span></a>
                <?php } else { ?>
                <a href="javascript:void(0)" class="btn btn-primary checkout_btn display-flex align-items-center">
                  <svg width="22" height="20" viewBox="0 0 22 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M1.25 0.25C1.05109 0.25 0.860322 0.329018 0.71967 0.46967C0.579018 0.610322 0.5 0.801088 0.5 1C0.5 1.19891 0.579018 1.38968 0.71967 1.53033C0.860322 1.67098 1.05109 1.75 1.25 1.75H2.636C2.806 1.75 2.954 1.864 2.998 2.028L5.556 11.62C4.75257 11.8293 4.04126 12.2992 3.53349 12.9561C3.02572 13.613 2.75017 14.4197 2.75 15.25C2.75 15.664 3.086 16 3.5 16H19.25C19.4489 16 19.6397 15.921 19.7803 15.7803C19.921 15.6397 20 15.4489 20 15.25C20 15.0511 19.921 14.8603 19.7803 14.7197C19.6397 14.579 19.4489 14.5 19.25 14.5H4.378C4.53313 14.0612 4.82052 13.6813 5.20056 13.4127C5.5806 13.144 6.0346 12.9999 6.5 13H17.718C17.8585 13 17.9962 12.9605 18.1153 12.8861C18.2345 12.8117 18.3304 12.7053 18.392 12.579C19.5337 10.2361 20.5224 7.82171 21.352 5.351C21.3848 5.25326 21.397 5.14981 21.3881 5.04712C21.3791 4.94442 21.349 4.84468 21.2997 4.75413C21.2505 4.66357 21.1831 4.58415 21.1017 4.52081C21.0204 4.45747 20.9269 4.41158 20.827 4.386C15.5528 3.04115 10.122 2.40985 4.68 2.509L4.448 1.642C4.34156 1.24274 4.10621 0.889824 3.77853 0.638098C3.45086 0.386373 3.0492 0.249939 2.636 0.25H1.25ZM2.75 18.25C2.75 17.8522 2.90804 17.4706 3.18934 17.1893C3.47064 16.908 3.85218 16.75 4.25 16.75C4.64782 16.75 5.02936 16.908 5.31066 17.1893C5.59196 17.4706 5.75 17.8522 5.75 18.25C5.75 18.6478 5.59196 19.0294 5.31066 19.3107C5.02936 19.592 4.64782 19.75 4.25 19.75C3.85218 19.75 3.47064 19.592 3.18934 19.3107C2.90804 19.0294 2.75 18.6478 2.75 18.25ZM15.5 18.25C15.5 17.8522 15.658 17.4706 15.9393 17.1893C16.2206 16.908 16.6022 16.75 17 16.75C17.3978 16.75 17.7794 16.908 18.0607 17.1893C18.342 17.4706 18.5 17.8522 18.5 18.25C18.5 18.6478 18.342 19.0294 18.0607 19.3107C17.7794 19.592 17.3978 19.75 17 19.75C16.6022 19.75 16.2206 19.592 15.9393 19.3107C15.658 19.0294 15.5 18.6478 15.5 18.25Z" fill="white"/>
                  </svg>
                  <span>&nbsp; Place Order</span>
                </a>
                <?php } ?>
              </div>
            </div>
          </div>  
        </div>
      </div>
      <?= $content_bottom; ?></div>
    <?= $column_right; ?></div>
</div>
<?= $footer; ?> 

<script type="text/javascript">
  $('.addcartitem').click(function(){
  	var updateQty = parseInt($(this).prev().val()) + 1;
  	var cartProId = $(this).attr("cartProId");
    $(".product_id_"+cartProId).val(updateQty);
    $('.submitcart').trigger('click');
  })

  $('.rmcartitem').click(function(){
    if($(this).next().val() > 1){
    	var updateQty = parseInt($(this).next().val()) - 1;
      	var cartProId = $(this).attr("cartProId");
    	$(".product_id_"+cartProId).val(updateQty);
      $('.submitcart').trigger('click');
    }
  });

  function applyCouponFromList(code){
    $('#input-coupon').val(code);
    $('#button-coupon').trigger('click');
  }
$(".view-more-coupon").click(function () {
  $('.coupon-popup').fadeIn();
  $('body').css('overflow-y','hidden');
});
$(".close-pincode-popup, .cpn-apply").click(function () {
  $('.coupon-popup').fadeOut();
  $('body').css('overflow-y','auto');
});
</script>