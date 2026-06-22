<?php echo $header; ?>
<style type="text/css">
  form#contactForm div.form-group label{
    color: rgba(255,255,255,0.5);
    font-size: 16px;
  }
  .contact{
    justify-content: center;
  }
  @media screen and (max-width: 767px){
    .information-corporate .contact_left{
      max-width: 100%;
    }
    .contact_left input{
      width: 100%;
    }
    form#contactForm{
      padding: 35px 15px;
    }
    .information-corporate .clientbox.contact_right {
      width: 100%;
      padding: 35px 15px;
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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="contact">
        <div class="contact_left">
          <div class="">
            <div class="">
            <div class="other_link ">
              <div id="common" style="display:block;">
                <div class="address_book_row_form">
                  <form action="<?php echo $action; ?>" method="post" id="contactForm" enctype="multipart/form-data" class="form-horizontal">
                    <div class="">
                      <h2 class="text-white mt-0">For Corporate Query</h2>
                    </div>
                    <p class="text-white" style="line-height: 22px; font-size: 14px;">Call us at +91 813 0961 414 or Fill in the details and we will call you back in 10 minutes.</p>
                    <fieldset>
                       <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <div class="col-sm-6">
                          <input autocomplete="off" type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                          <?php if ($error_name) { ?>
                          <div class="text-danger"><?php echo $error_name; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-6">
                          <input autocomplete="off" type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                          <?php if ($error_email) { ?>
                          <div class="text-danger"><?php echo $error_email; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-phone"><?php echo 'Phone No.'; ?></label>
                        <div class="col-sm-6">
                          <input autocomplete="off" type="text" name="phone" value="<?php echo $phone; ?>" id="input-phone" maxlength="10" class="form-control" />
                          <?php if ($error_phone) { ?>
                          <div class="text-danger" ><?php echo $error_phone; ?></div>
                          <?php } else { ?>
                           <div class="text-danger" id="errortelephoneMsg"> </div>
                           <?php } ?>
                        </div>
                      </div>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-enquiry">Custom Query</label>
                        <div class="col-sm-6">
                          <textarea name="enquiry" rows="6" id="input-enquiry" class="form-control heightauto"><?php echo $enquiry; ?></textarea>
                          <?php if ($error_enquiry) { ?>
                          <div class="text-danger" ><?php echo $error_enquiry; ?></div>
                          <?php } ?>
                        </div>
                      </div>

                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-enquiry">Attachment</label>
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
                  <br>
                  <br>
                  <br>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="clientbox contact_right __web-inspector-hide-shortcut__">
          <div class="cont_ordser_email_call ">
            <div style="clear: both; margin: 0; padding: 0; height: 0;"></div>
            
            <div class="col-sm-12">
            <h2 class="text-white mt-0 mb-20">Our Clients</h2>
            <ul>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client1.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client2.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client3.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client4.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client5.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client6.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client7.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client8.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client9.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client10.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client11.webp" alt="Clients" /></li>
            <li><img loading="lazy" decoding="async"src="catalog/view/theme/default/image/fg-client12.webp" alt="Clients" /></li>          
            </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="">
        <div class="top slider corporatebox">
          <div class="master">
              <h2 class="re-title">REVIEWS</h2>
              <div class="review-slider">
                 <div class="type-card-wrapper review-col slick-slide">
                    <div class="type-card review_2_section">
                       <div class="tmls-testimonial">
                          <p>Superb tasty cakes with amazing ambience.they are not just excellent in providing tasty cakes with creative ideas (with the option to customise the style) but have also taken good care of cleanliness. Best place to visit &amp; order. You can't get enough with it!</p>
                          <div class="tmls-name">Komal Lang</div>
                       </div>
                    </div>
                 </div>
                 <div class="type-card-wrapper review-col slick-slide">
                    <div class="type-card review_2_section">
                       <div class="tmls-testimonial">
                          <p>Thank you Flavours guru, another amazing cake. I was delighted with it and it went down very well... delicious. Will be in touch for the next event.</p>
                          <div class="tmls-name">Gopal Singh Rajput</div>
                       </div>
                    </div>
                 </div>
                 <div class="type-card-wrapper review-col slick-slide">
                    <div class="type-card review_2_section">
                       <div class="tmls-testimonial">
                          <p><span>Thank u for the yummy cake and timely delivery. My son is super happy. Thank you for making his day special.</span></p>
                          <div class="tmls-name">Sowmiya Kasturirangan</div>
                       </div>
                    </div>
                 </div>
                 <div class="type-card-wrapper review-col slick-slide">
                    <div class="type-card review_2_section">
                       <div class="tmls-testimonial">
                          <p><span>Flavour Guru....as the name suggest is truly guru of flavours...luv their cakes...taste is awesome n lovely presentation...totally worth giving a try.… </span></p>
                          <div class="tmls-name">Varsha Singh</div>
                       </div>
                    </div>
                 </div>
                 <div class="type-card-wrapper review-col slick-slide">
                    <div class="type-card review_2_section">
                       <div class="tmls-testimonial">
                          <p><span>Hang on this is just the right place for you to satisfy your sweet tooth and the hunger pangs. Must try!</span></p>
                          <div class="tmls-name">Niha Imtiaz</div>
                       </div>
                    </div>
                 </div>
                 <div class="type-card-wrapper review-col slick-slide">
                    <div class="type-card review_2_section">
                       <div class="tmls-testimonial">
                          <p><span>I ordered for Red valvet choclate brownie cake and walnut choclate cake..I must say the cakes were awesome and very tasty..every bite of red valvet is rich in terms of walnuts..Superb job</span></p>
                          <div class="tmls-name">Pallavi Chand</div>
                       </div>
                    </div>
                 </div>
              </div>
           </div>
        </div>
      </div>
<div class="best-seller-section col-md-12 col-sm-12 col-xs-12 section-m-b" style="display: none;">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12 p-l-0 p-r-0">
          <p class="section-title col-md-12 col-sm-12 col-xs-12 p-l-0 text-center">Corporate Gifts</p>
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
                <img loading="lazy" decoding="async" class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Cake-for-Boys.webp" alt="Cake designed with blue icing and toy cars, ideal for celebrating a boy's special day.">
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
                <img loading="lazy" decoding="async" class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Cake-for-Girls.webp" alt=" A cake decorated with a girl holding balloons and a rainbow, perfect for a girl's celebration.">
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
                <img loading="lazy" decoding="async" class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/First-Birthday.webp" alt=" A cake with a teddy bear on top and a number one on the side. Perfect for a first birthday celebration.">
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
                <img loading="lazy" decoding="async" class="img-responsive" src="catalog/view/theme/default/image/Home/new-images/Half-Birthday.webp" alt="Half Birthday cakes">
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
});

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
<style type="text/css">
  .productName{    margin-top: -10px;
    font-size: 14px;
    text-align: center;}
</style>      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
