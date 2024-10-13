<?php echo $header; ?>
<meta name="robots" content="noindex,nofollow">
<style type="text/css">
  .content-mdl{
    font-size: 25px;
    padding-top: 85px;
    text-align: center;
    height:200px; 
    color: #000000;
    border-radius:15px;
  }

  .name-cont{
    float: left;
    margin-left: 10px;
    font-size: 14px;
    margin-top: 10px;
    text-decoration: none;
    color: #F65F73;
    padding: 8px 20px;
    border:1px solid #F65F73;
    display: inline-table;
    min-width: 80px;
    text-align: center;
    border-radius: 50px;
  }

  .name-cont:hover{
    /*color: #ffffff;*/
    outline: none;
    color: #ffffff;
    background:#F65F73;  
  }

  .name-row{
    margin-bottom: 20px;
  }

  .responseFilter ul {
    background: #fff;
    margin: 0;
    float: initial;
    width: 100%;
    white-space: initial;
    padding-left: 0px;
    overflow: auto;
    text-align:left;
    border-bottom-left-radius: 6px;
    border-bottom-right-radius: 6px;
}

.responseFilter ul li {
    padding: 9px 20px;
    background: #fff;
    margin: 0;
    list-style: none;
    display: inline-block;
    font-size: 12px;
    cursor: pointer;
    width: 100%;
}
.responseFilter ul li a{
  color: #22303D;
}
.space-between{
  justify-content: space-between;
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
.bachelorette_cakes{
  display: none;
}
.wedding_cakes{
  display: none;
}
.kids_cake_category{
  display: none;
}
.birthday_category, .new_year_banner, .regular_cakes_category{
  display: none;
}
.product-category-29 .kids_cake_category{
  display: block;
}
.product-category-50 .birthday_category{
  display: block;
}
.product-category-52 .wedding_cakes{
  display: block;
}
.product-category-187 .bachelorette_cakes{
  display: block;
}
.product-category-4 .regular_cakes_category{
  display: block;
}
.product-category-65 .new_year_banner{
  display: block;
  margin-top: 120px;
}
.product-category-65 .new_year_banner img{
  width: 100%;
}
body.product-category-65.offermsg .container.top_positionn{
  margin-top: 15px;
}
.topfilterrow.filter-fixdown, .topfilterrow.filter-fixup{
  background:none;
}
.col-sm-8.filterBox {
    width: 100%;
    padding-top: 0px;
    padding-right: 0;
}
.responseFilter{
  padding-top: 15px;
    padding-bottom: 10px;
}
.desk-filter-clear {
    color: #22303D;
    font-size: 16px;
    text-transform: uppercase;
    padding-top: 13px;
    position: relative;
    display: inline-block;
}
.desk-filter-clear:hover, .desk-filter-clear:focus{
  text-decoration: underline;
  color: #22303D;
}
.pagination>.active>span{
  background-color: #495461;
  border-color: #495461;
}
.pagination>li>a:hover, .pagination>.active>span:hover{
  background-color: #495461;
  border-color: #495461;
  color: #ffffff;
}
.mob-pagination ul.pagination {
    width: 100%;
    margin-top: 15px;
}
.mob-pagination .pagination>li>a{
  width: 49%;
  text-align: center;
  color: #fff;
  background-color: #495461;
}
.mob-pagination .pagination>li:last-child a{
  margin-left: 2%;
}
.product-info-detail{
  padding-left: 10px;
  cursor: pointer;
  visibility: hidden;
  opacity: 0;
}
.product-info-detail i{
  font-size: 18px;
}
.product-info-dialog-bg{
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 121212222;
  background:rgba(0, 0, 0, 0.9);
  display: none;
}
.product-info-dialog{
  position: absolute;
  bottom: 0;
  width: 100%;
  height: auto;
  background:#ffffff;
  border-top-right-radius: 15px;
  border-top-left-radius: 15px;
}
.p-15{
  padding: 15px;
}
.pb-0{
  padding-bottom: 0;
}
.close-dialog{
  text-align: right;
}
.close-dialog i{
  font-size: 20px;
  cursor: pointer;
}
.kg-btn-ul{
  list-style: none;
  flex-wrap: wrap;
  padding-left: 0;
  padding-top: 10px;
  margin-bottom: 0;
}
.attrivuet-list{
  list-style: none;
  padding-left: 0;
  margin-bottom: 0;
}
.attrivuet-list li{
  margin-bottom: 10px;
  font-size: 16px;
}
.attrivuet-list li:last-child{
  margin-bottom: 0;
}
.weight_cake_btn {
    padding: 10px 15px;
    display: inline-block;
    margin-right: 10px;
    margin-bottom: 10px;
    font-size: 14px;
    border: 1px solid ;
    border-radius: 6px;
    font-weight: 500 !important;
    white-space: nowrap !important;
}
.margin-bottom-15{
  margin-bottom: 15px;
}
.margin-bottom-30{
  margin-bottom: 30px;
}
.full-width-btn{
  width: 100%;
} 
.border-radius-none{
  border-radius: 0;
}
.review-card {
  margin-left: 0;
  margin-top: 0;
  margin-bottom: 0;
}
.review_text_cat{
  margin-bottom: 0 !important;
}
.category_main_row_col .product-thumb{
  position: relative;
}
.best-seller{
  /*background-color: #F65F73;*/
  color: #ffffff;
  background-image: url('catalog/view/theme/default/image/best-seller.svg');
  background-repeat: no-repeat;
  background-size: cover; 
  padding: 5px 10px;
  position: absolute;
  z-index: 1;
  top: 20px;
  left: 0px;
  font-weight: 500;
  width: 108px;
  height: 28px;
}
@media screen and (max-width: 767px){
  .product-info-detail{
    visibility: visible;
    opacity: 1;
  }
  .xs-category-filter{
    width: 100%;
    position: fixed;
    z-index: 122;
    background: #ffffff;
    height: 100%;
    top: 100%;
    left: 0;
    opacity: 0;
  }
  .filter_hd{
    padding: 12px 10px;
    position: relative;
    box-shadow: -1px 2px 2px rgb(0 0 0 / 16%);
    font-size: 18px;
  }
  .clear_filter{
    text-decoration: none;
    outline: inherit;
    color: #F65F73;
  }
  .clear_filter:hover{
    outline: inherit;
    color: #F65F73;
  }
  .space-between{
    justify-content: space-between;
  }
  .filter_category_col{
    height: calc(100vh - 60px);
    width: 100%;
  }
  .sidebar_filters{
    height: calc(100% - 32px);
    overflow: auto;
    background: #f2f2f2;
    width: 136px;
    float: left;
    border-right: 1px solid #c9c9c9;
    padding-left: 0;
    font-size: 16px;
  }
  .sidebar_filters li{
    margin-right: -1px;
    padding: 20px 10px 20px 20px;
    border-bottom: 1px solid #c9c9c9;
  }
  .sidebar_filters li.active{
    background: #fff;
  }
  .filter_apply{
    position: fixed;
    bottom: 0;
    width: 100%;
    left: 0;
    right: 0;
    z-index: 5;
    display: none;
  }
  .apply_filter_btn{
    position: initial !important;
    font-size: 18px;
    color: #ffffff;
    outline: inherit;
    margin-top: 0 !important;
    height: initial;
  }
  .select_filter_option{
    position: absolute;
    left: 136px;
    top: 52px;
    width: calc(100% - 136px);
    height: 100%;
    display: none;
  }
  .select_filter_option ul{
    padding-left: 10px;
    list-style: none;
  }
  .select_filter_option li {
    padding: 15px 10px 15px 20px;
    color: #404040;
  }
  .select_filter_option li a{
    color: #404040;
  }
  .select_filter_option ul li.dropdown > a:after {
    content: "";
    border-top: 1px solid #404041;
    border-left: 1px solid #404041;
    border-right: 0px solid transparent;
    width: 9px;
    height: 9px;
    position: absolute;
    left: 0px;
    top: 22px;
    -webkit-transform: rotate(136deg);
    -moz-transform: rotate(136deg);
    -khtml-transform: rotate(136deg);
    -ms-transform: rotate(136deg);
    transform: rotate(136deg);
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -o-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;
  }
  .sidebar_filters li.active .select_filter_option{
    display: block;
  }
  .select_filter_option .dropdown> ul{
    display: none;
  }
  .dropdown.open> ul{
    display: block;
  }
  .dropdown.open>a:after{
    -webkit-transform: rotate(227deg) !important;
    -moz-transform: rotate(227deg) !important;
    -khtml-transform: rotate(227deg) !important;
    -ms-transform: rotate(227deg) !important;
    transform: rotate(227deg) !important;
  }
  .dropdown-backdrop{
    position: initial;
  }
  .align-items-center{
    align-items: center;
  }
  .rating_col{
    display: inline;
    background-color: #219652;
    padding: 3px 10px;
    color: #fff;
    border-radius: 3px;
    font-size: 12px;
    margin-right: 10px;
  }
  .m-r-5{
    margin-right: 5px;
  }
  .m-b-0{
    margin-bottom: 0;
  }
  .check_selected_show{
    display: none;
  }
  .check_selected_show i{
    color: #219652;
  }
  .selected .check_selected_show{
    display: block;
  }
  .xs-mb-15{
    margin-bottom: 15px !important;
  }
  .xs-pl-0{
    padding-left: 0;
  }
  .xs-pr-0{
    padding-right: 0;
  }
  .responseFilter {
    padding-bottom: 0;
  }
  .item-add-input{
    min-width: initial !important;
    width: 30px !important;
  }
  .pricebox{
    padding-right: 10px !important;
    padding-left: 10px !important;
    font-size: 12px;
  }
}
@media screen and (min-width: 767px){
  .xs-category-filter{
    display: none;
  }
  .category_main_row_col .product-thumb{
    height: 385px;
  }
}
</style>
<div class="container top_positionn category_main_row_col">
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
    <div class="form_box"> 
     <h1 class="xs-pl-15 xs-pr-15"><?php echo $heading_title; ?></h1>
      <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
          </div>
        </div>
        <p>
          <label class="checkbox-inline">
            <?php if ($description) { ?>
            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="description" value="1" id="description" />
            <?php } ?>
            <?php echo $entry_description; ?></label>
          </p>
          
          </div>
          <h2 class="xs-pr-15 xs-pl-15 mb-15"><?php echo $text_search; ?></h2>
          <?php if ($products) { ?>
          <div class="row select_grid-list">
            <div class="col-md-2 col-sm-6 hidden-xs">
              <div class="btn-group btn-group-sm">
                <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
              </div>
            </div>

            <?php /* ?>
            <div class="col-md-3 col-sm-6">
              <div class="form-group">
                <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
              </div>
            </div>
            <div class="col-md-4 col-xs-6">
              <div class="form-group input-group input-group-sm">
                <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
                <select id="input-sort" class="form-control" onchange="location = this.value;">
                  <?php foreach ($sorts as $sorts) { ?>
                  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="col-md-3 col-xs-6">
              <div class="form-group input-group input-group-sm">
                <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
                <select id="input-limit" class="form-control" onchange="location = this.value;">
                  <?php foreach ($limits as $limits) { ?>
                  <?php if ($limits['value'] == $limit) { ?>
                  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <?php */ ?>

          </div>
          <div class="row category category_main_col">
            <?php foreach ($products as $product) { ?>
             <div class="product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-6">
                <div class="product-thumb hover-zoom-col">
                  <?php if($product['purchased'] > 5){ ?>
                    <div class="best-seller">Best Seller</div>
                  <?php } ?>
                  <div class="image"><a href="<?php echo $product['href']; ?>" target="_blank"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive img-zoom" /></a></div>
                  <div class="add_wish_list">
                    <button type="button" data-toggle="" title="<?php //echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                      <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" fill="none">
                      <rect width="32" height="32" rx="16" fill="white"/>
                      <path d="M15.7087 24.2955L15.703 24.2931L15.6849 24.2832C15.5793 24.2251 15.4746 24.1655 15.3707 24.1044C14.1217 23.3622 12.9545 22.4904 11.8884 21.5033C10.0004 19.7417 8 17.1275 8 13.9078C8 11.5054 10.0217 9.60016 12.4619 9.60016C13.1403 9.59683 13.8107 9.74649 14.4232 10.038C15.0358 10.3295 15.5747 10.7553 16 11.2838C16.4254 10.7552 16.9644 10.3293 17.5771 10.0378C18.1898 9.7463 18.8604 9.59671 19.5389 9.60016C21.9783 9.60016 24 11.5054 24 13.9078C24 17.1284 21.9996 19.7425 20.1116 21.5025C19.0455 22.4896 17.8783 23.3614 16.6293 24.1035C16.5255 24.165 16.4207 24.2249 16.3151 24.2832L16.297 24.2931L16.2913 24.2964L16.2888 24.2972C16.1998 24.3443 16.1007 24.369 16 24.369C15.8993 24.369 15.8002 24.3443 15.7112 24.2972L15.7087 24.2955Z" fill=""/>
                      </svg>
                    </button>
                    <?php /*<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> */?>
                  </div>
                  <div href="<?php echo $product['href']; ?>" target="_blank" class="product_sort_detail">
                    <div class="caption" style="margin-bottom: 0;">
                      <p class="cat_product_title" style="margin: 8px 0 10px 0;height:auto;"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a>
                        <span class="product-info-detail" proId="<?php echo $product['product_id']; ?>" title="<?php echo $product['name']; ?>" hrftag="<?php echo $product['href']; ?>"><i class="fa fa-info-circle"></i></span>
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

                        <?php if(isset($product['reviewcnt']) && $product['reviewcnt'] > 0){ ?>
                          <p class="review_text_cat"><?php echo $product['reviewcnt']; ?> Reviews</p>
                        <?php } ?>
                        </div>
                      </div>
                    </div>
                    <div class="button-group">
                      <?php if($product['quantity'] > 0) { ?>
                        <a class="anchor" target="_blank" href="<?php echo $product['href']; ?>"  >  <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></a> 
                      <?php } else { ?>
                        <a class="anchor danger" href="javascript:void(0);"><span class="hidden-xs hidden-sm hidden-md" >Out of Stock</span></a> 
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            <?php } ?>
          </div>
          <div class="row ">
            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
          </div>
          <?php } else { ?>
          <div class="text-center xs-pl-15 xs-pr-15">
              <h3 style="color: #e53333;"><?php echo 'Sorry, no results found.' //$text_empty; ?></h3>
              <p>Please try searching for something else.</p>
          </div>
          
          <div class="col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0  xs-pl-15 xs-pr-15" style="margin-bottom: 20px;">
            <h3 style="margin-bottom: 20px;">Search Instead:</h3>
            <div class="search-tab-cakes">
              <ul class="d-flex">
                <li><a href="https://www.flavoursguru.com/regular-cakes">Normal Cream Cakes <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/birthday">Birthday Cakes <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/anniversary">Anniversary Cakes <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/kids">Cake For Kids <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/cartoon-cakes">Cartoon Cakes <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/custom-theme-cakes">Theme Cakes <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/wedding">Wedding Cakes <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/bachelorette-cake">Bachelorette Cakes <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/pull-me-up-cake">Pull Me Cakes <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/pinata-cakes">Pinata Cakes <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/cakes-by-profession">Cakes By Profession <i class="fa fa-angle-right"></i></a></li>
                <li><a href="https://www.flavoursguru.com/bomb-cake">Bomb Cakes <i class="fa fa-angle-right"></i></a></li>
              </ul>
            </div>
          </div>
          <div class=" xs-pl-15 xs-pr-15">
            <img style="border-radius: 10px;" src="catalog/view/theme/default/image/custom-cake.jpg" alt="" class="img-responsive">
          </div>
          <div class="">
            <h3 class=" xs-pl-15 xs-pr-15">Best Seller</h3>
            <div class="row category category_main_col">
              <?php foreach ($productsNotFound as $product) { ?>
              <div class="product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-6">
                <div class="product-thumb hover-zoom-col">
                  <?php if($product['purchased'] > 5){ ?>
                    <div class="best-seller">Best Seller</div>
                  <?php } ?>
                  <div class="image"><a href="<?php echo $product['href']; ?>" target="_blank"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive img-zoom" /></a></div>
                  <div class="add_wish_list">
                    <button type="button" data-toggle="" title="<?php //echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                      <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" fill="none">
                      <rect width="32" height="32" rx="16" fill="white"/>
                      <path d="M15.7087 24.2955L15.703 24.2931L15.6849 24.2832C15.5793 24.2251 15.4746 24.1655 15.3707 24.1044C14.1217 23.3622 12.9545 22.4904 11.8884 21.5033C10.0004 19.7417 8 17.1275 8 13.9078C8 11.5054 10.0217 9.60016 12.4619 9.60016C13.1403 9.59683 13.8107 9.74649 14.4232 10.038C15.0358 10.3295 15.5747 10.7553 16 11.2838C16.4254 10.7552 16.9644 10.3293 17.5771 10.0378C18.1898 9.7463 18.8604 9.59671 19.5389 9.60016C21.9783 9.60016 24 11.5054 24 13.9078C24 17.1284 21.9996 19.7425 20.1116 21.5025C19.0455 22.4896 17.8783 23.3614 16.6293 24.1035C16.5255 24.165 16.4207 24.2249 16.3151 24.2832L16.297 24.2931L16.2913 24.2964L16.2888 24.2972C16.1998 24.3443 16.1007 24.369 16 24.369C15.8993 24.369 15.8002 24.3443 15.7112 24.2972L15.7087 24.2955Z" fill=""/>
                      </svg>
                    </button>
                    <?php /*<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> */?>
                  </div>
                  <div href="<?php echo $product['href']; ?>" target="_blank" class="product_sort_detail">
                    <div class="caption" style="margin-bottom: 0;">
                      <p class="cat_product_title" style="margin: 8px 0 10px 0;height:auto;"><a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a>
                        <span class="product-info-detail" proId="<?php echo $product['product_id']; ?>" title="<?php echo $product['name']; ?>" hrftag="<?php echo $product['href']; ?>"><i class="fa fa-info-circle"></i></span>
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

                        <?php if(isset($product['reviewcnt']) && $product['reviewcnt'] > 0){ ?>
                          <p class="review_text_cat"><?php echo $product['reviewcnt']; ?> Reviews</p>
                        <?php } ?>
                        </div>
                      </div>
                    </div>
                    <div class="button-group">
                      <?php if($product['quantity'] > 0) { ?>
                        <a class="anchor" target="_blank" href="<?php echo $product['href']; ?>"  >  <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></a> 
                      <?php } else { ?>
                        <a class="anchor danger" href="javascript:void(0);"><span class="hidden-xs hidden-sm hidden-md" >Out of Stock</span></a> 
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
            
          </div>
          <?php } ?>
          <?php echo $content_bottom; ?></div>
          <?php echo $column_right; ?></div>
        </div>
<div class="product-info-dialog-bg">
  <div class="product-info-dialog">
    <div class="p-15 pb-0">
      <div class="close-dialog">
        <i class="fa fa-close"></i>
      </div>
      <div class="margin-bottom-30">
        <h3 style="margin-top: 0;margin-bottom: 0;" class="individualproducttitle"></h3>
      </div>
      <div class="display-flex margin-bottom-30 individualreview">
        <div class="review-card" style="margin-top: 0;margin-left: 0;margin-right: 15px;margin-bottom: 0;">
          <span>5 </span><span>&nbsp; <i class="fa fa-star"></i></span>
        </div>
        <div>
            <p style="margin-bottom: 0;" class="individualproductreview"></p>
        </div>
      </div>
      <div class="margin-bottom-30">
        <ul class="attrivuet-list">
          
        </ul>
      </div>
      <div class="margin-bottom-30 individualweightoption">
        <p style="font-weight: 600;font-size: 18px;">Weight Options</p>
        <ul class="display-flex kg-btn-ul">
        </ul>
      </div>
    </div>
    <div>
      <a target="_blank" href="" class="btn-primary btn full-width-btn border-radius-none hrftag">Order Now</a>
    </div>
  </div>
</div>        
<style>
.anchor{float: none;
    width: auto;
    border: 1px solid #632f53;
    background: none;
    color: #404040;
    font-size: 13px;
    font-weight: 300;
    text-transform: uppercase;
    padding: 2px 6px;
    line-height: normal;}
    .search-tab-cakes ul {
      padding-left: 0;
      list-style: none;
    }
    .d-flex {
      display: flex;
      flex-wrap: wrap;
  }
  .search-tab-cakes ul li {
      margin-right: 15px;
      margin-bottom: 10px;
  }
  .search-tab-cakes ul li a {
      padding: 9px 15px;
      background-color: #ffffff;
      display: inline-block;
      box-shadow: 0 2px 3px rgb(0 0 0 / 20%);
      color: #404040;
      font-weight: 500;
      font-size: 16px;
  }
</style>
<script type="text/javascript">
  $(document).ready(function(){
    $(".add_wish_list").click(function () {
      $(this).toggleClass('item_added');
    });

    $('.product-info-detail').on('click', function(){
      var proId = $(this).attr('proId');
      var title = $(this).attr('title');
      var hrftag = $(this).attr('hrftag');
      $('.hrftag').attr("href", hrftag);
      $.ajax({
         type: "GET",
         url: <?= '"'.HTTP_SERVER.'index.php?route=product/category/proIDetails"' ?>,
         data: {proId:proId},
         cache: false,
         success: function(data){
          var obj = JSON.parse(data);
          var attributehtml = "";
          var optionhtml = "";
          for(var i in obj.attribute){
            attributehtml += '<li><i class="fa fa-check" style="margin-right: 15px;"></i> '+obj.attribute[i]['name']+': '+obj.attribute[i]['text']+'</li>';
          }

          for(var i in obj.options){
            optionhtml += '<li class="weight_cake_btn">'+obj.options[i]+'</li>';
          }
          if(attributehtml){
            $('.attrivuet-list').html(attributehtml);
          }
          if(optionhtml){
            $('.kg-btn-ul').html(optionhtml);
            $('.individualweightoption').show();
          } else {
            $('.individualweightoption').hide();
          }
          $('.individualproductreview').html(obj.reviewCnt+" Reviews");
          if(parseInt(obj.reviewCnt) > 0){
            $('.individualreview').show();  
          } else {
            $('.individualreview').hide();
          }
          $('.individualproducttitle').html(title);
          
          $('.product-info-dialog-bg').fadeIn();    
         }
       })
      
    });
    $('.close-dialog, .btn.full-width-btn').on('click', function(){
      $('.product-info-dialog-bg').fadeOut();
    });
  });
</script>        
        

<?php echo $footer; ?>