<?php echo $header; ?>
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
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <!-- <?php } else if($msg){ ?>
    <div class="alert alert-danger"><i clas s="fa fa-exclamation-circle"></i> <?php echo $msg; ?></div> -->
    <?php } ?>

  <div class="trackorder"> 

  <div class="title">Track Order</div> 

    <div id="content" class=" ">   
     <div class="trackorderbox"> 

  	   
    <div class="successmsg "></div>
       <input type="hidden" name="url" id="url" value="<?php echo $action; ?>" />
       <form action="" method="POST" id="trackForm" name="trackForm">

        <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-orderid"><?php echo $entry_orderid; ?></label>
            
            <span class="error_orderid error"></span>

            <div class="col-sm-12">
              <input type="text" name="orderid" value="<?php echo $orderid; ?>" placeholder="<?php echo $entry_orderid; ?>" id="orderid" class="form-control" />
              <?php if ($error_orderid) { ?>
              <div class="text-danger"><?php echo $error_orderid; ?></div>
              <?php } ?>
            </div>

          </div>
          <div class="form-group required">
            <label class="col-sm-12 control-label" for="input-email"><?php echo $entry_email; ?></label>
            
            <span class="error_email error"></span>

            <div class="col-sm-12">
              <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
             
            <div class="col-sm-12 ">
              <input type="button"  value="Submit"   id="buttontrack" class="btn form-control" />
              
            </div>
          </div> 
    </form>

    </div>
   

</div>
</div>
</div> <!--container-->
<script type="text/javascript">
  $('#buttontrack').click(function(){
    var urls = $('#url').val(); 
    var email = $('#email').val();     
    var orderid = $('#orderid').val();     
    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    $('.successmsg').text('');
     
    if($.trim(orderid)=='' || orderid.length<0){
        $('.error_orderid').text('Enter orderId!');
        return false;     
    } else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) {        
        $('.error_email').text('Not a valid e-mail address!');
        return false;
    } else { 
   
      $.ajax({ 
        type:'post',
        url : urls,
        data : 'datas=y&orderid='+orderid+'&email='+email,
        beforeSend : function(){ $('.successmsg').html('<img loading="lazy" decoding="async" class="" src="<?php echo $loder."image/loader.gif"; ?>" />'); },
        success : function(rslt){         
          $('.error').text(''); 
         
          if(rslt==0){
               $('.successmsg').text('Invalid email or orderid');
          } else {
               $('.successmsg').html(rslt);
               $('#trackForm').hide();
          }
         
          $('.secondBox').addClass('trackorderbox');
          $('#trackForm')[0].reset();
        }
      });

  }
  });

</script>

<?php echo $footer; ?>