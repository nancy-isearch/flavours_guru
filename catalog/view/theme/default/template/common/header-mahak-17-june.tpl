<!DOCTYPE html> 
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, user-scalable=0, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/nprogress.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.elevatezoom.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/ie11.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/nprogress.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<?php if(!isset($_GET['_route_'])){ ?>
<link href="https://www.bookmyflowers.com" rel="canonical" />
<?php } ?>

<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet" type="text/css"/>
<script src="catalog/view/javascript/custom.js" type="text/javascript"></script>

</head>
 
<body class="<?php echo $class; ?>">
<div class="header_Box">
<nav id="top">
<style type="text/css"> .text-danger-email{color:red;}</style>
  <div class="container">
    <!--<div class="pull-left signRegister"><a href="<?php echo $login; ?>">Sign In</a> | <a href="<?php echo $register; ?>">Register</a></div>-->
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
   <?php /*?> <?php echo $currency; ?><?php */?>
      <ul class="list-inline">
        <li><a href="<?php echo $ordertrack; ?>">Track Order</a></li>
       
        <li><a href="<?php echo $helper; ?>">Help</a></li>
        <?php if(!$logged){ ?>
        <li class="dropdown"><a href="<?php echo $login; ?>" title="<?php echo $text_account; ?>" ><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> </a>
     <?php   }
        else
        { ?>
        <li class="dropdown"><a href="<?php echo $login; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <?php /*<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>*/ ?>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
          </ul>
        </li>
      <?php   } ?>
        <li><a href="#"><span class="webRupee"></span> <?php echo $currency; ?> </a></li>
      	<!--<li>Shipping to: <img src="catalog/view/theme/default/image/india-flag.jpg" alt="India" /></li> -->
        
      
        <?php /* ?>
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
        <?php */ ?>
      </ul>
    </div>
  </div> 
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4 logobox">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="Send Flowers Online - Bookmyflowers" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>

      <div class="col-sm-2 pull-right cart"><?php echo $cart; ?>
      <div class="dotmenu"></div>
        <div class="mob_t-link">
          <div id="top-links" class="nav pull-right">
   <?php /*?> <?php echo $currency; ?><?php */?>
      <ul class="list-inline">
        <li><a href="<?php echo $ordertrack; ?>">Track Order</a></li>
       
        <li><a href="<?php echo $helper; ?>">Help</a></li>
        <?php if(!$logged){ ?>
        <li class="dropdown"><a href="<?php echo $login; ?>" title="<?php echo $text_account; ?>" ><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> </a>
     <?php   }
        else
        { ?>
        <li class="dropdown"><a href="<?php echo $login; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <?php /*<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>*/ ?>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
          </ul>
        </li>
      <?php   } ?>
        <li><a href="#"><span class="webRupee"></span> <?php echo $currency; ?> </a></li>
        <!--<li>Shipping to: <img src="catalog/view/theme/default/image/india-flag.jpg" alt="India" /></li> -->
        
      
        <?php /* ?>
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
        <?php */ ?>
      </ul>
    </div>
        </div>
      </div>
      <div class="col-sm-4 pull-righ searcht"><?php echo $search; ?></div>
    </div>
  </div>
</header>
<?php /*if ($categories) { ?>
<div class="menunav">
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="menu-overlay"></div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <span class="menu-close">X</span>
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <!--  <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a> -->
        <li class="dropdown"><a  class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
             <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li>
                  <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                  <?php if ($child['children']) { ?>
                    <ul class='list-child'>
                      <?php foreach ($child['children'] as $child2) { ?>
                        <li>
                          <a href="<?php echo $child2['href'] ?>"><?php echo $child2['name'] ?></a>
                        </li>
                      <?php } ?>
                    </ul>
                  <?php } ?>
                </li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
        <!--     <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> --> </div>
        </li>
        <?php } else { ?>
           <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
</div>
<?php }*/ ?>

<?php if ($menu_structure) { ?>
<div class="menunav">
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="menu-overlay"></div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <span class="menu-close">X</span>
      <ul class="nav navbar-nav">
        <?php foreach ($menu_structure as $main_category_name=>$category) { ?>
        <?php if (count($category)) { ?>
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><?php echo $main_category_name; ?></a>
             <div class="dropdown-menu">
            <div class="dropdown-inner">
                <?php foreach ($category as $sub_category_name=>$child) { ?>
                <ul class="list-unstyled">
                <li>
                  <a><?php echo $sub_category_name; ?></a>
                  <?php if (count($child)) { ?>
                    <ul class='list-child'>
                      <?php foreach ($child as $child2) { ?>
                        <li>
                          <a href="<?php echo $child2[2] ?>"><?php echo $child2[0] ?></a>
                        </li>
                      <?php } ?>
                    </ul>
                  <?php } ?>
                </li>
              </ul>
              <?php } ?>
            </div>
        </li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
</div>
<?php } ?>

</div>
<div class="header_Box_back"></div>
 