<?php echo $header; ?>

<!-- <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title></title>
  
</head> -->
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<style type="text/css">
  /*@media screen and (min-width: 1367px){
    .container {
      width: 1366px;
    }*/
    body{
      overflow-x: hidden;
    }
    .gif-icon{
    	position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 95px !important;
	    transform: translate(-50%, -50%);
	    margin-bottom: 0 !important;
    }
    .banner-first-title{
      border-radius: 24px;
      padding: 10px 15px;
      font-size: 34px;
      font-weight: 700;
      width: fit-content;
      line-height: initial;
      font-family:Cirka-bold;
    }
    .home-primary-btn.white-bg-btn{
      background:#ffffff;
      color: #4A4A4A; 
    }
    .fathers-v{
    	width: 85px !important;
    	margin-left: 10px!important;
    }
    .product-name-title{
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
    @media screen and (min-width: 767px){
      .banner-title {
        font-size: 50px;
        font-weight: 700;
        line-height: 115%;
      }
      .banner-slide ul.slick-dots{
        bottom: 10px;
      }
    }
    @media screen and (max-width: 767px){
    	.gif-icon{
    		width: 60px !important;
    	}
      .banner-first-title{
        border-radius: 16px;
        padding: 5px 15px;
        font-size: 14px;
      }
      .banner-overlay-content{
        top: 20px;
      }
    .fathers-v{
    	width: 65px !important;
    	margin-left: 10px !important;
    }
  }
  @media screen and (max-width: 380px){
  	.banner-slide img.visible-xs{
    	height: 210px;
    	object-fit: cover;
    }
  }
</style>
  <div class="col-md-12 col-sm-12 col-xs-12 home-header-tab mb-15">
    <div class="offer-split">
      <p class="mb-0">Limited Period Offer! Use code <span style="color: #F65F73;font-weight: 700;font-size: 14px;">CAKE12</span> Avail 12% Off.</p>
    </div>
    <div class="container xs-p-r-0 xs-p-l-0" style="margin-top: 15px;">
      <div class="row">
        <ul>
          <?php /*<li>
            <a href="/halloween-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/halloween.png" alt="">
            </a>
            <p>Halloween</p>
          </li> */ ?>
          <?php /*<li>
            <a href="/womens-day" class="hover-zoom-col">
              <div class="position-relative">
               <lottie-player class="gif-icon" src="catalog/view/theme/default/image/Home/women.json" background="transparent" speed="1" loop="" autoplay=""></lottie-player>
              </div>
            </a>
            <p>Women’s<br> Day</p>
          </li>
          <li>
            <a href="/new-year-1st-jan" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-year-cake.jpg" alt="New year cake">
            </a>
            <p>New Year</p>
          </li>  
          <li>
            <a href="/womens-day" class="hover-zoom-col">
              <div class="position-relative">
               <img style="border-radius: 50%" class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/icon-bg.jpg" alt=""> 
               <lottie-player class="gif-icon" src="catalog/view/theme/default/image/Home/women.json" background="transparent" speed="1" loop="" autoplay=""></lottie-player>
              </div>
            </a>
            <p>Women’s<br> Day</p>
          </li>
          <li>
            <a href="/womens-day" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/womens-day.png" alt="a customised three-layered orange cake">
            </a>
            <p>Women’s Day</p>
          </li>
          <li>
            <a href="/mothers-day/mothers-day-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/mothers-day-cakes.webp" alt="Online chake mothers day">
            </a>
            <p>Mother’s Day</p>
          </li>
          <li>
            <a href="/fathers-day" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/fathers-day-icons.webp" alt="Father day cake online">
            </a>
            <p>Fathers Day</p>
          </li>
          <li>
            <a href="/friendship-day" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/friend-ship.png" alt="friend ship day cake online">
            </a>
            <p>Friendship Day</p>
          </li>
          <li>
            <a href="/rakhi" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/raksha-bandhan-icon.webp" alt="rakhi cake online">
            </a>
            <p>Raksha Bandhan</p>
          </li>
          <li>
            <a href="/janmashtami-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/janmashtami-cakes-icon.webp" alt="janmashtami cakes online">
            </a>
            <p>Janmashtami</p>
          </li>
          <li>
            <a href="/teachers-day-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/teacher-day-icons.png" alt="a customised three-layered orange cake">
            </a>
            <p>Teacher's Day</p>
          </li>
          <li>
            <a href="/christmas" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/christmas.jpg" alt="christmas cake online">
            </a>
            <p>Christmas</p>
          </li>
          <li>
            <a href="/new-year-1st-jan" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-year-cake.jpg" alt="New year cake">
            </a>
            <p>New Year</p>
          </li>
          <li>
            <a href="/republic-day-cake" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/rep-day-icon.gif" alt="Republic Day">
            </a>
            <p>Republic Day</p>
          </li>
          <li>
            <a href="/gifts/flowers" class="hover-zoom-col">
              <img style="border-radius: 50%;" class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/flowers.jpg" alt="flowers cake">
            </a>
            <p>Flowers</p>
          </li>
          <li>
            <a href="/valentines.php" class="hover-zoom-col">
              <div class="position-relative">
                <img style="border-radius: 50%" class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/icon-bg.jpg" alt="">
                <lottie-player class="gif-icon" src="catalog/view/theme/default/image/Home/valenrine-heart.json" background="transparent" speed="1" loop="" autoplay=""></lottie-player>
              </div>
            </a>
            <p>Valentine's<br> Day</p>
          </li>*/ ?>
          <!-- <li>
            <a href="/womens-day" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/womens-day.png" alt="a customised three-layered orange cake">
            </a>
            <p>Women’s Day</p>
          </li> -->
          <li>
            <a href="/customize" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/custom-cakes.png" alt="a customised three-layered orange cake">
            </a>
            <p>Customized</p>
          </li>
          <li>
            <a href="/flower-combo" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/flower-combos.png" alt="Flower and cake combos ">
            </a>
            <p>Combos</p>
          </li>
          <li>
            <a href="/birthday" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/birthday.jpg" alt="Birthday Cakes">  
            </a>
            <p>Birthday</p>
          </li>
          <li>
            <a href="/anniversary" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/anniversary-cake.png" alt="Anniversary Cakes">  
            </a>
            <p>Anniversary</p>
          </li>
          <li>
            <a href="/new-arrival-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/fresh-arrivals.png" alt="Fresh Arrivals cakes">  
            </a>
            <p>Fresh Arrivals</p>
          </li>
          <li>
            <a href="/heart-shape" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/heart-shape.png" alt="Red heart-shaped cake topped with strawberries">  
            </a>
            <p>Heart Shape</p>
          </li>
          <li>
            <a href="/gifts" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/gift-hamper.png" alt="Gift ideas for special occassions">  
            </a>
            <p>Gifts</p>
          </li>
          <li>
            <a href="/cakes-below-600" class="hover-zoom-col">
              <img  class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/cakes-under-500.png" alt="Delicious cake under 600 calories, adorned with fresh berries">
            </a>
            <p>Under 600</p>
          </li>
           <!--<li>
            <a href="/classic-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/premium-flavours.png" alt="A cherry-topped premium cake in the picture">  
            </a>
            <p>Premium</p>
          </li> -->
          <!-- <li>
            <a href="/photo-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/photo-cake.png" alt="A photo frame featuring a cake and cupcakes">  
            </a>
            <p>Photo Cakes</p>
          </li> -->
           <?php /*<li>
            <a href="/custom-theme-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/theme-cake.png" alt="Theme Cakes">  
            </a>
            <p>Theme<br> Cakes</p>
          </li>
          <li>
            <a href="/regular-cakes/cheese-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/cheese-cakes.png" alt="">  
            </a>
            <p>Cheese Cakes</p>
          </li>
          <li>
            <a href="/gifts/plants" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/desktop-icons.png" alt="">
            </a>
            <p>Birthday<br> Plants</p>
          </li> */ ?>
        </ul>
      </div>
    </div>  
  </div>

  <div class="col-md-12 col-sm-12 col-xs-12 mb-15 pr-0 pl-0 main-banner-slide">
    <div class="banner-slide">
       <?php /* <a href="/valentines.php">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/new-images/valentine-day-desk.webp" alt="valentines day - Flavours Guru">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/new-images/valentine-day-mob.webp" alt="valentines day - Flavours Guru">
      </a>
      
      <a href="/mothers-day/mothers-day-cakes">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/new-images/mother-day-desktop.webp" alt="Cake your imagination">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/new-images/mother-day-mobile.webp" alt="Cake your imagination">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title text-white" style="background: #993BD5;">A Mother's Love</p>
            <h2 class="mb-10 banner-title text-black"><span class="">Deserves a really, really</br> <b>Good Taste</b>.</h2>
            <p class="text-white banner-sm-title mb-30"></p>
            <div class="home-primary-btn white-bg-btn" style="box-shadow: 0px 4px 0px 0px #9C89AE;">Order Now</div>  
          </div>
        </div>
      </a>
      <a href="/custom-theme-cakes">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/new-images/desktop-customized-cake.webp" alt="Cake your imagination">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/new-images/mobile-customized-cake.webp" alt="Cake your imagination">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title text-white" style="background: #E297BB;">Cake your imagination</p>
            <h2 class="mb-10 banner-title text-white"><span class="text-white">To new heights</span><br> Customised cake</h2>
            <p class="text-white banner-sm-title mb-30">Crafted Just for you</p>
            <div class="home-primary-btn white-bg-btn">Order Now</div>  
          </div>
        </div>
      </a> */ ?>

      <?php /* <a href="/1-hour-delivery">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/new-images/1-Hour-Delivery.webp" alt="Last minute celebration cakes">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/new-images/1-Hour-Delivery-mob.webp" alt="Last minute celebration cakes">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="pacifico-regular text-yellow banner-first-title"><span>Last minute celebration?</span></p>
            <h2 class="mb-10 banner-title text-yellow"><span class="text-white">Let us save</span><br> The day with</h2>
            <p class="text-white banner-sm-title mb-30">1 hour cake delivery!</p>
            <div class="home-primary-btn">Order Now</div>  
          </div>
        </div>
      </a>
      
      <a href="/premium-cakes">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/new-images/desktop-luxury-cakes.webp" alt="Make a Statement with Your Cake - Flavours Guru">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/new-images/mobile-luxury-cakes.webp" alt="Make a Statement with Your Cake - Flavours Guru">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title text-white" style="background: #044595;">Make a Statement with Your Cake</p>
            <h2 class="mb-10 banner-title text-white"><span style="color: #044595;" class="">Make Your Celebration <br>One of a Kind</span><br> </h2>
            <p class="text-white banner-sm-title mb-30">With a vast range of exclusive Luxury Cakes</p>
            <div class="home-primary-btn white-bg-btn">Order Now</div>  
          </div>
        </div>
      </a>
      <a href="/rakhi">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/new-images/rakshabandhan-desk.webp" alt="rakshabandhan cake">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/new-images/rakshabandhan.webp" alt="rakshabandhan cake 1">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title" style="background: #C74D2E;color: #ffffff;">HAPPY RAKSHABANDHAN</p>
            <h2 class="mb-30 banner-title">
              <span class="" style="color: #ffffff">On This Auspicious </span><br>
              <span class="" style="color: #ffffff">Occasion Celebrate</span>
            </h2>
            <p class="text-white banner-sm-title mb-30"></p>
            <div class="home-primary-btn white-bg-btn" style="color: #4A4A4A;box-shadow: 0px 4px 0px 0px #AF6BFF;background: #ffffff;">Order Now Delicious Cake </div>  
          </div>
        </div>
      </a>
      <a href="/janmashtami-cakes">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/janmashtami-cakes-desktop.webp" alt="janmashtami cake">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/mobile-janmasthmi.webp" alt="janmashtami cake 1">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title" style="background:rgba(4, 69, 149, 0.6);color: #ffffff;">HAPPY KRISHNA JANMASTHMI</p>
            <h2 class="mb-30 banner-title">
              <span class="" style="color: #044595;">A Treat for you as </span><br>
              <span class="" style="color: #044595;">well as your Nandlal!</span>
            </h2>
            <p class="text-white banner-sm-title mb-30"></p>
            <div class="home-primary-btn white-bg-btn" style="color: #4A4A4A;box-shadow: 0px 4px 0px 0px rgba(109, 174, 224, 1);background: #ffffff;">Order Now </div>  
          </div>
        </div>
      </a>
      <a href="/christmas">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/christmas-banner-web.webp" alt="christmas cake">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/christmas-banner-mobile.webp" alt="christmas cake 1">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title" style="background:#6AA245;color: #ffffff;">Celebrate the season with</p>
            <h2 class="mb-30 banner-title">
              <span class="" style="color: #ffffff;">Our Delicious </span><br>
              <span class="" style="color: #ffffff;">Christmas Cakes!</span>
            </h2>
            <p class="text-white banner-sm-title mb-30"></p>
            <div class="home-primary-btn white-bg-btn" style="color: #272727;box-shadow: 0px 4px 0px 0px #6AA245;background: #ffffff;">Order Now </div>  
          </div>
        </div>
      </a>
      <a href="/new-year-1st-jan">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/new-year-web-2026.webp" alt="new year cake">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/new-year-mobile-2026.webp" alt="new year cake 1">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title" style="background:#FBB637;color: #ffffff;">Celebrate the season with</p>
            <h2 class="mb-30 banner-title">
              <span class="" style="color: #ffffff;">Our Delicious </span><br>
              <span class="" style="color: #ffffff;">New Year Cakes!!</span>
            </h2>
            <p class="text-white banner-sm-title mb-30"></p>
            <div class="home-primary-btn white-bg-btn" style="color: #ffffff;box-shadow: 0px 4px 0px 0px #FFFFFF;background: #5C175E;">Order Now </div>  
          </div>
        </div>
      </a>
      <a href="/luxury-flowers">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/flower-desktop.webp" alt="Cake your imagination">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/flower-mobile.webp" alt="Cake your imagination">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title text-white" style="background: #E98A46;">Luxury Flowers</p>
            <h2 class="mb-10 banner-title text-white"><span class="text-white">Express Your Love</span><br> With Exclusivity</h2>
            <p class="text-white banner-sm-title mb-30"></p>
            <div class="home-primary-btn white-bg-btn" style="box-shadow: 0px 4px 0px 0px #F1547B;">Order Now</div>  
          </div>
        </div>
      </a>
      <a href="/valentines.php">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/valentines-desktop.webp" alt="Cake your Valentine">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/valentines-mobile.webp" alt="Valentine day cake">
        <div class="banner-overlay-content">
          <div class="banner-title-row"> 
            <p class="banner-first-title text-white" style="background: #A51E40;">Happy Valentine’s Day</p>
            <h2 class="mb-10 banner-title text-white"><span class="text-white">Always in Love</span><br> Valentine’s Day Cake</h2>
            <p class="text-white banner-sm-title mb-30">Explore 2026 New Arrivals!</p>
            <div class="home-primary-btn" style="background: #291019;border:1px solid #ffffff;color: #ffffff;">Order Now</div>  
          </div>
        </div>
      </a> */ ?>
      <a href="/birthday">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/new-images/birthday-cake-desk.webp" alt="birthday cake">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/new-images/birthday-cake-mob.webp" alt="birthday cake">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title" style="background: #97FFFC;color: #0044A3;">Birthday Bliss</p>
            <h2 class="mb-30 banner-title">
              <span class="" style="background: linear-gradient(90deg, #339E9B 0%, #000D9D 100%);-webkit-background-clip: text;-webkit-text-fill-color: transparent;">Let’s Get This Party </span><br>
              <span class="" style="background: linear-gradient(90deg, #339E9B 0%, #000D9D 100%);-webkit-background-clip: text;-webkit-text-fill-color: transparent;">Started</span>
            </h2>
            <p class="text-white banner-sm-title mb-30"></p>
            <div class="home-primary-btn white-bg-btn" style="box-shadow: 0px 4px 0px 0px #00CAC4;">Shop birthday cakes</div>  
          </div>
        </div>
      </a>
      <a href="/anniversary">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/new-images/anniversary-cake-desk.webp" alt="anniversary cake">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/new-images/anniversary-cake-mob.webp" alt="anniversary cake">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title" style="background: #9670FF;color: #ffffff">Happy Anniversary!</p>
            <h2 class="mb-30 banner-title">
              <span class="" style="background: linear-gradient(90deg, #A33EFB 0%, #023F8B 100%);-webkit-background-clip: text;-webkit-text-fill-color: transparent;">Mark Your Anniversary </span><br>
              <span class="" style="background: linear-gradient(90deg, #A33EFB 0%, #023F8B 100%);-webkit-background-clip: text;-webkit-text-fill-color: transparent;">with Handcrafted Elegance</span>
            </h2>
            <p class="text-white banner-sm-title mb-30"></p>
            <div class="home-primary-btn white-bg-btn" style="box-shadow: 0px 4px 0px 0px #9670FF;">Explore anniversary cakes</div>  
          </div>
        </div>
      </a>
      <a href="/customize">
        <img class="img-responsive main-banner-border hidden-xs" src="catalog/view/theme/default/image/Home/new-images/designer-cake-desk.webp" alt="birthday cake">
        <img class="img-responsive main-banner-border visible-xs" src="catalog/view/theme/default/image/Home/new-images/designer-cake-mob.webp" alt="birthday cake">
        <div class="banner-overlay-content">
          <div class="banner-title-row">
            <p class="banner-first-title" style="background: #FF7C78;color: #ffffff;">Design It Delicious</p>
            <h2 class="mb-30 banner-title">
              <span class="" style="background: linear-gradient(90deg, #FF7C77 0%, #FF2E9D 100%);-webkit-background-clip: text;-webkit-text-fill-color: transparent;">Craft Your Dream </span><br>
              <span class="" style="background: linear-gradient(90deg, #FF7C77 0%, #FF2E9D 100%);-webkit-background-clip: text;-webkit-text-fill-color: transparent;">Custom Cake</span>
            </h2>
            <p class="text-white banner-sm-title mb-30"></p>
            <div class="home-primary-btn white-bg-btn" style="box-shadow: 0px 4px 0px 0px #FF7C78;">Customize now</div>  
          </div>
        </div>
      </a>
    </div>
  </div>

  <div class="col-md-12 col-sm-12 col-xs-12 mb-15 usp-section">
    <div class="container xs-p-r-0 xs-p-l-0">
      <div class="row">
        <div class="usp-table-col">
          <div class="slide tag-section-btm tag-section-bottom-1">
            <div class="display-flex align-items-center">
              <div style="width: 65px;padding-right: 15px;">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/cakes-icon.svg" alt="5000+ Cakes">
              </div>
              <div style="width: calc(100% - 65px);">
                <h3 style="font-weight: 600" class="m-t-0 mb-5">5000+ Cakes</h3>
                <p style="font-size: 14px;">For all Occasions and Themes</p>
              </div>
            </div>
          </div>
          <div class="slide tag-section-btm tag-section-bottom-1">
            <div class="display-flex align-items-center">
              <div style="width: 65px;padding-right: 15px;">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/rated-icon.png" alt="Rated 4.8">
              </div>
              <div style="width: calc(100% - 65px);">
                <h3 style="font-weight: 600" class="m-t-0 mb-5">Rated 4.8*</h3>
                <p style="font-size: 14px;">Based on 5000+ Reviews</p>
              </div>
            </div>
          </div>
          <div class="slide tag-section-btm tag-section-bottom-1">
            <div class="display-flex align-items-center">
              <div style="width: 65px;padding-right: 15px;">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/egg-less.png" alt="Fresh &amp; Eggless 100%">
              </div>
              <div style="width: calc(100% - 65px);">
                <h3 style="font-weight: 600" class="m-t-0 mb-5">100%</h3>
                <p style="font-size: 14px;">Fresh &amp; Eggless</p>
              </div>
            </div>
          </div>
          <div class="slide tag-section-btm tag-section-bottom-1">
            <div class="display-flex align-items-center">
              <div style="width: 65px;padding-right: 15px;">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/fast-delivery.png" alt="Fast Delivery">
              </div>
              <div style="width: calc(100% - 65px);">
                <h3 style="font-weight: 600" class="m-t-0 mb-5">Fast Delivery</h3>
                <p style="font-size: 14px;">Across Multiple Cities</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<div class="bg-gray col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0 pt-40">
  <div class="teanding-section col-md-12 col-sm-12 col-xs-12 section-m-b">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0">
          <p class="section-title col-md-6 col-sm-6 col-xs-6 p-l-0">Trending Now</p>
          <!-- <div class="col-md-6 col-sm-6 col-xs-6 text-right">
            <a href="javascript:void(0)" class="view-all-btn">View All</a>
          </div> -->
        </div>
        <div class="row">
          <div class="treanding-slide col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0">
            <div class="slide">
              <a href="/surprise-cake-box">
                <div class="tranding-vector-img">
                  <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/treanding-vector-bg-min.png" alt="A colorful cake box with a big red bow reveal a surprise inside">
                  <img class="img-responsive trending-circl-img" src="catalog/view/theme/default/image/Home/new-images/surprise-box.png" alt="A colorful cake box with a big red bow reveal a surprise inside">
                  <div class="home-primary-btn trending-btn">Surprise Box</div>
                </div>
              </a>
            </div>
            <div class="slide">
              <a href="/floral-birthday-cakes">
                <div class="tranding-vector-img">
                  <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/treanding-vector-bg-min.png" alt="Pull Me up - Flavours Guru">
                  <img class="img-responsive trending-circl-img" src="catalog/view/theme/default/image/Home/new-images/floral-cakes.png" alt="floral cakes - Flavours Guru">
                  <div class="home-primary-btn trending-btn">Floral Cakes</div>
                </div>
              </a>
            </div>
            <div class="slide">
              <a href="/designer-cream-cake">
                <div class="tranding-vector-img">
                  <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/treanding-vector-bg-min.png" alt="A black cake adorned with a boom sign, resembling a bomb cake.">
                  <img class="img-responsive trending-circl-img" src="catalog/view/theme/default/image/Home/new-images/designer-cakes.png" alt="designer cakes ">
                  <div class="home-primary-btn trending-btn">Designer Cakes</div>
                </div>
              </a>
            </div>
            <div class="slide">
              <a href="/fault-line-cake">
                <div class="tranding-vector-img">
                  <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/treanding-vector-bg-min.png" alt="Green fault line birthday cake with white flowers">
                  <img class="img-responsive trending-circl-img" src="catalog/view/theme/default/image/Home/new-images/fault-line-min.png" alt="Green fault line birthday cake with white flowers">
                  <div class="home-primary-btn trending-btn">Fault Line Cakes</div>
                </div>
              </a>
            </div>
            <div class="slide">
              <a href="/balloon-cakes">
                <div class="tranding-vector-img">
                  <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/treanding-vector-bg-min.png" alt="A pink color balloon cake reveal a surprise inside.">
                  <img class="img-responsive trending-circl-img" src="catalog/view/theme/default/image/Home/new-images/ballon-cake-min.png" alt="A pink color balloon cake reveal a surprise inside.">
                  <div class="home-primary-btn trending-btn">Ballon Cakes</div>
                </div>
              </a>
            </div>
            <div class="slide">
              <a href="/isomalt-cakes">
                <div class="tranding-vector-img">
                  <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/treanding-vector-bg-min.png" alt="Isomalt Cakes - Flavours Guru">
                  <img class="img-responsive trending-circl-img" src="catalog/view/theme/default/image/Home/new-images/isomalt-min.png" alt="Isomalt Cakes - Flavours Guru">
                  <div class="home-primary-btn trending-btn">Isomalt Cakes</div>
                </div>
              </a>
            </div>
            <div class="slide">
              <a href="/pinata-cakes">
                <div class="tranding-vector-img">
                  <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/treanding-vector-bg-min.png" alt="Pinata Cakes - Flavours Guru">
                  <img class="img-responsive trending-circl-img" src="catalog/view/theme/default/image/Home/new-images/pinata.png" alt="Pinata Cakes - Flavours Guru">
                  <div class="home-primary-btn trending-btn">Pinata</div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <?php if($home_category && isset($home_category[0]) && isset($home_category[0]['products'])){ ?>
  <div class="best-seller-section col-md-12 col-sm-12 col-xs-12 section-m-b">
    <div class="container">
      <div class="row">
        <div class="row display-flex align-items-center">
          <p class="section-title col-md-6 col-sm-6 col-xs-8 p-l-0">Bestselling Cakes</p>
          <!-- <div class="col-md-6 col-sm-6 col-xs-4 text-right p-r-0 hidden-xs mb-20">
            <a href="https://www.flavoursguru.com/valentines.php" class="home-primary-btn position-relative">View All</a>
          </div> -->
        </div>
        <div class="row">
          <div class="treanding-slide col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0">
            <?php foreach($home_category[0]['products'] as $catproductContent){ ?>
               <div class="slide">
                <a href="<?php echo $catproductContent['href']; ?>">
                  <div class="best-seller-pd-col">
                    <div>
                      <img class="img-responsive img-zoom" src="<?php echo $catproductContent['image'];?>" alt="<?php echo $catproductContent['name'];?>" alt="<?php echo $catproductContent['name'];?>">
                    </div>
                    <div class="text-center">
                      <h4 class="product-name-title mt-20 mb-10"><?php echo $catproductContent['name'];?></h4>
                      <div class="mb-10 home_price"><?php echo $catproductContent['price'];?></div>
                      <div class="home-secondary-btn">
                        Buy Now
                      </div>
                    </div>
                  </div>
                </a>
               </div>
             <?php   } ?>
          </div>
          <div class="col-md-6 col-sm-6 col-xs-12 text-center p-r-0 visible-xs" style="margin-top: 15px;">
            <a href="https://www.flavoursguru.com/best-seller" class="home-primary-btn position-relative">View All</a>
          </div>
        </div>

      </div>
    </div>
  </div>
<?php } ?>

<div class="col-md-12 col-sm-12 col-xs-12 section-m-b home-header-tab m-t-0 bg-gray">
    <div class="container">
      <div class="row mb-40 display-flex align-items-center">
        <p class="section-title col-md-6 col-sm-6 col-xs-8 p-l-0 mb-0">Cakes by Profession</p>
        <div class="col-md-6 col-sm-6 col-xs-4 text-right p-r-0">
          <a href="/cakes-by-profession" class="home-primary-btn position-relative">View All</a>
        </div>
      </div>
    </div>
    <div class="container xs-p-r-0 xs-p-l-0">
      <div class="row">
        <ul>
          <li>
            <a href="/cakes-by-profession/doctor" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Doctor.png" alt="doctor presenting a heart cake">
            </a>
            <p>Doctor</p>
          </li>
          <li>
            <a href="/cakes-by-profession/engineers" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Engineer.png" alt="A man holding a wrench, with a cake for an engineer.">
            </a>
            <p>Engineer</p>
          </li>
          <li>
            <a href="/cakes-by-profession/entrepreneur" class="hover-zoom-col">
              <img  class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Entrepreneur.png" alt="An elegant cake adorned with edible gold flakes for an Entrepreneur.">
            </a>
            <p>Entrepreneur</p>
          </li>
          <li>
            <a href="/cakes-by-profession/blogger" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Blogger.png" alt="Beautifully decorated cake with edible flowers, ideal for a blogger's social media feed.">  
            </a>
            <p>Blogger</p>
          </li>
          <li>
            <a href="/cakes-by-profession/teacher" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Teacher.png" alt="A man with glasses standing next to a cake for teacher.">  
            </a>
            <p>Teacher</p>
          </li>
          <li>
            <a href="/custom-theme-cakes/makeup-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Makeup.png" alt="A beautifully decorated cake with makeup-themed decorations for a makeup artist.">
            </a>
            <p>Makeup</p>
          </li>
          <li>
            <a href="/cakes-by-profession/soldier" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Soldier.png" alt="A soldier-themed cake with camouflage pattern.">  
            </a>
            <p>Soldier</p>
          </li>
          <li>
            <a href="/cakes-by-profession/traveller" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Traveller.png" alt="Suitcase with beach chair and palm tree, perfect cake for traveler">  
            </a>
            <p>Traveller</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>

<div class="contact-less-section col-md-12 col-sm-12 col-xs-12 section-m-b p-r-0 p-l-0 mt-40">
  <?php /*<img style="border-radius: 15px;" class="img-responsive" src="catalog/view/theme/default/image/Home/Covid-Safe-Delivery-Banner.jpg" alt="Eggless cakes - Flavours Guru">  
  <a href="/experience-gift-ideas"><img class="img-responsive mb-20 hidden-xs" src="catalog/view/theme/default/image/Home/new-images/desktop-experience-banner.webp" alt="experience cakes - Flavours Guru"></a>
  <a href="/experience-gift-ideas"><img class="img-responsive mb-20 visible-xs" src="catalog/view/theme/default/image/Home/new-images/mobile-experience-banner.webp" alt="experience cakes 2 - Flavours Guru"></a>*/ ?>
  <div class="container">
  	<div class="row">
  		<div class="col-md-6 col-sm-6 col-xs-12 xs-mb-15 xs-p-r-0 p-l-0">
  			<a href="/her" class="hover-zoom-col">
  				<img class="img-responsive " src="catalog/view/theme/default/image/Home/new-images/cake-for-her.webp" alt="cake for her">
  			</a>
  		</div>
  		<div class="col-md-6 col-sm-6 col-xs-12 xs-p-r-0 xs-p-l-0 p-r-0">
  			<a href="/cakes-for-him" class="hover-zoom-col">
  				<img class="img-responsive " src="catalog/view/theme/default/image/Home/new-images/cake-for-him.webp" alt="cake for him">
  			</a>
  		</div>
  	</div>
  </div>
</div>

<div class="col-md-12 col-sm-12 col-xs-12 section-m-b home-header-tab m-t-0">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0">
        <p class="section-title col-md-12 col-sm-12 col-xs-12 p-l-0">Shop by Occasions</p>
      </div>
    </div>
    <div class="row hidden-xs shop_by_occasions_row">
      <div class="col-md-6 col-md-6 col-xs-12 xs-p-r-0 xs-p-l-0">
        <div class="row">
          <div class="col-md-6 mb-15 position-relative">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Birthday-Cakes.jpg" alt="A colorful mixture of birthday cakes with various designs and decorations">
            <a class="overlay-occasions-col text-center" href="/birthday">
              <div class="inner-overlay-cta-col"> 
                <p>Birthday Cakes</p>
                <div class="display-flex align-items-center overlay-cta">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                  <span>View More Cakes</span>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-6 mb-15 position-relative">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Anniversary-Cakes.jpg" alt="Anniversary Cake featuring a couple, held by a hand">
            <a class="overlay-occasions-col text-center" href="/anniversary">
              <div class="inner-overlay-cta-col"> 
                <p>Anniversary Cakes</p>
                <div class="display-flex align-items-center overlay-cta">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                  <span>View More Cakes</span>
                </div>
              </div>
            </a>
          </div>
        </div>
        <div class="row">
          <div class="position-relative col-md-12 col-sm-12 col-xs-12">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Bachelorette-Party.jpg" alt="A cake with a woman sitting on top, celebrating a Bachelorette Party">
            <a class="overlay-occasions-col text-center" href="/bachelorette-cake">
                <div class="inner-overlay-cta-col"> 
                  <p>Bachelorette Party</p>
                  <div class="display-flex align-items-center overlay-cta">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                    <span>View More Cakes</span>
                  </div>
                </div>
            </a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-12 position-relative  mb-15">
        <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Romantic-Love.jpg" alt="A selection of beautifully decorated cakes perfect for celebrating romantic love">
        <a class="overlay-occasions-col text-center" href="/anniversary/love-anniversary">
          <div class="inner-overlay-cta-col"> 
            <p>Romantic Love</p>
            <div class="display-flex align-items-center overlay-cta" >
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
              <span>View More Cakes</span>
            </div>
          </div>
        </a>
      </div>
      <div class="col-md-3">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12 position-relative  mb-15">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Wedding-Cakes.jpg" alt="Newlyweds slicing into a wedding cake together">
            <a class="overlay-occasions-col text-center" href="/wedding">
                <div class="inner-overlay-cta-col"> 
                  <p>Wedding Cakes</p>
                  <div class="display-flex align-items-center overlay-cta">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                    <span>View More Cakes</span>
                  </div>
                </div>
            </a>
          </div>
          <div class="col-md-12 col-sm-12 col-xs-12 position-relative">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Baby-Shower-Cakes.jpg" alt="A baby shower cake beautifully decorated for the celebration.">
            <a class="overlay-occasions-col text-center" href="/baby-shower-cakes">
                <div class="inner-overlay-cta-col"> 
                  <p>Baby Shower Cakes</p>
                  <div class="display-flex align-items-center overlay-cta">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                    <span>View More Cakes</span>
                  </div>
                </div>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="row visible-xs">
      <div class="treanding-slide col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0 shop_by_occasions_slide">
        <div class="slide">
          <div class="mb-15 position-relative">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Birthday-Cakes.jpg" alt="Flavours Guru">
            <a class="overlay-occasions-col text-center" href="/birthday">
              <div class="inner-overlay-cta-col"> 
                <p>Birthday Cakes</p>
                <div class="display-flex align-items-center overlay-cta">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                  <span>View More Cakes</span>
                </div>
              </div>
            </a>
          </div>
        </div>
        <div class="slide">
          <div class="mb-15 position-relative">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/anniversary-cake-mob.jpg" alt="Anniversary Cake featuring a couple, held by a hand">
            <a class="overlay-occasions-col text-center" href="/anniversary">
              <div class="inner-overlay-cta-col"> 
                <p>Anniversary Cakes</p>
                <div class="display-flex align-items-center overlay-cta">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                  <span>View More Cakes</span>
                </div>
              </div>
            </a>
          </div>
        </div>
        <div class="slide">
          <div class="mb-15 position-relative">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/romantic.webp" alt="A selection of beautifully decorated cakes perfect for celebrating romantic love">
            <a class="overlay-occasions-col text-center" href="/anniversary/love-anniversary">
              <div class="inner-overlay-cta-col"> 
                <p>Romantic Love</p>
                <div class="display-flex align-items-center overlay-cta">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                  <span>View More Cakes</span>
                </div>
              </div>
            </a>
          </div>
        </div>
        <div class="slide">
          <div class="mb-15 position-relative">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/wedding.webp" alt="Newlyweds slicing into a wedding cake together">
            <a class="overlay-occasions-col text-center" href="/wedding">
              <div class="inner-overlay-cta-col"> 
                <p>Wedding Cakes</p>
                <div class="display-flex align-items-center overlay-cta">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                  <span>View More Cakes</span>
                </div>
              </div>
            </a>
          </div>
        </div>
        <div class="slide">
          <div class="mb-15 position-relative">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/bachelorette.webp" alt="A cake with a woman sitting on top, celebrating a Bachelorette Party">
            <a class="overlay-occasions-col text-center" href="/bachelorette-cake">
              <div class="inner-overlay-cta-col"> 
                <p>Bachelorette Party</p>
                <div class="display-flex align-items-center overlay-cta" >
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                  <span>View More Cakes</span>
                </div>
              </div>
            </a>
          </div>
        </div>
        <div class="slide">
          <div class="mb-15 position-relative">
            <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/baby.webp" alt="A baby shower cake beautifully decorated for the celebration.">
            <a class="overlay-occasions-col text-center" href="/baby-shower-cakes">
              <div class="inner-overlay-cta-col"> 
                <p>Baby Shower Cakes</p>
                <div class="display-flex align-items-center overlay-cta">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path d="M8.74999 3L7.86612 3.88389C7.37796 4.37205 7.37796 5.16351 7.86612 5.65166C8.35427 6.13982 9.14573 6.13982 9.63388 5.65166C10.122 5.16351 10.122 4.37205 9.63388 3.88389L8.74999 3Z" fill=""/>
                  <path d="M15.25 3L14.3661 3.88389C13.878 4.37205 13.878 5.16351 14.3661 5.65166C14.8543 6.13982 15.6457 6.13982 16.1339 5.65166C16.622 5.16351 16.622 4.37205 16.1339 3.88389L15.25 3Z" fill=""/>
                  <path d="M12 3L12.8839 3.88389C13.372 4.37205 13.372 5.16351 12.8839 5.65166C12.3957 6.13982 11.6043 6.13982 11.1161 5.65166C10.628 5.16351 10.628 4.37205 11.1161 3.88389L12 3Z" fill=""/>
                  <path d="M9.5 7.77066C9.5 7.35645 9.16421 7.02066 8.75 7.02066C8.33579 7.02066 8 7.35645 8 7.77066V8.23445C6.82122 8.53913 6 9.62498 6 10.8564V10.9509C6.10036 10.9303 6.20229 10.913 6.30573 10.8991C8.16935 10.6494 10.0702 10.5207 12 10.5207C13.9298 10.5207 15.8306 10.6494 17.6943 10.8991C17.7977 10.913 17.8996 10.9303 18 10.9509V10.8564C18 9.62498 17.1788 8.53912 16 8.23445V7.77066C16 7.35645 15.6642 7.02066 15.25 7.02066C14.8358 7.02066 14.5 7.35645 14.5 7.77066V8.08895C13.9195 8.05716 13.3361 8.03637 12.75 8.02679V7.77066C12.75 7.35645 12.4142 7.02066 12 7.02066C11.5858 7.02066 11.25 7.35645 11.25 7.77066V8.02679C10.6639 8.03637 10.0805 8.05716 9.5 8.08895V7.77066Z" fill=""/>
                  <path d="M6.50491 12.3858C8.30269 12.145 10.137 12.0207 12 12.0207C13.863 12.0207 15.6973 12.145 17.4951 12.3858C18.9666 12.583 20 13.8585 20 15.2995V15.9928C19.4297 15.9928 18.8594 15.8618 18.3354 15.5998C16.8652 14.8648 15.1348 14.8648 13.6646 15.5998C12.6167 16.1238 11.3833 16.1238 10.3354 15.5998C8.86524 14.8648 7.13476 14.8648 5.66459 15.5998C5.14065 15.8618 4.57032 15.9928 4 15.9928V15.2995C4 13.8585 5.03337 12.583 6.50491 12.3858Z" fill=""/>
                  <path d="M17.6646 16.9415C18.3997 17.309 19.1998 17.4928 20 17.4928V18.5207C20 19.3491 19.3284 20.0207 18.5 20.0207H5.5C4.67157 20.0207 4 19.3491 4 18.5207V17.4928C4.80016 17.4928 5.60032 17.309 6.33541 16.9415C7.38329 16.4175 8.61671 16.4175 9.66459 16.9415C11.1348 17.6766 12.8652 17.6766 14.3354 16.9415C15.3833 16.4175 16.6167 16.4175 17.6646 16.9415Z" fill=""/>
                  </svg>
                  <span>View More Cakes</span>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="best-seller-section col-md-12 col-sm-12 col-xs-12 section-m-b">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0">
          <p class="section-title col-md-6 col-sm-6 col-xs-6 p-l-0">Cakes for Kids</p>
          <!-- <div class="col-md-6 col-sm-6 col-xs-6 text-right">
            <a href="javascript:void(0)" class="view-all-btn">View All</a>
          </div> -->
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row cakes-for-kids-row">
      <div class="treanding-slide col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0 cakes-for-kids">
          <div class="slide">
            <a href="/kids/boys">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Cake-for-Boys.jpg" alt="Cake designed with blue icing and toy cars, ideal for celebrating a boy's special day.">
                <div class="text-center">
                  <h4 class="product-name-title mt-20 mb-20">Cake for Boys</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="slide">
            <a href="/kids/girls">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Cake-for-Girls.jpg" alt=" A cake decorated with a girl holding balloons and a rainbow, perfect for a girl's celebration.">
                <div class="text-center">
                  <h4 class="product-name-title mt-20 mb-20">Cake for Girls</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="slide">
            <a href="/birthday/1st-birthday">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/First-Birthday.jpg" alt=" A cake with a teddy bear on top and a number one on the side. Perfect for a first birthday celebration.">
                <div class="text-center">
                  <h4 class="product-name-title mt-20 mb-20">First Birthday</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="slide">
            <a href="/birthday/half-birthday">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Half-Birthday.jpg" alt="Half Birthday cakes">
                <div class="text-center">
                  <h4 class="product-name-title mt-20 mb-20">Half Birthday</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
</div>

<div class="col-md-12 col-sm-12 col-xs-12 section-m-b home-header-tab m-t-0">
  <div class="container">
    <div class="row mb-40 display-flex align-items-center">
      <p class="section-title col-md-6 col-sm-6 col-xs-7 p-l-0 mb-0">Cartoon Cakes</p>
      <div class="col-md-6 col-sm-6 col-xs-5 p-r-0 text-right ">
        <a href="/cartoon-cakes" class="home-primary-btn position-relative">View All</a>
      </div>
    </div>
  </div>
  <div class="container xs-p-r-0 xs-p-l-0">
    <div class="row">
      <ul>
        <li>
          <a href="/custom-theme-cakes/unicorn-cakes" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Peppa-Pig.jpg" alt="Unicorn cakes">
          </a>
          <p>Unicorn</p>
        </li>
        <li>
          <a href="/cartoon-cakes/peppa-pig" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Unicorn.jpg" alt="A Peppa Pig cake with pink frosting">
          </a>
          <p>Peppa Pig</p>
        </li>
        <li>
          <a href="/cartoon-cakes/avengers" class="hover-zoom-col">
            <img  class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Avengers.jpg" alt="Cake adorned with Avengers logo and hammer motif.">
          </a>
          <p>Avengers</p>
        </li>
        <li>
          <a href="/cartoon-cakes/masha-and-the-bear-cake" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Masha-Bear.jpg" alt="A delightful Masha and the Bear cake beautifully decorated.">  
          </a>
          <p>Masha Bear</p>
        </li>
        <li>
          <a href="/cartoon-cakes/jurassic-park" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Dinosaur.jpg" alt="A cake decorated with dinosaurs and a volcano design, perfect for a dinosaur-themed party.">  
          </a>
          <p>Dinosaur</p>
        </li>
        <li>
          <a href="/cartoon-cakes/shin-chan-cakes" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Shin-Chan.jpg" alt="A delicious Shin Chan-themed cake with colorful icing">
          </a>
          <p>Shin Chan</p>
        </li>
        <li>
          <a href="/cartoon-cakes/panda" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Panda.jpg" alt="A panda cake with a cute panda face decoration on top">  
          </a>
          <p>Panda</p>
        </li>
        <li>
          <a href="/cartoon-cakes/barbie" class="hover-zoom-col">
            <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Barbie.jpg" alt="A Barbie doll cake with a pink dress and pink icing, perfect for any celebration.">
          </a>
          <p>Barbie</p>
        </li>
      </ul>
    </div>
  </div>
</div>

<div class="contact-less-section col-md-12 col-sm-12 col-xs-12 p-r-0 p-l-0">
  <img style="width: 100%" class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/prom-banner.webp" alt="Eggless cakes - Flavours Guru">
</div>

<div class="bg-gray col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0 pt-40 xs-bg-white">
  <div class="col-md-12 col-sm-12 col-xs-12 section-m-b home-header-tab m-t-0 section-m-b bg-gray  xs-bg-white">
    <div class="container">
      <div class="row mb-40 display-flex align-items-center">
        <p class="section-title col-md-6 col-sm-6 col-xs-7 p-l-0 mb-0">Cakes by Traits</p>
        <div class="col-md-6 col-sm-6 col-xs-5 text-right p-r-0">
          <a href="/cake-by-traits" class="home-primary-btn position-relative">View All</a>
        </div>
      </div>
    </div>
    <div class="container xs-p-r-0 xs-p-l-0">
      <div class="row">
        <ul>
          <li>
            <a href="/cake-by-traits/lazy-man" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Lazy.png" alt="Yellow emoticon wearing a red hat, representing 'Cake For lazy">
            </a>
            <p>Lazy</p>
          </li>
          <li>
            <a href="/cake-by-traits/gamer" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Gamer.png" alt="A purple controller with four buttons on it, designed for gamers.">
            </a>
            <p>Gamer</p>
          </li>
          <li>
            <a href="/custom-theme-cakes/shopping-cakes" class="hover-zoom-col">
              <img  class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Shopping.png" alt="Shopping Cakes">
            </a>
            <p>Shopping</p>
          </li>
          <li>
            <a href="/custom-theme-cakes/gym-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Gym-Lover.png" alt="Gym-themed cake with a yellow dumbbell and red bottle">  
            </a>
            <p>Gym Lover</p>
          </li>
          <li>
            <a href="/custom-theme-cakes/car" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Car-Lover.png" alt="Yellow car with black roof on dark background, perfect for car lovers.">  
            </a>
            <p>Car Lover</p>
          </li>
          <li>
            <a href="/custom-theme-cakes/football-cakes" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Football.png" alt="Cake decorated with football field design">
            </a>
            <p>Football</p>
          </li>
          <li>
            <a href="/cake-by-traits/foodie" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Foodie.png" alt="Hamburger on dark background">  
            </a>
            <p>Foodie</p>
          </li>
          <li>
            <a href="/cake-by-traits/workaholic" class="hover-zoom-col">
              <img class="img-responsive img-zoom" src="catalog/view/theme/default/image/Home/new-images/Workaholic.png" alt="A man multitasking with headphones looks workholic cake">
            </a>
            <p>Workaholic</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="best-seller-section col-md-12 col-sm-12 col-xs-12 section-m-b">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0">
          <p class="section-title col-md-6 col-sm-6 col-xs-12 mob-p-l-0">Shop by Flavours</p>
        </div>
        
        <div class="row xs-two-col for-mob-view-load-more">
          <div class="col-md-3 col-sm-3 col-xs-6 mb-40 visible">
            <a href="/regular-cakes/chocolate-cakes/">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Rich-Chocolate.jpg" alt=" Chocolate cake with whipped cream a decadent treat for chocolate lovers.">
                <div class="text-center">
                  <h4 class="product-name-title mt-20 mb-20">Rich Chocolate</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-6 mb-40 visible">
            <a href="/regular-cakes/red-velvet/">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Premium-Red-Velvet.jpg" alt="A cherry-topped premium red velvet cake in the picture">
                <div class="text-center">
                  <h4 class="product-name-title mt-20 mb-20">Premium Red Velvet</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-6 mb-40 visible">
            <a href="/regular-cakes/black-forest-cakes/">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Exotic-Black-Forest.jpg" alt="Black Forest Cakes ecadent dessert with layers of rich chocolate cake">
                <div class="text-center">
                  <h4 class="product-name-title mt-20 mb-20">Exotic Black Forest</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-6 mb-40 visible">
            <a href="/regular-cakes/pineapple-cakes/">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Sweet-Pineapple.jpg" alt="Delicious pineapple cakes with a sweet and tropical flavor">
                <div class="text-center">
                  <h4 class="product-name-title mt-20 mb-20">Sweet Pineapple</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-6 mb-40 visible">
            <a href="/regular-cakes/fruit-cakes/">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Cravy-Fruit-Cake.jpg" alt=" A close-up photo of a delicious fruit cake with colorful fruits on top, making it look irresistibly cravy.">
                <div class="text-center hide-title-col">
                  <h4 class="product-name-title mt-20 mb-20">Cravy Fruit Cake</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-6 mb-40 visible">
            <a href="/regular-cakes/blueberry-cakes/">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Fab-Blueberry.jpg" alt="blueberry cakes topped with powdered sugar and fresh blueberries">
                <div class="text-center hide-title-col">
                  <h4 class="product-name-title mt-20 mb-20">Fab Blueberry</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-6 mb-40">
            <a href="/regular-cakes/vanilla-cakes/">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Yummy-Vanilla.jpg" alt="Vanilla cake topped with frosting and sprinkles.">
                <div class="text-center">
                  <h4 class="product-name-title mt-20 mb-20">Yummy Vanilla</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-6 mb-40">
            <a href="/regular-cakes/butterscotch-cakes/">
              <div class="best-seller-pd-col">
                <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Yay-Butterscotch.jpg" alt="Delicious butterscotch cakes with a golden brown crust and a creamy caramel filling">
                <div class="text-center">
                  <h4 class="product-name-title mt-20 mb-20">Yay Butterscotch</h4>
                  <div class="home-secondary-btn">
                    View All
                  </div>
                </div>
              </div>
            </a>
          </div>
        </div>
        <div class="white-gradiant-overlay">
        </div>
        <div class="row visible-xs">
          <div class="text-center p-t-15 p-b-15">
            <div class="home-primary-btn load-more-product">View All</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0 pt-40 form-bg-img" style="background-image: url('catalog/view/theme/default/image/Home/new-images/banner-customized.webp');">
  <div class="container">
    <div class="row display-flex align-items-center">
      <div class="col-md-6 col-sm-6 col-xs-12 xs-p-r-0 p-l-0">
        <div class="img-preview-slide-col">
          <div class="items">
            <div class="img-preview-slide">
              <img class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/prev-img-slide.jpg" alt="">
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-sm-6 col-xs-12 p-r-0 xs-p-l-0">
        <form action="/customize" method="post" id="contactForm" enctype="multipart/form-data" class="form-horizontal">
          <div>
            <h4 class="home_form_title mb-30">Design your dream cake with our customisation options!</h4>
          </div>
          <div class="form-group">
            <div class="">
              <div class="col-md-6 col-sm-6 col-xs-6 xs-pr-7.5">
                <input type="text" placeholder="Your Name *" class="home_contact_input" name="name" required="">
              </div>
              <div class="col-md-6 col-sm-6 col-xs-6 xs-pl-7">
                <input type="text" placeholder="Your Phone *" class="home_contact_input phonenum" name="phone" required="">
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <input type="text" placeholder="Your Email *" class="home_contact_input" name="email" required="">
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="msg-file-col">
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input  type="file" class="home_contact_input" id="upload_img" accept="image/*" name="image" required="">
                <?php /* ?<label for="upload_img" class="home_contact_textarea position-relative file-upload-label">
                  <p class="mb-0">Upload Reference Image</p>
                  <p class="mb-0" style="color: #011149;font-size: 10px;opacity: 0.4;">Supported Formats: JPEG. PNG, PDF</p>
                  <p class="mb-0" style="color: #011149;font-size: 10px;display: none;">abcdefgfhh.....jpg</p>
                  <div class="file-img-upload">
                    <img src="catalog/view/theme/default/image/Home/new-images/file-upload-icon.svg" alt="">
                  </div>
                </label>
                <?php */ ?>
              </div>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <textarea class="home_contact_textarea custom-scroll" name="enquiry" placeholder="Describe your cake... *" required=""></textarea>
              </div>
            </div>
          </div>
          <div>
            <input type="button" value="Connect with our Cake Expert" class="home-primary-btn full-width border-0 saveCustomize" name="">
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
	
	<?php if($allreviews['cnt'] > 0){ ?>
  <div class="col-md-12 col-sm-12 col-xs-12 social-review-section">
    <div class="container xs-p-r-0">
      <div class="row mb-40">
        <p class="section-title col-md-6 col-sm-6 col-xs-12 p-l-0 mb-0">What our customers say about us!</p>
      </div>
    </div>
    <div class="container xs-p-r-0">
      <div class="row google-review-row">
        <div class="review-slider">
        <?php $x = 0; foreach ($allreviews['all'] as $value) { if($x == 5) { break; } ?>
          <div class="review-col slide">
            <div class="review_2_section">
              <div class="home-google-review">
                <div class="text-center border-btm-1 border-color-primary">
                  <div class="mb-30 xs-mb-15">
                    <img src="catalog/view/theme/default/image/Home/new-images/google-img.png" alt="">
                  </div>
                  <div class="mb-30 xs-mb-15">
                    <p><?php echo ucfirst($value['text']) ?></p>
                    <p><?php echo date('d-M-Y', strtotime($value['date_added'])) ?> </span> <span><?php echo date('h.i A', strtotime($value['date_added'])) ?></p>
                  </div>
                </div>
              </div>
              <div class="">
                <div class="display-flex item-center m-b-20 review_inner_2">
                  <div class="m-r-15">
                    <div class="google-testimonial-name">
                      <?php 
                        $cus_first_char = $value['author'];
                        $first = substr($cus_first_char, 0, 1); 
                      ?>
                      <span><?php echo $first ?> </span>
                    </div>
                    <!-- <img class=" img-responsive img-circle" src="catalog/view/theme/default/image/Home/new-images/review-user-img.jpg" alt=""> -->
                  </div>
                  <div>
                    <p class="review_name"><?php echo ucwords($value['author']) ?></p>
                    <div id="stars">
                      <span class="review_name"><?php echo $value['rating'] ?>/5</span>
                      <label data-value="1" for="rating_01" class="fill_rating <?php echo (round($value['rating']) >= 1) ? 'star_selected' : '' ?>">
                      <input style="display: none;" id="rating_01" type="radio" name="rating" value="1">
                      <i class="fa fa-star fa-fw"></i>
                      </label>
                      <label data-value="2" for="rating_02" class="fill_rating <?php echo (round($value['rating']) >= 2) ? 'star_selected' : '' ?>">
                      <input style="display: none;" id="rating_02" type="radio" name="rating" value="2">
                      <i class="fa fa-star fa-fw"></i>
                      </label>
                      <label data-value="3" for="rating_03" class="fill_rating <?php echo (round($value['rating']) >= 3) ? 'star_selected' : '' ?>">
                      <input style="display: none;" id="rating_03" type="radio" name="rating" value="3">
                      <i class="fa fa-star fa-fw"></i>
                       </label>
                      <label data-value="4" for="rating_04" class="fill_rating <?php echo (round($value['rating']) >= 4) ? 'star_selected' : '' ?>">
                      <input style="display: none;" id="rating_04" type="radio" name="rating" value="4">
                      <i class="fa fa-star fa-fw"></i>
                      </label>
                      <label data-value="5" for="rating_05" class="fill_rating <?php echo (round($value['rating']) >= 5) ? 'star_selected' : '' ?>">
                      <input style="display: none;" id="rating_05" type="radio" name="rating" value="5">
                      <i class="fa fa-star fa-fw"></i>
                      </label>
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

  <div class="col-md-12 col-sm-12 col-xs-12 p-t-15 xs-p-r-0 xs-p-l-0">
      <div class="container">
        <div class="row">
            <h1 class="section-title">Cake Delivery Online</h1>

            <h2 class="home-h2 section_head">Online Cakes: Delectable Desserts for Super Special Occasions</h2>
            <div class="home-p">
              <p>Delving into a delicious and creamy extravaganza with delectable and creamy cakes is the demand of every special occasion. Cakes uplift the mood of every celebration with their scrumptious flavors and attractive designs. These are the most anticipated gift items expected by everyone from their dear ones which adds so much happiness and enthusiasm in any celebration.<!-- <span id="dots">...</span> --></p>
              <p>With the rising popularity of the online cake shops which provides home delivery services of amazing cakes at the doorsteps, there is no need to rush to the nearby local bakeries to place the orders for cakes. Now, orders can be placed for cakes online with just a few clicks on the phone while sitting in the comfort of one’s home or office. Moreover, these websites also give you flexibility to select the preferred time slots within which you wish to deliver your cakes. The range with these portals is quite large and intriguing and provides you a much clearer glimpse of the cake for which you are placing your order. What a mind-blowing service, isn’t it? </p>
            </div>
            
            <div id="more" class="">
            <h2 class="home-h2 ">Explore Scrumptious Variety of Eggless Cakes with Good Taste Guaranteed</h2>
            <div class="home-p">
              <p class="">Flavourguru.com is a premium cake shop that offers incredible services of online cake delivery in Delhi/NCR. The great assortment of eggless cakes found here is known for its delicious flavors and fresh textures among customers. All our cakes are prepared using the best quality ingredients to retain the right taste and richness without compromising on the quality.  So, whether it is a birthday cake, an anniversary cake, or cakes for Father’s Day online, our online cake shop has everything you are looking for. The gigantic cake assortment provides you with nice options to select the best cakes for your dear ones. </p>
            </div>

            <h2 class="home-h2 section_head">Online Cake Delivery – Flavourguru.com:</h2>
            <div class="container home-p">
              <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-12 home_des_ft m-b-20">
                  <ul>
                    <li class="bd_li">Cake by Types</li>
                    <li>Regular Cream Cakes</li>
                    <li>Designer cakes</li>
                    <li>Fondant Cakes</li>
                    <li>Photo Cakes</li>
                    <li>Multi-Tier Cakes</li>
                    <li>Photo Cakes</li>
                  </ul>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12 home_des_ft m-b-20">
                  <ul>
                    <li class="bd_li">Cakes by Occasion</li>
                    <li>Father’s Day Cakes</li>
                    <li>Birthday Cakes</li>
                    <li>Anniversary Cakes</li>
                    <li>Wedding Cakes</li>
                    <li>Christmas Cakes</li>
                    <li>Friendship’s day Cakes</li>
                  </ul>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12 home_des_ft m-b-20">
                  <ul>
                    <li class="bd_li">Cakes by Relation</li>
                    <li>Cakes for Husband or Wife</li>
                    <li>Cakes for Son or Daughter</li>
                    <li>Cakes for Father or Mother</li>
                    <li>Cakes for Brother or Sister</li>
                    <li>Cakes for Boyfriend or Girlfriend</li>
                    <li>Cakes for Kids or Friends</li>
                  </ul>
                </div>
              </div>
            </div>
            <h2 class="home-h2">Send Cakes to India in a Jiffy with Flavours Guru</h2>
            <div class="home-p">
              <p class="">Do you wish to send your love and best wishes to your loved ones residing in India on their special occasion? Then, you can go ahead with this idea by opting for cake delivery online. Flavoursguru.com is a reliable online cake bakery boasting of a magnificent range of cakes which can be delivered in a jiffy through its impeccable and flawless online cake delivery in Delhi NCR. Now, delicious cakes can be sent to India in a pocket-friendly manner with this website and occasions can be made memorable and fantastic by opting for its services. </p>
            </div>

            <h2 class="home-h2">Why prefer Online Cake delivery in Delhi/NCR from this Online Cake Shop?</h2>
            <div class="home-p">
              <p>Flavoursguru.com is gradually climbing the ladders of success with its amazing and striking cake delivery services in the regions of Delhi and National Capital Regions. Apart from making the Delhiites happy as a clam, it is also making the citizens of NCR happier with its online cake delivery in Gurgaon, Faridabad, Noida, and Greater Noida. Covering almost every corner of these cities, acquiring cakes is not a tiresome deal anymore. Now, your cakes will reach their desired destinations within time and will bring instant happy smiles on the faces of your loved ones. </p>
            </div>

            <h2 class="home-h2">The other reasons for opting this website includes-</h2>
            <div class="home-p">
              <ul style="padding-left: 15px;" class="home-ft-ul">
                <li style="">The freshest range of cakes in all shapes and sizes.</li>
                <li>Midnight cake delivery available.</li>
                <li>A great amount of choices </li>
                <li>Cash on delivery available</li>
                <li>Eggless cakes – A perfect treat for vegetarians</li>
              </ul>
            <p class="home-p">So, don’t just wait, place your orders now!!!</p>
            </div>
          </div>
          <!-- <div onclick="readmore()" id="myBtn" class="readmore">Read more...</div> -->
        </div>
    </div>

<!--start of Badge Script-->
<script> 
  jQuery(document).ready(function($){
    jQuery('.saveCustomize').click(function(){
    	if($('.phonenum').val().length != 10){
    		alert("Please enter valid phone number.");
    		return;
    	}
      $('.saveCustomize').val("Saving data....");
      $.ajax({
           url: 'index.php?route=information/customize/customizeAjaxAdd',
           type: 'post',
           dataType: 'json',
           data: new FormData($('#contactForm')[0]),
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
               $('.saveCustomize').val("Please try again!");
               $("#contactForm").trigger("reset");
             }
   
             if (json['success']) {
              $('.saveCustomize').val("Sit back and relax! We'll connect with you shortly.");
              $("#contactForm").trigger("reset");
               /*$('.text-success').show();
               $('.text-success').text(json['success']);
               $("#image-to-place").empty();
               $("#image-to-place").append('<img src="'+json['imagePath']+'" height="82" width="100" />');
               $(node).parent().find('input').val(json['code']);*/
             }
           },
           error: function(xhr, ajaxOptions, thrownError) {
             alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
           }
         });
    })
    jQuery(".section_wrap > h2").click(function(){
      jQuery(".hidden-text").slideUp();
      jQuery(this).parent().siblings().removeClass("active");
      if(jQuery(this).parent().hasClass("active")){
        jQuery(this).parent().removeClass("active");
        }
        else{
      jQuery(this).next().slideToggle();
      jQuery(this).parent().addClass("active");
      }
    });
    jQuery(".home-h2").click(function(){
      $('.home-h2').removeClass('active');
      $('.home-p').hide();
      $(this).addClass('active');
      $(this).next().show();
    });

    jQuery(".load-more-product").click(function(){
      $(this).hide();
      $('.for-mob-view-load-more > div').show();
      $('.for-mob-view-load-more .best-seller-pd-col .text-center.hide-title-col').show();
      $('.white-gradiant-overlay').hide();
    });
  }); 
</script>
<!--End of Badge Script-->

<script>
  $('.carousel').slick({
  infinite: true,
  slidesToShow: 3,
  slidesToScroll: 1,
  arrows: true,
  autoplay: true,
  autoplaySpeed: 2000,
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
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 767,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }

      ]
    });

  /*$('.usp-table-col').slick({
  infinite: true,
  slidesToShow: 4,
  slidesToScroll: 1,
  arrows: false,
  dots:false,
  responsive: [
        {
          breakpoint: 1200,
          settings: {
            slidesToShow: 4,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 991,
          settings: {
            slidesToShow: 3,
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
          breakpoint: 520,
          settings: {
            infinite: false,
            slidesToShow: 1.4,
            slidesToScroll: 1
          }
        }

      ]
    });*/

  $('.treanding-slide').slick({
  infinite: false,
  slidesToShow: 4,
  slidesToScroll: 1,
  //centerMode: true,
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
            slidesToShow: 3,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 767,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        }
      ]
    });

  $('.review-slider').slick({
  infinite: false,
  slidesToShow: 3,
  slidesToScroll: 1,
  //centerMode: true,
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
            slidesToShow: 1.1,
            slidesToScroll: 1,
            arrows: false,
            dots:true
          }
        }
      ]
    });

  $('.banner-slide').slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    speed: 800,
    dots: true,
    autoplay: true,
    autoplaySpeed: 6000,
  });

  /*function readmore() {
    var dots = document.getElementById("dots");
    var moreText = document.getElementById("more");
    var btnText = document.getElementById("myBtn");

    if (dots.style.display === "none") {
      dots.style.display = "inline";
      btnText.innerHTML = "Read more";
      moreText.style.display = "none";
    } else {
      dots.style.display = "none";
      btnText.innerHTML = "Read less";
      moreText.style.display = "inline";
    }
  }*/
</script>

<!-- BEGIN GCR Language Code -->
<script>
  window.___gcfg = {
    lang: 'en'
  };
</script>
<!-- END GCR Language Code -->

<style type="text/css">
.occassions { width: 100%; position: relative; z-index: 9; background: #fff; clear: both; }
.occassions ul { overflow-x: scroll; overflow-y: hidden; white-space: nowrap; font-size: 0; padding: 0 12px; }
.occassions li { width: 20%; margin: 0 12px 0 0; vertical-align: top; padding: 10px 0; text-align: center; }
.occassions li.column.column-block { float: none; display: inline-grid }
.slider-mobile{ display: none;}
.column.column-block span a { font-size: 13px !important; font-weight: 500 !important;}
.giftBlocks div span a {color: #81340e !important;}
form#contactForm{
  background:none !important;
  padding: 0 !important; 
} 
form#contactForm div.form-group div.col-sm-6 {
  width: 50%;
}

@media screen and (max-width:767px){
.slider-mobile{display: block; }
.giftBlocks{ display: none; }
.column.column-block img { width: 58px; margin: auto; display: block; }
.column.column-block span a { font-size: 13px !important; font-weight: 600 !important; color: #5e1d1d !important;}
  }
</style>
    <?php echo $column_right; ?></div>
</div>


<div style="display: none;">
  <div itemscope itemtype="http://schema.org/Organization">
    <span itemprop="name">Flavours Guru</span>
    <span itemprop="url">https://www.flavoursguru.com/</span>
    <spanitemprop="logo">https://www.flavoursguru.com/image/catalog/Flavours%20Guru/logo.png</span>
    <span itemprop="sameAs">["https://www.facebook.com/flavoursgurubakery",
    "https://twitter.com/flavoursguru"
    "https://www.instagram.com/flavoursguru/"
    "https://in.pinterest.com/flavoursgurudm/"]</span>
    Contact Details:
    <div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
      Main address:
        <span itemprop="addressLocality"> Delhi</span>
        <span itemprop="addressRegion">New Delhi, Delhi</span>
        <span itemprop="streetAddress"> Delhi, India </span>
        <span itemprop="postalCode">110017</span>,
    </div>
      Tel:<span itemprop="telephone"> +91 8130961414</span>,
  </div>
</div>
<script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      "url": "https://www.flavoursguru.com/",
      "potentialAction": {
        "@type": "SearchAction",
        "target": "https://www.flavoursguru.com/index.php?route=product/search&search={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }
    </script>
<div style="display: none;">
	<ul itemscope itemtype="http://www.schema.org/SiteNavigationElement">
		<li itemprop="name"><a itemprop="url" href="https://www.flavoursguru.com/birthday">Birthday Cakes</a></li>
		<li itemprop="name"><a itemprop="url" href="https://www.flavoursguru.com/anniversary">Anniversary Cakes</a></li>
		<li itemprop="name"><a itemprop="url" href="https://www.flavoursguru.com/cartoon-cakes">Cartoon Cakes</a></li>
		<li itemprop="name"><a itemprop="url" href="https://www.flavoursguru.com/best-seller">Best Sellers</a></li>
		<li itemprop="name"><a itemprop="url" href="https://www.flavoursguru.com/photo-cakes">Photo Cakes</a></li>
		<li itemprop="name"><a itemprop="url" href="https://www.flavoursguru.com/new-arrival-cakes">New Arrivals</a></li>
		<li itemprop="name"><a itemprop="url" href="https://www.flavoursguru.com/custom-theme-cakes">Theme Cakes</a></li>
		<li itemprop="name"><a itemprop="url" href="https://www.flavoursguru.com/contact">Contact Us</a></li>
		<li itemprop="name"><a itemprop="url" href="https://www.flavoursguru.com/ordertrack">Track Order</a></li>
	</ul>	
</div>


<?php echo $footer; ?> 