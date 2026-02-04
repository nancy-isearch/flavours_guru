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
<meta name="google-site-verification" content="c-aTOWEdrzsRLOCEasIBDFHb2rqTG0pEEx-iQAJq9qc" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<link href="catalog/view/theme/default/stylesheet/stylesheet_1.css?<?php echo random_int(999,999999); ?>" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/ie11.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/nprogress.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<?php foreach ($links as $link) { if($link['rel'] == 'next'){continue;} ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<?php if(!isset($_GET['_route_']) && !isset($_GET['route'])){ ?>
<link href="https://www.flavoursguru.com" rel="canonical" />
<?php } ?>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">


<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/nprogress.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.elevatezoom.js" type="text/javascript"></script>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script src="catalog/view/javascript/custom.js?<?php echo random_int(999,999999); ?>" type="text/javascript"></script>

<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

 <script src="catalog/view/javascript/slick.min.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
jQuery(document).ready(function ($) {
  
  var gadgetCarousel = $(".carousel");
  
  gadgetCarousel.each(function() {
    if ($(this).is(".type-one-carousel")) {
    $(this).slick({
        dots: true,
        infinite: true,
        slidesToShow: 2
      });
    } 
    else if ($(this).is(".type-two-carousel")){
      $(this).slick({
        dots: true,
        infinite: true,
        slidesToShow: 3
      });
    }
    else {
      $(this).slick();
    }
  })
});   

</script>

<!--Start of Zendesk Chat Script-->
<!-- <script type="text/javascript">var $zoho= $zoho || {};$zoho.salesiq = $zoho.salesiq || {widgetcode:"35ac9f07616c637246ca48682939ba598dc9ca2e8466262135c3c1351acec6d0f3aa0799f0e13798c25673d3e16f582b", values:{},ready:function(){}};var d=document;s=d.createElement("script");s.type="text/javascript"; s.id="zsiqscript";s.defer=true;s.src="https://salesiq.zoho.com/widget";t=d.getElementsByTagName("script")[0];t.parentNode.insertBefore(s,t);d.write("<div id='zsiqwidget'></div>");</script> -->

<!--End of Zendesk Chat Script-->
<script>
  /*window.fbAsyncInit = function() {
    FB.init({
      appId      : '2670085683277880',
      cookie     : true,
      xfbml      : true,
      version    : 'v7.0'
    });
      
    FB.AppEvents.logPageView();   
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));*/
</script>
<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window,document,'script',
'https://connect.facebook.net/en_US/fbevents.js');

fbq('init', '242538297952267');
fbq('track', 'PageView');
</script>
<noscript>
<img height="1" width="1"
src="https://www.facebook.com/tr?id=242538297952267&ev=PageView&noscript=1"/>
</noscript>
<!-- End Facebook Pixel Code -->
<meta name="facebook-domain-verification" content="8e3g3u146r3rbj95344ukcxnbzwxmx" />

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Flavoursguru",
  "url": "https://www.flavoursguru.com",
  "logo": "https://www.flavoursguru.com/image/catalog/images/short.png",
  "contactPoint": {
    "@type": "ContactPoint",
    "telephone": "+918130961414",
    "contactType": "customer service",
    "areaServed": "IN",
    "availableLanguage": ["en","Hindi"]
  },
  "sameAs": [
    "https://www.facebook.com/flavoursgurubakery",
    "https://twitter.com/flavoursguru",
    "https://www.instagram.com/flavoursguru/",
    "https://www.pinterest.com/flavoursguru/",
    "https://www.linkedin.com/company/flavoursguru/"
  ]
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [{
    "@type": "Question",
    "name": "How to place order on Flavoursguru.com",
    "acceptedAnswer": {
      "@type": "Answer",
      "text": "You can conveniently order cake that you have selected online and get it delivered to the address you provide. Follow the steps below to order online today.

Step 1: Go to the FlavoursGuru website and navigate to the cake that you want to order.

Step 2: click on the shortlisted image tile

Step 3: In the Delivery section, enter the Pincode.

Step 4: Enter the date and time the cake should be delivered.

Step 5: In the prompt, select the shipping option and time.

Step 6: You can select the weight of your cake under the \"Choose Weight\" section.

Step 7: Select the desired flavour from the Flavor drop-down menu.

Step 8: Enter the message you want on your cake.

Step 9: Once you confirm everything, click the \"Order Now\" button at the bottom of the page.

Step 10: If you want to get add-ons to make your moment extra special, you can select from the various choices.

Step 11: On the next page, enter your details. You can also sign up to make it convenient for your next purchase.

Step 12: Provide Shipping Details

Step 13: Review your details and secure payment to place your order."
    }
  },{
    "@type": "Question",
    "name": "Does FlavoursGuru Offer A Guarantee of Fresh Birthday Cake Delivery?",
    "acceptedAnswer": {
      "@type": "Answer",
      "text": "At FlavoursGuru, we only provide the best and freshest cakes to our customers. We want to make your special occasions extraordinary, so we ensure the quality of our cakes and other items. All the cakes are prepared on the date of delivery."
    }
  },{
    "@type": "Question",
    "name": "Can I Get A Cake In Midnight or on Same Day of Order Placement?",
    "acceptedAnswer": {
      "@type": "Answer",
      "text": "Yes, All the cakes can be delivered on Same Day or Midnight . e offer different time slots for cake delivery to make it convenient for you. You can get your cake at midnight or on the same day by choosing the option under time while ordering."
    }
  },{
    "@type": "Question",
    "name": "Can I Customise a cake as per my design?",
    "acceptedAnswer": {
      "@type": "Answer",
      "text": "Yes, At Flavoursguru We specialize in customizing the cakes basis the design or the ideas you share with the team. Our Customized cake team will understand your requirement in complete detail and will share with Production team and will stay in touch with respective team till the final outcome."
    }
  },{
    "@type": "Question",
    "name": "What are serviceable areas?",
    "acceptedAnswer": {
      "@type": "Answer",
      "text": "As of June 2022 we are present in Delhi, Gurgaon, Noida, Greater Noida, Ghaziabad, Faridabad, Sohna, Hyderabad. Gradually we are increasing our delivery cities. Few upcoming cities are , Chandigarh, Lucknow Mohali and more are in pipeline."
    }
  },{
    "@type": "Question",
    "name": "What are the delivery timings?",
    "acceptedAnswer": {
      "@type": "Answer",
      "text": "Order will be delivered on the desired/chosen date of delivery within the time slot you select."
    }
  },{
    "@type": "Question",
    "name": "How do I contact Flavoursguru?",
    "acceptedAnswer": {
      "@type": "Answer",
      "text": "You can connect with us over call or whatsapp on +91 8130961414 anytime between 9 Am and 10 Pm or over email at cs@flavoursguru.com."
    }
  }]
}
</script>

<?php /* if($_SERVER['REQUEST_URI'] == '/?' || $_SERVER['REQUEST_URI'] == '/index.php?'){ ?>
  <meta name="robots" content="noindex, nofollow" />
<?php } */ ?>


<?php if (strpos($_SERVER['REQUEST_URI'], "?") !== false) { ?>
  <meta name="robots" content="noindex, nofollow" />
<?php } ?>
<style type="text/css">
  body{
    overflow-x: hidden;
    position: relative;
  }
  .offer_popup_2{
    position: fixed;
    z-index: 1212122;
    top: 50%;
    left: 50%;
    display: none;
    transform: translate(-50%, -50%);
    background: #fff;
    border-radius: 10px;
    min-height: 230px;
    width: 500px;
    padding: 35px;
  }
  .offer_popup_2 h3{
    font-weight: 600;
    color: #000;
    margin-bottom: 20px;
  }
  .offer_popup_2 p{
    font-size: 17px;
    line-height: 27px;
  }
  .offer_close_btn_2 {
    position: absolute;
    top: 0;
    right: -20px;
    margin-top: -25px;
    cursor: pointer;
  }
  .offer_close_btn_2 i{
    font-size: 25px;
    color: #fff;
  }
  .info_offer{
    position: absolute;
    z-index: 1;
    top: 10px;
    right: 10px;
    cursor: pointer;
  }
  .info_offer i{
    font-size: 18px;
    color: #fff;
  }
  @media screen and (max-width: 767px){
    .offer_popup_2{
      width: 86%;
      padding: 20px;
    }
    .info_offer{
      top: 5px;
      right: 5px;
    }
    header{
    	min-height: 120px;
    }
    #logo{
    	min-height: 41px;
    }
  }
</style>
</head>
 
<body class="<?php echo $class; ?>">
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5RZLZ4N"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<div class="header_Box">
<!-- <div id="offerBanner" style="display:none;"><div class="container"><strong>Special Offer</strong> - Flat 10% off on Cakes, Gifts & Combos    Use Coupon Code: <strong class="offerCode">FG10</strong> <span>X</span></div></div> -->
<style type="text/css">
  .search-drop-close{
    position: absolute;
    top: 10px;
    right: 48px;
    z-index: 12;
    font-size: 20px;
    display: none;
  }
</style>
<script>
  $(document).ready(function() {
    $("#pincodeSubmit").click(function() {
    var pin_code = $("#pincodeInput").val();
      $.ajax({
       url: 'index.php?route=product/product/checkCustomPincode',
       method: 'POST',
       data: {pincode:pin_code},
       dataType: 'json',
       success: function(data) {
        console.log(data);
         if(data["pincodeServiceable"] == 1){
          alert("Great news! We deliver to your area. Please proceed with your order.");
          location.reload();
         } else {
          alert("We apologize, but it seems that we do not currently deliver to your area. Please check back later as we are constantly expanding our delivery zones.");
          location.reload();
         }
       }
     });
  })
  })
  
  
</script>
<header>
  <div class="container border-btm-white top_hd_col">
    <div class="row">
      <div class="col-sm-3 col-xs-4 logobox">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="https://www.flavoursguru.com/"><!-- <img src="<?php echo $logo; ?>" --><img src="catalog/view/theme/default/image/Home/FGLogoWhite.png"  title="Send Cakes Online - Flavours Guru" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="https://www.flavoursguru.com/"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-2 col-xs-4 newPincodeBlock">
        <div>
          <div class="pincode-box">
            <div class="pincode-inner">
              <?php 
                  $selectedPincode = '';
                  if (!empty($this->session->data['selectedCityId'])) {
                    $selectedPincode = $this->session->data['selectedCityId'];
                  }
              ?>
              <input type="text" id="pincodeInput" placeholder="Enter Pincode" value="<?php echo $selectedPincode; ?>">
              <button id="pincodeSubmit"><i class="fa fa-location-arrow"></i></button>
            </div>
        </div>
      </div>
      <div class="col-sm-2 search">
        <i class="fa fa-close search-drop-close"></i>
      	<?php echo $search; ?>
      	<div class="custom-search-link">
      		<ul class="Hajaxtargetresult">
      			<div>
      				<p style="font-size: 16px;font-weight: 600;">Popular Cakes</p>
      			</div>
      			<li class="Hselectli"><a href="/birthday">Birthday Cakes</a></li>
      			<li class="Hselectli"><a href="/anniversary">Anniversary Cakes</a></li>
      			<li class="Hselectli"><a href="/kids">Cake For kids</a></li>
      			<li class="Hselectli"><a href="/custom-theme-cakes">Theme Cakes</a></li>
      			<li class="Hselectli"><a href="/cartoon-cakes">Cartoon Cakes</a></li>
      			<li class="Hselectli"><a href="/regular-cakes">Basic Cakes</a></li>
      			<li class="Hselectli"><a href="/customize">Customize Your Cake</a></li>
      		</ul>
      	</div>
      </div>
      <div class="col-sm-5 col-xs-8 cart">
        <div class="cart_btn_col"><?php echo $cart; ?></div>
        <div class="sign-col">
          <ul class="list-inline">
            <?php if(!$logged){ ?>
            <li class="dropdown">
              <a class="login-click" href="javascript:void(0)" title="<?php echo $text_account; ?>" >
                <div class="header-action-btn display-flex align-items-center">
                  <img class="mr-5" src="catalog/view/theme/default/image/Home/new-images/user-icon.svg" alt="user icon black">
                  <span class="hidden-xs">Login</span>
                </div>
              </a>
         <?php   }
            else
            { ?>
            <li class="dropdown"><a href="<?php echo $login; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
              <div class="header-action-btn display-flex align-items-center">
                  <img class="mr-5" src="catalog/view/theme/default/image/Home/new-images/user-icon.svg" alt="user icon black"> <span class="hidden-xs">My account <span class="caret"></span></span>
                </div> 
                <!-- <p class="icon-with-text"><?php echo $text_account; ?> <span class="caret"></span></p> -->
                </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <?php /*<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>*/ ?>
                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
              </ul>
            </li>
            <?php   } ?>
          </ul>
        </div>
        <div class="healp_col">
          <!-- <a href="/contact">
            <div class="header-action-btn display-flex align-items-center">
              <img style="" class="mr-5" src="catalog/view/theme/default/image/Home/new-images/help-center.svg" alt="help icon black">
              <span class="hidden-xs">Help Center</span>
            </div>
          </a> -->
          <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
            <div class="header-action-btn display-flex align-items-center wish-hd-col">
            <svg class="wish-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
            <path d="M11.7087 19.6954L11.703 19.693L11.6849 19.6831C11.5793 19.625 11.4746 19.5654 11.3707 19.5043C10.1217 18.7621 8.95448 17.8903 7.88841 16.9032C6.00041 15.1416 4 12.5274 4 9.30775C4 6.90529 6.02174 5.00006 8.46195 5.00006C9.14031 4.99674 9.81069 5.14639 10.4232 5.43789C11.0358 5.72939 11.5747 6.15523 12 6.68375C12.4254 6.15512 12.9644 5.72921 13.5771 5.43771C14.1898 5.14621 14.8604 4.99661 15.5389 5.00006C17.9783 5.00006 20 6.90529 20 9.30775C20 12.5283 17.9996 15.1424 16.1116 16.9024C15.0455 17.8895 13.8783 18.7613 12.6293 19.5034C12.5255 19.5649 12.4207 19.6248 12.3151 19.6831L12.297 19.693L12.2913 19.6963L12.2888 19.6971C12.1998 19.7442 12.1007 19.7689 12 19.7689C11.8993 19.7689 11.8002 19.7442 11.7112 19.6971L11.7087 19.6954Z" fill=""/>
            </svg>
            <span class="hidden-xs"><?php echo $text_wishlist; ?></span> 
            </div>
          </a>
        </div>
        
        <div class="more_menu cursor-pointer">
          <div class="dotmenu_top">
            <div class="header-action-btn display-flex align-items-center">
              <span class="hidden-xs mr-5">More</span>
              <img class="" src="catalog/view/theme/default/image/Home/new-images/more-icon.svg" alt="humber icon">
            </div>
          </div>
          <div class="mob_t-link">
            <div id="top-links" class="nav pull-right">
              <div class="visible-xs mob-sun-nav-close">
				<svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path d="M6.17387 4.99858L9.75374 1.42703C9.91051 1.27026 9.99858 1.05764 9.99858 0.835935C9.99858 0.614232 9.91051 0.401608 9.75374 0.24484C9.59697 0.0880716 9.38435 0 9.16264 0C8.94094 0 8.72832 0.0880716 8.57155 0.24484L5 3.82471L1.42845 0.24484C1.27168 0.0880716 1.05906 -1.65182e-09 0.837356 0C0.615652 1.65182e-09 0.403029 0.0880716 0.246261 0.24484C0.0894923 0.401608 0.0014208 0.614232 0.00142079 0.835935C0.00142079 1.05764 0.0894923 1.27026 0.246261 1.42703L3.82613 4.99858L0.246261 8.57013C0.168229 8.64752 0.106294 8.7396 0.0640274 8.84105C0.021761 8.9425 0 9.05132 0 9.16122C0 9.27113 0.021761 9.37994 0.0640274 9.48139C0.106294 9.58285 0.168229 9.67492 0.246261 9.75232C0.323655 9.83035 0.415733 9.89229 0.517185 9.93455C0.618636 9.97682 0.727452 9.99858 0.837356 9.99858C0.94726 9.99858 1.05608 9.97682 1.15753 9.93455C1.25898 9.89229 1.35106 9.83035 1.42845 9.75232L5 6.17244L8.57155 9.75232C8.64894 9.83035 8.74102 9.89229 8.84247 9.93455C8.94392 9.97682 9.05274 9.99858 9.16264 9.99858C9.27255 9.99858 9.38136 9.97682 9.48281 9.93455C9.58427 9.89229 9.67634 9.83035 9.75374 9.75232C9.83177 9.67492 9.89371 9.58285 9.93597 9.48139C9.97824 9.37994 10 9.27113 10 9.16122C10 9.05132 9.97824 8.9425 9.93597 8.84105C9.89371 8.7396 9.83177 8.64752 9.75374 8.57013L6.17387 4.99858Z" fill="#222222"/>
				</svg>
              </div>
              <ul class="list-inline">
                <li>
                  <a href="<?php echo $ordertrack; ?>">
                    <div class="top_nav_menu_icon_col">
						<svg width="16" height="20" viewBox="0 0 16 20" fill="none" xmlns="http://www.w3.org/2000/svg">
						<g clip-path="url(#clip0_1519_388)"><path d="M7.61917 0C3.41121 0 0.00012207 3.47824 0.00012207 7.76905V7.78221C0.00303646 9.51136 0.559269 11.1072 1.49853 12.3965L1.56806 12.4903C1.56806 12.4903 1.56848 12.4912 1.5689 12.4916L6.82479 19.5963C7.22281 20.1346 8.01553 20.1346 8.41355 19.5963L13.7244 12.4173C14.6728 11.1246 15.2353 9.52027 15.2382 7.78221V7.76905C15.2382 3.47824 11.8267 0 7.61917 0ZM7.61917 13.7126C4.40002 13.7126 1.79039 11.0516 1.79039 7.76905C1.79039 4.48652 4.40002 1.82551 7.61917 1.82551C10.8383 1.82551 13.4479 4.48652 13.4479 7.76905C13.4479 11.0516 10.8383 13.7126 7.61917 13.7126ZM3.28922 5.36914L7.61459 3.39164L11.9075 5.39121L7.61459 7.34621L3.28922 5.36871V5.36914ZM7.2861 8.06623V12.2165L3.28922 10.3587L3.29879 6.18722L7.2861 8.06623ZM11.9491 6.18722V10.3706L7.99388 12.2165V8.05689L11.9491 6.1868V6.18722Z" fill="#222222"/>
						</g><defs><clipPath id="clip0_1519_388"><rect width="15.2381" height="20" fill="white"/></clipPath>
						</defs></svg>
                    </div>
                    <div>Track Order</div>
                  </a>
                </li>
                <li>
                  <a href = "/corporate">
                    <div class="top_nav_menu_icon_col">
						<svg width="18" height="16" viewBox="0 0 18 16" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path d="M6.51724 1.19228C6.1057 1.19228 5.71101 1.34829 5.42001 1.62599C5.129 1.90368 4.96552 2.28032 4.96552 2.67305C4.96552 3.06577 5.129 3.44242 5.42001 3.72011C5.71101 3.99781 6.1057 4.15382 6.51724 4.15382H8.06897V7.70768H1.55172C1.14018 7.70768 0.745494 7.55167 0.454489 7.27397C0.163485 6.99627 0 6.61963 0 6.2269V5.63459C0 4.81642 0.695172 4.15382 1.55172 4.15382H4.19421C3.79184 3.58343 3.63603 2.88673 3.75934 2.20929C3.88264 1.53184 4.27551 0.926078 4.85586 0.518569C5.4362 0.111059 6.15913 -0.0666653 6.87357 0.0225313C7.58801 0.111728 8.2387 0.460944 8.68966 0.99721C9.14061 0.460944 9.7913 0.111728 10.5057 0.0225313C11.2202 -0.0666653 11.9431 0.111059 12.5235 0.518569C13.1038 0.926078 13.4967 1.53184 13.62 2.20929C13.7433 2.88673 13.5875 3.58343 13.1851 4.15382H16.4483C17.3048 4.15382 18 4.81721 18 5.63459V6.2269C18 7.04508 17.3048 7.70768 16.4483 7.70768H9.31034V4.15382H10.8621C11.169 4.15382 11.469 4.06698 11.7242 3.90427C11.9793 3.74156 12.1782 3.51029 12.2957 3.23972C12.4131 2.96914 12.4439 2.67141 12.384 2.38417C12.3241 2.09692 12.1763 1.83308 11.9593 1.62599C11.7423 1.4189 11.4658 1.27787 11.1648 1.22073C10.8638 1.16359 10.5518 1.19292 10.2683 1.30499C9.98471 1.41707 9.74236 1.60686 9.57186 1.85038C9.40135 2.09389 9.31034 2.38018 9.31034 2.67305V4.15382H8.06897V2.67305C8.06897 1.85487 7.37379 1.19228 6.51724 1.19228ZM8.06897 8.89229H1.24138V14.2231C1.24138 14.6943 1.43756 15.1463 1.78677 15.4796C2.13597 15.8128 2.6096 16 3.10345 16H8.06897V8.89229ZM9.31034 8.89229V16H14.8966C15.3904 16 15.864 15.8128 16.2132 15.4796C16.5624 15.1463 16.7586 14.6943 16.7586 14.2231V8.89229H9.31034Z" fill="#222222"/>
						</svg>
                    </div>
                    <div>Corporate Cakes</div>
                  </a>
                </li>
                <li>
                  <a href="franchise-programme">
                    <div class="top_nav_menu_icon_col">
						<svg width="18" height="15" viewBox="0 0 18 15" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path d="M1.10153 1.43541V0H16.9235V1.43541H1.10153ZM1.2267 15V9.13876H0V7.70335L1.10153 2.87081H16.8985L18 7.70335V9.13876H16.7733V15H15.2712V9.13876H10.79V15H1.2267ZM2.72879 13.5646H9.2879V9.13876H2.72879V13.5646Z" fill="#222222"/>
						</svg>
                    </div> 
                    <div>Franchise Enquiry</div>
                  </a>
                </li>
                <li class="">
                  <a href="baking-institute"> 
                    <div class="top_nav_menu_icon_col">
						<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path d="M13.29 2.63C12.53 1.07 10.91 0 9.04 0C7.17 0 5.54 1.08 4.79 2.63C4.76 2.63 4.74 2.63 4.71 2.63C2.11 2.63 0 4.7 0 7.24C0 9.32 1.4 11.08 3.34 11.65L3.46 14.19H14.63L14.75 11.63C16.64 11.03 18.01 9.29 18.01 7.24C18.01 4.69 15.9 2.63 13.3 2.63H13.29ZM7.24 12.58C7.24 12.9 6.97 13.17 6.64 13.17C6.47 13.17 6.33 13.1 6.22 13C6.11 12.89 6.05 12.75 6.05 12.59V11.42C6.05 11.1 6.32 10.83 6.65 10.83C6.82 10.83 6.96 10.9 7.07 11C7.12 11.05 7.16 11.1 7.19 11.16C7.23 11.24 7.25 11.32 7.25 11.41V12.58H7.24ZM9.63 12.58C9.63 12.9 9.36 13.17 9.03 13.17C8.87 13.17 8.72 13.1 8.61 13C8.5 12.89 8.44 12.75 8.44 12.59V9.66C8.44 9.48 8.53 9.31 8.66 9.21C8.75 9.14 8.86 9.09 8.98 9.08C9 9.08 9.01 9.08 9.03 9.08H9.04C9.18 9.08 9.31 9.13 9.42 9.21C9.44 9.22 9.45 9.24 9.47 9.25C9.58 9.36 9.64 9.5 9.64 9.66V12.59L9.63 12.58ZM12.02 12.58C12.02 12.9 11.75 13.17 11.42 13.17C11.25 13.17 11.11 13.1 11 13C10.89 12.89 10.83 12.75 10.83 12.59V11.42C10.83 11.34 10.84 11.27 10.87 11.2C10.96 10.98 11.17 10.83 11.42 10.83C11.58 10.83 11.73 10.9 11.84 11C11.95 11.11 12.01 11.25 12.01 11.41V12.58H12.02ZM3.65 17.99H14.41L14.55 15.36H3.52L3.66 17.99H3.65Z" fill="#222222"/>
						</svg>
                    </div>
                    <div>Baking Institute</div>
                  </a>
                </li>
                <li>
                  <a href="faq">
                    <div class="top_nav_menu_icon_col">
						<svg width="16" height="17" viewBox="0 0 16 17" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path d="M2.51562 16.7708V13.1651C1.71901 12.4384 1.10058 11.5893 0.660351 10.618C0.220117 9.64671 0 8.62299 0 7.54686C0 5.45051 0.733723 3.66862 2.20117 2.20117C3.66862 0.733723 5.45051 0 7.54687 0C9.29383 0 10.8416 0.513606 12.1903 1.54082C13.5389 2.56803 14.4159 3.9062 14.8212 5.55533L15.9742 10.1254C16.0301 10.321 15.9952 10.4992 15.8694 10.6599C15.7436 10.8207 15.5759 10.901 15.3663 10.901H13.4167V13.8359C13.4167 14.1853 13.2944 14.4823 13.0498 14.7269C12.8052 14.9714 12.5082 15.0937 12.1588 15.0937H10.0625V16.7708H2.51562ZM7.54687 11.7396C7.78445 11.7396 7.98361 11.6592 8.14433 11.4985C8.30505 11.3378 8.38541 11.1386 8.38541 10.901C8.38541 10.6634 8.30505 10.4643 8.14433 10.3036C7.98361 10.1428 7.78445 10.0625 7.54687 10.0625C7.30928 10.0625 7.11013 10.1428 6.94941 10.3036C6.78869 10.4643 6.70833 10.6634 6.70833 10.901C6.70833 11.1386 6.78869 11.3378 6.94941 11.4985C7.11013 11.6592 7.30928 11.7396 7.54687 11.7396ZM6.91796 9.05624H8.19673C8.19673 8.70685 8.24216 8.42384 8.333 8.20722C8.42384 7.99059 8.60902 7.72855 8.88853 7.42108C9.14009 7.14157 9.38467 6.85856 9.62225 6.57206C9.85984 6.28556 9.97863 5.91171 9.97863 5.45051C9.97863 4.86354 9.75153 4.3674 9.29732 3.9621C8.84311 3.55681 8.28059 3.35416 7.60976 3.35416C7.05073 3.35416 6.54411 3.51488 6.0899 3.83632C5.63569 4.15776 5.31775 4.57703 5.13606 5.09413L6.28905 5.57629C6.38688 5.26883 6.55809 5.02076 6.80266 4.83209C7.04724 4.64342 7.31627 4.54908 7.60976 4.54908C7.91722 4.54908 8.17228 4.63294 8.37492 4.80064C8.57757 4.96835 8.6789 5.18498 8.6789 5.45051C8.6789 5.744 8.59155 6.00605 8.41685 6.23665C8.24216 6.46724 8.03601 6.70134 7.79843 6.93892C7.51891 7.23241 7.30229 7.5259 7.14856 7.81939C6.99483 8.11288 6.91796 8.52516 6.91796 9.05624Z" fill="#222222"/>
						</svg>
                    </div>
                    <div>FAQ</div>
                  </a>
                </li>
                <li class="hidden-xs">
                  <a href="about-us"> 
                    <div class="top_nav_menu_icon_col">
						<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M0 8C0 3.58154 3.58154 0 8 0C12.4185 0 16 3.58154 16 8C16 12.4185 12.4185 16 8 16C3.58154 16 0 12.4185 0 8ZM7.14338 6.81682C8.08369 6.34667 9.14297 7.19672 8.88779 8.21662L8.30605 10.5436L8.34051 10.5272C8.4851 10.4636 8.64859 10.4581 8.79715 10.5117C8.94571 10.5654 9.06795 10.6741 9.13859 10.8153C9.20922 10.9566 9.22284 11.1196 9.17661 11.2706C9.13038 11.4217 9.02786 11.5491 8.89026 11.6267L8.85744 11.6447C7.91631 12.1149 6.85703 11.2648 7.11221 10.2449L7.69477 7.91795L7.66031 7.93436C7.58772 7.9747 7.50773 7.99993 7.42513 8.00853C7.34254 8.01714 7.25906 8.00894 7.17972 7.98442C7.10038 7.95991 7.02682 7.9196 6.96347 7.8659C6.90012 7.81221 6.8483 7.74625 6.81112 7.672C6.77393 7.59775 6.75217 7.51674 6.74712 7.43385C6.74208 7.35096 6.75386 7.26791 6.78176 7.1897C6.80966 7.11149 6.8531 7.03973 6.90947 6.97875C6.96584 6.91777 7.03396 6.86883 7.10974 6.83487L7.14338 6.81682ZM8 5.53846C8.16321 5.53846 8.31974 5.47363 8.43514 5.35822C8.55055 5.24281 8.61539 5.08629 8.61539 4.92308C8.61539 4.75987 8.55055 4.60334 8.43514 4.48793C8.31974 4.37253 8.16321 4.30769 8 4.30769C7.83679 4.30769 7.68026 4.37253 7.56486 4.48793C7.44945 4.60334 7.38462 4.75987 7.38462 4.92308C7.38462 5.08629 7.44945 5.24281 7.56486 5.35822C7.68026 5.47363 7.83679 5.53846 8 5.53846Z" fill="#222222"/>
						</svg>
                    </div>
                    <div>About Us</div>
                  </a>
                </li>
                <li class="">
                  <a href="/contact">
                    <div class="top_nav_menu_icon_col">
						<svg width="20" height="18" viewBox="0 0 20 18" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path d="M9 18V16.5H17.5V8.9C17.5 7.93333 17.2917 7.00417 16.875 6.1125C16.4583 5.22083 15.9 4.43333 15.2 3.75C14.5 3.06667 13.7 2.52083 12.8 2.1125C11.9 1.70417 10.9667 1.5 10 1.5C9.03333 1.5 8.1 1.70417 7.2 2.1125C6.3 2.52083 5.5 3.06667 4.8 3.75C4.1 4.43333 3.54167 5.22083 3.125 6.1125C2.70833 7.00417 2.5 7.93333 2.5 8.9V15H2C1.45 15 0.979167 14.8042 0.5875 14.4125C0.195833 14.0208 0 13.55 0 13V11C0 10.6167 0.0916667 10.2792 0.275 9.9875C0.458333 9.69583 0.7 9.45833 1 9.275L1.075 7.95C1.225 6.73333 1.57083 5.63333 2.1125 4.65C2.65417 3.66667 3.32917 2.83333 4.1375 2.15C4.94583 1.46667 5.85417 0.9375 6.8625 0.5625C7.87083 0.1875 8.91667 0 10 0C11.1 0 12.1542 0.1875 13.1625 0.5625C14.1708 0.9375 15.075 1.47083 15.875 2.1625C16.675 2.85417 17.3458 3.6875 17.8875 4.6625C18.4292 5.6375 18.775 6.725 18.925 7.925L19 9.225C19.3 9.375 19.5417 9.59583 19.725 9.8875C19.9083 10.1792 20 10.5 20 10.85V13.15C20 13.5167 19.9083 13.8417 19.725 14.125C19.5417 14.4083 19.3 14.625 19 14.775V16.5C19 16.9125 18.8531 17.2656 18.5594 17.5594C18.2656 17.8531 17.9125 18 17.5 18H9ZM7 10.75C6.8 10.75 6.625 10.675 6.475 10.525C6.325 10.375 6.25 10.1958 6.25 9.9875C6.25 9.77917 6.325 9.60417 6.475 9.4625C6.625 9.32083 6.80417 9.25 7.0125 9.25C7.22083 9.25 7.39583 9.32188 7.5375 9.46562C7.67917 9.60938 7.75 9.7875 7.75 10C7.75 10.2 7.67812 10.375 7.53438 10.525C7.39062 10.675 7.2125 10.75 7 10.75ZM13 10.75C12.8 10.75 12.625 10.675 12.475 10.525C12.325 10.375 12.25 10.1958 12.25 9.9875C12.25 9.77917 12.325 9.60417 12.475 9.4625C12.625 9.32083 12.8042 9.25 13.0125 9.25C13.2208 9.25 13.3958 9.32188 13.5375 9.46562C13.6792 9.60938 13.75 9.7875 13.75 10C13.75 10.2 13.6781 10.375 13.5344 10.525C13.3906 10.675 13.2125 10.75 13 10.75ZM4.025 9.45C3.95833 8.46667 4.09583 7.575 4.4375 6.775C4.77917 5.975 5.2375 5.29583 5.8125 4.7375C6.3875 4.17917 7.05 3.75 7.8 3.45C8.55 3.15 9.3 3 10.05 3C11.5667 3 12.8417 3.47917 13.875 4.4375C14.9083 5.39583 15.5417 6.59167 15.775 8.025C14.2083 8.00833 12.8292 7.5875 11.6375 6.7625C10.4458 5.9375 9.525 4.86667 8.875 3.55C8.60833 4.9 8.04583 6.09583 7.1875 7.1375C6.32917 8.17917 5.275 8.95 4.025 9.45Z" fill="#222222"/>
						</svg>
                    </div>
                    <div>Help</div>
                  </a>
                </li>
                <li class="visible-xs">
                  <a href="/blogs">
                    <div class="top_nav_menu_icon_col"><img class="img-responsive" src="catalog/view/theme/default/image/about-us.png" alt="about 2"></div>
                    <div>Blog</div>
                  </a>
                </li>
                <li class="visible-xs">
                  <a href="https://api.whatsapp.com/send/?phone=+918130961414&text=Hello&app_absent=0">
                    <div class="top_nav_menu_icon_col"><img class="img-responsive" src="catalog/view/theme/default/image/WhatsApp.png" alt="whatsapp"></div>
                    <div>Whatsapp</div>
                  </a>
                </li>
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
      </div>
    </div>
  </div>
</header>
<?php /*if ($categories) { ?>
<div class="menunav">
<div class="container">
  <div class="row">
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
</div>
<?php }*/ ?>

<?php if ($menu_structure) { ?>
<div class="menunav">
<div class="container">
  <div class="row">
    <nav id="menu" class="navbar">
      <div class="navbar-header"><span id="category" class="visible-xs ctgrynmchng"><?php echo $text_category; ?></span>
        <button type="button" class="btn btn-navbar navbar-toggle new-nav-bar"><!-- <i class="fa fa-bars"></i> --><img style="transform: rotate(180deg);" class="menu-bar" src="catalog/view/theme/default/image/Home/humberger-icon-white.png" alt="humber-icon 2" /></button>
      </div>
      <div class="menu-overlay"></div>
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <div class="slide-menu-user-col">
          <div class="guest-col text-white">
            <p style="margin-bottom: 0;"><img style="width: 25px;margin-right: 5px;" src="catalog/view/theme/default/image/Home/user-guest.png" alt="Hi Guest"> Hi Guest</p>
          </div>
          <div class="guest-col-phone">
            <a href="tel:+918130961414"><i class="fa fa-phone mr-5"></i>+91 8130 961 414</a>
          </div>
        </div>
        <span class="menu-close">X</span>
        <ul class="nav navbar-nav">
          <?php if(isset($first_menu)){ ?>
            <?php foreach ($first_menu as $category_name=>$category) { ?>
              <?php if (count($category)) { ?>
              <li class="dropdown">
                <a href="<?php echo $category[0][0][2] ?>" onclick="location.href='<?php echo $category[0][0][2] ?>'" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category_name; ?></a>
              </li>
              <?php } ?>
            <?php } ?>
          <?php } ?>
          
          <?php foreach ($menu_structure as $main_category_name=>$category) { ?>
          <?php if (count($category)) {

          if($main_category_name == "Customised Cakes"){ ?>
          <li class="dropdown 2"><a href="https://www.flavoursguru.com/index.php?route=information/customize"><?php echo $main_category_name; ?></a>
          </li>
          <?php } else { ?>
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
          <?php } ?>
        </ul>
      </div>
    </nav>
  </div>
</div>
</div>
<?php } ?>

</div>
<div class="header_Box_back"></div>

<div class="bg-img"></div>
<div class="offer-popup">
  <div class="offer-close-btn">
    <img style="width: 25px;" class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/offer-close.svg" alt="offer popup">
  </div>
    <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/offer-popup-img.webp" alt="offer popup">
</div>

<!-- <div class="offer_popup_2">
  <div class="offer_close_btn_2"><i class="fa fa-close"></i></div>
  <div class="text-center">
    <h3>Special offer on Valentines Items</h3>
    <h4 style="margin-bottom: 15px;">Avail FLAT 15% OFF</h4>
    <p style="display: flex;align-items: center;justify-content: center;"><span>Use Code : </span> <span style="font-weight: 700;font-size: 28px;color: #000000">LOVE15</span></p>
    <p>* Valid only on Valentine’s Day Products.</p>
    <p>* Valid till 13th Feb, 2023, 23:59.</p>
  </div>
</div> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.1.2/js.cookie.js"></script>
<script type="text/javascript">
   /*if(localStorage.getItem('popState') != 0){
        $('.bg-img').delay(30000).fadeIn();
        $('.offer-popup').delay(30000).fadeIn();
        localStorage.setItem('popState',1);
    }

    $('.offer-close-btn').click(function(e){ 
      $('.bg-img').fadeOut();
      $('.offer-popup').fadeOut();
      localStorage.setItem('popState', 1);
    });

    window.onbeforeunload = function() {
        localStorage.setItem('popState', 0);
    };*/

  $(document).ready(function(){
    if(!Cookies.get('hide-popup')){
      setTimeout(function() {
        $('.bg-img').fadeIn();
        $('.offer-popup').fadeIn();
      }, 500000);
    }

    $(".offer-close-btn").click(function () {
        var date = new Date();
        date.setTime(date.getTime() + (1500 * 1000));
        Cookies.set('hide-popup', true, { expires: date });
        $('.bg-img').fadeOut();
        $('.offer-popup').fadeOut();
    });
    $("#seacrchHeader").focus(function () {
    	$(this).attr("autocomplete", "off");
    	$('.custom-search-link').show();
      $('.search-drop-close').show();
    });
    $(".search-drop-close").click(function () {
      $('#serchId').hide();
    });
    $(document).mouseup(function (e) {
        var popup = $(".custom-search-link");
        if (!$('#seacrchHeader').is(e.target) && !popup.is(e.target) && popup.has(e.target).length == 0) {
            popup.slideUp(100);
            $('.search-drop-close').hide();
        }
    });
    jQuery('#seacrchHeader').keypress(function(){
      $('.custom-search-link').hide();
      $('#serchId').show();
      //$('.search-drop-close').hide();
    });
    $(".dotmenu_top").click(function () {
      $('.mob_t-link').addClass('show');
    });
    $(document).mouseup(function (e) {
        var popup = $(".mob_t-link");
        if (!$('.dotmenu_top').is(e.target) && !popup.is(e.target) && popup.has(e.target).length == 0) {
            popup.slideUp(100);
            $('.mob_t-link').removeClass('show');
        }
    });
    $('.mob-sun-nav-close').on('click', function(){
      $('.mob_t-link').removeClass('show');
    });

    $(".info_offer").click(function () {
      $('.offer_popup_2').fadeIn();
      $('.bg-img').fadeIn();
    });

    $(".offer_close_btn_2").click(function () {
      $('.offer_popup_2').fadeOut();
      $('.bg-img').fadeOut();
    });
  });
</script>
