<?php echo $header; ?>
<style type="text/css">
  .contact_left{
    width: 100%;
    color: #ffffff;
    /*float: initial;*/
  }
  .cont_us{
    width: 50%;
    color: #ffffff;
    padding: 20px;
    border-right: 1px solid #ffffff;
  }
  .cont_us p{
    color: #ffffff;
    font-size: 17px;
  }
  .contact_left{
    display: flex;
    display: -webkit-box;
    align-items: center;
    flex-wrap: wrap;
    border-radius: 15px;
  }
  .contact_help_you p{
    color: #ffffff;
    font-size: 17px !important;
    letter-spacing: 0.25px;
  }
  .cont_us h3{
    margin-bottom: 15px;
  }
  .contact_help_you{
    width: 50%;
  }

  .customise-slider img{
    border-radius: 6px;
    border:2px solid #e2e2e2;
  }
  .productName{    margin-top: -10px;
    font-size: 14px;
    text-align: center;
  }
  form#contactForm{
    background:none;
  }
  .type-card-wrapper{
    position: relative;
  }
  .type-card-wrapper .slide-view-all-testimonial{
    position: initial;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 210px;
    transform: initial;
  }
  .catDescription{
    margin-top: 25px;
    padding-right: 0;
    padding-left: 0;
  }
  @media screen and (max-width: 767px){
    .type-card-wrapper .slide-view-all-testimonial{
      height: 130px;
    }
    .mob-p-l-r-15{
      padding-left: 15px;
      padding-right: 15px;
    }
    form#contactForm{
      padding: 0;
    }
    .contact_help_you, .cont_us{
      width: 100%;
      border-right: 0;
    }
    .cont_us{
      padding-left: 0;
      padding-right: 0;
    }
    #catDescription p{
      display: block;
    }
    .contact_left{
      flex-direction: column;
      display: initial;
    }
    button.slick-next.slick-arrow {
        right: 0;
        top: 50%;
        margin-top: -11.5px;
    }
    button.slick-prev.slick-arrow {
        left: 0;
        top: 50%;
        margin-top: -11.5px;
    }
  }
</style>
<div class="container top_positionn">
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
    <div id="content" class=""><?php //echo $content_top; ?>
      <div class="row">
        <div class="top corporatebox" style="margin-bottom: 25px;">
          <div class="master">
            <div class="customise-slider type-one-carousel">
              <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/05-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div>

              <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/11-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div>
              <!-- <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/cust-cake3.webp" alt="Cake"/>
                  </div>
                </div>
              </div> -->

              <div class="type-card-wrapper">
                <div class="type-card">
                <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/01-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div>

              <!-- <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/02-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div> -->

              <!-- <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/03-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div> -->
              <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/04-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div>
              <!-- <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                  <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/cust-cake1.webp" alt="Cake"/>
                  </div>
                </div>
              </div>
              <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/06-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div>
              <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/07-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div>
              <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/08-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div>
              <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/09-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div>
              <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                    <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/10-min.webp" alt="Cake"/>
                  </div>
                </div>
              </div>
              <div class="type-card-wrapper">
                <div class="type-card">
                 <div class="tmls-testimonial">
                  <img loading="lazy" decoding="async"src="catalog/view/theme/default/image/cust-cake2.webp" alt="Cake"/>
                  </div>
                </div>
              </div> -->
              <div class="slide type-card-wrapper">
                  <div class="slide-view-all-testimonial">
                    <a href="https://www.flavoursguru.com/blogs/customised-cake-images/">View All &nbsp; <img loading="lazy" decoding="async"style="border: 0;" class="view-arrow" src="catalog/view/theme/default/image/Home/arrow-right-black.webp" alt="" /></a>
                  </div>
              </div>
            </div>
          </div>
        </div>
   
        <div class="contact_left mob-p-l-r-15">
          <div class="cont_us col-md-6 col-sm-12 col-xs-12">
            <h3>Bake Your Own Cake!</h3>
            <p>Our team of professional bakers are highly trained and equipped to bake any kind of cake you want. Our QA's keep a tap on quality, design and presentation at each step while it is produced and we guarantee to match upto 99% of your expectations.</p>
            <p>You just have to describe the cake you want and upload a reference image if you have any. Our custom cake specialist will call you within minutes to understand more about your cake in detail and take your order over call itself.</p>
            <p>Alternatively you can also Call or Whatsapp us on <strong>+91 8130961414</strong></p>
          </div>
          <div class="contact_help_you col-md-6 col-sm-12 col-xs-12">
            <div class="my_account_top">
              <div class="other_link ">
                <div id="common" style="display:block;">
                  <div class="address_book_row_form">
                    <form action="<?php echo $action; ?>" method="post" id="contactForm" enctype="multipart/form-data" class="form-horizontal">
                      <fieldset>
                         <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                          <div class="col-sm-6">
                            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                            <?php if ($error_name) { ?>
                            <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                          <div class="col-sm-6">
                            <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                            <?php if ($error_email) { ?>
                            <div class="text-danger"><?php echo $error_email; ?></div>
                            <?php } ?>
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 " for="input-phone"><?php echo 'Phone No.'; ?></label>
                          <div class="col-sm-6">
                            <input type="text" name="phone" value="<?php echo $phone; ?>" id="input-phone" maxlength="10" class="form-control" />
                            <?php if ($error_phone) { ?>
                            <div class="text-danger" ><?php echo $error_phone; ?></div>
                            <?php } else { ?>
                             <div class="text-danger" id="errortelephoneMsg"> </div>
                             <?php } ?>
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-enquiry">Describe your cake</label>
                          <div class="col-sm-6">
                            <textarea name="enquiry" rows="6" id="input-enquiry" class="form-control heightauto"><?php echo $enquiry; ?></textarea>
                            <?php if ($error_enquiry) { ?>
                            <div class="text-danger" ><?php echo $error_enquiry; ?></div>
                            <?php } ?>
                          </div>
                        </div>

                        <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-enquiry">Attach reference image</label>
                          <div class="col-sm-6">
                            <input id="file" name="image" type="file" />
                            <?php /*if ($error_enquiry) { ?>
                            <div class="text-danger" ><?php echo $error_enquiry; ?></div>
                            <?php }*/ ?>
                          </div>
                          
                        </div>
                        <?php echo $captcha; ?>
                      </fieldset>
                      <div class="buttons formbutton">
                        <div class="pull-left">
                          <input class="btn btn-primary" type="button" id="submits" value="<?php echo $button_submit; ?>" />
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="top slider corporatebox">
        <div class="master">
          <h2 class="re-title">REVIEWS</h2>
          <div class="carousel type-one-carousel">
            <div class="type-card-wrapper">
              <div class="type-card">
                <div class="tmls-testimonial">
                    <p>Superb tasty cakes with amazing ambience.they are not just excellent in providing tasty cakes with creative ideas (with the option to customise the style) but have also taken good care of cleanliness. Best place to visit &amp; order. You can't get enough with it!</p>
                    <div class="tmls-name">Komal Lang</div>
                </div>
              </div>
            </div>
            <div class="type-card-wrapper">
              <div class="type-card">
                <div class="tmls-testimonial">
                  <p>Thank you Flavours guru, another amazing cake. I was delighted with it and it went down very well... delicious. Will be in touch for the next event.</p>
                  <div class="tmls-name">Gopal Singh Rajput</div>
                </div>
              </div>
            </div>
            <div class="type-card-wrapper">
              <div class="type-card">
                <div class="tmls-testimonial">
                  <p><span>Thank u for the yummy cake and timely delivery. My son is super happy. Thank you for making his day special.</span></p>
                  <div class="tmls-name">Sowmiya Kasturirangan</div>
                </div>
              </div>
            </div>
            <div class="type-card-wrapper">
              <div class="type-card">
                <div class="tmls-testimonial">
                  <p><span>Flavour Guru....as the name suggest is truly guru of flavours...luv their cakes...taste is awesome n lovely presentation...totally worth giving a try.… </span></p>
                  <div class="tmls-name">Varsha Singh</div>
                </div>
              </div>
            </div>
            <div class="type-card-wrapper">
              <div class="type-card">
                <div class="tmls-testimonial">
                  <p><span>Hang on this is just the right place for you to satisfy your sweet tooth and the hunger pangs. Must try!</span></p>
                  <div class="tmls-name">Niha Imtiaz</div>
                </div>
              </div>
            </div>
            <div class="type-card-wrapper">
              <div class="type-card">
                <div class="tmls-testimonial">
                  <p><span>I ordered for Red valvet choclate brownie cake and walnut choclate cake..I must say the cakes were awesome and very tasty..every bite of red valvet is rich in terms of walnuts..Superb job</span></p>
                  <div class="tmls-name">Pallavi Chand</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-12 col-sm-12 col-xs-12 catDescription" id="catDescription"><h2><strong>Why will you choose the custom cake for your celebrations?</strong></h2>
<p><span style="font-weight: 400;">No matter the occasion or the type of cake, all custom cakes start from the basics. Before you decide on decorating, consider what kind of cake you want, including flavor, filling, icing, or frosting. Next, you can get more detailed information such as which dessert for the occasion, including prices, and how to order custom cakes near me from FlavorsGuru.</span></p>
<h2><strong>Average prices for custom cakes:</strong></h2>
<p><span style="font-weight: 400;">Many things can go into the price of a custom birthday cake. To help you understand the cost, many bakeries charge a prorated fee for the activity. The bakery may charge $1 to $15 per piece depending on the fineness of the custom cake. For some, custom cake shops near me may be required, which may incur additional charges. This value can range from $50 to several hundred dollars. Some bakeries may charge fixed prices or increase them over time if you plan a tasting.</span></p>
<p>If you have a limited budget, there are many ways to reduce custom cake prices for your custom cakes. Simple cakes with classic flavors and shapes are cheaper and easier to assemble. You might want to think about serving and slicing the cake yourself. We can use edible custom cake toppers.</p>
<h3><strong>Types of cakes designed to serve:</strong></h3>
<p><span style="font-weight: 400;">The three main types of the custom cake design that are available and can be ordered online are described below:</span></p>
<p><strong>Fondant Cake:</strong></p>
<p><span style="font-weight: 400;">The cakes are made to order and designed to perfection with an additional edible top layer of icing. Make people drool too. </span><a href="https://www.flavoursguru.com/fondant-cakes"><span style="font-weight: 400;">Fondant cakes</span></a><span style="font-weight: 400;"> are also called designer cakes. It is therefore essential to note that fondant is prepared from three main ingredients: sugar, gelatin, and glucose. These customized cakes for the boyfriend are in great demand. So always choose the best option available on the market, such as FlavorsGuru.</span></p>
<p><span style="font-weight: 400;">Although most cakes are edible, some are decorated with toppings made from ready-to-use ingredients. Because the cakes are made to order, there are many colors. However, we work best with FSSAI-certified paint. There is an option to use vegan ingredients for those who want it. We can entirely rely on the customized cake for the husband.</span></p>
<h3><strong>Made-to-order cream cakes:</strong></h3>
<p><span style="font-weight: 400;">These designer cakes are everyone's all-time favorite! Since childhood, we grew up with pastries and cakes while thoroughly enjoying the cream. We make different types of cakes, from </span><a href="https://www.flavoursguru.com/cartoon-cakes/barbie/"><span style="font-weight: 400;">Barbie cakes</span></a><span style="font-weight: 400;"> to character cakes to teddy cakes to customized </span><a href="https://www.flavoursguru.com/birthday"><span style="font-weight: 400;">birthday cake</span></a><span style="font-weight: 400;"> for lawyers. Each piece has its charm.</span></p>
<p><span style="font-weight: 400;">We are a bakery that is 100% reliable for using the best quality cream and flour to prepare cakes with just the right amount of frosting in all customized cakes along with regular cakes. Now you can enjoy a delicious customized cake for mom like never before! You can customize the cake to your liking, and FlavorsGuru does its job with the utmost meticulous detailing to the smallest detail in the cake.</span></p>
<h3><strong>Special Wedding Cake:</strong></h3>
<p><span style="font-weight: 400;">Are you engaged or married? As we all know, a wedding would never be complete without an elegant multi-tiered cake. We strive to make the best </span><a href="https://www.flavoursguru.com/anniversary"><span style="font-weight: 400;">customized anniversary cake</span></a><span style="font-weight: 400;">. We ensure their clients have the best time at the most memorable ceremony of their lives. So they designed, decorated, and packaged the cake in one of the most surprising ways. From a simple wedding cake to a two- or three-tier wedding cake, FlavorsGuru is sure to benefit both customized cakes for girlfriend.&nbsp;</span></p>
<h3><strong>Why choose a custom cake from FlavorsGuru?</strong></h3>
<p><span style="font-weight: 400;">Here's a list of key indicators as to why we should choose cake customization near me:</span></p>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">Designer cakes create the best memories.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">The customized chocolate cake makes everyone feel special.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">The freshness of these designer cakes can only be felt in the bite of a cake.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">The uniqueness of custom image cake is something that everyone loves!</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Modern designer cakes can also be a way for people to message their more comprehensive friends.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Children are part of everyone's life and can do anything to make them smile. Designer cakes make them the happiest.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Make any themed party feel perfect with amazing designer cakes.</span></li>
</ul>
<p>All the ingredients used to make this delicious dish are fresh, and one can instantly understand it with just a bite! We believe in creating the best custom cakes near me with a special love. This will make the product even better. In each season, you can enjoy seasonal fruits. As we specialize in fruit-flavored custom birthday cakes near me, we combine the best in service. This includes same-day or midnight delivery, which is optional.</p>
<h3><strong>What are the steps to buying the cake from FlavorsGuru?</strong></h3>
<h2>&nbsp;</h2>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">You need to go to our official website to order custom cake online&nbsp;</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">You will see a search bar. If you are searching for your husband there you can type "customized cake ideas for husband."</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">You are redirected to the ordering page</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">As a result, you will find a wide variety of freshly prepared custom cakes with love.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Then you will place an order with us.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">You can also choose the payment mode.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Now you can quickly summarize the best-customized cake for your occasions.</span></li>
</ul>
<p><span style="font-weight: 400;">Above all, FlavorsGuru believes in free shipping. You can easily save money and find the best deals. You can check out a list of customized cake for sister on our website by searching for "custom cakes" in the "custom cakes" dropdown list. We give customers multiple reasons to come back repeatedly with amazing deals. You don't need any reason because we are here to provide the best service in town!</span></p>
<h2>&nbsp;</h2>
<p><strong>FAQ:</strong></p>
<p><strong>Who are we?</strong></p>
<p><span style="font-weight: 400;">We are your one-stop shop for your dessert emergencies. We have a market where you can order delicious cakes online and deliver them to your doorstep.</span></p>
<p><strong>Will the cake looks like on the website?</strong></p>
<p><span style="font-weight: 400;">The bakers do their best to match the photos as closely as possible. However, we cannot guarantee that the cakes will turn out exactly the same as they are handmade. But they are really delicious.&nbsp;</span></p>
<p><strong>What types of desserts does your platform have?</strong></p>
<p><span style="font-weight: 400;">We had candy jars, cakes, desserts, cupcakes, donuts, and cookies, and everything was delicious.</span></p>
<p><strong>Do you have themed desserts?</strong></p>
<p><span style="font-weight: 400;">Yes. We have themed desserts on our platform. You can order treats for weddings, engagements, anniversaries, birthdays, baby showers, and more.</span></p>
<p><strong>Can I get a customized cake for my needs?</strong></p>
<p><span style="font-weight: 400;">Yes, you can! Custom-made cakes can be customized according to your needs and requirements according to the taste, size, and decoration, provided that you inform us in advance.&nbsp;</span></p></div>
<!-- <div class="contact_right __web-inspector-hide-shortcut__">
<div class="cont_ordser_email_call ">
  <div style="clear: both; margin: 0; padding: 0; height: 0;"></div>
  <div class="col-sm-12 cakebox"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/cust-cake1.webp" alt="Cake"/></div>
  <div class="col-sm-12 cakebox"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/cust-cake2.webp" alt="Cake"/></div>
  <div class="col-sm-12 cakebox"><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/cust-cake3.webp" alt="Cake"/></div>  
</div>
</div> -->
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>

<script type="text/javascript">
   $('#input-phone').keypress(function(e) {
     var a = [];
       var k = e.which;
         var textLength = $(this).val().length;
             
       for (i = 48; i < 58; i++)
           a.push(i);

       if (!(a.indexOf(k)>=0))
           e.preventDefault();
   });
 
$(document).ready(function(){
  $("#input-phone").focusout(function(){
   var textLength = $(this).val().length;
   if(textLength>10 || textLength<10){
      
     $("#errortelephoneMsg").text("Please enter 10 digit valid number").addClass("text-danger");
   }else{
    $("#errortelephoneMsg").text("").addClass("text-danger");
   }
 }); 

  $('.customise-slider').slick({
  infinite: false,
  slidesToShow: 5,
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
          breakpoint: 420,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        }
      ]
    });
}); 

$('#submits').click(function(){
var textLength = $('#input-phone').val().length;
 
  if(textLength >10 || textLength <10){
   
     $("#errortelephoneMsg").text("Please enter 10 digit valid number").addClass("text-danger");
     return false;
   } else {
    document.getElementById('contactForm').submit();
    return true;
   }

});
</script>     
    
<?php echo $footer; ?>
