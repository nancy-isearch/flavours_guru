<?php echo $header; ?>
<style type="text/css">
  .contact_hd{
    margin-bottom: 25px;
  }
  .contact_hd h3{
    font-size: 24px;
    font-weight: 600;
  }
  .contact_hd h5{
    font-size: 18px;
    max-width: 600px;
    margin-right: auto;
    margin-left: auto;
    line-height: 25px;
  }
  .breadcrumb{
    display: none;
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
    <div class=" col-md-offset-2 col-md-8 col-sm-12 col-xs-12 text-center contact_hd">
      <h3>Have a question?</h3>
      <h5>Fill up the below form with your query. Our customer support team will respond within 30 mins.</h5>
    </div>
   <div class="contact col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
    <div class="contact_left col-md-6 col-sm-6 col-xs-12">
      <div class="contact_help_you">
        <div class="my_account_top">
          <div class="other_link ">
            <div id="common" style="display:block;">
              <div class="address_book_row_form">
                <form action="<?php echo $action; ?>" method="post" id="contactForm" enctype="multipart/form-data" class="form-horizontal">
                  <h3 class="text-white m-b-15" style="color: #fff;padding-top: 0;">Write us</h3>
                <fieldset>
                  <div class="form-group required">
                    <!-- <label class="col-sm-2" for="input-orderNo"><?php echo 'Order No'; ?></label> -->
                    <div class="col-sm-6">
                      <input autocomplete="off" type="text" placeholder="Order No" name="orderNo" value="<?php echo $orderNo; ?>" id="input-orderNo" class="form-control" />
                      <?php if ($error_orderNo) { ?>
                      <div class="text-danger"><?php echo $error_orderNo; ?></div>
                      <?php } ?>
                    </div>
                  </div>

                  <div class="form-group required">
                    <!-- <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label> -->
                    <div class="col-sm-6">
                      <input autocomplete="off" type="text" placeholder="Your Name" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                      <?php if ($error_name) { ?>
                      <div class="text-danger"><?php echo $error_name; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group required">
                    <!-- <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label> -->
                    <div class="col-sm-6">
                      <input autocomplete="off" type="text" placeholder="E-Mail Address" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                      <?php if ($error_email) { ?>
                      <div class="text-danger"><?php echo $error_email; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group required">
                    <!-- <label class="col-sm-2 " for="input-phone"><?php echo 'Phone No.'; ?></label> -->
                    <div class="col-sm-6">
                      <input autocomplete="off" type="text" placeholder="Phone No" name="phone" value="<?php echo $phone; ?>" id="input-phone" maxlength="10" class="form-control" />
                      <?php if ($error_phone) { ?>
                      <div class="text-danger" ><?php echo $error_phone; ?></div>
                      <?php } else { ?>
                       <div class="text-danger" id="errortelephoneMsg"> </div>
                       <?php } ?>
                    </div>
                  </div>
                  <div class="form-group required">
                    <!-- <label class="col-sm-2 control-label" for="input-enquiry">Type your question here</label> -->
                    <div class="col-sm-6">
                      <textarea autocomplete="off" style="height:70px;" placeholder="Type your question here" name="enquiry" rows="6" id="input-enquiry" class="form-control heightauto"><?php echo $enquiry; ?></textarea>
                      <?php if ($error_enquiry) { ?>
                      <div class="text-danger" ><?php echo $error_enquiry; ?></div>
                      <?php } ?>
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
    <div class="contact_right __web-inspector-hide-shortcut__  col-md-6 col-sm-6 col-xs-12">
      <div class="cont_ordser_email_call ">
        <h4 class="m-b-15" style="color: #fff;font-size: 18px;">Contact Information</h4>
        <p style="color: rgba(255,255,255,0.5);font-size: 16px;margin-bottom: 25px;">We're open for any suggestion or just to have a chat</p>
        <div style="margin-bottom: 30px;">
        	<h5 style="color: #fff;font-size: 14px;margin-bottom: 5px;">Correspondence Address</h5>
        	<p style="color: rgba(255,255,255,0.5);font-size: 14px;">R-59, 2nd floor Malviya Nagar , opposite select city walk mall New Delhi - 110017</p>
        </div>
        <div class="contact_info">
          <div class="cont_ordser_email_call_colum">
            <span class="m-r-10"><i class="fa fa-clock-o" style="margin-right: 5px;"></i> Timings: </span><span style="color: rgba(255,255,255,0.5);">9AM - 10PM, All Days</span>
          </div>
          <div class="cont_ordser_email_call_colum">
            <span class="m-r-10"><i class="fa fa-phone" style="margin-right: 5px;"></i> Phone: </span>
            <a href="tel:+918130961414" style="color: rgba(255,255,255,0.5);">+91 8130 961 414</a>
          </div>
          <div class="cont_ordser_email_call_colum">
            <span class="m-r-10"><i class="fa fa-paper-plane" style="margin-right: 5px;"></i> Email: </span>
            <a href="mailto:cs@flavoursguru.com" style="color: rgba(255,255,255,0.5);">cs@flavoursguru.com</a>
          </div>
          <div class="cont_ordser_email_call_colum">
            <img loading="lazy" decoding="async"style="width: 25px;" src="catalog/view/theme/default/image/track_your_orders_white.webp" alt="track order" />
            <p>
              <a style="color: rgba(255,255,255,0.5);text-decoration: underline;" href="<?php echo $link; ?>" data-reveal-id="myModal">TRACK ORDER</a>
            </p>
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
  </div>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
