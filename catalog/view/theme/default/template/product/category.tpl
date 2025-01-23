<?php echo $header; ?>
<script type="text/javascript">
  <?php $allg4 = array(); $ab = 0; foreach ($products as $product) {
    $arr = array();
    $arr['item_id'] = $product['sku'];
    $arr['item_name'] = $product['name'];
    $arr['index'] = $ab;
    $arr['item_brand'] = "Flavours Guru";
    $arr['item_category'] = $heading_title;
    $arr['price'] = (int)$product['mainp'];
    $arr['quantity'] = 1;
    $arr['item_list_id'] = $category_id;
    $arr['item_list_name'] = $heading_title;
    $allg4[] = (object)$arr;
    $ab++;
  } ?>
  dataLayer.push({ ecommerce: null });  // Clear the previous ecommerce object.
  dataLayer.push({
  event: "view_item_list",
  ecommerce: {
    items: <?php echo json_encode($allg4); ?>
  }
});
</script>
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
.birthday_category, .new_year_banner, .regular_cakes_category, .anniversary_category, .christmas_category, .newyear_category{
	display: none;
}
.product-category-29 .kids_cake_category{
	display: block;
}
.product-category-51 .anniversary_category{
	display: block;
}
.product-category-50 .birthday_category{
	display: block;
}
.product-category-90 .christmas_category{
  display: block;
}
.product-category-65 .newyear_category{
  display: block;
}
.home-header-tab{
	margin-top: 15px;
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
  /*margin-top: 15px;*/
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
.expand-tab .view-all-cat-tab{
	position: relative;
	margin-bottom: 25px;
  display: inline-flex;
}
.view_less_text{
  display: none;
}
.expand-tab .view_less_text{
  display: block;
}
.expand-tab .view_all_text{
  display: none;
}
.expand-tab .row.name-row{
	height: auto;
    overflow: initial;
    max-height: initial;
}
.expand-tab .cat-disable-tab-split{
	display: none;
}
.view-all-cat-tab img{
	transition: 0.3s;
}
.expand-tab .view-all-cat-tab img{
	transform: rotate(180deg);
}
.product-thumb.hover-zoom-col{
  display: inline-block;
}
.add_wish_list{
  z-index: 1;
}
.responseFilter h2{
	font-size: 18px;
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
    height: calc(100% - 100px);
    display: none;
    overflow-y: auto;
    overflow-x: hidden;
  }
  .select_filter_option ul{
    padding-left: 10px;
    list-style: none;
  }
  .select_filter_option li {
    padding: 15px 10px 15px 22px;
    color: #404040;
    position: relative;
  }
  .select_filter_option li:before{
    content: '';
    position: absolute;
    width: 16px;
    height: 16px;
    border: 1px solid #F65F73;
    left: 0;
    top: 17px;
    padding: 5px;
    border-radius: 3px;
  }
  .select_filter_option li a{
    color: #404040;
    font-size: 14px;
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
    position: absolute;
    left: 1px;
    top: 16px;
  }
  .check_selected_show i{
    color: #F65F73;
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
  .xs-filterItself{

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

<div class="xs-category-filter">
    <div class="filter_hd display-flex space-between">
      <div class="back_filter">
        <i class="fa fa-chevron-left" style="margin-right: 10px;"></i>
        <span>FILTER</span>
      </div>
      <div class="">
        <a href="javascript:void()" class="clear_filter clear_filterall">CLEAR ALL</a>
      </div>
    </div>
    <div class="filter_category_col">
      <ul class="sidebar_filters">        
        <?php foreach ($nfilter['filter_groups'] as $filter_group) { ?>
        <li>
          <div class="">
            <span><?php echo $filter_group['name']; ?></span>
            <div class="select_filter_option">
              <ul>
                <?php foreach ($filter_group['filter'] as $filter) { ?> 
                  <li>
                    <?php $selected = false; if (in_array($filter['filter_id'], $nfilter['filter_category'])) {
                      $selected = true;
                    } ?>
                    <a href="javascript:void(0)" class="display-flex xs-filterItself <?php echo ($selected) ? 'selected' : ''; ?>" filterId="<?php echo $filter['filter_id']; ?>">
                      <span class="m-r-5 check_selected_show"><i class="fa fa-check"></i></span>
                      <span><?php echo $filter['name']; ?></span>
                    </a>
                  </li>
                <?php } ?>
              </ul>
            </div>
          </div>
        </li>
        <?php } ?>
      </ul>
    </div>
    <div class="filter_apply">
      <a href="javascript:void(0)" class="btn-orange btn apply_filter_btn">APPLY</a>
    </div>
</div>
<!-- <div class="new_year_banner">
  <img class="img-responsive" src="catalog/view/theme/default/image/newyearsale.webp" alt="New Year Cakes - Flavours Guru" />
</div> -->
<div class="container top_positionn category_main_row_col">
  <ul class="breadcrumb">
  <?php 
        $i=1; 
        $Totlbrdcum = count($breadcrumbs);
        if($Totlbrdcum == "3") { ?>
          <li><a href="<?php echo $breadcrumbs['0']['href']; ?>"><?php echo $breadcrumbs['0']['text']; ?></a></li>
          <li><a href="<?php echo $breadcrumbs['2']['href']; ?>"><?php echo $breadcrumbs['2']['text']; ?></a></li>
          <li><a href="<?php echo $breadcrumbs['1']['href']; ?>"><?php echo $breadcrumbs['1']['text']; ?></a></li>
        <?php  } else {
        foreach($breadcrumbs as $breadcrumb) {  
         if($Totlbrdcum==$i){  
      ?> 
          <li><span class="" style="color: #35a8d4;"><?php echo $breadcrumb['text']; ?></span></li>
      <?php  } else { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li> 
      <?php } $i++; } }  ?>
  </ul>
  <div class="categories_banner wedding_cakes">
    <a href="bachelorette-cake"><img class="img-responsive" src="catalog/view/theme/default/image/Naughty-Cakes-for-bachelorette-Online.webp" alt="" /></a>
  </div>
  <div class="categories_banner bachelorette_cakes">
    <a href="naughty-cakes"><img class="img-responsive" src="catalog/view/theme/default/image/Naughty-Cakes.webp" alt="" /></a>
  </div>
  <div class="kids_cake_category home-header-tab">
  	<div class="container xs-p-r-0 xs-p-l-0">
		<div class="row">
			<ul>
				<li>
					<a href="/1st-birthday" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/first-birthday-cakes.webp" alt="a customised three-layered orange cake">
					</a>
					<p>1st Birthday</p>
				</li>
				<li>
					<a href="/birthday/half-birthday" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/half-birthday.webp" alt="Flower and cake combos ">
					</a>
					<p>1/2 Birthday</p>
				</li>
				<li>
					<a href="/birthday/twins-cake" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/twins-kids-cake.webp" alt="Fresh Arrivals cakes">
					</a>
					<p>Twins</p>
				</li>
				<li>
					<a href="/cartoon-cakes" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/cartoon-cakes-2.webp" alt="Red heart-shaped cake topped with strawberries">
					</a>
					<p>Cartoon</p>
				</li>
				<li>
					<a href="/balloon-decorations" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/balloon-decor.webp" alt="Gift ideas for special occassions">
					</a>
					<p>Balloon Decor</p>
				</li>
				<li>
					<a href="/pinata-cakes" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/pinata-cakes.webp" alt="Delicious cake under 600 calories, adorned with fresh berries">
					</a>
					<p>Pinata</p>
				</li>
			</ul>
		</div>
	</div>
  </div>
  <div class="birthday_category home-header-tab ">
  	<div class="container xs-p-r-0 xs-p-l-0">
		<div class="row">
			<ul>
				<li>
					<a href="/kids" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/cake-for-kids.webp" alt="a customised three-layered orange cake">
					</a>
					<p>Kids</p>
				</li>
				<li>
					<a href="/classic-cakes" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/premium-flavours.webp" alt="Flower and cake combos ">
					</a>
					<p>Premium</p>
				</li>
				<li>
					<a href="/regular-cakes" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/regular-cakes.webp" alt="Fresh Arrivals cakes">
					</a>
					<p>Regular</p>
				</li>
				<li>
					<a href="/cartoon-cakes" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/cartoon-cakes.webp" alt="Red heart-shaped cake topped with strawberries">
					</a>
					<p>Cartoon</p>
				</li>
				<li>
					<a href="/birthday/girlfriend" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/cake-for-girlfriend.webp" alt="Gift ideas for special occassions">
					</a>
					<p>Girlfriend</p>
				</li>
				<li>
					<a href="/birthday/husband" class="hover-zoom-col">
					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/cake-for-husband.webp" alt="Delicious cake under 600 calories, adorned with fresh berries">
					</a>
					<p>Husband</p>
				</li>
			</ul>
		</div>
	</div>
  </div>
  <div class="anniversary_category home-header-tab ">
  	<div class="container xs-p-r-0 xs-p-l-0">
  		<div class="row">
  			<ul>
  				<li>
  					<a href="/heart-shape" class="hover-zoom-col">
  					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/heart-shape-cakes.webp" alt="">
  					</a>
  					<p>Heart Shape</p>
  				</li>
  				<li>
  					<a href="/classic-cakes" class="hover-zoom-col">
  					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/premium-flavours-2.webp" alt="">
  					</a>
  					<p>Premium</p>
  				</li>
  				<li>
  					<a href="/premium-cakes" class="hover-zoom-col">
  					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/luxury-design-cakes.webp" alt="">
  					</a>
  					<p>Luxury</p>
  				</li>
  				<li>
  					<a href="/fusion-cakes" class="hover-zoom-col">
  					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/fusion-cakes.webp" alt="">
  					</a>
  					<p>Fusion</p>
  				</li>
  				<li>
  					<a href="/multi-tier-cakes" class="hover-zoom-col">
  					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/multi-tier-cakes.webp" alt="">
  					</a>
  					<p>Multi Tier</p>
  				</li>
  				<li>
  					<a href="/regular-cakes" class="hover-zoom-col">
  					<img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/regular-cakes.webp" alt="">
  					</a>
  					<p>Regular</p>
  				</li>
  			</ul>
  		</div>
  	</div>
  </div>

  <div class="christmas_category home-header-tab ">
    <div class="container xs-p-r-0 xs-p-l-0">
      <div class="row">
        <ul>
          <li>
            <a href="/christmas/christmas-cup-cake" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/christmas-cupcake.jpg" alt="Christmas cake">
            </a>
            <p>Cup Cake</p>
          </li>
          <li>
            <a href="/christmas/plum-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/plum-cakes.jpg" alt="Christmas cake">
            </a>
            <p>Plum Cakes</p>
          </li>
          <li>
            <a href="/new-year-1st-jan" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-year-cake.jpg" alt="New year cake">
            </a>
            <p>New Year</p>
          </li>
          <li>
            <a href="/flower-combo" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/flower-combos.png" alt="Flower and cake combos ">
            </a>
            <p>Combos</p>
          </li>
          <li>
            <a href="/regular-cakes" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/regular-cakes.webp" alt="">
            </a>
            <p>Regular</p>
          </li>
          <li>
            <a href="/classic-cakes" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/premium-flavours-2.webp" alt="">
            </a>
            <p>Premium</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="newyear_category home-header-tab ">
    <div class="container xs-p-r-0 xs-p-l-0">
      <div class="row">
        <ul>
          <!-- <li>
            <a href="/new-year-1st-jan" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-year-cake.jpg" alt="New year cake">
            </a>
            <p>New Year</p>
          </li> -->
          <li>
            <a href="/christmas" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/christmas.jpg" alt="Christmas cake">
            </a>
            <p>Christmas</p>
          </li>
          <li>
            <a href="/christmas/plum-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/plum-cakes.jpg" alt="Christmas cake">
            </a>
            <p>Plum Cakes</p>
          </li>
          <li>
            <a href="/flower-combo" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/flower-combos.png" alt="Flower and cake combos ">
            </a>
            <p>Combos</p>
          </li>
          <li>
            <a href="/regular-cakes" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/regular-cakes.webp" alt="">
            </a>
            <p>Regular</p>
          </li>
          <li>
            <a href="/classic-cakes" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/premium-flavours-2.webp" alt="">
            </a>
            <p>Premium</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
<?php
$actual_link = (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; 
if($actual_link == 'https://www.flavoursguru.com/christmas') { ?>
  <div class="mt-30">
    <p>Ho Ho Ho! The merriest season of cakes is here all again. After crossing the entire year, the joyous time of Christmas celebration has approached all again. Adding more into the merriment of one of the biggest holiday seasons of the year, here we have come up with an exclusive line of online Christmas Cakes at <a href="https://www.flavoursguru.com/" target="_blank">Flavoursguru.com</a>. Boasting the most wonderful, delightful, unique, and attractive Christmas Cakes, the trendy Christmas Cakes collection is sure to sort out your festive cake shopping desires in a matter of just a few clicks and without going high on the budget. With us, customers can get an excellent selection of Christmas cakes online in India with fast, reliable, and timely delivery services. Apart from the best Christmas cakes ideas 2024, you can also trust us for the same day delivery and even free delivery to send cakes to India on Christmas online. So, let's explore the range below.</p>
  </div>
<?php } ?>
  

  <div class="regular_cakes_category">
  	<div class="row">
  		<div class="col-md-6 col-sm-6 col-xs-6 xs-mb-15">
  			<a href="https://www.flavoursguru.com/rasmalai-cake"><img style="width: 100%;border-radius: 15px;" class="img-responsive" src="catalog/view/theme/default/image/rasmail-cakes-2.jpg" alt="" /></a>
  		</div>
  		<div class="col-md-6 col-sm-6 col-xs-6">
  			<a href="https://www.flavoursguru.com/ferrero-rocher-cakes"><img style="width: 100%;border-radius: 15px;" class="img-responsive" src="catalog/view/theme/default/image/ferrero-2.jpg" alt="" /></a>
  		</div>
  	</div>
  </div>
  <div class="row">
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <h1 class="categoryTitle col-md-12"><?php echo $heading_title; ?></h1>
      <?php if ($thumb || $category_content) { ?>
      <div class="row">
        <?php if ($thumb) { ?>
        <div class="col-sm-12"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
        <?php if ($category_content) { ?>
        <!--<div class="col-sm-10 catDescription"><?php //echo $category_content; ?></div>-->
        <?php } ?>
      </div>
      
      <?php } ?>
      <!-- <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?> -->
      <?php $j=1 ; ?>
      <div class="chil-category1" style="display:none;"><?php echo "<pre>"; echo $_SERVER['REQUEST_URI']; echo count($categories1); echo "</pre>"; ?></div>
      <?php $currentUri = explode('/', $_SERVER['REQUEST_URI']);
            $allCitiesCat = array('delhi', 'greater-noida', 'chandigarh', 'gurgaon', 'lucknow', 'mohali', 'noida', 'sohna', 'panchkula', 'faridabad', 'hyderabad', 'varanasi', 'ghaziabad', 'patna', 'zirakpur');
      ?>
      <?php if (!in_array($currentUri[2], $allCitiesCat) && $categories1) { ?>
        <div class="position-relative">
          <div class="row 1 name-row">
            <?php foreach ($categories1 as $category) {
              /*if(!empty($category['img'])){*/
            ?>
              <a href="<?php echo $category['href'];?>" class="name-cont <?php echo 'color-id-'.$j; ?>"><?php echo $category['name']; ?></a>
              
           <?php /*}*/
              $j++ ; }
            ?>
          </div>
          <div class="cat-disable-tab-split"></div>
          <div class="home-primary-btn cursor-pointer view-all-cat-tab">
            <span class="view_all_text">View All</span>
            <span class="view_less_text">View Less</span>
            <img src="catalog/view/theme/default/image/Home/new-images/arrow-down-icon.svg" alt="">
          </div>
        </div>
      <?php } ?>
      <?php /*<div class="visible-xs total_review_count">
        <h3 class="category_title" style="margin-bottom: 0;"><?php echo $heading_title; ?></h3>
        <!-- <div class="review_row display-flex align-items-center">
          <div class="m-r-5">Star Rating here</div>
          <div class="_total_review">1200 REVIEWS <i class="fa fa-angle-right"></i></div>
        </div>
        <div class="total_product">Showing 20 gifts out of 475</div> -->
      </div> */ ?>
      <?php if ($products) { ?>
      <div class="topfilterrow">
      <div class="container">
      <div class="row toolbar hidden-xs">
        <div class="col-md-2 col-sm-6 hidden-xs listGridView">
          <div class="btn-group btn-group-sm">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>  

       	<div class="col-md-12 col-sm-12 responseFilter display-flex align-items-center justify-content-between">
       		<div class="col-md-4 col-sm-4">
       			<h2 style="margin: 0;">Order <?php echo $heading_title; ?> Online</h2>
       		</div>  
       		<div class="col-md-8 col-sm-8">
       			<div class="col-md-6 col-sm-6">
       				<div class="display-flex align-items-center">
       					<p class="font-size-12 font-weight-500 mr-10 margin-bottom-none" style="color: #22303D">Filters by Cake</p>
       					<div class="filter-dropdown">
       						<div class="show_cleart_flt" style="display: none;">
       							<div class=" display-flex align-items-center space-between">
       							<p style="color: #F65F73;text-decoration: underline;" class="margin-bottom-none filter-clear">Clear All Filter</p>
       							<svg class="filter-clear" xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 21 21" fill="none">
								<path d="M13.1739 11.9986L16.7537 8.42703C16.9105 8.27026 16.9986 8.05764 16.9986 7.83594C16.9986 7.61423 16.9105 7.40161 16.7537 7.24484C16.597 7.08807 16.3843 7 16.1626 7C15.9409 7 15.7283 7.08807 15.5715 7.24484L12 10.8247L8.42845 7.24484C8.27168 7.08807 8.05906 7 7.83736 7C7.61565 7 7.40303 7.08807 7.24626 7.24484C7.08949 7.40161 7.00142 7.61423 7.00142 7.83594C7.00142 8.05764 7.08949 8.27026 7.24626 8.42703L10.8261 11.9986L7.24626 15.5701C7.16823 15.6475 7.10629 15.7396 7.06403 15.8411C7.02176 15.9425 7 16.0513 7 16.1612C7 16.2711 7.02176 16.3799 7.06403 16.4814C7.10629 16.5828 7.16823 16.6749 7.24626 16.7523C7.32365 16.8303 7.41573 16.8923 7.51718 16.9346C7.61864 16.9768 7.72745 16.9986 7.83736 16.9986C7.94726 16.9986 8.05608 16.9768 8.15753 16.9346C8.25898 16.8923 8.35106 16.8303 8.42845 16.7523L12 13.1724L15.5715 16.7523C15.6489 16.8303 15.741 16.8923 15.8425 16.9346C15.9439 16.9768 16.0527 16.9986 16.1626 16.9986C16.2725 16.9986 16.3814 16.9768 16.4828 16.9346C16.5843 16.8923 16.6763 16.8303 16.7537 16.7523C16.8318 16.6749 16.8937 16.5828 16.936 16.4814C16.9782 16.3799 17 16.2711 17 16.1612C17 16.0513 16.9782 15.9425 16.936 15.8411C16.8937 15.7396 16.8318 15.6475 16.7537 15.5701L13.1739 11.9986Z" fill="#F65F73"/>
								</svg>
								</div>
       						</div>
       						<div class="show_filter_lab">
       							<div class="display-flex align-items-center space-between">
	       						<p class="margin-bottom-none">Most Popular</p>
	   							<svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 21 21" fill="none">
								<path fill-rule="evenodd" clip-rule="evenodd" d="M7.23017 9.20938C7.52875 8.92228 8.00353 8.93159 8.29063 9.23017L12 13.1679L15.7094 9.23017C15.9965 8.93159 16.4713 8.92228 16.7698 9.20938C17.0684 9.49647 17.0777 9.97125 16.7906 10.2698L12.5406 14.7698C12.3992 14.9169 12.204 15 12 15C11.796 15 11.6008 14.9169 11.4594 14.7698L7.20938 10.2698C6.92228 9.97125 6.93159 9.49647 7.23017 9.20938Z" fill="#22303D"/>
								</svg>
								</div>
							</div>
							<div class="desk-filter-col">
								<?php echo $column_left; ?>
							    <div class="filter_apply text-center" style="padding: 10px 15px;">
							      <a href="javascript:void(0)" class="apply_filter_desktop_btn home-primary-btn full-width-btn" style="border-radius: 6px;">Apply Filters</a>
							    </div>
							</div>
       					</div>
       				</div>
       			</div>
       			<div class="col-md-6 col-sm-6">
       				<div class="display-flex align-items-center">
       					<p class="font-size-12 font-weight-500 mr-10 margin-bottom-none" style="color: #22303D">Sort By</p>
       					<div class="filter-dropdown">
       						<p class="margin-bottom-none">Most Popular</p>
   							<svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 21 21" fill="none">
							<path fill-rule="evenodd" clip-rule="evenodd" d="M7.23017 9.20938C7.52875 8.92228 8.00353 8.93159 8.29063 9.23017L12 13.1679L15.7094 9.23017C15.9965 8.93159 16.4713 8.92228 16.7698 9.20938C17.0684 9.49647 17.0777 9.97125 16.7906 10.2698L12.5406 14.7698C12.3992 14.9169 12.204 15 12 15C11.796 15 11.6008 14.9169 11.4594 14.7698L7.20938 10.2698C6.92228 9.97125 6.93159 9.49647 7.23017 9.20938Z" fill="#22303D"/>
							</svg>
							<div class="desk-filter-col">
								<ul>
					              <li style="display: none;"> <a href="<?php echo strtok($_SERVER["REQUEST_URI"],'?') ?>" <?php if(!isset($_GET['sort'])) { echo 'style="color:red;"'; } ?>> Most Popular </a> </li>
					              <?php foreach ($sorts as $st) { if( $st['text'] == 'Most Popular'){ continue; } ?>
					                <?php if ($st['value'] == $sort . '-' . $order) { ?>
					                  <li> <a href="<?php echo $st['href']; ?>" style="color:red;"><?php echo $st['text']; ?> </a></li>
					                <?php } else { ?>
					                  <li> <a href="<?php echo $st['href']; ?>"><?php echo $st['text']; ?></a></li>
					                <?php } ?>
					              <?php } ?>
					            </ul>
							</div>
       					</div>
       				</div>
       			</div>
       		</div>
        </div>

      <?php /*?>  <div class="col-md-3 col-sm-6">
          <div class="form-group">
            <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
          </div>
        </div> 
        <div class="col-md-4 col-xs-6">
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
        <?php */?>

        

      </div>

      <!-- Sort by Filter in mobile view -->
        <div class="row toolbar visible-xs">
              <div class="col-md-2 col-sm-6 hidden-xs listGridView">
                <div class="btn-group btn-group-sm">
                  <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="" data-original-title="List"><i class="fa fa-th-list"></i></button>
                  <button type="button" id="grid-view" class="btn btn-default active" data-toggle="tooltip" title="" data-original-title="Grid"><i class="fa fa-th"></i></button>
                </div>
              </div>   
            <div class="col-md-8 col-sm-6 responseFilter">  <p class="hFilter hidden-xs">Filter</p>
             </div>
              <div class="col-md-4 col-xs-12 pull-right sortBy">
                <div class="col-xs-4 visible-xs p-l-0 p-r-0">
                  <div class="open_filter display-flex align-items-center justify-content-center">
                    <span class="m-r-5">Filter</span>
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
					<path d="M14.0625 9.5625H15.1875C15.3367 9.5625 15.4798 9.50324 15.5852 9.39775C15.6907 9.29226 15.75 9.14918 15.75 9C15.75 8.85082 15.6907 8.70774 15.5852 8.60225C15.4798 8.49676 15.3367 8.4375 15.1875 8.4375H14.0625C13.9133 8.4375 13.7702 8.49676 13.6648 8.60225C13.5593 8.70774 13.5 8.85082 13.5 9C13.5 9.14918 13.5593 9.29226 13.6648 9.39775C13.7702 9.50324 13.9133 9.5625 14.0625 9.5625ZM9 4.5C9 4.35082 9.05926 4.20774 9.16475 4.10225C9.27024 3.99676 9.41332 3.9375 9.5625 3.9375H15.1875C15.3367 3.9375 15.4798 3.99676 15.5852 4.10225C15.6907 4.20774 15.75 4.35082 15.75 4.5C15.75 4.64918 15.6907 4.79226 15.5852 4.89775C15.4798 5.00324 15.3367 5.0625 15.1875 5.0625H9.5625C9.41332 5.0625 9.27024 5.00324 9.16475 4.89775C9.05926 4.79226 9 4.64918 9 4.5ZM9 13.5C9 13.3508 9.05926 13.2077 9.16475 13.1023C9.27024 12.9968 9.41332 12.9375 9.5625 12.9375H15.1875C15.3367 12.9375 15.4798 12.9968 15.5852 13.1023C15.6907 13.2077 15.75 13.3508 15.75 13.5C15.75 13.6492 15.6907 13.7923 15.5852 13.8977C15.4798 14.0032 15.3367 14.0625 15.1875 14.0625H9.5625C9.41332 14.0625 9.27024 14.0032 9.16475 13.8977C9.05926 13.7923 9 13.6492 9 13.5ZM2.8125 5.0625H3.9375C4.08668 5.0625 4.22976 5.00324 4.33525 4.89775C4.44074 4.79226 4.5 4.64918 4.5 4.5C4.5 4.35082 4.44074 4.20774 4.33525 4.10225C4.22976 3.99676 4.08668 3.9375 3.9375 3.9375H2.8125C2.66332 3.9375 2.52024 3.99676 2.41475 4.10225C2.30926 4.20774 2.25 4.35082 2.25 4.5C2.25 4.64918 2.30926 4.79226 2.41475 4.89775C2.52024 5.00324 2.66332 5.0625 2.8125 5.0625ZM3.9375 14.0625H2.8125C2.66332 14.0625 2.52024 14.0032 2.41475 13.8977C2.30926 13.7923 2.25 13.6492 2.25 13.5C2.25 13.3508 2.30926 13.2077 2.41475 13.1023C2.52024 12.9968 2.66332 12.9375 2.8125 12.9375H3.9375C4.08668 12.9375 4.22976 12.9968 4.33525 13.1023C4.44074 13.2077 4.5 13.3508 4.5 13.5C4.5 13.6492 4.44074 13.7923 4.33525 13.8977C4.22976 14.0032 4.08668 14.0625 3.9375 14.0625ZM2.25 9C2.25 8.85082 2.30926 8.70774 2.41475 8.60225C2.52024 8.49676 2.66332 8.4375 2.8125 8.4375H8.4375C8.58668 8.4375 8.72976 8.49676 8.83525 8.60225C8.94074 8.70774 9 8.85082 9 9C9 9.14918 8.94074 9.29226 8.83525 9.39775C8.72976 9.50324 8.58668 9.5625 8.4375 9.5625H2.8125C2.66332 9.5625 2.52024 9.50324 2.41475 9.39775C2.30926 9.29226 2.25 9.14918 2.25 9ZM6.75 2.8125C6.30245 2.8125 5.87322 2.99029 5.55676 3.30676C5.24029 3.62323 5.0625 4.05245 5.0625 4.5C5.0625 4.94755 5.24029 5.37678 5.55676 5.69324C5.87322 6.00971 6.30245 6.1875 6.75 6.1875C7.19755 6.1875 7.62677 6.00971 7.94324 5.69324C8.25971 5.37678 8.4375 4.94755 8.4375 4.5C8.4375 4.05245 8.25971 3.62323 7.94324 3.30676C7.62677 2.99029 7.19755 2.8125 6.75 2.8125ZM9.5625 9C9.5625 8.55245 9.74029 8.12323 10.0568 7.80676C10.3732 7.49029 10.8024 7.3125 11.25 7.3125C11.6976 7.3125 12.1268 7.49029 12.4432 7.80676C12.7597 8.12323 12.9375 8.55245 12.9375 9C12.9375 9.44755 12.7597 9.87677 12.4432 10.1932C12.1268 10.5097 11.6976 10.6875 11.25 10.6875C10.8024 10.6875 10.3732 10.5097 10.0568 10.1932C9.74029 9.87677 9.5625 9.44755 9.5625 9ZM6.75 11.8125C6.30245 11.8125 5.87322 11.9903 5.55676 12.3068C5.24029 12.6232 5.0625 13.0524 5.0625 13.5C5.0625 13.9476 5.24029 14.3768 5.55676 14.6932C5.87322 15.0097 6.30245 15.1875 6.75 15.1875C7.19755 15.1875 7.62677 15.0097 7.94324 14.6932C8.25971 14.3768 8.4375 13.9476 8.4375 13.5C8.4375 13.0524 8.25971 12.6232 7.94324 12.3068C7.62677 11.9903 7.19755 11.8125 6.75 11.8125Z" fill="#22303D"/>
					</svg>
                  </div>
                </div>
                <div class="form-group input-group input-group-sm col-xs-8">
                  <div class="sortSelect display-flex align-items-center justify-content-center">
                    <select id="input-sort" class="sortformobile m-r-5">
                      <option value="<?php echo strtok($_SERVER["REQUEST_URI"],'?') ?>">Sort</option>
                      <?php foreach ($msorts as $str) { if( $str['text'] == 'Most Popular'){ continue; } ?>
                        <?php if ($str['value'] == $sort . '-' . $order) { ?>
                          <option value="<?php echo $str['href']; ?>" selected="selected"><?php echo $str['text']; ?></option>
                        <?php } else { ?>
                          <option value="<?php echo $str['href']; ?>"><?php echo $str['text']; ?></option>
                        <?php } ?>
                      <?php } ?>
                  </select>
                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
					<path fill-rule="evenodd" clip-rule="evenodd" d="M5.22751 1.85249C5.33298 1.74716 5.47594 1.68799 5.62501 1.68799C5.77407 1.68799 5.91704 1.74716 6.02251 1.85249L9.39751 5.22749C9.49687 5.33412 9.55096 5.47516 9.54839 5.62089C9.54582 5.76661 9.48678 5.90565 9.38372 6.00871C9.28066 6.11177 9.14162 6.1708 8.9959 6.17338C8.85017 6.17595 8.70914 6.12185 8.60251 6.02249L6.18751 3.60749V12.375C6.18751 12.5242 6.12824 12.6673 6.02275 12.7727C5.91726 12.8782 5.77419 12.9375 5.62501 12.9375C5.47582 12.9375 5.33275 12.8782 5.22726 12.7727C5.12177 12.6673 5.06251 12.5242 5.06251 12.375V3.60749L2.64751 6.02249C2.54088 6.12185 2.39984 6.17595 2.25411 6.17338C2.10839 6.1708 1.96935 6.11177 1.86629 6.00871C1.76323 5.90565 1.7042 5.76661 1.70163 5.62089C1.69905 5.47516 1.75315 5.33412 1.85251 5.22749L5.22751 1.85249ZM12.375 5.06249C12.5242 5.06249 12.6673 5.12176 12.7728 5.22725C12.8782 5.33273 12.9375 5.47581 12.9375 5.62499V14.3925L15.3525 11.9775C15.404 11.9222 15.4661 11.8779 15.5351 11.8472C15.6041 11.8164 15.6786 11.7999 15.7541 11.7985C15.8296 11.7972 15.9047 11.8111 15.9747 11.8394C16.0447 11.8677 16.1084 11.9098 16.1618 11.9632C16.2152 12.0166 16.2573 12.0803 16.2856 12.1503C16.3139 12.2203 16.3278 12.2954 16.3265 12.3709C16.3251 12.4464 16.3086 12.5209 16.2778 12.5899C16.2471 12.6589 16.2028 12.721 16.1475 12.7725L12.7725 16.1475C12.667 16.2528 12.5241 16.312 12.375 16.312C12.2259 16.312 12.083 16.2528 11.9775 16.1475L8.60251 12.7725C8.54724 12.721 8.50291 12.6589 8.47217 12.5899C8.44143 12.5209 8.4249 12.4464 8.42356 12.3709C8.42223 12.2954 8.43612 12.2203 8.46441 12.1503C8.49271 12.0803 8.53481 12.0166 8.58823 11.9632C8.64164 11.9098 8.70527 11.8677 8.77531 11.8394C8.84535 11.8111 8.92037 11.7972 8.9959 11.7985C9.07143 11.7999 9.14591 11.8164 9.21491 11.8472C9.28391 11.8779 9.34601 11.9222 9.39751 11.9775L11.8125 14.3925V5.62499C11.8125 5.47581 11.8718 5.33273 11.9773 5.22725C12.0827 5.12176 12.2258 5.06249 12.375 5.06249Z" fill="#22303D"/>
					</svg>
                  </div>
                </div>
              </div>
      </div>
      <!-- End Mobile -->
      </div>
      </div>

      <div class="row category category_main_col">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-6">
          <div class="add_wish_list">
            <button type="button" data-toggle="" title="<?php //echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
              <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" fill="none">
              <rect width="32" height="32" rx="16" fill="white"/>
              <path d="M15.7087 24.2955L15.703 24.2931L15.6849 24.2832C15.5793 24.2251 15.4746 24.1655 15.3707 24.1044C14.1217 23.3622 12.9545 22.4904 11.8884 21.5033C10.0004 19.7417 8 17.1275 8 13.9078C8 11.5054 10.0217 9.60016 12.4619 9.60016C13.1403 9.59683 13.8107 9.74649 14.4232 10.038C15.0358 10.3295 15.5747 10.7553 16 11.2838C16.4254 10.7552 16.9644 10.3293 17.5771 10.0378C18.1898 9.7463 18.8604 9.59671 19.5389 9.60016C21.9783 9.60016 24 11.5054 24 13.9078C24 17.1284 21.9996 19.7425 20.1116 21.5025C19.0455 22.4896 17.8783 23.3614 16.6293 24.1035C16.5255 24.165 16.4207 24.2249 16.3151 24.2832L16.297 24.2931L16.2913 24.2964L16.2888 24.2972C16.1998 24.3443 16.1007 24.369 16 24.369C15.8993 24.369 15.8002 24.3443 15.7112 24.2972L15.7087 24.2955Z" fill=""/>
              </svg>
            </button>
            <?php /*<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> */?>
          </div>
          <a href="<?php echo $product['href']; ?>" target="_blank" class="product-thumb hover-zoom-col">
            <?php if($product['purchased'] > 5){ ?>
              <div class="best-seller">Best Seller</div>
            <?php } ?>
            <div class="image"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive img-zoom" /></div>
            <div class="product_sort_detail">
              <div class="caption" style="margin-bottom: 0;">
                <p class="cat_product_title" style="margin: 8px 0 10px 0;height:auto;"><?php echo $product['name']; ?>
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
              </div> <?php /*
              <div class="button-group">
                <?php if($product['quantity'] > 0) { ?>
                  <a class="anchor" target="_blank" href="<?php echo $product['href']; ?>"  >  <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></a> 
                <?php } else { ?>
                  <a class="anchor danger" href="javascript:void(0);"><span class="hidden-xs hidden-sm hidden-md" >Out of Stock</span></a> 
                <?php } ?>
              </div> */ ?>
            </div>
          </a>
        </div>
        <?php } ?>
      </div>
      <div class="row desk-pagination hidden-xs">
        <div class="col-sm-6 text-left"><?php echo $results; ?></div>
       <div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
      </div>

      <div class="row visible-xs">
       <div class="col-xs-12 mob-pagination"><?php echo $paginationMobile; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p class='noproducts'><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class=""><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div> 
      <?php } ?>
      <?php echo $content_bottom; ?></div>
      <?php if ($description) { ?>
        <div class="col-sm-10 catDescription" id="catDescription"><?php //echo closetags($description); ?><?php echo html_entity_decode($description); ?></div>
        <?php } ?>
    <?php echo $column_right; ?></div>
</div>
<div class="col-md-12 col-sm-12 col-xs-12 position-relative">
  <div class="container">
    <?php if (in_array($currentUri[2], $allCitiesCat) && $categories1) { ?>
          <div class="position-relative">
            <div class="row 1 name-row">
              <?php foreach ($categories1 as $category) {
                /*if(!empty($category['img'])){*/
              ?>
                <a href="<?php echo $category['href'];?>" class="name-cont <?php echo 'color-id-'.$j; ?>"><?php echo $category['name']; ?></a>
                
             <?php /*}*/
                $j++ ; }
              ?>
            </div>
            <div class="cat-disable-tab-split"></div>
            <div class="home-primary-btn cursor-pointer view-all-cat-tab">
              <span class="view_all_text">View All</span>
              <span class="view_less_text">View Less</span>
              <img src="catalog/view/theme/default/image/Home/new-images/arrow-down-icon.svg" alt="">
            </div>
          </div>
      <?php } ?>
  </div>
</div>

<?php if($allreviews['cnt'] > 0){ ?>
<div class="col-md-12 col-sm-12 col-xs-12 social-review-section">
    <div class="container xs-p-r-0">
      <div class="row mb-40">
        <p class="section-title col-md-6 col-sm-6 col-xs-12 p-l-0 mb-0 xs-mb-15">What our customers say about us!</p>
      </div>
    </div>
    <div class="container">
      <div class="row google-review-row">
        <div class="review-slider">
          <?php $x = 0; foreach ($allreviews['all'] as $value) { if($x == 5) { break; } ?>
          <div class="review-col slide">
            <div class="review_2_section">
              <div class="home-google-review">
                <div class="text-center border-btm-1 border-color-primary">
                  <div class="mb-30 xs-mb-15 text-right">
                    <p style="color: #BABFC3;" class="mb-0"><span><?php echo date('d-M-Y', strtotime($value['date_added'])) ?> </span></p>
                    <!-- <img src="catalog/view/theme/default/image/Home/new-images/google-img.png" alt=""> -->
                  </div>
                  <div class="mb-30 xs-mb-15 text-left">
                    <p><?php echo ucfirst($value['text']) ?></p>
                  </div>
                </div>
              </div>
              <div class="">
                <div class="display-flex m-b-20 review_inner_2">
                  <div class="m-r-15">
                    <img class=" img-responsive img-circle" src="<?php echo $value['image'] ?>" alt="">
                  </div>
                  <div class="text-left">
                    <p class="review_name"><?php echo ucwords($value['author']) ?></p>
                    <div class="stars">
                      <span class="review_name"><?php echo $value['rating'] ?>/5 </span>
                      <span><i style="color: #FFCC00;" class="fa fa-star fa-fw"></i></span>
                      <span><i style="color: #FFCC00;" class="fa fa-star fa-fw"></i></span>
                      <span><i style="color: #FFCC00;" class="fa fa-star fa-fw"></i></span>
                      <span><i style="color: #FFCC00;" class="fa fa-star fa-fw"></i></span>
                      <span><i style="color: #FFCC00;" class="fa fa-star fa-fw"></i></span>
                      <!-- <label data-value="1" for="rating_01" class="fill_rating star_selected">
                      <input style="display: none;" id="rating_01" type="radio" name="rating" value="1">
                      <i class="fa fa-star fa-fw"></i>
                      </label>
                      <label data-value="2" for="rating_02" class="fill_rating star_selected">
                      <input style="display: none;" id="rating_02" type="radio" name="rating" value="2">
                      <i class="fa fa-star fa-fw"></i>
                      </label>
                      <label data-value="3" for="rating_03" class="fill_rating star_selected">
                      <input style="display: none;" id="rating_03" type="radio" name="rating" value="3">
                      <i class="fa fa-star fa-fw"></i>
                       </label>
                      <label data-value="4" for="rating_04" class="fill_rating star_selected">
                      <input style="display: none;" id="rating_04" type="radio" name="rating" value="4">
                      <i class="fa fa-star fa-fw"></i>
                      </label>
                      <label data-value="5" for="rating_05" class="fill_rating">
                      <input style="display: none;" id="rating_05" type="radio" name="rating" value="5">
                      <i class="fa fa-star fa-fw"></i>
                      </label> -->
                      </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <?php $x++; } ?>
          <div class="review-col slide">
              <div class="slide-view-all-testimonial">
                <a href="https://www.flavoursguru.com/testimonial">View All &nbsp; <img class="view-arrow" src="catalog/view/theme/default/image/Home/arrow-right-black.png" alt="arrow right" /></a>
              </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<?php } ?>  

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

<?php

function closetags($html) {
    preg_match_all('#<(?!meta|img|br|hr|input\b)\b([a-z]+)(?: .*)?(?<![/|/ ])>#iU', $html, $result);
    $openedtags = $result[1];
    preg_match_all('#</([a-z]+)>#iU', $html, $result);
    $closedtags = $result[1];
    $len_opened = count($openedtags);
    if (count($closedtags) == $len_opened) {
        return $html;
    }
    $openedtags = array_reverse($openedtags);
    for ($i=0; $i < $len_opened; $i++) {
        if (!in_array($openedtags[$i], $closedtags)) {
            $html .= '</'.$openedtags[$i].'>';
        } else {
            unset($closedtags[array_search($openedtags[$i], $closedtags)]);
        }
    }
    return $html;
} 

?>
<?php 
  $cnt = count($breadcrumbs);
  if($cnt == 3){
    $brds[0] = $breadcrumbs[0];
    $brds[1] = $breadcrumbs[2];
    $brds[2] = $breadcrumbs[1];
  } else {
    $brds = $breadcrumbs;
  }
?>
<?php if(isset($brds) && !empty($brds)) { ?><script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "BreadcrumbList",
"itemListElement": [
<?php $temp = 0;end($brds); $lastElement = key($brds); foreach ($brds as $key => $value) { $temp = $temp + 1;?>
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

<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "Product",
"description": "<?php echo $heading_title; ?>",
"name": "<?php echo $heading_title; ?>",
<?php if(isset($allreviews['cnt']) && !empty($allreviews['cnt']) && $allreviews['cnt'] > 0) { ?>
"aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "<?php echo $allreviews['average'] ?>",
    "reviewCount": "<?php echo $allreviews['cnt']; ?>"
  },
  "review": [
  <?php $v = 0; foreach ($allreviews['all'] as $value) { $v++; ?>
    {
      "@type": "Review",
      "author": {
          "@type": "Person",
          "name": "<?php echo $value['author'] ?>"
        },
      "datePublished": "<?php echo date('Y-m-d', strtotime($value['date_added'])) ?>",
      "reviewBody": "<?php echo $value['text'] ?>",
      "reviewRating": {
        "@type": "Rating",
        "bestRating": "5",
        "ratingValue": "<?php echo $value['rating'] ?>",
        "worstRating": "1"
      }
    } <?php if($v < $allreviews['cnt']) {echo ',';} ?>
  <?php } ?>
  ],

  <?php } ?>
  "offers": {
          "@type": "AggregateOffer",
          "lowPrice": "<?php echo $pMinPrice; ?>",
          "highPrice": "<?php echo $pMaxPrice; ?>",
          "priceCurrency": "INR"
        }
}
</script>


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
    .product_review_img_col{
      width: 60px;
    }
    .review_info_col{
      width: calc(100% - 60px);
      padding-left: 10px;
    }
    .review_inner_col{
      display: flex;
      box-shadow: 0 0 7px #00000066;
      padding: 10px;
    }
    .product_review_title{
      font-weight: 600;
    }
    .review_date_col{
      font-size: 16px;
    }
    .slide{
      padding: 5px;
    }
</style>
<script>
 $(document).ready(function()
{
  var screenwidth = $(window).width();
    if(screenwidth < 767){
      $("#catDescription").append("<button id='show'>Read More</button> ");
      $("#catDescription").append("<button id='hidetext'>Read Less</button>");
      $("#hidetext").hide();
      $("#show").click(function(){
        $('#catDescription').addClass('show');
        $("#show").hide();
        $("#hidetext").show();
      });
      $("#hidetext").click(function(){
        $('#catDescription').removeClass('show');
        $("#hidetext").hide();
        $("#show").show();
      });
    }

    $('.sidebar_filters > li').on('click', function(){
      $('.sidebar_filters > li').removeClass('active');
      $(this).addClass('active');
    });

    $('.open_filter').on('click', function(){
      $('.xs-category-filter').animate({"top":"0"},100);
      $('.xs-category-filter').css({'opacity':'1'});
      $('.filter_apply').show();
    })

    $('.back_filter').on('click', function(){
      $('.xs-category-filter').animate({"top":"100%"},100);
      $('.xs-category-filter').css({'opacity':'0'});
      $('.filter_apply').hide();
    })
    $('#es-c.row').addClass('category category_main_col');

    jQuery('.filter-clear').click(function(){
        //$('.filter_main .sub_main label input').removeAttr('checked');
        nFilterIds = [];
        location = '<?php echo $nfilter['action']; ?>';
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

 var nFilterIds = [];
 <?php if(isset($nfilter['filter_category']) && !empty($nfilter['filter_category'])){ ?>
  nFilterIds = [<?php echo '"'.implode('","', $nfilter['filter_category']).'"' ?>]
 <?php } ?>
 
 $('.xs-filterItself').click(function(){
  var filterId = $(this).attr('filterid');
  var index = nFilterIds.indexOf(filterId);
  if (index !== -1) {
    nFilterIds.splice(index, 1);
  } else {
    nFilterIds.push(filterId);
  }
  $(this).toggleClass('selected');
  
 });

 $('.filter_category_col .sidebar_filters li:first-child').addClass('active');

 $('.apply_filter_btn').click(function(){
  location = '<?php echo $nfilter['action']; ?>&filter='+ nFilterIds.join(',');
 })


 var nFilterDesktopIds = [];
 <?php if(isset($nfilter['filter_category']) && !empty($nfilter['filter_category'])){ ?>
  nFilterIds = [<?php echo '"'.implode('","', $nfilter['filter_category']).'"' ?>]
 <?php } ?>
 
 $('.filterItself').click(function(){
  var filterId = $(this).attr('filterid');
  var index = nFilterDesktopIds.indexOf(filterId);
  if (index !== -1) {
    nFilterDesktopIds.splice(index, 1);
  } else {
    nFilterDesktopIds.push(filterId);
  }
  $(this).toggleClass('selected');
  
 })

 $("input[type='checkbox']").change(function(){
      nFilterDesktopIds = [];
      $("#pro_filter:checked").each(function()
        {
         if( $(this).prop('checked')){ nFilterDesktopIds.push(this.value); };
      });
    })

 $('.apply_filter_desktop_btn').click(function(){
  location = '<?php echo $nfilter['action']; ?>&filter='+ nFilterDesktopIds.join(',');
 })
 

 $('.clear_filterall').click(function(){
  nFilterIds = [];
  location = '<?php echo $nfilter['action']; ?>';
 })

 $('.sortformobile').change(function(){
  location = $(this).val();
 })

$(".filter-dropdown").click(function () {
  $(this).find('.desk-filter-col').show();
  $(this).find('.show_cleart_flt').show();
  $(this).find('.show_filter_lab').hide();
});

$(".show_cleart_flt").click(function () {
  $('.show_cleart_flt').hide();
  $('.show_filter_lab').show();
});


$(".add_wish_list").click(function () {
  $(this).toggleClass('item_added');
});
$(document).mouseup(function (e) {
    var popup = $(".desk-filter-col");
    if (!$('.filter-dropdown').is(e.target) && !popup.is(e.target) && popup.has(e.target).length == 0) {
        popup.slideUp(100);
        $('.desk-filter-col').hide();
        $('.show_cleart_flt').hide();
  		$('.show_filter_lab').show();
    }
});

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
          slidesToScroll: 1
        }
      }
    ]
  });
</script>
<?php echo $footer; ?>
