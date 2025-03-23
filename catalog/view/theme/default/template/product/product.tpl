<!DOCTYPE html>
<?= $header; ?>
<link href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet">
</link>
<script type="text/javascript">
  dataLayer.push({ ecommerce: null });  // Clear the previous ecommerce object.
  dataLayer.push({
    event: "view_item",
    ecommerce: {
    currency: "INR",
    value: <?php echo $pprice; ?>,
    items: [
    {
      item_id: "<?php echo $sku; ?>",
      item_name: "<?php echo $heading_title; ?>",
      discount:0,
      index: 0,
      item_brand: "Flavours Guru",
      item_category: "<?php echo $parent_cat['title'] ?>",
      item_list_id: "related_products",
      item_list_name: "Related products",
      price: <?php echo $pprice; ?>,
      quantity: 1
    }
    ]
  }
  });
</script>
<style type="text/css">
  .cityDateShipping .label{
    font-weight: normal;
    font-size: 16px;
    color: #404040;
  }
  select.form-control, textarea{
    border-radius: 5px !important;
  }
  .select_date_time:focus .bootstrap-datetimepicker-widget.dropdown-menu, .bootstrap-datetimepicker-widget.dropdown-menu{
    display: none !important;
  }
  .select_city_col {
    position: relative;
  }
  .select_city_col img{
    position: absolute;
    top: 18px;
    left: 15px;
  }
  .select_city_col select.select_city{
    text-indent:25px;
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
  }
  input.select_date_time:focus-visible,  .select_date_time:focus{
    outline: inherit !important;
    color: #404040 !important;
  }
  .productTabs.product_des_tab:after, .productTabs.product_des_tab:before{
    border: 0;
  }
  .product_des_tab .nav-tabs{
    display: inline-block;
    border-right: 0;
    float: initial;
    margin-bottom: 0 !important;
    border-top:1px solid #ccc;
  }
  .productTabs.product_des_tab{
    display: initial;
    width: 100%;
    float: initial;
  }
  .product_des_tab .nav-tabs > li{
    width: auto;
    margin-right: 15px;
  }
  .product_des_tab .nav-tabs > li > a{
    border:1px solid #ccc;
  }
  .product_des_tab .nav-tabs > li.active > a{
    border-left:1px solid #ccc;
    border-right:1px solid #ccc;
  }
  .productTabs .tab-content {
    padding-left: 0;
    font-size:14px;
    float: left;
  }
  #form-review .form-control{
    border-radius: 5px !important;
  }
  #form-review .form-group .control-label {
    font-size: 16px;
    margin-bottom: 5px;
  }
  #form-review .buttons.clearfix .pull-right{
    float: left!important;
  }
  #stars label.fill_rating{
    background: #D5D7DD;
    padding: 4px;
    width: 30px;
    height: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 5px;
  }
  label.fill_rating{
    cursor: pointer;
  }
  label.fill_rating i{
    color: #ccc;
    font-size: 20px;
  }
  label.fill_rating:hover i{
    /*color: #ffcc36;*/
  }
  label.fill_rating.star_selected i{
    color: #ffcc36 !important;
  }
  .fa-stack{
    color: #ffcc36;
  }
  .review_section {
    padding: 0;
    background: #ffffff;
    border-radius: 6px;
    width: 50%;
  }
  #form-review h2{
    margin-top: 10px;
  }
  .product_des_tab .nav-tabs > li{
    margin-top: -1px;
  }
  div#review {
      margin-bottom: 20px;
  }
  .more{
      width: fit-content;
      padding: 8px 15px;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      background-color: #36a8d4;
      color: #ffffff;
  }
  .eggless-img{
    margin-top: -45px;
  }
  .caret-color{
    caret-color: transparent;
  }
  .pincodenew{
    height: 55px !important;
    padding-left: 35px !important;
    width: 100%;
    border-radius: 5px;
    border: 1px solid #F65F73;
  }
  .pincodenew:focus{
    outline: none;
  }
  .citynametoshow{
    position: absolute;
    left: 110px;
    top: 16px;
    display: none;
  }
  .pincodelist{
    overflow-y: auto;
    max-height: 200px;
    position: absolute;
    top: 55px;
    left: 0;
    width: 100%;
    z-index: 1;
  }
  .pincodelist ul{
    padding-left: 0;
  }
  .pincodelist ul li{
    list-style: none;
    padding: 12px 15px;
    background-color: #ffffff;
    font-weight: 500;
    font-size: 16px;
    border: 1px solid #e6e6e6;
    border-bottom: 0;
    padding-left: 35px;
    position: relative;
      cursor: pointer;
      margin-bottom: 0;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
  }
  .pincodelist ul li:last-child{
    border-bottom: 1px solid #e6e6e6;
  }
  .pincodelist ul li:before{
    left: 13px;
      top: 9px;
      background: url(https://m-i1.fnp.com/assets/images/autocomplete-icons.png) no-repeat 0 -156px;
      content: "";
      position: absolute;
      width: 17px;
      height: 26px;
      overflow: hidden;
  }
  .pincodelist ul li:hover{
    background-color: #f5f5f5;
  }
  .pincodelist ul li:hover:before{
    background-position: -18px -156px;
  }
  .send-pincode-api ul{
    padding-left: 0;
    margin-bottom: 0;
  }
  .send-pincode-api ul li{
    padding: 0;
    list-style: none;
  }
  .send-pincode-api ul li a{
    display: inline-block;
    color: #23a1d1;
    font-size: 16px;
    padding: 5px 0px;
    width: 100%;
  }
  .send-pincode-api ul li a:hover{
    color: #23a1d1;
  }
  .send-pincode-api ul li:before{
    content: none;
  }
  .close-pincode-list{
    width: 20px;
    position: absolute;
    top: 18px;
    right: 15px;
    cursor: pointer;
    display: none;
  }
  .cityDateShipping .label{
    margin-top: 0;
  }
    input::-webkit-outer-spin-button,
  input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }
  .weight_cake_btn{
    /*padding: 10px 15px;
    display: inline-block;
    
    font-size: 14px;
    border: 1px solid;
    border-radius: 6px;
    font-weight: 500 !important;
    white-space: nowrap !important;*/
    margin-right: 10px;
  }
  .weight_cake_btn:hover{
    /*border-color: #f195b2;
    color: #f195b2;*/
  }
  .weight_cake_btn.selected_weight{
    background:#F65F73; 
    color: #ffffff;
  }
  .weight_radio {
    display: inline-flex;
    flex-wrap: wrap;
    margin-top: 0;
  }
  .cake_weight_row{
    /*flex-wrap: nowrap;*/
    overflow-x: auto;
    align-items: baseline;
  }
  .cake_weight_row::-webkit-scrollbar {
      height: 5px;
  }

  /* Track */
  .cake_weight_row::-webkit-scrollbar-track {
      background: #e2e2e2; 
  }

  /* Handle */
  .cake_weight_row::-webkit-scrollbar-thumb {
      /*background: rgba(128, 189, 255, 0.33);*/
      background: #999999;
      border-radius: 20px;
  }
  .product-shop div#product{
    margin-top: 5px;
  }
  .pro-detail-text.form-group{
    border-bottom: 0 !important;
  }
  .product_des_tab .tab-pane{
    font-size: 16px;
  }
  .product_des_tab .tab-pane ul{
    padding-left: 15px;
  }
  .product_des_tab .tab-pane li{
    margin-bottom: 10px;
  }

  /* Firefox */
  input[type=number] {
    -moz-appearance: textfield;
  }
  .soorypincode, .selectpincodeerr{
    text-transform: capitalize;
  }
  .item-add-input {
    width: 45px !important;
    float: initial !important;
    text-align: center;
    margin-right: 0;
    border:1px solid #E9EAEC;
    background:#ffffff;
    margin-right: 6px; 
  }
  .rmcartitem {
    font-size: 20px;
    background: #DEE0E2;
    margin-right: 0;
    border: 1px solid #E9EAEC;
    height: 34px;
    border-radius: 4px 0px 0px 4px;
    margin-right: 6px;
  }
  .addcartitem {
    font-size: 20px;
    border-radius: 0px 4px 4px 0px;
    background: none;
    border: 1px solid #E9EAEC;
    margin-right: 0;
    height: 34px;
    background: #DEE0E2;
  }
  .slick-list.draggable{
    /*padding-right: 5px !important;
    padding-left: 5px !important;
    overflow: hidden;*/
  }
  .product-thumb .price{
  margin-bottom: 5px;
  }
  .product-thumb .rating{
    padding-bottom: 0;
  }
  .review_count_main_col p{
    margin-bottom: 0;
  }
  .review-card {
      margin-left: 0;
      margin-top: 0;
      margin-bottom: 0;
  }
  .text-form{
  	border-radius: 5px !important;
  }
  .zoomWindow {
      object-fit: cover;
  }
  .zoomContainer {
  	transform: translateY(-157px) !important;
  }

  .review-slider .slick-slide{
    padding: 5px 0 30px 0;
  }
  .review_input{
    padding: 15px !important;
    border:1px solid #DEE0E2 !important;
    color: #0C1115 !important;
    font-size: 14px !important;
    width: 100%;
    border-radius: 10px;
  }
  .review_input:focus{
    outline: inherit;
  }
  #product .row{
  	display: flex;
  	flex-wrap: wrap;
  }
  .msg_count_total_col{
  	top: 0;
  	right: 5px;
  }
  @media screen and (min-width: 767px){
    .category_main_row_col .product-thumb {
        height: 385px;
    }
  }
  
  @media screen and (max-width: 767px){
    .eggless-img{
      /*margin-top: -15px;*/
    }
    .review_section{
      width: 100%;
    }
    .xs-pl-0{
      padding-left: 0;
    }
    .xs-pr-0{
      padding-right: 0;
    }
    .drop-arrow {
      padding-right: 10px;
      margin-top: -32px;
      z-index: 12;
      position: absolute;
      right: 0;
    }
    .linked-products{
      margin-top: 0;
      margin-bottom: 15px;
      padding-top: 5px;
    }
    .linked-products ul{
      display: flex;
      overflow-x: auto;
    }
    .linked-products ul li{
      display: initial;
      width: 85px;
    }
    .linked-products ul li a{
      display: inline-block;
      width: 85px;
    }
    div#cityDateShipping {
      background: #f5f5f5;
      padding: 15px;
      border-radius: 6px;
    }
    .show-date-time-col{
      background: #f5f5f5;
    }
    .product-shop div#product {
      padding-top: 0px;
      margin-top: 10px;
    }
    .col-sm-7.product-shop{
      padding-right: 0;
      padding-left: 0;
    }
    .eggless-img {
      margin-top: 65px;
  }
  .weight_cake_btn{
    margin-right: 5px;
  }
  .cart-footer {
    margin-top: 0;
  }
  .xs-pl-15{
    padding-left: 15px;
  } 
  .xs-pr-15{
    padding-right: 15px;
  }
  .item-add-input{
    min-width: initial !important;
    width: 30px !important;
  }
  .pricebox{
    padding-right: 10px !important;
    padding-left: 10px !important;
    font-size: 11px;
    font-weight: 500;
  }
  .addcartitem,.rmcartitem{
    width: 23px;
    text-align: center;
    padding: 0;
  }
  .news-letter-col{
    margin-top: 40px;
  }
}
</style>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
<div class="container top_positionn product-main-col">
   <input type="hidden" id="siturl" value='<?= HTTP_SERVER."image/loader.gif"; ?>'>
   <ul class="breadcrumb">
      <?php 
         $i=1; 
         $Totlbrdcum = count($breadcrumbs); 
         foreach($breadcrumbs as $breadcrumb) { 
          
          if($Totlbrdcum==$i){  
         ?> 
      <li><span class="" style="color: #35a8d4;"><?= $breadcrumb['text']; ?></span></li>
      <?php  } else { ?>
      <li><a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?></a></li>
      <?php } $i++; }   ?>
   </ul>
   <div class="row productPage">
      <?= $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <div id="content" class="<?= $class; ?>">
         <?php echo $content_top; ?>
         <div class="row">
            <?php if ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-5 product-img-box'; ?>
            <?php } ?>
            <div class="<?php echo $class; ?>">
               <!-- <div class="eggless"></div> -->
               <?php if ($thumb || $images) { ?>
               <ul class="thumbnails">
                  <?php if ($thumb) { ?>
                  <li style="position: relative;"><a class="thumbnail thumb-zoom" href="<?= $popup; ?>" title="<?= $heading_title; ?>"><img src="<?= $thumb; ?>" data-zoom-image="<?= $popup ?>" title="<?= $heading_title; ?>" alt="<?= $heading_title; ?>" /></a>
                    <div class="open_similar_products">View Similar</div>
                  </li>
                  <?php } ?>
                  <?php if ($images) { ?>
                  <?php foreach ($images as $image) { ?>
                  <li class="image-additional"><a class="thumbnail" href="<?= $image['popup']; ?>" title="<?= $heading_title; ?>"> <img src="<?= $image['thumb']; ?>" title="<?= $heading_title; ?>" alt="<?= $heading_title; ?>" /></a></li>
                  <?php } ?>
                  <?php } ?>
               </ul>
               <?php } ?>
            </div>
            <?php if ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-7 product-shop pull-right'; ?>
            <?php } ?>
            <div class="<?= $class; ?>">
               <div class="headingpriceboth">
                  <div class="display-flex flex-wrap">
                    <div class="pl-0 pr-0 width-70">
                      <h1><?= $heading_title; ?> </h1>
                      <div class="display-flex align-items-center mb-15">
                        <div class="review-card" style="margin: 0;margin-right: 10px;">
                          <span><?php echo $raverage; ?> </span><span>&nbsp; <i class="fa fa-star"></i></span>
                        </div>
                        <div>
                          <p class="mb-0" style="color: #22303D;font-size: 14px;">Rating & <?php echo $rcount; ?> Reviews</p>
                        </div>
                      </div>
                    </div>
                    <div class="pl-0 pr-0 width-30">
                      <div class="display-flex align-items-center mb-15 justify-content-end">
                        <div class="mr-10 egg-less-icon xs-mr-5">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <circle cx="12" cy="12" r="6" fill="#4BB543"/>
                            <rect x="0.5" y="0.5" width="23" height="23" rx="1.5" stroke="#4BB543" stroke-linejoin="round"/>
                          </svg>
                        </div>
                        <div>
                          <p class="mb-0 xs-fs-10" style="color: #22303D;font-size: 14px;" >100% Eggless</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <?php if ($price) { ?>
                  <ul class="list-unstyled">
                     <?php if (!$special) { ?>
                     <li class="product-page-price">
                      <div class="display-flex align-items-center">
                          <h2 class="pro_price m-r-10"><?= $price; ?></h2>
                          <!-- <p style="color: #222222;font-size: 12px;margin-bottom: 0;">Inclusive of all taxes</p> -->
                      </div>
                     </li>
                     <?php } else { ?>
                     <li>
                      <span style="text-decoration: line-through;" class="pro_price_old"><?= $price; ?></span>
                      <span class="text-primary font-weight-600 pro_price_old_percent" style="display: none;">14% off</span>
                      </li>
                     <li>
                      <div class="display-flex align-items-center">
                        <h2 class="pro_price m-r-10"><?= $special; ?></h2>
                          <!-- <p style="color: #222222;font-size: 12px;">Inclusive of all taxes</p> -->
                      </div>
                     </li>
                     <?php } ?>
                     <?php if ($tax) { ?>
                     <li><?= $text_tax; ?> <?= $tax; ?></li>
                     <?php } ?>
                     <?php if ($points) { ?>
                     <li><?= $text_points; ?> <?= $points; ?></li>
                     <?php } ?>
                     <?php if ($discounts) { ?>
                     <li>
                        <hr>
                     </li>
                     <?php foreach ($discounts as $discount) { ?>
                     <li><?= $discount['quantity']; ?><?= $text_discount; ?><?= $discount['price']; ?></li>
                     <?php } ?>
                     <?php } ?>
                  </ul>
                  <?php } ?>
               </div>
               <div class="">
                <ul class="list-unstyled codeproduct">
                  <li style="margin-bottom: 5px;" class="modelNo sku">SKU : <?= $sku; ?></li>
                  <span style="z-index: 10; position: relative; cursor: pointer; color: #015EF7; font-weight: 500;font-size: 14px;" onclick="scrollToDesc();">View Product Details &nbsp;<i class="fa fa-angle-down"></i></span>
                  
                  <!--<li><?= $text_stock; ?> <?= $stock; ?></li>-->
                </ul>
               </div>
               
               <div class="mobile-pick-an-upgrade"></div>
               <span id="errorMsg" style="color: red;"></span>
               <!--<div class="pull-right eggless-img"></div>-->
               <style type="text/css">
                @media screen and (max-width: 767px){
                  .pro_list_box{
                      height: initial !important;
                    }
                  }

                  .pincode-feild{
                  width: 47%;
                  margin-top: 20px;
                  height: 40px !important;
                  margin-bottom: 5px;
                  }
                  .pincode-btn{
                  color: #ffffff;
                  }
                  .pincode-error{
                  color: #ff0000;
                  display: none;
                  }
                  @media screen and (max-width: 767px){
                  .pincode-feild{
                  width: 100%;
                  margin-top: 20px;
                  height: 40px !important;
                  margin-bottom: 5px;
                  }
                  }

                  .bg_img{
                     width: 100%;
                     height: 100%;
                     position: fixed;
                     z-index: 1212;
                     background-color: rgba(0,0,0,0.8);
                     bottom: 0;
                     left: 0;
                     display: none;
                  }

                  .select-info-popup{
                     width: 500px;
                     height: 480px;
                     position: fixed;
                     background-color: #fff;
                     border-radius: 6px;
                     top: 50%;
                     left: 50%;
                     z-index: 1213;
                     transform: translate(-50%,-50%);
                     overflow-x: hidden;
                     display: none;
                  }

                  .section-title{
                     width: 100%;
                     text-align: center;
                     font-size: 18px;
                     padding-top: 15px;
                     padding-bottom: 15px;
                     border-bottom: 1px solid #cdcdcd;
                  }

                  .product-reveal-close{
                     font-weight: 400;
                     font-size: 40px;
                     color: #aaa;
                     cursor: pointer;
                     position: absolute;
                     right: 20px;
                     top: 15px;
                     text-decoration: none;
                     outline: inherit;
                  }

                  .product-reveal-close:hover{
                     text-decoration: none;
                     outline: inherit;
                  }

                  .shipping-section ul li {
                      display: table;
                      height: 50px;
                      width: 100%;
                      margin-bottom: 20px;
                      border-radius: 5px;
                      padding: 0 15px;
                  }

                  #modaldatetimepicker .scroll-pane>ul {
                      height: 100%;
                      margin: 0;
                      width: 100%;
                  }

                  .shipping-section{
                     overflow-y: auto;
                  }

                  .shipping-section .scroll-pane{
                     height: 320px;
                     padding-top: 35px;
                  }

                  .shipping-section input[type="radio"]:checked+label {
                      color: #f195b2;
                  }

                  .selectedshipping {
                      border: 1px solid #f195b2 !important;
                  }

                  .shipping-section input[type="radio"]:checked+label span.rdo-span {
                      background-color: #F65F73;
                      color: #7cc3e1 !important;
                      box-shadow: 0 0 0 2px #F65F73;
                  }

                  .shipping-section input[type="radio"] {
                      display: none;
                  }

                  .shipping-section ul li a {
                      text-align: left !important;
                      display: table-cell;
                      vertical-align: middle;
                      padding: 0 !important;
                      width: 100%;
                  }

                  .shipping-section ul li .timeslotdetails>label {
                      width: 82.9%;
                      border-radius: 4px 0 0 4px;
                      margin-right: 0;
                      height: 50px;
                      border: 1px solid #CCC;
                      border-right: 0 solid #fff;
                  }

                  .shipping-section input[type="radio"]+label span.rdo-span {
                      border: 2px solid #fff;
                      box-shadow: 0 0 0 2px #555;
                      display: inline-block;
                      width: 11px;
                      height: 11px;
                      margin: 0 15px 0 0;
                      vertical-align: inherit;
                      cursor: pointer;
                      -moz-border-radius: 50%;
                      border-radius: 50%;
                  }

                  .shipping-section .timesloter {
                      text-align: center;
                      color: #474747;
                      font-size: 14px;
                      padding-top: 2px;
                  }

                  .shipping-section .input-group-button.button{
                      float: right;
                      margin: 0 5px 0 0;
                      border-radius: 0 3px 3px 0;
                      height: 50px;
                      width: 15%;
                      color: #fff;
                      background-color: #F65F73;
                      display: inline-block;
                      text-align: center;
                      line-height: 50px;
                  }

                  .shipping-section .webprice .WebRupee {
                      margin: 0;
                      font-size: .9em;
                      font-weight: 900;
                  }

                  .shipping-section .input-group-button .delcost.webprice {
                      color: #fff;
                  }

                  .scroll-pane ul{
                     padding-left: 0;
                  }

                  .timeslotdetails label {
                      padding: 12px 0 13px 13px;
                      cursor: pointer;
                  }

                  .delcost {
                   text-decoration: none;
                   font-size: 14px;
                   margin-top: 10px;
                   font-weight: 600;
                   text-align: center;
               }

               .timeslotdetails{
                  outline: inherit;
                  text-decoration: none;
               }

               .timeslotdetails:focus{
                  outline: inherit;
               }

               .timeslotdetails:hover{
                  outline: inherit;
                  display: inline-block;
                  text-decoration: none;
               }

               .backtocalendar {
                   text-align: left;
                   margin-left: 35px;
                   position: absolute;
                   top: 13px;
                   font-size: 2em;
                   width: 20px;
                   cursor: pointer;
                   display: inline-block;
               }

               .backtocalendar .back-arrow {
                   font-size: 20px;
                   font-weight: 400 !important;
                   color: #f195b2;
               }

               .order-calendar-date{
                width: 100%;
                height: 100%;
               }

               .order-calendar-date .ui-datepicker-inline{
                  width: 100%;
                  height: 100%;
               }

               .ui-datepicker th {
                  font-size: 20px;
                  font-weight: normal;
               }

               .order-calendar-date .ui-state-default, .ui-widget-content .ui-state-default{
                  border: 0;
                  background: none;
                  height: 45px;
                  width: 45px;
                  margin: 0 auto;
                  color: #222;
                  font-size: 20px;
                  font-weight: 300 !important;
                  -webkit-border-radius: 50%;
                  -moz-border-radius: 50%;
                  border-radius: 50%;
                  text-align: center;
                  line-height: 45px;
                  padding: 0 !important;
              }

              .order-calendar-date .ui-state-hover, .ui-widget-content .ui-state-hover{
                background-color: #F65F73;
                color: #ffffff;
              }

              .order-calendar-date .ui-datepicker-header{
                  background: no-repeat;
                  border: 0;
                  padding-top: 15px;
                  padding-bottom: 15px;
                  width: 200px;
                  margin: auto;
              }

              .order-calendar-date .ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-next {
                  position: absolute;
                  top: 20px;
                  width: 1.8em;
                  height: 1.8em;
              }

              .order-calendar-date .ui-datepicker-title{
                font-size: 18px;
                font-weight: 300;
              }

              .calendar-section {
                  background: #fff;
                  position: absolute;
                  width: 100%;
                  border-radius: 6px;
              }

              #shippingmethoddiv{
                position: absolute;
                width: 100%;
                background-color: #ffffff;
                border-radius: 6px;
                left: 100%;
              }

              #timimg-section{
                position: absolute;
                width: 100%;
                background-color: #ffffff;
                border-radius: 6px;
                left: 100%
              }

              .order-calendar-date .ui-datepicker-year{
                display: none;
              }

              .custom-scroll::-webkit-scrollbar {
                width: 5px;
              }

              /* Track */
              .custom-scroll::-webkit-scrollbar-track {
                background: #f1f1f1; 
              }
               
              /* Handle */
              .custom-scroll::-webkit-scrollbar-thumb {
                background: #888;
                border-radius: 20px;
              }

              /* Handle on hover */
              .custom-scroll::-webkit-scrollbar-thumb:hover {
                background: #555; 
              }

              #citynew:focus{
                outline: inherit;
              }

              #delDate:focus{
                outline: inherit;
              }

              .order-calendar-date .ui-widget-content{
                border: 0;
              }

              .timeslottable {
                  margin: 15px auto;
                  border: 1px solid #CCC;
                  border-radius: 5px;
                  width: 50% !important;
              }

              .time-slot-lable{
                width: 100% !important;
                border: 0 !important;
                height: auto !important;
                margin-bottom: 0;
              }
              .js-add-button {
                text-align: right;
                position: relative;
                right: 5px;
                bottom: 0px;
                top: auto;
                left: auto;
                width: auto;
                height: auto;
                background: transparent;
                line-height: 100%;
                float: right;
                padding: 0;
                margin: 0;
            }
            .js-add-button input {
                float: left;
                margin: -2px 4px 0 3px;
                vertical-align: middle;
                width: 18px;
                height: 18px;
                /*-moz-appearance: none;
                -webkit-appearance: none;
                appearance: none;*/
                background: #fff;
                display: inline-block;
                border: 1px solid #ccc;
                /*visibility: hidden;
                display: none;*/
            }
            
            .remove-addon:after, .toggle-remove-addon:after {
              border-radius: 50px;
              content: "";
              padding: 17px 14px 11px 15px;
              font-size: 17px;
              line-height: 25px;
              position: absolute;
              left: -20px;
              color: #aaa;
              top: 3px;
              display: inline-block;
              border: 1px solid #ccc;
              background: url(https://img.floweraura.com/sites/all/themes/facd7/images/new_images/close-icon.png);
              background-size: 19px;
              background-repeat: no-repeat;
              background-position: 5px 4px;
          }
          .remove-addon, .toggle-remove-addon {
                color: #000 !important;
                display: inline-block;
                font-size: 0 !important;
                cursor: pointer;
                border: none !important;
            }

            .checkbox.product-addons{
              display: none;
            }

            .remove-addon{
              display: none;
              background:none !important;
            }
          .product-addon-add:hover {
              /*background-color: #49a066;
              border: none;
              color: #ffffff;*/
          }
          .show-date-time-col{
            border: 1px solid #F65F73;
            height: 55px;
            padding: 5px 0 0 40px !important;
            border-radius: 5px;
          }
          .deliverydateofmonth{
            font-size: 36px;
            line-height: 34px;
            color: #222;
            font-weight: 300;
            float: left;
            margin-right: 2px;
          }
          .deliverymonth{
            margin-right: 2px;
          }
          .WebRupee_product{
            display: inline-block;
            color: #e53333;
            font-weight: 600;
            margin-left: 5px;
          }
          .drop-arrow{
            float: right;
            padding-right: 15px;
            margin-top: -36px;
          }
          .drop-arrow i{
            font-size: 18px;
            color: #F65F73;
          }
          .select_city, .select_date_time{
            height: 55px !important;
          }
          .time_slot_col{
            position: relative;
          }
          .time_slot_msg{
            position: fixed;
            bottom: 35px;
            padding-left: 15px;
            padding-right: 15px;
            left: 50%;
            width: 100%;
            left: 100%;
            /*transform: translate(-50%, 0);*/
          }
          .drop-arrow i{
            cursor: pointer;
          }
          .shippingmethod{
            color: #e53333;
            font-weight: 600;
          }
          .deliverymonth_date{
            font-size: 36px;
            float: left;
            margin-right: 5px;
          }
          .display-flex{
            display: flex;
          }
          .align-items-center{
            align-items: center;
          }
          .show-date-time-col{
            cursor: pointer;
          }
          .occassions { width: 100%; position: relative; z-index: 9; background: #fff; clear: both; }
.occassions ul { overflow-x: scroll; overflow-y: hidden; white-space: nowrap; font-size: 14px; padding: 0 12px; }
.occassions li { margin: 0 12px 0 0; vertical-align: top; padding: 10px 0; text-align: center; }
          @media screen and (max-width: 767px){
            .select-info-popup {
                width: 100%;
                height: 100%;
                border-radius: initial;
                top: 0;
                transform: translate(-50%,0%);
            }
            .time_slot_msg{
              bottom: 20px;
            }
            .pro_list_box {
                height: initial !important;
                padding-left: 10px;
                padding-right: 10px;
                margin-bottom: 50px;
            }
            .shipping-section .scroll-pane{
              height: auto;
            }
            #timimg-section{
              height: calc(100vh - 150px);
            }
          }

               </style>
               <p class="text-error" style="color:red;"> </p>
               <div class="bg_img"></div>
               <div class="select-info-popup custom-scroll">
                  <div class="calendar-section hideppnew">
                    <a class="product-reveal-close">×</a>
                    <div class="section-title">Select Delivery Date</div>
                    <div class="order-calendar-date" autocomplete="off" id="datetimeshipping"></div>
                  </div>
                  
                  <div class="shipping-section hideppnew" id="shippingmethoddiv">
                    <a class="product-reveal-close">×</a>
                    <div class="section-title">Select Shipping Option</div>
                     <div class="scroll-pane custom-scroll">
                        <ul class="newshippingoptionhtml">
                           
                        </ul>
                     </div>
                     <a class="backtocalendar backtocalendar-1">
                      <img style="width: 25px;" src="/image/back_icon1.jpg" class="material-icons back-arrow" alt="" /><!-- <i class="material-icons back-arrow fa fa-arrow-left"></i> --></a>
                  </div>

                  <div class="timing-section hideppnew shipping-section" id="timimg-section">
                    <a class="product-reveal-close">×</a>
                    <div class="section-title">Select Time Option</div>
                    <div class="time_slot_col">
                      <div class="scroll-pane custom-scroll">
                        <ul class="newshippingslothtml">
                           
                        </ul>
                     </div>
                     <div id="time_slot_msg" class="text-center time_slot_msg">
                       <p style="color: #ff0000"> *Order will be delivered anytime within the selected time slot.</p>
                     </div> 
                    </div>
                     <a class="backtocalendar backtocalendar-2">
                       <img style="width: 25px;" src="/image/back_icon1.jpg" class="material-icons back-arrow" alt="" />
                    </a>
                  </div>
               </div>

               <input type="hidden" id="validateValue"  value="" class=""> 
               <?php if($product_addon_shipping_type == 0){  $class = '';?>
               <div class="col-sm-12 cityDateShipping" id="cityDateShipping">
                  <!-- <div class="col-md-12 col-sm-12 col-xs-12 xs-pl-0 xs-pr-0"><span id="errorMsgNew" style="color: red;font-size: 14px;display: none">Enter correct pincode for smooth delivery</span></div> -->
                  <div class="row">
                  <div class="col-sm-6">
                     <!-- <div class="col-sm-12 label">Delivery To <span class="astrik">*</span></div> -->
                     <div class="col-sm-12 select_city_col">
                      <input pattern='[0–9]*' inputmode='decimal' placeholder="Enter pin code to check delivery " type="number" name="" maxlength="6" class="pincodenew animation-border for-animation">
                      <span class="citynametoshow"></span>
                      <!-- <div class="send-pincode-api">
                      <ul><li><a target="_blank" href="https://www.indiapost.gov.in/VAS/Pages/findpincode.aspx">Don't know Pincode ?</a></li></ul>
                     </div> -->
                      <div class="close-pincode-list">
                        <svg class="" focusable="false" viewBox="0 0 24 24" aria-hidden="true"><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z"></path></svg>
                      </div>
                      <div style="color: red; display: none;" class="soorypincode">This product can not be delivered at the desired location.</div>
                      <div style="color: green; display: none;" class="availablepincode">Delivery is available for this pincode.</div>
                      <div class="pincodelist custom-scroll">
                      </div>
                      <!-- <img class="location-icon" src="catalog/view/theme/default/image/location.svg" alt="Select City"> -->
                      <div class="location-icon">
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M9.61667 18.6258L9.675 18.6592L9.69833 18.6725C9.79086 18.7225 9.89439 18.7487 9.99958 18.7487C10.1048 18.7487 10.2083 18.7225 10.3008 18.6725L10.3242 18.66L10.3833 18.6258C10.7093 18.4326 11.0273 18.2263 11.3367 18.0075C12.1376 17.4421 12.8859 16.8056 13.5725 16.1058C15.1925 14.4475 16.875 11.9558 16.875 8.75C16.875 6.92664 16.1507 5.17795 14.8614 3.88864C13.572 2.59933 11.8234 1.875 10 1.875C8.17664 1.875 6.42795 2.59933 5.13864 3.88864C3.84933 5.17795 3.125 6.92664 3.125 8.75C3.125 11.955 4.80833 14.4475 6.4275 16.1058C7.11387 16.8056 7.86189 17.442 8.6625 18.0075C8.97214 18.2263 9.29045 18.4326 9.61667 18.6258ZM10 11.25C10.663 11.25 11.2989 10.9866 11.7678 10.5178C12.2366 10.0489 12.5 9.41304 12.5 8.75C12.5 8.08696 12.2366 7.45107 11.7678 6.98223C11.2989 6.51339 10.663 6.25 10 6.25C9.33696 6.25 8.70107 6.51339 8.23223 6.98223C7.76339 7.45107 7.5 8.08696 7.5 8.75C7.5 9.41304 7.76339 10.0489 8.23223 10.5178C8.70107 10.9866 9.33696 11.25 10 11.25Z" fill="#F65F73"/>
                      </svg>
                      </div>
                        
                        <input type="hidden" name="cityN" id="cityN" />
                        <input type="hidden" name="data-city-id" id="data-city-id"/ >
                        <input type="hidden" id="timeslotData" value='' />
                        <input type="hidden" id="specifictime" name="specifictime" value='' />
                        <input type="hidden" id="specificexpirytime" name="specificexpirytime" value='' />
                        <input type="hidden" class="delivery_date" name="delivery_date">
                        <input type="hidden" class="shippingtype" name="shippingtype">
                        <input type="hidden" class="pincodeN" name="pincodeN">
                     </div>
                     <div style="color:#ff0000; display: none;" class="selectpincodeerr">Please enter pin code</div>
                  </div>
                  <div class="col-sm-6 show-date-time-toselected">
                     <!-- <div class="col-sm-12 label">Deliver On <span class="astrik">*</span></div> -->
                      <div class="col-sm-12 calender">
                      <input type="text" class="for-animation select_date_time date"  readonly='true' autocomplete="off" id="newdelDate" placeholder="Select Date and Time">
                        <div class="location-icon">
                          <img src="catalog/view/theme/default/image/calender.svg" alt="">
                        </div>
                      </div>
                  </div>
                  <div class="col-sm-6 show-date-time-selected" style="display: none;">
                    <!-- <div class="col-sm-12 label" style="opacity: 0;">Selected time and date</div> -->
                     <div class="show-date-time-col col-sm-12 display-flex align-items-center">
                      <div class="location-icon">
                        <img src="catalog/view/theme/default/image/calender.svg" alt="">
                      </div>
                      <!-- <span class="deliverymonth"></span> -->
                      <div>
                        <span class="deliverymonth_date">20</span>  
                      </div>
                      <div>
                        <div>
                          <span class="deliverymonth_month">OCT</span>  
                          <span class="shippingmethod"></span>
                        </div>
                        <div>
                          <span class="timeslot deliverymonth_time">07:00Hrs - 09:00Hrs</span>
                        </div>
                      </div>
                    </div>
                    <span class="drop-arrow"><i class="fa fa-pencil"></i></span>
                  </div>
                </div>
               </div>
               
               <?php } ?>
               
               <?php /*  if(count($linkedProducts)){ ?>
               <div class='linked-products'>
                  <h2>Choose Weight</h2>
                  <ul>
                     <?php foreach($linkedProducts as $lp){ ?>
                     <li class="<?= $lp['product_id']==$product_id?'current':'' ?>">
                        <a href="<?= $lp['href'] ?>">
                           <div class="image"><img src="<?= $lp['image']?>" /></div>
                           <div class="title"><?= $lp['name']?></div>
                           <div class="price"><?= $lp['price']?></div>
                        </a>
                     </li>
                     <?php } ?>
                  </ul>
               </div>
               <?php } */ ?>
               <p style="color: red; display: block;" id="personallised-pro"></p>
               <div id="product" class="pinDiv <?= $class;?>">
                  <?php if ($options) { ?>
                  <!--    <hr> -->
                  <?php /* ?>
                  <h3><?= $text_option; ?></h3>
                  <?php */ ?>
                  <div class="row">
                  <?php 
                     foreach ($options as $option) { ?>
                  <?php if ($option['type'] == 'select') { ?>
                  <div class="xs-pr-0 xs-pl-0 col-md-6 col-sm-12 col-xs-12 form-group<?= ($option['required'] ? ' required' : ''); ?>">
                     <!-- <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label> -->
                     <div class="position-relative">
                       <select name="option[<?= $option['product_option_id']; ?>]" id="input-option<?= $option['product_option_id']; ?>" class="form-control product_input">
                          <option value=""><?php // echo $text_select; ?>Select Flavour </option>
                          <?php foreach ($option['product_option_value'] as $option_value) { ?>
                          <option value="<?= $option_value['product_option_value_id']; ?>"><?= $option_value['name']; ?>
                             <?php if ($option_value['price']) { ?>
                             (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
                             <?php } ?>
                          </option>
                          <?php } ?>
                       </select>
                      <div class="location-icon" style="top: 15px;">
                          <img src="catalog/view/theme/default/image/flavour.svg" alt="">
                        </div>
                  </div>
                     <span style="font-size: 12px;color: #22303D;">Will not affect Cake design</span>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'radio') { ?>
                  <div class="xs-pr-0 xs-pl-0 col-md-12 col-sm-12 col-xs-12 form-group<?= ($option['required'] ? ' required' : ''); ?>">
                     <!-- <label class="control-label"><?= $option['name']; ?></label> -->
                     <p style="font-size: 14px;font-weight: 600;margin-bottom: 0">Choose Weight</p>
                     <div class="display-flex flex-nowrap cake_weight_row" id="input-option<?= $option['product_option_id']; ?>">
                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                        <div class="radio weight_radio">
                           <label for="cake_<?= $option_value['product_option_value_id']; ?>" class="weight_cake_btn home-secondary-btn" price="<?= $option_value['simpleprice']; ?>" opttext="<?= $option_value['name']; ?>">
                           <input style="display: none;" id="cake_<?= $option_value['product_option_value_id']; ?>" type="radio" name="option[<?= $option['product_option_id']; ?>]" class="weightradio" value="<?= $option_value['product_option_value_id']; ?>" />
                           <?php if ($option_value['image']) { ?>
                           <img src="<?= $option_value['image']; ?>" alt="<?= $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                           <?php } ?>                    
                           <?= $option_value['name']; ?>
                           
                           </label>
                        </div>
                        <?php } ?>
                     </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'checkbox') { ?>
                  <div class="xs-pr-0 xs-pl-0 col-md-6 col-sm-12 col-xs-12 form-group<?= ($option['required'] ? ' required' : ''); ?>">
                     <label class="control-label"><?= $option['name']; ?></label>
                     <div id="input-option<?= $option['product_option_id']; ?>">
                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                        <div class="checkbox">
                           <label>
                           <input type="checkbox" name="option[<?= $option['product_option_id']; ?>][]" value="<?= $option_value['product_option_value_id']; ?>" />
                           <?php if ($option_value['image']) { ?>
                           <img src="<?= $option_value['image']; ?>" alt="<?= $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                           <?php } ?>
                           <?= $option_value['name']; ?>
                           <?php if ($option_value['price']) { ?>
                           (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
                           <?php } ?>
                           </label>
                        </div>
                        <?php } ?>
                     </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'text') { ?>
                  <div class="xs-pr-0 xs-pl-0 col-md-6 col-sm-12 col-xs-12 form-group<?= ($option['required'] ? ' required' : ''); ?> <?= isset($eggProducts)?'cake-msg':'' ?>">
                     <label class="control-label" for="input-option<?= $option['product_option_id']; ?>">Please Enter Message<?php// echo $option['name']; ?></label>
                     <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="" placeholder="<?= $option['value']; ?>" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'number') { ?>
                  <div class="xs-pr-0 xs-pl-0 col-md-6 col-sm-12 col-xs-12 form-group">
                     <?php /* ?><label class="control-label" for="input-option<?= $option['product_option_id']; ?>">Please Enter Age</label> <?php */ ?>
                     <div class="position-relative">
                     	<input type="number" name="option[<?= $option['product_option_id']; ?>]" value="" placeholder="Please Enter Age" id="input-option<?= $option['product_option_id']; ?>" class="form-control text-form" />
	                    <div class="location-icon" style="top: 15px;">
							<svg style="width: 16px;" width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
			                  <path d="M8 8C7.20887 8 6.43552 7.76541 5.77772 7.32588C5.11992 6.88635 4.60723 6.26164 4.30448 5.53074C4.00173 4.79983 3.92252 3.99556 4.07686 3.21964C4.2312 2.44372 4.61216 1.73098 5.17157 1.17157C5.73098 0.612165 6.44372 0.231202 7.21964 0.0768607C7.99556 -0.0774802 8.79983 0.00173314 9.53073 0.304484C10.2616 0.607234 10.8864 1.11992 11.3259 1.77772C11.7654 2.43552 12 3.20888 12 4C12 5.06087 11.5786 6.07828 10.8284 6.82843C10.0783 7.57857 9.06087 8 8 8ZM8 10C10.6703 10 16 11.3398 16 14V16H0V14C0 11.3398 5.32971 10 8 10Z" fill="#F65F73"></path>
			                </svg>
						</div>
                     </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'textarea') { ?>
                  <div class="xs-pr-0 xs-pl-0 form-group<?= ($option['required'] ? ' required' : ''); ?> col-md-6 col-sm-12 col-xs-12">
                     <!-- <label class="control-label" for="input-option<?= $option['product_option_id']; ?>">Cake Message</label> -->
                     <div class="position-relative">
                      <div class="msg_count_total_col">
                        <span><span class="show_lnh_text">0</span>/30</span>
                      </div>
                       <input type="text" maxlength="30" name="option[<?= $option['product_option_id']; ?>]" placeholder="Message On Cake" id="input-option<?= $option['product_option_id']; ?>" value="<?= $option['value']; ?>" class="form-control text-form cake_msg_valid">
                       <!-- <span style="font-size: 12px;color: #22303D">*Text mentioned here will be written on cake at the suitable spot.</span> -->
                       <div class="location-icon" style="top: 15px;">
                        <img src="catalog/view/theme/default/image/message.svg" alt="">
                       </div>
                   </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'file') { ?>
                  <div class="xs-pr-0 xs-pl-0 col-md-6 col-sm-12 col-xs-12 form-group<?= ($option['required'] ? ' required' : ''); ?> col-md-6 col-sm-12 col-xs-12">
                     <?php /* ?><label class="control-label"><?= $option['name']; ?></label><?php */ ?>
                     <button type="button" id="button-upload<?= $option['product_option_id']; ?>" data-loading-text="<?= $text_loading; ?>" class="btn btn-default btn-block img_file_upload"><i class="fa fa-upload"></i> <?= $button_upload; ?></button>
                     <input type="hidden" name="option[<?= $option['product_option_id']; ?>]" value="" id="input-option<?= $option['product_option_id']; ?>" />
                     <div id="image-to-place" ></div>
                     <p class="text-success"> </p>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'date') { ?>
                  <div class="xs-pr-0 xs-pl-0 col-md-6 col-sm-12 col-xs-12 form-group<?= ($option['required'] ? ' required' : ''); ?>">
                     <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
                     <div class="input-group date">
                        <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                        </span>
                     </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'datetime') { ?>
                  <div class="xs-pr-0 xs-pl-0 col-md-6 col-sm-12 col-xs-12 form-group<?= ($option['required'] ? ' required' : ''); ?>">
                     <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
                     <div class="input-group datetime">
                        <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                        </span>
                     </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'time') { ?>
                  <div class="xs-pr-0 xs-pl-0 col-md-6 col-sm-12 col-xs-12 form-group<?= ($option['required'] ? ' required' : ''); ?>">
                     <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
                     <div class="input-group time">
                        <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="HH:mm" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
                        <span class="input-group-btn">
                        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                        </span>
                     </div>
                  </div>
                  <?php } ?>
                  <?php } ?>
                 </div>
                  <?php } ?>
                  <?php if ($recurrings) { ?>
                  <hr>
                  <h3><?= $text_payment_recurring; ?></h3>
                  <div class="form-group required">
                     <select name="recurring_id" class="form-control">
                        <option value=""><?= $text_select; ?></option>
                        <?php foreach ($recurrings as $recurring) { ?>
                        <option value="<?= $recurring['recurring_id']; ?>"><?= $recurring['name']; ?></option>
                        <?php } ?>
                     </select>
                     <div class="help-block" id="recurring-description"></div>
                  </div>
                  <?php } ?>
                  <div class="form-group pro-detail-text">
                     <!-- <label class="control-label" for="input-quantity"><?php//echo $entry_qty; ?></label> -->
                     <input type="hidden" name="quantity" value="<?= $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                     <input type="hidden" name="product_id" value="<?= $product_id; ?>" />
                     <input type="hidden" name="shipping_price" value="" id="shipping_price" />
                     <input type="hidden" name="addon" value="0" id="addon" />
                     <div class="product-ad-to-btn">
                        <button type="button" id="button-cart" data-loading-text="<?= $text_loading; ?>" class="btn btn-primary btn_cart btn-lg btn-block btn-orange home-primary-btn"> <img src="catalog/view/theme/default/image/cart-icon.svg" class="mr-5" alt=""><span>Add to cart</span></button>
                       <?php if($quantity > 0) { ?>
                       <button style="background: #4BB543 !important;" type="button" id="button-cart-2" data-loading-text="<?= $text_loading; ?>" class="btn btn-primary btn_cart btn-lg btn-block btn-orange  home-primary-btn"><img src="catalog/view/theme/default/image/order-now.svg" class="mr-5" alt=""> <span>Order Now</span></button>
                       <!-- <button type="button" data-toggle="tooltip" title="<?= $button_wishlist; ?>" onclick="wishlist.add('<?= $product_id; ?>');"><i class="fa fa-heart"></i></button> -->
                     </div>
                     <?php } else { ?>
                     <button type="button" id="button-cart-2" data-loading-text="<?= $text_loading; ?>" class="btn btn-primary  btn-lg btn-block btn-orange">Out of Stock</button>
                     <?php } ?>
                     <!-- <div class="btn-group col-sm-6 pull-right">
                     </div> -->
                  </div>
                  <p style="color: red; display: block;" id="personallised-pro1"></p>
                  <div class="shortDescription" style="display: none;">
                     <?= $description; ?>
                     <!-- <form id="check-pincode-form" name="check-pincode" class="check-pincode-form" method="post">
                        <input style="padding-left:10px; font-size: 12px;" id="pincode-feild" class="pincode-feild" type="text" name="pincode1" placeholder="Enter Delivery Pincode" onkeyup="checkButton()" />
                        <p class="pincode-error">not delivered this area </p>
                        <input style="margin-left:2px; height:40px;"id="pincodecheck" type="button" name="check-pincode-btn" value="Check" class="btn pincode-btn" disabled />
                        <div style="font-weight:900;color:#ff0000;" id="pin-availablity"></div>
                        </form>  --> 
                  </div>
                  <?php if(count($eggProducts)) { ?>
                  <div class='egg-eggless'>
                     <ul>
                        <?php $eggTitle=array("With Egg","Eggless"); $eggCounter=0; foreach($eggProducts as $lp){ ?>
                        <li class="<?= $lp['product_id']==$product_id?'current':'' ?>">
                           <a href="<?= $lp['href'] ?>"><?= $eggTitle[$eggCounter++] ?></a>
                        </li>
                        <?php } ?>
                     </ul>
                  </div>
                  <?php } ?>
                  <?php if ($minimum > 1) { ?>
                  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?= $text_minimum; ?></div>
                  <?php } ?>
               </div>
               <?php /*?> <?php if ($review_status) { ?>
               <div class="rating">
                  <p>
                     <?php for ($i = 1; $i <= 5; $i++) { ?>
                     <?php if ($rating < $i) { ?>
                     <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                     <?php } else { ?>
                     <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                     <?php } ?>
                     <?php } ?>
                     <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?= $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?= $text_write; ?></a>
                  </p>
                  <hr>
                  <!-- AddThis Button BEGIN -->
                  <div class="addthis_toolbox addthis_default_style" data-url="<?= $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
                  <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                  <!-- AddThis Button END -->
               </div>
               <?php } ?> <?php */?>
            </div>
            <!--<p class="pls_note" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Please note on 7th August Delivery will done between 9AM to 9PM</p>-->
            <p class="pls_note" style="display:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Please note on 5th, 6th, 7th & 8th August Delivery will be done between 9AM to 9PM</p>
            <?php if($product_addon_shipping_type == 1){ ?> 
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Gifts may be delivered prior or after the chosen date.</p>
            <?php } ?>
          </div>
            <div class="productTabs product_des_tab">
              <div class="product_tab_band">
                 <ul class="nav nav-tabs col-sm-12 col-md-12 col-xs-12">
                    <li class="active"><a href="#tab-description" data-toggle="tab"><?= $tab_description; ?></a></li>
                    <li><a href="#tab-disclaimer" data-toggle="tab">Delivery Info</a></li>
                    <?php if ($review_status) { ?>
                    <li class="show_review_slider"><a href="#tab-review" data-toggle="tab"><?= $tab_review; ?></a></li>
                    <?php } ?>
                 </ul>
              </div>
               <div class="tab-content col-sm-12 col-md-12 col-xs-12">
                  <div class="tab-pane active" id="tab-description"><?= $description; ?>
                    <br><br><p><strong>Key Attributes</strong><br>
                      <?php foreach ($attribute_groups as $attribute_group) { ?>
                      <?php foreach ($attribute_group['attribute'] as $attribute) {
                        echo $attribute['name'].': '.$attribute['text'].'<br>';
                      }?>
                      <?php } ?>
                    </p>
                    <p class="pspeccon"><strong>Product Specifications</strong><br><span class="pspec"></span></p>
                  </div>
                  <div class="tab-pane" id="tab-disclaimer">
                    <strong>Cakes</strong>
                    <ul>
                      <li>As cakes are handcrafted and each chef has his/her own way of making and designing a cake, there might be a slight variation in the product in terms of design and shape.</li>
                      <li>There are certain unforeseen circumstances like rain, accidents etc where delivery can be delayed a little wherein we will try our best to deliver each product on time for the best service experience.</li>
                      <li>Sculptural elements and figurines may contain wire supports or toothpicks or wooden skewers for support, so kindly check the placement of these items before serving.</li>
                      <li>Non edible items can be used on the cake in order to make it closer to the design which completely depends upon the type of design selected or customised.</li>
                      <li>Please keep the cake in room temperature for 30-60 minutes before consuming for better taste.</li>
                      <li>In order to give good customer experience we always use organic colours in the cake but Strong/Dark Colours like Red, Blue, and Black etc have a potential to stain teeth, tongue, linen, clothing and furniture upon contact. </li>
                      <li>The cake should be consumed with in 24 hrs.</li>
                      <li>Sometime in rare case substitutions of flavours/designs is necessary due to temporary and/or unavailability of the product.</li>
                      <li>As the cakes are perishable in nature so product will be attempted for the delivery only once.</li>
                      <li>Delivery address provided by the sender will not be change same day and once the order is out for delivery.</li>
                      <li>In order to give proper shape and design to the cake fondant is used which is sugary in nature and doesn’t contains softness like a cream cake.</li>
                    </ul>
                    <strong>Flowers</strong>
                    <ul>
                      <li>Flowers delivered can be fully bloomed, semi-bloomed or in form of bud depending upon the availability.</li>
                      <li>When flowers are arrived trim the stem and add water in the pot to keep it fresh for longer time, do not keep it as it is as they are perishable in nature.</li>
                      <li>Always use clean water and clean vase.</li>
                    </ul>
                  </div>
                  <?php if ($review_status) { ?>
                  <div class="tab-pane" id="tab-review">
                     <form class="form-horizontal" id="form-review">
                     	<div class="review-slider">
                          
                          
                          
                          


                          
                        </div>
                        <div id="review"></div>
                        <div class="review_section">
                          <h3><?= $text_write; ?></h3>
                          <?php if ($review_guest) { ?>
                          <div class="form-group required">
                             <div class="col-sm-12">
                                <input type="text" placeholder="Your Name *" name="name" value="<?= $customer_name; ?>" id="input-name" class="review_input" />
                             </div>
                          </div>
                          <div class="form-group required">
                             <div class="col-sm-12">
                                <textarea placeholder="Write your review *" name="text" rows="5" id="input-review" class="review_input"></textarea>
                             </div>
                          </div>
                          <div class="form-group required">
                             <div class="col-sm-12">
                                <p style="font-size: 14px;color: #22303D;margin-bottom: 0;">Rate Us</p>
                                <div id="stars" class="display-flex">
                                    <label data-value='1' for="rating_01" class="fill_rating">
                                      <input style="display: none;" id="rating_01" type="radio" name="rating" value="1" />
                                      <i class="fa fa-star fa-fw"></i>
                                    </label>
                                    <label data-value='2' for="rating_02" class="fill_rating">
                                      <input style="display: none;" id="rating_02" type="radio" name="rating" value="2" />
                                      <i class="fa fa-star fa-fw"></i>
                                    </label>
                                    <label data-value='3' for="rating_03" class="fill_rating">
                                      <input style="display: none;" id="rating_03" type="radio" name="rating" value="3" />
                                      <i class="fa fa-star fa-fw"></i>
                                    </label>
                                    <label data-value='4' for="rating_04" class="fill_rating">
                                      <input style="display: none;" id="rating_04" type="radio" name="rating" value="4" />
                                      <i class="fa fa-star fa-fw"></i>
                                    </label>
                                    <label data-value='5' for="rating_05" class="fill_rating">
                                      <input style="display: none;" id="rating_05" type="radio" name="rating" value="5" />
                                      <i class="fa fa-star fa-fw"></i>
                                    </label>
                                </div>
                                <?php /*<?= $entry_bad; ?>

                                 <?= $entry_good; ?> */ ?>
                             </div>
                             
                             <!-- <div class="review">
                              <span class="rating_stars rating r<?php echo $rating; ?>">
                               </span>
                              <a class="to_review" ><?php echo $reviews; ?></a>
                              </div> -->
                             
                          </div>
                          <?= $captcha; ?>
                          <div class="buttons clearfix">
                             <div class="">
                                <button type="button" id="button-review" data-loading-text="<?= $text_loading; ?>" class="home-primary-btn border-none full-width">Submit Review</button>
                             </div>
                          </div>
                          <?php } else { ?>
                          <?= $text_login; ?>
                          <?php } ?>
                        </div>
                     </form>
                  </div>
                  <?php } ?>
               </div>
            </div>
         
         <?php if ($tags) { ?>
         <p style="display: none;"><?= $text_tags; ?>
            <?php for ($i = 0; $i < count($tags); $i++) { ?>
            <?php if ($i < (count($tags) - 1)) { ?>
            <a href="<?= $tags[$i]['href']; ?>"><?= $tags[$i]['tag']; ?></a>,
            <?php } else { ?>
            <a href="<?= $tags[$i]['href']; ?>"><?= $tags[$i]['tag']; ?></a>
            <?php } ?>
            <?php } ?>
         </p>
         <?php } ?>
         <?= $content_bottom; ?>
      </div>
      <?= $column_right; ?>
   </div>
</div>
<div class="bg-gray pb-40 mb-40 recenty_view_section">
  <div class="container">
    <div class="row">
      <div class="relatedProducts row col-sm-12" style="margin-bottom: 0;">
        <?php if ($recentlyViewed) { ?>
        <!--<h3><?= $text_related; ?></h3>-->
        <h2 class=""><span>Recently Viewed By You</span></h2>
        <div class="row">
          <div class="slick_slider_simlar">
           <?php $i = 0; ?>
           <?php foreach ($recentlyViewed as $product) { ?>
           <div class="category_main_row_col item">
              <div class="product-layout product-grid">
                  <div class="product-thumb hover-zoom-col">
                     <div class="image"><a href="<?= $product['href']; ?>"><img src="<?= $product['thumb']; ?>" alt="<?= $product['name']; ?>" title="<?= $product['name']; ?>" class="img-responsive img-zoom" /></a></div>
                     <div href="<?php echo $product['href']; ?>" target="_blank" class="product_sort_detail">
                    <div class="caption" style="margin-bottom: 0;">
                      <p class="cat_product_title" style="margin: 8px 0 10px 0;height:auto;"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a>
                        <span class="product-info-detail" proId="<?php echo $product['product_id']; ?>" title="<?php echo $product['name']; ?>" hrftag="<?php echo $product['href']; ?>"></span>
                      </p>
                      <div class="display-flex align-items-center space-between">
                        <div>
                          <?php if ($product['price']) { ?>
                          <p class="price">
                            <?php if (!$product['special']) { ?>
                            <?php echo $product['price']; ?>
                            <?php } else { ?>
                             <span class="price-new"> <?php echo $product['special']; ?> </span> <span class="price-old"> <?php echo $product['price']; ?> </span>
                            <?php } ?>
                            <?php if ($product['tax']) { ?>
                             <span class="price-tax"> <?php echo $text_tax; ?> <?php echo $product['tax']; ?> </span>
                            <?php } ?>
                          </p>
                          <?php } ?>
                        </div>
                        <div class="review_count_main_col">
                          <div class="review-card">
                            <span><?php echo $product['rating']; ?> </span><span>&nbsp; <i class="fa fa-star"></i></span>
                          </div>
                        <?php /* if ($product['rating']) { ?>
                        <div class="rating">
                          <?php for ($i = 1; $i <= 5; $i++) { ?>
                          <?php if ($product['rating'] < $i) { ?>
                          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                          <?php } else { ?>
                          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                          <?php } ?>
                          <?php } ?>
                        </div>
                        <?php } */ ?>
                          <p class="review_text_cat"><?php echo $product['reviews']; ?> Reviews</p>
                        </div>
                      </div>
                    </div>
                   </div>
                     <!--<div class="button-group">
                        <button type="button" onclick="cart.add('<?= $product['product_id']; ?>', '<?= $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?= $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
                        <button type="button" data-toggle="tooltip" title="<?= $button_wishlist; ?>" onclick="wishlist.add('<?= $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                        <button type="button" data-toggle="tooltip" title="<?= $button_compare; ?>" onclick="compare.add('<?= $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                        </div>-->
                  </div>
              </div>
           </div>
           <?php $i++; ?>
           <?php } ?>
          </div>
        </div>
        <?php } ?>
    </div>
    </div>
  </div>
</div>

<div class="you_may_also_like">
<div class="container">
  <div class="row">
    <div class="relatedProducts row col-sm-12" style="margin-top: 0;">
      <?php if ($products) { ?>
      <!--<h3><?= $text_related; ?></h3>-->
      <h2 class=""><span>You May Also Like</span></h2>
      <div class="row">
         <?php $i = 0; $a = 0; ?>
         <?php foreach ($similarProducts as $product) { $a++; if($a > 4) { CONTINUE; } ?>
         <?php if ($column_left && $column_right) { ?>
         <?php $class = 'col-xs-8 col-sm-6'; ?>
         <?php } elseif ($column_left || $column_right) { ?>
         <?php $class = 'col-xs-6 col-md-4'; ?>
         <?php } else { ?>
         <?php $class = 'col-xs-6 col-sm-3'; ?>
         <?php } ?>
         <div class="<?= $class; ?> category_main_row_col">
            <div class="product-layout product-grid">
                <div class="product-thumb hover-zoom-col">
                   <div class="image"><a href="<?= $product['href']; ?>"><img src="<?= $product['thumb']; ?>" alt="<?= $product['name']; ?>" title="<?= $product['name']; ?>" class="img-responsive img-zoom" /></a></div>
                   <div href="<?php echo $product['href']; ?>" target="_blank" class="product_sort_detail">
                  <div class="caption" style="margin-bottom: 0;">
                    <p class="cat_product_title" style="margin: 8px 0 10px 0;height:auto;"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a>
                      <span class="product-info-detail" proId="<?php echo $product['product_id']; ?>" title="<?php echo $product['name']; ?>" hrftag="<?php echo $product['href']; ?>"></span>
                    </p>
                    <div class="display-flex align-items-center space-between">
                      <div>
                        <?php if ($product['price']) { ?>
                        <p class="price">
                          <?php if (!$product['special']) { ?>
                          <?php echo $product['price']; ?>
                          <?php } else { ?>
                           <span class="price-new"> <?php echo $product['special']; ?> </span> <span class="price-old"> <?php echo $product['price']; ?> </span>
                          <?php } ?>
                          <?php if ($product['tax']) { ?>
                           <span class="price-tax"> <?php echo $text_tax; ?> <?php echo $product['tax']; ?> </span>
                          <?php } ?>
                        </p>
                        <?php } ?>
                      </div>
                      <div class="review_count_main_col">
                        <div class="review-card">
                          <span><?php echo $product['rating']; ?> </span><span>&nbsp; <i class="fa fa-star"></i></span>
                        </div>
                      <?php /* if ($product['rating']) { ?>
                      <div class="rating">
                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($product['rating'] < $i) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } ?>
                        <?php } ?>
                      </div>
                      <?php } */ ?>
                        <p class="review_text_cat"><?php echo $product['reviews']; ?> Reviews</p>
                      </div>
                    </div>
                  </div>
                 </div>
                   <!--<div class="button-group">
                      <button type="button" onclick="cart.add('<?= $product['product_id']; ?>', '<?= $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?= $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
                      <button type="button" data-toggle="tooltip" title="<?= $button_wishlist; ?>" onclick="wishlist.add('<?= $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                      <button type="button" data-toggle="tooltip" title="<?= $button_compare; ?>" onclick="compare.add('<?= $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                      </div>-->
                </div>
            </div>
         </div>
         <?php if (($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
         <div class="clearfix visible-md visible-sm"></div>
         <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
         <div class="clearfix visible-md"></div>
         <?php } elseif (($i+1) % 4 == 0) { ?>
         <div class="clearfix visible-md"></div>
         <?php } ?>
         <?php $i++; ?>
         <?php } ?>
      </div>
      <?php } ?>
  </div>
  </div>
</div>
</div>
<div class="mainPop">
   <div class="dev_popdiv" id="dev_popdiv"></div>
</div>
<script type="text/javascript">

   $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
     $.ajax({
       url: 'index.php?route=product/product/getRecurringDescription',
       type: 'post',
       data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
       dataType: 'json',
       beforeSend: function() {
         $('#recurring-description').html('');
       },
       success: function(json) {
         $('.alert, .text-danger').remove();
   
         if (json['success']) {
           $('#recurring-description').html(json['success']);
         }
       }
     });
   });

     
     function displayErrorMsg(msg, addCls){
      // $('html, body').animate({ scrollTop: 0 }, 'slow');
       $('.alert-danger').remove();
        $(addCls).after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '+ msg +' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
       $(addCls).addClass("red-border");
       return;
     }
 
  
</script>

<script type="text/javascript"><!--
   var btnCartButton = 0;  
   /*$("#entre_city").blur(function(){    
       setTimeout(function(){ $('#ajaxtargetdiv').hide(); },500);
   });*/
   $("#enter_pincode_courier").blur(function(){    
       setTimeout(function(){ $('#ajaxtargetdiv1').hide(); },500);
   });
   
   $('.btn_cart').on('click', function() {
   
     var btncart=$(this);
     
     
   
     if($(this).attr('id')=='button-cart-2')
       btnCartButton=1;
      if($(window).width() < 767){
        $('html, body').animate({
          scrollTop: $('.mobile-pick-an-upgrade').offset().top - 100
        }, 'slow');
        if(parseInt(cityIdFromPincode) == 0){
          $('.selectpincodeerr').show();
          return;
        }
      }
     $('.text-error').show();
     var cityid = $("#validateValue").val();

     var timeslotData = $("#timeslotData").val();
     var specifictime = $("#specifictime").val();

     if(timeslotData == '' || specifictime == ''){
      $('.text-error').show();
      return
     }
    
     if(cityid.trim().length > 0){
         $('.loadingbox').show();
         $('.text-error').text('').hide();
         
         $.ajax({
           url: 'index.php?route=checkout/cart/add',
           type: 'post',
           data: $('#product input[type=\'text\'], #product input[type=\'number\'], #cityDateShipping input[type=\'text\'], #cityDateShipping input[type=\'hidden\'], #cityDateShippingCourier input[type=\'text\'], #cityDateShipping select, #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
           dataType: 'json',
           beforeSend: function() {
             //$(btncart).button('loading');
           },
           complete: function() {
             //$(btncart).button('reset');
           },
           success: function(json) {
             //console.log(data); return;
             $('.alert, .text-danger').remove();
             $('.form-group').removeClass('has-error');
   
             if (json['error']) {
               if (json['error']['option']) {
                 for (i in json['error']['option']) {
                   var element = $('#input-option' + i.replace('_', '-'));
   
                   if (element.parent().hasClass('input-group')) {
                     element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                   } else {
                     element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                   }
                 }
               }
   
               if (json['error']['recurring']) {
                 $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
               }
   
               // Highlight any found errors
               $('.text-danger').parent().addClass('has-error');
             }
   
             if (json['success']) {
               // $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

               $('.loadingbox').show();

               $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
   
               $('html, body').animate({ scrollTop: 0 }, 'slow');
   
               $('#cart > ul').load('index.php?route=common/cart/info ul li');

                console.log("added to cart");
                dataLayer.push({ ecommerce: null });  // Clear the previous ecommerce object.
                dataLayer.push({
                  event: "add_to_cart",
                  ecommerce: {
                  currency: "INR",
                  value: <?php echo $pprice; ?>,
                  items: [
                  {
                    item_id: "<?php echo $sku; ?>",
                    item_name: "<?php echo $heading_title; ?>",
                    discount:0,
                    index: 0,
                    item_brand: "Flavours Guru",
                    item_category: "<?php echo $parent_cat['title'] ?>",
                    item_list_id: "related_products",
                    item_list_name: "Related products",
                    price: <?php echo $pprice; ?>,
                    quantity: 1
                  }
                  ]
                }
                });
   
               $.ajax({
                 type: "POST",
                 url: <?= '"'.HTTP_SERVER.'index.php?route=product/product/getAddons"' ?>,
                 data: {proId:<?= $product_id; ?>,cityId:cityIdFromPincode},
                 cache: false,
                 success: function(data){
                   $('.loadingbox').hide();
                   if(data == '[]'){
                     if(btnCartButton == 0){
                       window.location.href = <?= '"'.HTTP_SERVER.'index.php?route=checkout/cart"' ?>;  
                     } else {
                       window.location.href = <?= '"'.HTTP_SERVER.'index.php?route=checkout/cart"' ?>;
                     }
                   }
                   $(".addonsTab").empty();
                   $(".addonContainer").empty();
                   var obj = JSON.parse(data);
                   var showData = "";
                   var showData1 = "";
                   var j = 0;
                   $.each(obj, function(key,value) {
                     showData += '<li class="slide-tab type-card-wrapper" rel="tab_'+j+'">'+key+'</li>';
                     showData1 += '<h3 class="d_active tab_drawer_heading" rel="tab_'+j+'">'+key+'</h3><div id="tab_'+j+'" class="tab_content"><div class="pro_list_box custom-scroll"><ul>';
                     for(var i = 0; i < value.length; i++){
                      var attri = value[i].attributes;
                      var attributes = '';
                      for(var e = 0; e < attri.length; e++){
                        attributes += '<li>'+attri[e]['name']+': '+attri[e]['text']+'</li>';
                      }
                       showData1 += '<li><div class="pro_image"><img class="img_v" src="'+value[i].image+'" alt="Call"></div><div class="popup-price"><h3>'+value[i].name+'</h3><p class="add_popup_info_price">'+value[i].price+'</p><div class="product-info hide"><h4>Product Details:</h4><ul class="attrivuet-list-add-on">'+attributes+'</ul></div><div class="price-add-item-col"><div class="pricebox home-primary-btn" price="'+value[i].price+'">'+value[i].price+'</div><div class="input-group btn-block display-flex add-item-col" style="justify-content: end;margin-bottom: 0px;margin-top: 0px;">';
                       if(parseInt(value[i].product_id) == 9380){
                        showData1 += '<small>Enter Age</small><input type="number" name="candle" value="" size="1" class="form-control item-add-candle" placeholder="eg: 2" proId="'+value[i].product_id+'"><button type="button" style="display:none;" class="rmcartitem">-</button><input type="text" name="quantity" value="0" size="1" class="form-control item-add-input"  style="display:none;" proId="'+value[i].product_id+'"><button type="button"  style="display:none;" class="addcartitem">+</button>'; 
                       } else {
                        showData1 += '<button type="button" class="rmcartitem">-</button><input type="text" name="quantity" value="0" size="1" class="form-control item-add-input" proId="'+value[i].product_id+'"><button type="button" class="addcartitem">+</button>';
                       }
                       
                       showData1 += '</div></div></div></li>';
                     }
                     showData1 += '</ul></div></div>';
                     j++;
                   })
                   $(".addonsTab").html(showData);
                   $(".addonContainer").html(showData1);
                   jQuery("body").addClass("addon-overflow");
                   addOnFuc();
                   imgClick();
                   addOnsTabs();
                   $('.loadingbox').hide();
                   $('.proTOP').css("visibility", "visible");
                   $('.proTOP').css("z-index", "99");

                   $('.item-add-candle').change(function(){
                    var type = $(this).val().length;
                    var price = $(this).parent().prev().html('₹'+parseInt(type) * 49);
                    $(this).next().next().val(type);
                    $(this).next().next().trigger("change");
                    tpro = tpro + type;
                    $('.addon_continue').text('Continue With '+tpro + ' Add Ons');
                   })
                   

                   $('.addcartitem').click(function(){
                    var addonqtycurrent = $(this).prev().val();
                    $(this).prev().val(parseInt(addonqtycurrent) + 1);
                    tpro = tpro + 1;
                    $('.addon_continue').text('Continue With '+tpro + ' Add Ons');
                   })

                   $('.rmcartitem').click(function(){
                    var addonqtycurrent = $(this).next().val();
                    if(parseInt(addonqtycurrent) > 0){
                      $(this).next().val(parseInt(addonqtycurrent) - 1);
                      tpro = tpro - 1;
                      $('.addon_continue').text('Continue With '+tpro + ' Add Ons');
                    }
                   })

                   $('.clspopup').click(function(){
                    $('.proTOP').css("visibility", "hidden");
                    $('.proTOP').css("z-index", "0");
                    jQuery("body").removeClass("addon-overflow");
                   });
                   var screenwidth = $(window).width();
                   if(screenwidth < 767){
                    $('.pro_image').on('click', function(){
                      $(this).parent().addClass('add_on_popup_li');
                      $('.bg-img-add-on-popup').fadeIn();
                      $('.product-info').removeClass('hide');
                    });
                    $('.add-on-info-popup-close').on('click', function(){
                      $('.pro_list_box > ul > li').removeClass('add_on_popup_li');
                      $('.bg-img-add-on-popup').fadeOut();
                      $('.product-info').addClass('hide');
                    });
                   }
                 }// success ends
               });
   
             }
           },
               error: function(xhr, ajaxOptions, thrownError) {
                   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
               }
         });
     } else {

       if($('#enter_pincode_courier').val()){
          $('.text-error').text('Enter Pincode is not available');
       } else {
          $('.text-error').text('Enter City is not available');
       }
    }
     $('.loadingbox').hide();
   });
   
   //-->
</script>
<script type="text/javascript">
  $('.close-pincode-list').click(function(){
    $(".pincodenew").val('');
    $(".pincodenew").addClass("animation-border");
    $("#newdelDate").removeClass("animation-border");  
    cityIdFromPincode = 0;
    $('.close-pincode-list').hide();
    $('.pincodelist').empty();
    $('.availablepincode').hide();
    $('.show-date-time-selected').hide();
    $('.show-date-time-toselected').show();
    $("#cityDateShipping input[type=\'hidden\']").val('');
    $('.citynametoshow').html('');
  })

  /*$(".pincodenew").change(function(){
      
      
      
    });*/

  $('.pincodenew').on('input', function() {
    $('.pincodenew').removeClass('caret-color');
    $('.citynametoshow').html('');
    $('.close-pincode-list').hide();
    $('.selectpincodeerr').hide();
    $('.show-date-time-selected').hide();
    $('.show-date-time-toselected').show();
    $("#cityDateShipping input[type=\'hidden\']").val('');
    this.value = this.value.replace(/[^0-9\.]/g,'');
    this.value = this.value.slice(0, 6) + "";
    var pincodeno = /^\d{6}$/;
    var inputpin = $(".pincodenew").val().trim();
    if(inputpin.length>1)
    if(!inputpin.match(pincodeno))
    {
      $('.soorypincode').show();
      $('.availablepincode').hide();
    }else{
      $('.soorypincode').hide();
    }
    var pininput = $(this);
    var pins = $(this).val();
    var ht = "<ul>";
    if(pins.length == 6){
      $('.close-pincode-list').show();
      $('.pincodelist').hide();
    } else {
      $('.pincodelist').show();
    }
    $('.pincodelist').empty();
    if(pins.length > 3){
      $.ajax({
          type: "POST",
          url: <?php echo '"'.HTTP_SERVER.'index.php?route=product/product/getPincodesList"' ?>,
          data: {proId:<?php echo $product_id; ?>,pins:pins},
          cache: false,
          success: function(data){
            var data = jQuery.parseJSON(data);
            for(var i in data){
              ht += "<li class='mainPin mainPin-"+data[i].pincode+"' mainPinCid='"+data[i].shipping_cities_id+"' holidays='"+data[i].holidays+"' mainPinCname='"+data[i].name+"' mainPinCode='"+data[i].pincode+"'>"+data[i].pincode+"</li>";
            }
            ht += "</ul>";
            if(data.length > 0){
              $('.soorypincode').hide();
              $('.pincodelist').html(ht);
              clickPincodeFromList();
              if(pins.length == 6){
                $('.pincodelist').hide();
                $('.mainPin-'+pins).trigger('click');
                $('.availablepincode').show();
              }
            } else {
              $('.soorypincode').show();
              $('.pincodelist').empty();
              cityIdFromPincode = 0;
            }
          }
      })
    }
  });

  var cityFromPincode = '';
  var cityIdFromPincode = 0;
  function clickPincodeFromList(){
    $('.mainPin').click(function(){
      cityIdFromPincode = $(this).attr("mainPinCid");
      cityFromPincode = $(this).attr("mainPinCname");
      cityFromPincodePin = $(this).attr("mainPinCode");
      var holidays = $(this).attr("holidays");
      if(holidays == ""){
        unavailableDates = [];
      } else {
        unavailableDates = holidays.split(",");
      }
      $('.citynametoshow').html(cityFromPincode);
      $('.pincodenew').val(cityFromPincodePin);
      $('.pincodeN').val(cityFromPincodePin);
      $('.pincodelist').empty();
      $('.close-pincode-list').show();
      $('.pincodenew').addClass('caret-color'); 
      $("#newdelDate").addClass("animation-border");
      $("#errorMsgNew").hide();
      $(".pincodenew").removeClass("animation-border");
    })  
  }

   $("#newdelDate").click(function(){
     /*$('#delDate').data("DateTimePicker").destroy();
     $('#delDate').val('');
     $('#delDate').datetimepicker({
         useCurrent: false,
         pickTime: false,
         minDate: moment(),
         format: 'DD-MM-YYYY',
      });*/
      if(parseInt(cityIdFromPincode) == 0){
        $('.selectpincodeerr').show();
        return;
      }
      $("#errorMsg").empty();
      var cid = cityIdFromPincode;
      if(cid == ''){
        $("#errorMsgNew").show();
        $(this).removeClass("animation-border");
        $(".pincodenew").addClass("animation-border");
        return;
      }
      var tomorrow = new Date(today.getTime() + 24 * 60 * 60 * 1000);
       $.ajax({
        type: "POST",
        url: <?php echo '"'.HTTP_SERVER.'index.php?route=product/product/checkTodayShipingType"' ?>,
        data: {proId:<?php echo $product_id; ?>,cid:cid},
        cache: false,
        success: function(data){

          var obj = jQuery.parseJSON(data);
          var types = '';
          console.log(obj['msg']);
          if(obj['msg']=='1'){
            //$('#datetimeshipping').data("DateTimePicker").destroy();
            
            $('#datetimeshipping').val('');
            $('#datetimeshipping').datepicker("option", "minDate", 0);
            $('.bg_img').show();
            $('.select-info-popup').show();
            $('.bootstrap-datetimepicker-widget.dropdown-menu').hide();
            
          }else{            
            startdate = GetFormattedDate();
            var new_date = moment(startdate, "DD-MM-YYYY").add('days', 1);
             var date = new Date();
            var tomorrow = new Date(date.getFullYear(), date.getMonth(), (date.getDate() + 1));
            console.log("else=>"+tomorrow);
            console.log("else2=>"+new_date);
            //$('#datetimeshipping').data("DateTimePicker").destroy();
            $('#datetimeshipping').val('');
            $('#datetimeshipping').datepicker("option", "minDate", tomorrow);
            $('.bg_img').show();
            $('.select-info-popup').show();
          }
          
          $("#datetimeshipping").datepicker("option", "beforeShowDay", disableDates)
          jQuery('#shippingmethoddiv').animate({"left":"100%"});
          jQuery('.calendar-section').animate({"right":"0"});
          jQuery('#timimg-section').animate({"left":"100%"});
          jQuery('#time_slot_msg').animate({"left":"100%"});
          jQuery('.pincodenew').removeClass('animation-border');
        }
      });
      $('.for-animation').click (function (){
         $('.for-animation.animation-border').removeClass("animation-border"); 
         $(this).addClass("animation-border"); 
      });

     //console.log('hello');
   })
   var unavailableDates = [];
  function disableDates(date) {
    if(unavailableDates.length > 0){
      var string = $.datepicker.formatDate('dd-mm-yy', date);
      return [unavailableDates.indexOf(string) == -1];
    } else {
      return [true];
    }
    
  }
 
   $('#datetimeshipping').change(function(){
    $('#data-city-id').val(cityIdFromPincode);
    var cid = cityIdFromPincode;
    $("#validateValue").val(cid);
    $("#entre_city").attr('cityId', cid);
    $("#cityN").val(cityFromPincode);
    $("#shippingtype").empty();
     getShippingTypeForPro(cid);
     $('.delivery_date').val($(this).val());
   })

   
   
   function GetFormattedDate() {
       var todayTime = new Date();
       var month = todayTime .getMonth() + 1;
       var day = todayTime .getDate();
       var year = todayTime .getFullYear();
       return day + "." + month + "." + year;
   }

    
   

       function getShippingTypeForPro(cid){
          var delDate = $("#datetimeshipping").val();
          $('.loadingbox').show();
          let cityName = cityFromPincode;
         $.ajax({
             type: "POST",
             url: <?= '"'.HTTP_SERVER.'index.php?route=product/product/getShippingTypeForPro"' ?>,
             data: {proId:<?= $product_id; ?>,cid:cid,delDate:delDate},
             cache: false,
             success: function(data){
               var obj = jQuery.parseJSON(data);
               var types = '';
               var free_type='';
               $.each(obj, function(key,value) {
                types += '<li><a data-shippingmethod="'+value.name.replace(/\s+/g, "")+'" class="timeslotdetails" data-ga-title="'+value.name+'" tabindex="0"><input type="radio" class="input-group-field applycoupon shippingtime" name="shippingmethodtype" id="'+value.name.replace(/\s+/g, "")+'" tabindex="0" value="'+value.name + ' - ' + value.price+'" typeId = "'+value.id+'" price = "'+value.usePrice+'"><label class="select_delivery" for="'+value.name.replace(/\s+/g, "")+'"><span class="rdo-span"></span><span class="timesloter">'+value.name+'</span></label><div class="input-group-button button del-method-btn"><span class="delcost">'+value.price+'</span></div></a></li>';
                 
               }); 
               
               $('.newshippingoptionhtml').html(types);
               jQuery('.calendar-section').animate({"right":"100%"});
                jQuery('#shippingmethoddiv').animate({"left":"0"});
               $('.loadingbox').hide();
               shippingMethodfunction();
             }
           });
       }
   
       var timeslotDataa = '';
       function shippingMethodfunction(){
        $('input[type=radio][name=shippingmethodtype]').change(function(){
          var typeId = $(this).attr('typeId');
          $('.shippingtype').val($(this).val());
          var price1 = $(this).attr('price');
          jQuery('#shipping_price').val(price1);
           jQuery.ajax({
             type: "POST",
             url: <?= '"'.HTTP_SERVER.'index.php?route=product/product/getDatesTimeForPro"' ?>,
               data: {shippingType:typeId},
               cache: false,
               dataType: 'json',
               success: function(data){
                 
                jQuery('#timeslotData').val(JSON.stringify(data.timeslot));
                if (typeId=='20' || typeId=='49' || typeId=='56' || typeId=='63' || typeId=='70') {
                 setTimeout(function(){ getTimeSlotOneDay(); },500); 
                }else{
                 setTimeout(function(){ getcurrTimeSlot(); },500); 
                }
                setTimeout(function() {
                  $('.loadingbox').hide();
                },500); 
               }             
            });
           }) 
       }
       
       function addOnsTabs(){
         $(".tab_content").hide();
         $(".tab_content:first").show();
         $("ul.tabs li:first").addClass("active");
   
         /* if in tab mode */
         $("ul.tabs li").click(function() {

                 
         $(".tab_content").hide();
         var activeTab = $(this).attr("rel"); 
         $("#"+activeTab).fadeIn();                
         
            
         $("ul.tabs li").removeClass("active");  
         $(this).addClass("active");

   
           $(".tab_drawer_heading").removeClass("d_active");
           $(".tab_drawer_heading[rel^='"+activeTab+"']").addClass("d_active");
           
         });
         /* if in drawer mode */
         $(".tab_drawer_heading").click(function() {
   
         $(".tab_content").hide();
         var d_activeTab = $(this).attr("rel"); 
         $("#"+d_activeTab).fadeIn();
           
           $(".tab_drawer_heading").removeClass("d_active");
         $(this).addClass("d_active");
           
           $("ul.tabs li").removeClass("active");
           $("ul.tabs li[rel^='"+d_activeTab+"']").addClass("active");
         });
   
   
         /* Extra class "tab_last" 
            to add border to right side
            of last tab */

          $('ul.tabs li').first().addClass("tab_first");
         $('ul.tabs li').last().addClass("tab_last");
         
       }
       function addOnFuc(){
         jQuery('#removeHide').click(function(){
           if(btnCartButton == 0){
             window.location.href = <?= '"'.HTTP_SERVER.'index.php?route=checkout/cart"' ?>;  
           } else {
             window.location.href = <?= '"'.HTTP_SERVER.'index.php?route=checkout/cart"' ?>;
           }
         })
         jQuery('.addon_continue').click(function(){
           var j = 0;
           var totalAddon = 0;
           $.each($(".item-add-input"), function(){
            var addonqty = $(this).val();
             if(parseInt(addonqty) > 0){
              totalAddon = totalAddon + 1;
             }
           })
           if(totalAddon > 0){
            $.each($(".item-add-input"), function(){  
             var addonqty = $(this).val();
             if(parseInt(addonqty) > 0){
              var candleProId = parseInt(jQuery(this).attr('proId'));
              if(candleProId == 9380){
                var candleProMsg = 'Number - '+$(this).prev().prev().val();
                var option = {18064: candleProMsg};
              } else {
                var option = {};
              }
              
                jQuery.ajax({
                   type: "POST",
                   url: <?= '"'.HTTP_SERVER.'index.php?route=checkout/cart/add"' ?>,
                     data: {quantity:addonqty, product_id: jQuery(this).attr('proId'), option:option, addon:'1', mainPro:<?= $product_id; ?>},
                     cache: false,
                     success: function(data){
                          var url =   $('#siturl').val();  
                          $('#loaderEtra').html('<img src="'+url+'" class="" width="25" style="float:left">');
                          j++;
                          if(totalAddon == j){
                            if(btnCartButton == 0){
                               window.location.href = <?= '"'.HTTP_SERVER.'index.php?route=checkout/cart"' ?>;  
                             } else {
                               window.location.href = <?= '"'.HTTP_SERVER.'index.php?route=checkout/cart"' ?>;
                             }
                          }
                     } 
                 });
             }
             
           });
          }else{
            if(btnCartButton == 0){
               window.location.href = <?= '"'.HTTP_SERVER.'index.php?route=checkout/cart"' ?>;  
             } else {
               window.location.href = <?= '"'.HTTP_SERVER.'index.php?route=checkout/cart"' ?>;
             }
          }
           
         });
         
   
       }

       var tpro = 0;


   
   
    
</script>
<script type="text/javascript"><!--
   function formatDate(date) {
       var d = new Date(date),
           month = '' + (d.getMonth() + 1),
           day = '' + d.getDate(),
           year = d.getFullYear();
   
       if (month.length < 2) month = '0' + month;
       if (day.length < 2) day = '0' + day;
   
       return [year, month, day].join('/');
   }
   function getTimeSlotOneDay(){
   var timeslots = jQuery('#timeslotData').val();
   var obj = jQuery.parseJSON(timeslots);
   console.log(obj);
   var oldArr = new Array();
   var types = '';
   var d = new Date();
   var n = d.getHours();
   var m = d.getMinutes();
   var types = '';
    var abc = 0;
   $.each(obj, function(key,value) {
   
     if(jQuery.inArray(value.id, oldArr) !== -1){
       //alert('found');
     } else {
       
       var matchTime = 0;
       var nextTime = 0;
       var o = 0;
       var n = d.getHours();
        var m = d.getMinutes();
        var hr = d.getHours();
        var cur_time = n+=+m/60;
        
        o = hr+1;
        nextTime =  o+=+m/60;
       //alert(n + "-" + value.leadtime + "-" + value.buffertime);
       matchTime = cur_time;
       
     $("#validateValue").val(matchTime);
       var from_time = value.timeslot_from.split(':');      
       if (from_time[0]>matchTime && from_time[0]<nextTime) {
         //console.log("This is match=>"+cur_time+"This is next=>"+nextTime+" This is first time=>"+from_time[0]);
        types += '<li class="timeslottable"><a data-shippingmethod="UGT_CALL_DEL-'+abc+'" class="timeslotdetails" data-ga-title="'+value.timeslot_from + ' - ' + value.timeslot_to+'" tabindex="0"><input type="radio"  value="'+value.timeslot_from + ' - ' + value.timeslot_to+'" class="input-group-field applycoupon shippingtime" name="shippingtimeslotnew" id="UGT_CALL_DEL-'+abc+'" tabindex="0"><label class="time-slot-lable" for="UGT_CALL_DEL-'+abc+'"><span class="rdo-span"></span><span class="timesloter">'+value.timeslot_from + ' - ' + value.timeslot_to+'</span></label></a></li>';
                      abc++
       }
        oldArr.push(value.id);
     }
    }); 
     $(".newshippingslothtml").html(types);
     jQuery('#shippingmethoddiv').animate({"right":"100%"});
     jQuery('#timimg-section').animate({"left":"0"});
     jQuery('#time_slot_msg').animate({"left":"0"});
     setDataToHiddenInputs();
   }

   function setDataToHiddenInputs(){
    $('input[type=radio][name=shippingtimeslotnew]').change(function(){
      var slot = $(this).val();
      var finalTime = $(this).attr("finalTime");
      var finalExpiryTime = finalTime !== undefined ? finalTime : '';
      var datetimeshipping = $('.delivery_date').val();
      var shippingmethodtype = $('.shippingtype').val();
      
      $('.shippingmethod').text(shippingmethodtype);
      $('.timeslot').text(slot);
      $('#specifictime').val(slot);
      $('#specificexpirytime').val(finalExpiryTime);
      $('.show-date-time-selected').show();
      $('.show-date-time-toselected').hide();
      var mydate = new Date(datetimeshipping);
      var month = ["Jan", "Feb", "Mar", "April", "May", "June","July", "Aug", "Sept", "Oct", "Nov", "Dec"][mydate.getMonth()];
      var str = + ' - ' + month + ' - ' + mydate.getFullYear();
      $('.deliverymonth_date').text(mydate.getDate());
      $('.deliverymonth_month').text(month);
      $('.select-info-popup').fadeOut('100');
      $('.bg_img').fadeOut('100');
      $('.deliverymonth_time').val(slot);
      $('.show-date-time-selected').click(function(){
        $('#newdelDate').trigger('click');
        $('.bootstrap-datetimepicker-widget.dropdown-menu.picker-open').hide();
      })
    })
   }
   
   function getcurrTimeSlot(){
           //alert('change');
           var oldArr = new Array();
           var selDate2 = jQuery('.delivery_date').val();
           
           var curDate = new Date();
           var selDate = new Date(selDate2);          
           var newArr = new Array();
           var timeslots = jQuery('#timeslotData').val();
           var obj = jQuery.parseJSON(timeslots);
           var selected_date = formatDate(selDate2);
           
           console.log("Selected->"+selDate+" This is curr->"+curDate);
           if (selDate > curDate) {
             //alert("We r in if");
             
             var types = '';
             var abc = 0;
             $.each(obj, function(key,value) {
               var lead_time = value.leadtime-value.buffertime;
               lead_time1 = "'"+lead_time+"'";
                var substring = ".";
                //var n = str.indexOf("to");
               if(lead_time1.indexOf(substring) > 0){
                 var convert_lead = lead_time1.split('.');
                 var lead_min = convert_lead[1]*60/100;
                 var formattedHour = ("0" + convert_lead[0]).slice(-2);
                 var formattedMin = ("0" + lead_min).slice(-2);
                 total_lead = formattedHour+':'+formattedMin+':00';
               }else{
                 var formattedHour = ("0" + lead_time).slice(-2);
                 total_lead = formattedHour+':00'+':00';
               }
               selected_date1 = selected_date+" "+value.timeslot_to+":00";
               //alert(selected_date1);
               var diff = getDiffHour(selected_date1, lead_time);
               //console.log(diff);
               if (diff=='Yes') {
                types += '<li class="timeslottable"><a data-shippingmethod="UGT_CALL_DEL-'+abc+'" class="timeslotdetails" data-ga-title="'+value.timeslot_from + ' - ' + value.timeslot_to+'" tabindex="0"><input type="radio" value="'+value.timeslot_from + ' - ' + value.timeslot_to+'" class="input-group-field applycoupon shippingtime" name="shippingtimeslotnew" id="UGT_CALL_DEL-'+abc+'" tabindex="0"><label class="time-slot-lable" for="UGT_CALL_DEL-'+abc+'"><span class="rdo-span"></span><span class="timesloter">'+value.timeslot_from + ' - ' + value.timeslot_to+'</span></label></a></li>';
                abc++;
               }
             });
             $(".newshippingslothtml").html(types);
             jQuery('#shippingmethoddiv').animate({"right":"100%"});
             jQuery('#timimg-section').animate({"left":"0"});
             jQuery('#time_slot_msg').animate({"left":"0"});
             setDataToHiddenInputs();
           } else {
             //alert("We r in else");
               var types = '';
               var d = new Date();
               var n = d.getHours();
               var m = d.getMinutes();
               var types = '';
               var abc = 0;
               $.each(obj, function(key,value) {
   
                 if(jQuery.inArray(value.id, oldArr) !== -1){
                   //alert('found');
                 } else {
                   
                   var matchTime = 0;
                   var n = d.getHours();
                    var m = d.getMinutes();
                    var cur_time = n+=+m/60;
                   //alert(n + "-" + value.leadtime + "-" + value.buffertime);
                   matchTime = cur_time += value.leadtime -= value.buffertime;
                   
                   var from_time = value.timeslot_to.split(':');
                   var calculatedTime = parseFloat(from_time[0])+parseFloat(from_time[1]/60);
                   //console.log("This is match=>"+matchTime+" This is database=>"+calculatedTime+" This is curr=>"+cur_time);



                   //here

                   var timeDifference = calculatedTime - matchTime;
                   // Assuming timeDifference is already calculated as a decimal value
					// Step 1: Get the current time in decimal format
					var currentHours = d.getHours(); // Get current hour
					var currentMinutes = d.getMinutes(); // Get current minutes
					var currentTimeDecimal = currentHours + currentMinutes / 60;

					// Step 2: Add the timeDifference
					var newTimeDecimal = currentTimeDecimal + timeDifference;

					// Step 3: Handle overflow for times beyond 24 hours
					if (newTimeDecimal >= 24) {
					    newTimeDecimal -= 24; // Wrap back within 24 hours
					}

					// Step 4: Convert the result back to HH:MM format
					var newHours = Math.floor(newTimeDecimal); // Get the integer part for hours
					var newMinutes = Math.round((newTimeDecimal - newHours) * 60); // Get the fractional part as minutes
					var newSeconds = Math.round(((newTimeDecimal - newHours) * 60 - newMinutes) * 60);

					// Handle edge cases
					if (newMinutes === 60) {
					    newMinutes = 0;
					    newHours += 1;
					}
					if (newHours === 24) {
					    newHours = 0;
					}

					var currentDate = new Date();
					var formattedDate = `${currentDate.getFullYear()}-${(currentDate.getMonth() + 1).toString().padStart(2, '0')}-${currentDate.getDate().toString().padStart(2, '0')}`;

					var finalTime = `${formattedDate} ${newHours.toString().padStart(2, '0')}:${newMinutes.toString().padStart(2, '0')}:${newSeconds.toString().padStart(2, '0')}`;


					console.log('Cut off time for: ' +value.timeslot_from + ' - ' + value.timeslot_to+' = '+finalTime);
					//


                   if (calculatedTime>matchTime) {
                      types += '<li class="timeslottable"><a data-shippingmethod="UGT_CALL_DEL-'+abc+'" class="timeslotdetails" data-ga-title="'+value.timeslot_from + ' - ' + value.timeslot_to+'" tabindex="0"><input type="radio"  value="'+value.timeslot_from + ' - ' + value.timeslot_to+'" finalTime="'+finalTime+'" class="input-group-field applycoupon shippingtime" name="shippingtimeslotnew" id="UGT_CALL_DEL-'+abc+'" tabindex="0"><label class="time-slot-lable" for="UGT_CALL_DEL-'+abc+'"><span class="rdo-span"></span><span class="timesloter">'+value.timeslot_from + ' - ' + value.timeslot_to+'</span></label></a></li>';
                      abc++
                   }
                    oldArr.push(value.id);
                     //oldArr[] = value.id ;
                     //alert('not found');
                 }
   
                 
                 //alert(matchTime);
   
                 //types += '<option value="'+value.timeslot_from + ' - ' + value.timeslot_to+'">'+value.timeslot_from + ' - ' + value.timeslot_to +'</option>';
               }); 
               $(".newshippingslothtml").html(types);
               jQuery('#shippingmethoddiv').animate({"right":"100%"});
                jQuery('#timimg-section').animate({"left":"0"});
                jQuery('#time_slot_msg').animate({"left":"0"});
                setDataToHiddenInputs();
           }
           //console.log('array=>'+oldArr.length);
           function getDiffHour(old_date, lead_time){
            
             console.log("----"+old_date);
           var result = '';
          dt1 = new Date();
         dt2 = new Date(old_date);
         var diffMs = diff_hours(dt1, dt2);
         console.log(dt1+","+dt2+","+diffMs);
   
         //console.log("This is diff"+lead_time+" This is date->"+dt2);
            if (diffMs>lead_time) {
             result = 'Yes';
           }else{
             result = 'No';
           }
           return result;
   
         }
         }
         /*function getDiffHour(old_date, lead_time){
            
             console.log("----"+old_date);
           var result = '';
          dt1 = new Date();
         dt2 = new Date(old_date);
         var diffMs = diff_hours(dt1, dt2);
         console.log(dt1+","+dt2+","+diffMs);
   
         //console.log("This is diff"+lead_time+" This is date->"+dt2);
            if (diffMs>lead_time) {
             result = 'Yes';
           }else{
             result = 'No';
           }
           return result;
   
         }*/
         function diff_hours(dt2, dt1) 
      {
   
       var diff =(dt2.getTime() - dt1.getTime()) / 1000;
       diff /= (60 * 60);
       return Math.abs(Math.round(diff));
       
      }
   function getDateCou(nowDate){
   var nowDate = new Date(nowDate);
   var datehtml='<input type="text" class="date" id="exDel" name="exDel" readonly="true">';
   jQuery("#exDel").remove();
   jQuery(".calender").html(datehtml);
   
   var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
   console.log("This is min date"+today);
   $('#exDel').datetimepicker({
     useCurrent: false,
     minDate: today,
     pickTime: false,
     format: 'DD-MM-YYYY',
     daysOfWeekDisabled:[0],
   });
   $('#exDel').datetimepicker('update');
   jQuery(".active.today").removeClass("active");
   }
   var nowDate1 = new Date();
   var today = new Date(nowDate1.getFullYear(), nowDate1.getMonth(), nowDate1.getDate(), 0, 0, 0, 0);
   $('.date').datetimepicker({
     useCurrent: false,
     minDate: moment(),
     pickTime: false,
     format: 'DD-MM-YYYY',
   });
   
   
   function getDate(nowDate, holiday){
   var nowDate = new Date(nowDate);
   var datehtml='<input type="text" class="date" id="delDate" nseldate="" name="delivery_date"  readonly="true">';
   jQuery(".delDate").remove();
   jQuery(".calender").html(datehtml);
   var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
   //console.log("This is min date"+today);
   //alert(holiday);
   $('.date').datetimepicker({
     useCurrent: false,
     minDate: today,
     pickTime: false,
     format: 'YYYY-MM-DD',
     disabledDates: holiday.split(','),
   }).on('change', function (ev) {
       $('#delDate').attr('nseldate', jQuery('#delDate').val());
       var oDate = jQuery('#delDate').attr('nseldate');
       oDate = new Date(oDate);
       ddn = ("0" + oDate.getDate()).slice(-2);
       monNew = oDate.getMonth() + 1;
       mmn = ("0" + monNew).slice(-2);
       yyn = oDate.getFullYear();
       $('#delDate').val(ddn+'-'+mmn+'-'+yyn);
       var rakhiDate =ddn+'-'+mmn+'-'+yyn;
       if(rakhiDate == '07-08-2017'){
         $('.pls_note').show();
       } else {
         $('.pls_note').hide();
       }
     });
   $('.date').datetimepicker('update');
   jQuery(".active.today").removeClass("active");
   //Script for timeslot
   
   
        function getDiffHour(old_date, lead_time){
            
             console.log("----"+old_date);
           var result = '';
          dt1 = new Date();
         dt2 = new Date(old_date);
         var diffMs = diff_hours(dt1, dt2);
         console.log(dt1+","+dt2+","+diffMs);
   
         //console.log("This is diff"+lead_time+" This is date->"+dt2);
            if (diffMs>lead_time) {
             result = 'Yes';
           }else{
             result = 'No';
           }
           return result;
   
         }
   //End Script for timeslot
   }
   
   jQuery(document).ready(function(){
   $('.sdate').datetimepicker({
     pickTime: false,
     minDate: 0
   });
   
   $('.datetime').datetimepicker({
     pickDate: true,
     pickTime: true
   });
   
   $('.time').datetimepicker({
     pickDate: false
   });
   
   $('button[id^=\'button-upload\']').on('click', function() {
     var node = this;
   
     $('#form-upload').remove();
   
     $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
   
     $('#form-upload input[name=\'file\']').trigger('click');
   
     if (typeof timer != 'undefined') {
         clearInterval(timer);
     }
   
     timer = setInterval(function() {
       if ($('#form-upload input[name=\'file\']').val() != '') {
         clearInterval(timer);
   
         $.ajax({
           url: 'index.php?route=tool/upload',
           type: 'post',
           dataType: 'json',
           data: new FormData($('#form-upload')[0]),
           cache: false,
           contentType: false,
           processData: false,
           beforeSend: function() {
             //$(node).button('loading');
           },
           complete: function() {
             //$(node).button('reset');
           },
           success: function(json) {
             $('.text-danger').remove();
   
             if (json['error']) {
               $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
             }
   
             if (json['success']) {
               $('.text-success').show();
               $('.text-success').text(json['success']);
               $("#image-to-place").empty();
               $("#image-to-place").append('<img src="'+json['imagePath']+'" height="82" width="100" />');
               $(node).parent().find('input').val(json['code']);
             }
           },
           error: function(xhr, ajaxOptions, thrownError) {
             alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
           }
         });
       }
     }, 500);
   });
   
   })
   //-->
</script>
<script type="text/javascript"><!--
   $('#review').delegate('.pagination a', 'click', function(e) {
       e.preventDefault();
   
       $('#review').fadeOut('slow');
   
       $('#review').load(this.href);
   
       $('#review').fadeIn('slow');
   });
   
   $('.review-slider').load('index.php?route=product/product/review&product_id=<?= $product_id; ?>');
   
   $('#button-review').on('click', function() {
     $.ajax({
       url: 'index.php?route=product/product/write&product_id=<?= $product_id; ?>',
       type: 'post',
       dataType: 'json',
       data: $("#form-review").serialize(),
       beforeSend: function() {
         //$('#button-review').button('loading');
       },
       complete: function() {
         //$('#button-review').button('reset');
       },
       success: function(json) {
         $('.alert-success, .alert-danger').remove();
   
         if (json['error']) {
           $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
         }
   
         if (json['success']) {
           //$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
        $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> Thank You for your review. It will be published online shortly.</div>');
           $('input[name=\'name\']').val('');
           $('textarea[name=\'text\']').val('');
           $('input[name=\'rating\']:checked').prop('checked', false);
         }
       }
     });
   });
   
   $(document).ready(function() {
     $('.thumbnails').magnificPopup({
       type:'image',
       delegate: 'a',
       gallery: {
         enabled:true
       }
     });
   
     if(window.innerWidth>=1023){
       $('.thumb-zoom img').elevateZoom({
         zoomType: "inner",
           cursor: "crosshair",
           zoomWindowFadeIn: 500, 
           zoomWindowFadeOut: 750
       });
     }
   
     if(window.innerWidth<767){
       $(".mobile-pick-an-upgrade").html($(".linked-products").html());
       $(".linked-products").last().remove();
       $(".mobile-pick-an-upgrade").addClass("linked-products");
     }
   
     $(".cake-msg label").append(" (Max 15 characters)");
     $(".cake-msg input").attr("maxlength","15");
   });
   
   
   function imgClick(){
     jQuery('.img_v').click(function(){
       
       if(jQuery(this).parent().prev().is(':checked')) {
         jQuery(this).parent().prev().prop('checked', false);
       } else {
         jQuery(this).parent().prev().prop('checked', true);
       }
     });
   }
      
   //-->
</script>  
<script type="text/javascript">
   $('#enter_pincode_courier').keypress(function(e) {
     var a = [];
       var k = e.which;
   a.push(8);
       for (i = 48; i < 58; i++)
           a.push(i);
   
       if (!(a.indexOf(k)>=0))
           e.preventDefault();
     
      var textLength = $(this).val().length;
      
      if(textLength>5){
        $(this).val('');
      }
   
   });
   
</script>  
<style type="text/css">
   #selectedfiles{
   position: relative;
   }
   .alert-danger{
   margin-bottom: 0px !important;
   margin-top: 4px !important;
   }
   .filedelete{
   border: 1px solid;
   padding: 0px 5px 2px 5px;
   border-radius: 50%;
   margin-left: 5px;
   }
   .form-control.ap-inputfile{
   margin-top:25px;
   }
   .ap-readonly{
   pointer-events: none;
   -webkit-user-select: none;  /* Chrome all / Safari all */
   -moz-user-select: none;     /* Firefox all */
   -ms-user-select: none;      /* IE 10+ */
   user-select: none;          /* Likely future */
   }
   .ap-readonly.ap-noborder,.ap-noborder{
   border: none;
   }
   /*#ajaxtargetresult 
   {
   list-style: none;
   margin: -1px 0 10px 0 !important;
   padding: 0;
   border: 1px solid #ededed;
   }
   #ajaxtargetresult li 
   {
   padding: 5px;
   cursor: pointer;
   margin: 0 !important;
   }*/
   .block{
   display: block;
   clear: both;
   }
</style>
<!--popup start -->
<?php /* ?>
<div class="pro_pop_top">
   <div class="pro_pop_container">
      <div class="pro_pop_master">
         <div class="pop_main">
            <h2>&nbsp;<span class="loaderEtra" id="loaderEtra" style="width:8px"></span>  Make It Extra Special !</h2>
            <div class="pro_list_box">
               <ul>
               </ul>
            </div>
            <div class="nothanks_continue">
               <a href="javascript:void(0)" id="removeHide">NO THANKS</a> <a href="javascript:void(0)" class="addon_continue">CONTINUE</a>
            </div>
         </div>
      </div>
   </div>
</div>
<?php */ ?>
</div>
<!-- Google Code for Remarketing Tag -->
<script type="text/javascript">
   var google_tag_params = {
   ecomm_prodid: '<?= $product_id; ?>',
   ecomm_pagetype: 'product',
   ecomm_totalvalue: <?php echo $mainprice; ?>,
   };
</script>
<script type="text/javascript">
   /* <![CDATA[ */
   var google_conversion_id = 989949273;
   var google_custom_params = window.google_tag_params;
   var google_remarketing_only = true;
   /* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>
<noscript>
   <div style="display:inline;">
      <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/989949273/?guid=ON&amp;script=0"/>
   </div>
</noscript>
<!--popup end -->
<?php if($config_gr_status) { ?>
  <span itemscope itemtype="http://schema.org/Product">
    <meta itemprop="name" content="<?php echo $heading_title; ?>">
    <meta itemprop="url" content="<?php echo $plink; ?>">
    <?php if($meta_description != "") { ?><meta itemprop="description" content="<?php echo $meta_description; ?>" /><?php } ?>
    <?php if(isset($pimage)) { ?><meta itemprop="image" content="<?php echo str_replace(" ","%20",$pimage); ?>" /><?php } ?>
    <?php if($model != "") { ?><meta itemprop="model" content="<?php echo $model; ?>"><?php } ?>
    <?php if($manufacturer != "") { ?><meta itemprop="brand" content="<?php echo $manufacturer; ?>"><?php } ?>
    <?php foreach ($pcurrencies as $currency) { ?><span itemscope itemprop="offers" itemtype="http://schema.org/Offer">
        <meta itemprop="price" content="<?php echo $currency['price']; ?>">
        <meta itemprop="priceCurrency" content="<?php echo $currency['code']; ?>">
        <meta itemprop="availability" itemtype="http://schema.org/ItemAvailability" content="http://schema.org/<?php echo ($pstock ? "InStock" : "OutOfStock") ?>">
        <meta itemprop="itemCondition" content="http://schema.org/NewCondition" />
      </span>
    <?php } ?>
    <?php if(isset($ptotalreviews) && $ptotalreviews) { ?>
      <span itemscope itemprop="aggregateRating" itemtype="http://schema.org/AggregateRating">
        <meta itemprop="reviewCount" content="<?php echo $ptotalreviews; ?>">
        <meta itemprop="ratingValue" content="<?php echo $raverage; ?>">
      </span>
    <?php } ?>
    <?php foreach($reviewresults as $result) { ?>
      <span itemprop="review" itemscope itemtype="http://schema.org/Review" />
        <meta itemprop="name"  content = "<?php echo substr($result['text'], 0, 15); ?>" />
        <meta itemprop="description" content = "<?php echo $result['text']; ?>" />
        <span itemprop="author" itemscope itemtype="http://schema.org/Person">
          <meta itemprop="name" content = "<?php echo $result['author']; ?>" />
        </span>
        <meta itemprop="datePublished" content="<?php echo date('Y-m-d', strtotime($result['date_added'])); ?>" />
        <span itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
          <meta itemprop="ratingValue" content = "<?php echo $result['rating']; ?>" />
          <meta itemprop="bestRating" content = "5" />
          <meta itemprop="worstRating" content="1" />
        </span>
      </span>
    <?php } ?>
  </span>
<?php } ?>
<?php if($config_gr_status) { ?><?php if(isset($breadcrumbs) && !empty($breadcrumbs)) { ?><script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "BreadcrumbList",
"itemListElement": [
<?php $temp = 0;end($breadcrumbs); $lastElement = key($breadcrumbs); foreach ($breadcrumbs as $key => $value) { $temp = $temp + 1;?>
{
"@type": "ListItem",
"position": <?php echo $temp ?>,
"item": {
"@id": "<?php echo $value['href']; ?>",
"name": "<?php echo ($key == 0) ? 'Home' : strip_tags($value['text']); ?>"
}  
}<?php if($key == $lastElement) {}else{echo ",";}?>
<?php } ?>
]
}
</script>
<?php } ?>
<?php } ?>
<?= $footer; ?>
<div class="proTOP">
  <div class="bg-img-add-on-popup">
    <div class="add-on-info-popup-close">
      <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
        <path d="M16.4673 14.9982L20.9422 10.5338C21.1381 10.3378 21.2482 10.072 21.2482 9.79492C21.2482 9.51779 21.1381 9.25201 20.9422 9.05605C20.7462 8.86009 20.4804 8.75 20.2033 8.75C19.9262 8.75 19.6604 8.86009 19.4644 9.05605L15 13.5309L10.5356 9.05605C10.3396 8.86009 10.0738 8.75 9.7967 8.75C9.51957 8.75 9.25379 8.86009 9.05783 9.05605C8.86187 9.25201 8.75178 9.51779 8.75178 9.79492C8.75178 10.072 8.86187 10.3378 9.05783 10.5338L13.5327 14.9982L9.05783 19.4627C8.96029 19.5594 8.88287 19.6745 8.83003 19.8013C8.7772 19.9281 8.75 20.0641 8.75 20.2015C8.75 20.3389 8.7772 20.4749 8.83003 20.6017C8.88287 20.7286 8.96029 20.8437 9.05783 20.9404C9.15457 21.0379 9.26967 21.1154 9.39648 21.1682C9.5233 21.221 9.65932 21.2482 9.7967 21.2482C9.93407 21.2482 10.0701 21.221 10.1969 21.1682C10.3237 21.1154 10.4388 21.0379 10.5356 20.9404L15 16.4656L19.4644 20.9404C19.5612 21.0379 19.6763 21.1154 19.8031 21.1682C19.9299 21.221 20.0659 21.2482 20.2033 21.2482C20.3407 21.2482 20.4767 21.221 20.6035 21.1682C20.7303 21.1154 20.8454 21.0379 20.9422 20.9404C21.0397 20.8437 21.1171 20.7286 21.17 20.6017C21.2228 20.4749 21.25 20.3389 21.25 20.2015C21.25 20.0641 21.2228 19.9281 21.17 19.8013C21.1171 19.6745 21.0397 19.5594 20.9422 19.4627L16.4673 14.9982Z" fill="white"/>
      </svg>
    </div>
  </div>
   <div class="proContainer">
      <div class="proMaster">
         <div class="pop_main">
            <?php /*<a href="javascript:void(0)" class="remove">X</a>*/ ?>
            <h2>
              <?php /*<span class="loaderEtra" id="loaderEtra"></span>*/ ?>  <span>Add on something to make it extra special!</span>
              <span style="float:right; cursor: pointer;" class="clspopup"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
                <path d="M16.4673 14.9982L20.9422 10.5338C21.1381 10.3378 21.2482 10.072 21.2482 9.79492C21.2482 9.51779 21.1381 9.25201 20.9422 9.05605C20.7462 8.86009 20.4804 8.75 20.2033 8.75C19.9262 8.75 19.6604 8.86009 19.4644 9.05605L15 13.5309L10.5356 9.05605C10.3396 8.86009 10.0738 8.75 9.7967 8.75C9.51957 8.75 9.25379 8.86009 9.05783 9.05605C8.86187 9.25201 8.75178 9.51779 8.75178 9.79492C8.75178 10.072 8.86187 10.3378 9.05783 10.5338L13.5327 14.9982L9.05783 19.4627C8.96029 19.5594 8.88287 19.6745 8.83003 19.8013C8.7772 19.9281 8.75 20.0641 8.75 20.2015C8.75 20.3389 8.7772 20.4749 8.83003 20.6017C8.88287 20.7286 8.96029 20.8437 9.05783 20.9404C9.15457 21.0379 9.26967 21.1154 9.39648 21.1682C9.5233 21.221 9.65932 21.2482 9.7967 21.2482C9.93407 21.2482 10.0701 21.221 10.1969 21.1682C10.3237 21.1154 10.4388 21.0379 10.5356 20.9404L15 16.4656L19.4644 20.9404C19.5612 21.0379 19.6763 21.1154 19.8031 21.1682C19.9299 21.221 20.0659 21.2482 20.2033 21.2482C20.3407 21.2482 20.4767 21.221 20.6035 21.1682C20.7303 21.1154 20.8454 21.0379 20.9422 20.9404C21.0397 20.8437 21.1171 20.7286 21.17 20.6017C21.2228 20.4749 21.25 20.3389 21.25 20.2015C21.25 20.0641 21.2228 19.9281 21.17 19.8013C21.1171 19.6745 21.0397 19.5594 20.9422 19.4627L16.4673 14.9982Z" fill="white"/>
                </svg> <?php /*<img src="catalog/view/theme/default/image/Home/new-images/addon-back.svg" class="clspopup" style="float:right; cursor: pointer;">*/ ?>
              </span>
            </h2>
            <div class="occassions">
            <ul class="tabs addonsTab popup-tab-slide">
               <li class="active type-card-wrapper" rel="tab1">Tab 1</li>
               <li rel="tab2">Tab 2</li>
               <li rel="tab3">Tab 3</li>
               <li rel="tab4">Tab 4</li>
            </ul>
            </div>
            <div class="tab_container addonContainer">
               <!-- #tab1 -->
               <h3 class="tab_drawer_heading" rel="tab2">Tab 2</h3>
               <div id="tab2" class="tab_content">
                  <h2>Tab 2 content</h2>
                  <p>Nunc dui velit, scelerisque eu placerat volutpat, dapibus eu nisi. Vivamus eleifend vestibulum odio non vulputate.</p>
               </div>
               <!-- #tab2 -->
               <h3 class="tab_drawer_heading" rel="tab3">Tab 3</h3>
               <div id="tab3" class="tab_content">
                  <h2>Tab 3 content</h2>
                  <p>Nulla eleifend felis vitae velit tristique imperdiet. Etiam nec imperdiet elit. Pellentesque sem lorem, scelerisque sed facilisis sed, vestibulum sit amet eros.</p>
               </div>
               <!-- #tab3 -->
               <h3 class="tab_drawer_heading" rel="tab4">Tab 4</h3>
               <div id="tab4" class="tab_content">
                  <h2>Tab 4 content</h2>
                  <p>Integer ultrices lacus sit amet lorem viverra consequat. Vivamus lacinia interdum sapien non faucibus. Maecenas bibendum, lectus at ultrices viverra, elit magna egestas magna, a adipiscing mauris justo nec eros.</p>
               </div>
               <!-- #tab4 --> 
            </div>
            <div class="nothanks_continue">
                <span class="addTextCout" style="float: left;font-size: 15px;padding-top: 5px;font-weight: 700;"></span>
               <a href="javascript:void(0)" class="addon_continue" style="display: block;"> Continue without Add Ons</a> 
               <a href="javascript:void(0)" id="removeHide" class="" style="display: none;">SKIP</a>
            </div>
            <!-- .tab_container -->
         </div>
      </div>
   </div>
</div>

<style type="text/css">
  .semilar_products_section{
    position: fixed;
    top: 100%;
    left: 0;
    width: 100%;
    height: 100%;
    background:rgba(0,0,0,0.8);
    z-index: 2222;
    transition: 0.1s; 
  }
  .semilar_products_col{
    background:#f8f8f8;
    position: fixed;
    bottom: -100%;
    padding: 20px 0 10px 0;
    min-height: 200px;
    width: 100%;
    left: 0;
    z-index: 2223;
    transition: 0.2s;
  }
  .similar-close{
    position: absolute;
    right: 15px;
    top: 18px;
    width: 35px;
    text-align: right;
    cursor: pointer;
  }
  .slide-view-all-testimonial{
    width: 100%;
  }
  .slide-view-all-testimonial a{
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
  }
  .similar-close i{
    font-size: 25px;
  }
  .semilar_products_col h3{
    padding-left: 15px;
    font-size: 20px;
    font-weight: 600;
    color: #222222;
    margin-top: 0;
    margin-bottom: 20px;
  }
  .rating-count{
    background:#ffffff;
    padding: 5px 10px;
    border-radius: 20px;
    position: absolute;
    bottom: 10px;
    box-shadow: 0px 0px 2px #00000099;
    left: 5px;
    color: #444444; 
  }
  .similar_product_img_col{
    position: relative;
  }
  .similar_product_img_col img{
    max-width: 100%;
    border-top-right-radius: 3px;
    border-top-left-radius: 3px;
  }
  .review_count{
    position: absolute;
    right: 5px;
    bottom: 10px;
    border-radius: 20px;
    padding: 5px 10px;
    background:#ffffff;
    box-shadow: 0px 0px 2px #00000099;
    color: #444444;
  }
  .similar_product_row{
    border: 1px solid #dcdcdc;
    width: 250px;
    border-top-right-radius: 3px;
    border-top-left-radius: 3px;
    position: relative;
  }
  .similar_product_name_col{
    padding: 15px;
    background-color: #ffffff;
  }
  .mb-0{
    margin-bottom: 0;
  }
  .mt-0{
    margin-top: 0;
  }
  .slick_slider_simlar{
    padding-left: 15px;
  }
  .slick_slider_simlar .slick-slide{
    margin-right: 15px;
    transition: 0.3s;
  }
  .open_similar_products{
    padding: 8px 16px;
    font-size: 14px;
    text-transform: capitalize;
    font-weight: 500 !important;
    margin-bottom: 15px;
    position: absolute;
    bottom: 15px;
    left: 15px;
    z-index: 1;
    background: #fff;
    border-radius: 50px;
    border:1px solid #F65F73;
    color: #F65F73;
  }
  .open_similar_products:hover{
    border-color: #f195b2;
    color: #f195b2;
    cursor: pointer;
  }
  .similar_product_name_col h4{
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
  }
  .similar_text_height{
    height: 76.5px;
  }
  .productTabs .tab-content{
    width: 100%;
  }
  /*.image-additional a.thumbnail{
  	border: 1px solid #ddd !important;
  	margin-right: 10px;
  	cursor: pointer;
  }
  .thumbnails > li{
  	margin-left: 0;
  }
  .thumbnails .image-additional{
  	margin-left: 0;
  }*/
  @media screen and (max-width: 767px){
    .slick_slider_simlar .slick-slide{
      margin-right: 7px;
    }
    .slick_slider_simlar .slick-list{
      overflow: initial;
    }
    .review_count{
      display: none;
    }
    .semilar_products_col h3{
      font-size: 16px;
    }
    .similar-close i {
      font-size: 20px;
    }
    .slick_slider_simlar{
      width: 100%;
      overflow-x: auto;
      white-space: nowrap;
      display: flow-root;
      padding-left: 0;
    }
    .relatedProducts{
      padding-left: 0;
      padding-right: 0;
    }
    .slick_slider_simlar .similar_product_row.item, .slick_slider_simlar .category_main_row_col.item{
      width: 200px;
      display: inline-block;
      margin-right: 10px;
    }
    .similar_product_img_col {
      position: relative;
      width: 100%;
      padding-left: 10px;
      padding-right: 10px;
      background: #fff;
      height: 150px;
    }
    .similar_product_img_col img{
      margin: auto;
      max-height: 100%;
    }
    .similar_product_row.item a{
      /*display: inline-block;*/
      width: 100%;
    }
    .similar_text_height{
      height: 55px;
    }
    .col-sm-5.product-img-box{
    	top: 120px;
    }
    .col-sm-7.product-shop.product-shop-height{
    	margin-top: calc(100vw - -80px);
    }
  }
</style>
<div class="semilar_products_section"></div>
<div class="semilar_products_col" style="visibility:hidden;">
  <h3>Similar Products</h3>
  <div class="similar-close">
     <i class="fa fa-close"></i>
  </div>
    <div class="container">
      <div class="slick_slider_simlar">
        <?php foreach ($similarProducts as $product) { ?>
          <div class="similar_product_row item">
            <a href="<?= $product['href']; ?>">
              <div class="similar_product_img_col">
                <img src="<?= $product['thumb']; ?>" alt="<?= $product['name']; ?>" title="<?= $product['name']; ?>" class="img-responsive" />
                <?php if ($product['rating']) { ?>            
                <div class="rating-count" style="display: none;">
                  <?php for ($j = 1; $j <= 5; $j++) { ?>
                   <?php if ($product['rating'] < $j) { ?>
                   <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                   <?php } else { ?>
                   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                   <?php } ?>
                   <?php } ?>
                </div>
                <?php } ?>
                <div class="review_count">
                  <span><?= $product['reviews']; ?> Reviews</span>
                </div>
              </div>
              <div class="similar_product_name_col">
                <div>
                  <h4 class="mt-0"><?= $product['name']; ?></h4>
                </div>
                <div>
                  <?php if ($product['price']) { ?>
                  <p class="price mb-0" style="font-weight: 700;color: #353535;">
                     <?php if (!$product['special']) { ?>
                     <?= $product['price']; ?>
                     <?php } else { ?>
                     <span class="price-new"><?= $product['special']; ?></span> <span class="price-old"><?= $product['price']; ?></span>
                     <?php } ?>
                     <?php if ($product['tax']) { ?>
                     <span class="price-tax"><?= $text_tax; ?> <?= $product['tax']; ?></span>
                     <?php } ?>
                  </p>
                  <?php } ?>
                </div>
              </div>
            </a>
          </div>
        <?php } ?>
        <div class="item similar_product_row position-relative ">
        <div class="similar_product_img_col">
          <img src="catalog/view/theme/default/image/Home/white-img.jpg" alt="" class="img-responsive">
        </div>
        <div class="slide-view-all-testimonial">
                <a href="/<?php echo $parent_cat_url['keyword'] ?>" tabindex="0">View All  &nbsp; <img class="view-arrow" src="catalog/view/theme/default/image/Home/arrow-right-black.png" alt=""></a>
            </div>
        <div class="similar_product_name_col similar_text_height"></div>
        </div>
      </div>
    </div>
</div>

<!--start of Badge Script-->
<!-- <script src="https://apis.google.com/js/platform.js?onload=renderBadge" async defer></script> 
<script> 
   window.renderBadge = function() { 
     var ratingBadgeContainer = document.createElement("div"); 
     document.body.appendChild(ratingBadgeContainer); 
     window.gapi.load('ratingbadge', function() { 
       window.gapi.ratingbadge.render(ratingBadgeContainer, {"merchant_id": 8438118}); 
     }); 
   } 
</script> -->
<!--End of Badge Script-->
<!-- BEGIN GCR Language Code -->
<script>
   window.___gcfg = {
     lang: 'en'
   };
</script>
<!-- END GCR Language Code -->
</div>
<script type="text/javascript">
   function checkButton(){
     document.getElementById("pincodecheck").disabled = false;
   }
   
   
   $(document).ready(function() {
     $("#pincodecheck").click(function() {
       var pin_code = $("#pincode-feild").val();
       var CheckZipCode = /(^\d{6}$)/;
        if(CheckZipCode.test(pin_code)){
              $.ajax({
       url: 'index.php?route=product/product/getPin',
       method: 'POST',
       data: {pincode1:pin_code},
       success: function(data) {
         //console.log(data);
         //$(".check-pincode-form").after().html(data);
         $("#pin-availablity").html(data);
       }
     });
        }
        else{
       alert("Your Entered Zip Code Is Not Valid."); 
        } 
        //alert(pin_code);
        /*$.ajax({
       url: 'index.php?route=product/product/getPin',
       method: 'POST',
       data: {pincode1:pin_code},
       success: function(data) {
         //console.log(data);
         //$(".check-pincode-form").after().html(data);
         $("#pin-availablity").html(data);
       }
     });*/
     });
     var dateToday = new Date();
        $( function() {
          $( "#datetimeshipping" ).datepicker({
             minDate: dateToday,
             dayNamesMin: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
          });
      });

      var cale_max_length = 30; 
      $('.cake_msg_valid').keyup(function () {
          var cakelen = cale_max_length - $(this).val().length; 
          //alert(cakelen);
          $('.show_lnh_text').text(cakelen); 
      }); 
   });
</script>
<!-- <script src="https://apis.google.com/js/platform.js?onload=renderBadge" async defer></script> 
<script> 
   window.renderBadge = function() { 
     var ratingBadgeContainer = document.createElement("div"); 
     document.body.appendChild(ratingBadgeContainer); 
     window.gapi.load('ratingbadge', function() { 
       window.gapi.ratingbadge.render(ratingBadgeContainer, {"merchant_id": 8438118, "position": "BOTTOM_LEFT"}); 
     }); 
   } 
</script> -->
<!--End of Badge Script-->
<!-- BEGIN GCR Language Code -->
<script>
   window.___gcfg = {
     lang: 'en'
   };

   //show date time popup
    $('#delDate').click(function(){
      $('.bg_img').show();
      $('.select-info-popup').show();
    });
    /*setTimeout (function(){
        $('.popup-tab-slide').slick({
        infinite: false,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: false,
        autoplay: false,
      });
    },1000);*/

  if($(window).width() > 767){
    $('.slick_slider_simlar').slick({
      infinite: false,
      slidesToShow: 4,
      slidesToScroll: 4,
      arrows: true,
      autoplay: false,
      pauseOnHover: false,
      speed:300,
      responsive: [
        {
          breakpoint: 1190,
          settings: {
            slidesToShow: 4,
            slidesToScroll: 4,
            infinite: false,
            dots: true
          }
        },
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 4,
            slidesToScroll: 3,
            infinite: false,
            dots: true
          }
        },
        {
          breakpoint: 767,
          settings: {
            slidesToShow: 3.5,
            infinite: false,
            slidesToScroll: 2
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 2.1,
            speed:100,
            infinite: false,
            slidesToScroll: 2
          }
        }
      ]
    });
  }

  $(document).ready( function(){
  $('.show_review_slider').click(function(){
    $('.review-slider').slick({
    infinite: false,
    slidesToShow: 3,
    slidesToScroll: 1,
    centerMode: false,
    //variableWidth: true,
    //arrows: true,
    //autoplay: true,
    //autoplaySpeed: 2000,
    responsive: [
        {
          breakpoint: 1200,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 991,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 767,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
          {
          breakpoint: 420,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
            dots:true
          }
        }
      ]
    });
    $('.review-slider').resize();
  });
});

    $('.open_similar_products').on('click', function() {
      $('.semilar_products_section').animate({'top':'0'},200);
      $('.semilar_products_col').animate({'bottom':'0'},300);
      $('.semilar_products_col').css('visibility','visible');
      $('body').addClass('addon-overflow');
    });
    $('.semilar_products_section, .similar-close').on('touchstart click', function(event) {
      $('.semilar_products_section').animate({'top':'100%'},200);
      $('.semilar_products_col').animate({'bottom':'-100%'},300);
      $('.semilar_products_col').css('visibility','hidden');
      $('body').removeClass('addon-overflow');
    });

</script>

<script type="text/javascript">
$(document).on("click", ".js-add-button > .product-addon-add", function() { 
  //alert("click");
  $(this).hide();
    $(this).next('.added-btn').show();
    $(this).prev('.remove-addon').show(); 

  $('.js-add-button > .remove-addon').click (function(){
    $(this).hide();
    $(this).next('.product-addon-add').show();
    $(this).next().next('.added-btn').hide();
  });
});  

$(document).ready(function(){
  $('#stars label').on('click', function(){
      var onStar = parseInt($(this).data('value'), 10);
      var stars = $(this).parent().children('label.fill_rating');
      //alert(onStar);
      for (i = 0; i < stars.length; i++) {
        $(stars[i]).removeClass('star_selected');
      }
      
      for (i = 0; i < onStar; i++) {
        $(stars[i]).addClass('star_selected');
      }
  });
  $('#button-review').html('Submit review');
  //$('#review div.text-right').remove();
  var productMainPrice = <?php echo $mainprice; ?>;
  var productOldPrice = <?php echo $oldmainprice; ?>;
  var servingWeight = [];
  servingWeight['0.5 Kg'] = "4-5 People";
  servingWeight['1 Kg'] = "8-10 People";
  servingWeight['1.5 Kg'] = "12-15 People";
  servingWeight['2 Kg'] = "16-20 People";
  servingWeight['2.5 Kg'] = "22-25 People";
  servingWeight['3 Kg'] = "25-30 People";
  servingWeight['4 Kg'] = "35-40 People";
  servingWeight['5 Kg'] = "50-55 People";
  servingWeight['6 Kg'] = "60-65 People";
  servingWeight['7 Kg'] = "70-80 People";
  servingWeight['8 Kg'] = "90-100 People";
  $('.weight_cake_btn').on('click', function(){
    $('.weight_cake_btn').removeClass('selected_weight');
    $(this).addClass('selected_weight');
    var newProductPrice = (parseInt(productMainPrice) + parseInt($(this).attr('price')));
    $('.pro_price').html('₹'+newProductPrice);
    var wei = $(this).attr('opttext');
    if(parseInt(productOldPrice) > parseInt(productMainPrice)){
    	var newProductOldPrice = (parseInt(productOldPrice) + parseInt($(this).attr('price')));
    	$('.pro_price_old').html('₹'+newProductOldPrice);
      $('.pro_price_old_percent').html((((newProductOldPrice - newProductPrice) / (newProductOldPrice)) * 100).toFixed(2)+'%');
      $('.pro_price_old_percent').show();
    } else {
      $('.pro_price_old_percent').hide();
    }
    var ps = "Product Weight: "+wei+"<br>Serving Size: "+servingWeight[wei]+"<br>Delivered along with knife and candles.";
    $('.pspec').html(ps);
    $('.pspeccon').show();
  });

});
$(window).load(function(){
  jQuery(".weightradio").first().click();
    //var step_nbr = 2;
    //var min_nbr = 3;
    /*$('#review').each(function() {
      var LiN = $(this).find('table').length;
      if (LiN > 3) {
        $('table', this).eq(2).nextAll().hide().addClass('toggleable');
        $(this).append('<div class="more">View more review</div>');
      }
    });
    $('#review').on('click', '.more', function() {
      if ($(this).hasClass('less')) {
        $(this).text('View more review').removeClass('less');
      } else {
        $(this).text('View less review').addClass('less');
      }
      $(this).siblings('table.toggleable').slideToggle();
    });*/

    var prod_img_count = $('.product-img-box .thumbnails li').length;
    if(prod_img_count > 1){
    	$('.product-shop').addClass('product-shop-height');
    }
});
</script>
