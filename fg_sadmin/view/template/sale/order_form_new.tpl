<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      
      <h1>Add Order</h1>
      
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">

  <div class="proTOP" style="display: none;">
   <div class="proContainer">
      <div class="proMaster">
         <div class="pop_main">
            <?php /*<a href="javascript:void(0)" class="remove">X</a>*/ ?>
            <h2><img src="/image/back_icon1.jpg" class="clspopup close_popup_addon" style="float:left; cursor: pointer;">&nbsp;&nbsp;<span class="loaderEtra" id="loaderEtra" style="width:8px"></span>  Add on !</h2>
            <div class="occassions">
            <ul class="tabs addonsTab popup-tab-slide nav nav-tabs">
               <li class="type-card-wrapper active"><a class="" href="#tab1" data-toggle="tab">Tab 1</a></li>
               <li><a href="#tab2" data-toggle="tab" roll="tab" aria-controls="tab1">Tab 2</a></li>
               <li><a href="#tab3" data-toggle="tab">Tab 3</a></li>
               <li><a href="#tab4" data-toggle="tab">Tab 4</a></li>
            </ul>
            </div>
            <div class="tab_container addonContainer tab-content">
                 <div id="tab1" class="tab-pane fade in active">
                    <h2>Tab 1 content</h2>
                    <p>Nunc dui velit, scelerisque eu placerat volutpat, dapibus eu nisi. Vivamus eleifend vestibulum odio non vulputate.</p>
                 </div>
                 <!-- #tab1 -->
                 <div id="tab2" class="tab-pane fade">
                    <h2>Tab 2 content</h2>
                    <p>Nunc dui velit, scelerisque eu placerat volutpat, dapibus eu nisi. Vivamus eleifend vestibulum odio non vulputate.</p>
                 </div>
                 <!-- #tab2 -->
                 <div id="tab3" class="tab-pane fade">
                    <h2>Tab 3 content</h2>
                    <p>Nulla eleifend felis vitae velit tristique imperdiet. Etiam nec imperdiet elit. Pellentesque sem lorem, scelerisque sed facilisis sed, vestibulum sit amet eros.</p>
                 </div>
                 <!-- #tab3 -->
                 <div id="tab4" class="tab-pane fade">
                    <h2>Tab 4 content</h2>
                    <p>Integer ultrices lacus sit amet lorem viverra consequat. Vivamus lacinia interdum sapien non faucibus. Maecenas bibendum, lectus at ultrices viverra, elit magna egestas magna, a adipiscing mauris justo nec eros.</p>
                 </div>
                 <!-- #tab4 -->
            </div>
            <div class="nothanks_continue" style="display: none;">
                <span class="addTextCout" style="float: left;font-size: 15px;padding-top: 5px;font-weight: 700;"></span>
               <a href="javascript:void(0)" class="addon_continue" style="display: block; float: left; background: #219652; width: auto; padding: 7px 10px;color: #ffffff;border-radius: 6px;"> CONTINUE WITHOUT ADD ONS</a> 
               <a href="javascript:void(0)" id="removeHide" class="" style="display: none;">SKIP</a>
            </div>
            <!-- .tab_container -->
         </div>
      </div>
   </div>
</div>

      <div class="select-info-popup custom-scroll">
        <div class="calendar-section hideppnew">
          <a class="product-reveal-close">×</a>
          <div class="section-title">Select Delivery Date</div>
          <div class="order-calendar-date" autocomplete="off" id="datetimeshipping"></div>
          <a class="backtocalendar backtocalendar-1">
            <img style="width: 25px;" src="/image/back_icon1.jpg" class="material-icons back-arrow first-back" alt="" /></a>
        </div>
        
        <div class="shipping-section hideppnew" id="shippingmethoddiv">
          <!-- <a class="product-reveal-close">×</a> -->
          <div class="section-title">Select Shipping Option</div>
           <div class="scroll-pane custom-scroll">
              <ul class="newshippingoptionhtml">
                 
              </ul>
           </div>
           <a class="backtocalendar backtocalendar-1">
            <img style="width: 25px;" src="/image/back_icon1.jpg" class="material-icons back-arrow back-two" alt="" /></a>
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
             <img style="width: 25px;" src="/image/back_icon1.jpg" class="material-icons back-arrow back-three" alt="" />
          </a>
        </div>
        <input type="hidden" id="timeslotData" value='' />
        <input type="hidden" class="delivery_date" name="delivery_date">
     </div>
      <div class="panel-body">
        <form action="index.php?route=sale/order/saveOrderAdmin&token=<?php echo $token; ?>" method="post" enctype="multipart/form-data">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          	<table class="table table-bordered table-striped table-products">
				<thead>
					<tr>
						<th>SKU</th>
						<td>Product Name</td>
						<th>Image</th>
						<th>Price</th>
						<th width="5%">Quantity</th>
						<th>City</th>
						<th>Selected Details</th>
            <td>Add Ons</td>
						<th>Total Price</th>
						<th>More</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr class="row-product" rowproduct="0">
						<td class="sku"><input type="text" name="" class="form-control fetchSKu" value=""> <button type="button" class="btn btn-primary btn-xs fetchdetails">Fetch Details</button></td>
						<td class="pname"></td><input type="hidden" name="product_id[]" class="product_id">
						<td class="sku_image"><img height="100" /></td>
						<td><span class="price"></span><input type="hidden" name="price[]" class="pri form-control"><input type="hidden" name="mainprice[]" class="mainprice form-control"><input type="hidden" name="product_option_id[]" class="product_option_id form-control"><input type="hidden" name="product_option_value_id[]" class="product_option_value_id form-control"><input type="hidden" name="tax[]" class="tax form-control"></td>
            			<td><input type="text" name="qty[]" class="cnt form-control qty"></td>
						<td width="5%">
              <input placeholder="*Enter Pincode" type="number" name="selectedPincode[]" maxlength="6" class="pincodenew animation-border for-animation">
              <span class="citynametoshow"></span>
              
                <div style="color: red; display: none;" class="soorypincode">Sorry, this pincode is not serviceable.</div>
                <div class="pincodelist custom-scroll">
                </div>
              <!-- <select id="citynew" name="citynew[]" class="select_city form-control">
		                   <option value="">Select City</option>
		                   <option value="31">Delhi</option>
		                   <option value="40">Gurgaon</option>
		                   <option value="75">Noida</option>
				               <option value="34">Faridabad</option>
		                   <option value="39">Greater Noida</option>
		                   <option value="36">Ghaziabad</option>
		                   <option value="10545">Chandigarh</option>
		                   <option value="10541">Patna</option>
		                   <option value="10543">Sohna</option>
		                   <option value="10544">Hyderabad</option>
		                   <option value="10548">Mohali</option>
		                   <option value="10547">Panchkula</option>
		                   <option value="10546">Zirakpur</option>
                       <option value="10549">Mumbai</option>
		                </select> -->
                    <input type="hidden" name="citynew[]" class="select_city">
		                </td>
						<td class="selecteddata">
              <span class="selectedDate"></span><input type="hidden" name="selectedDate1[]" class="selectedDate1"><br>
              <span class="selectedType"></span><input type="hidden" name="selectedType1[]" class="selectedType1"><input type="hidden" name="selectedTypePrice1[]" class="selectedTypePrice1"><br>
              <span class="selectedTime"></span><input type="hidden" name="selectedTime1[]" class="selectedTime1"><br>
            </td>
            <td><button type="button" class="btn btn-primary btn-xs addonbutton">Add Ons</button><input type="hidden" class="addon-input" name="addon[]"><br><span class="addonitems"></span></td>
						<td><span class="cntTtl"></span></td>
						<td>
							<input type="file" name="cake_file[]">
							<input type="text" class="form-control" name="card_message[]" placeholder="Please enter cake Message">
							<select name="flavour[]" class="form-control">
                        		<option value="">-- Select Flavour -- </option>
								<option value="39">Chocolate Truffle</option>
								<option value="40">Vanilla</option>
								<option value="41">Light Chocolate</option>
								<option value="42">Blackforest</option>
								<option value="49">Pineapple</option>
								<option value="50">Fresh Fruit</option>
								<option value="51">Red Velvet</option>
							</select>
              <select name="weight[]" class="form-control weight"><option>Please Select Weight</option></select>
						</td>
						<td><button class="btn btn-danger btn-sm btnRemove" style="display: none">X</button></td>
					</tr>
				</tbody>
			</table>
      <table class="table table-bordered table-striped totaltable" style="display: none;">
        <tr>
          <td>Sub-Total</td>
          <td class="sub_total"></td><input type="hidden" name="sub_total" class="sub_total1">
        </tr>
        <tr style="display: none;">
          <td>Discount</td>
          <td><input type="text" name="discount" class="discount"></td>
        </tr>
        <tr>
          <td>Tax (Gst 18%)</td>
          <td class="finaltotaltax"></td>
        </tr>
        <tr>
          <td>Total</td>
          <td class="finaltotal"></td>
        </tr>
      </table>
      <button type="button" class="btn btn-primary btn-sm btnAddProduct" style="margin-bottom: 20px;">Add More</button>
      <button type="button" class="btn btn-primary btn-sm btnCalTotal" style="margin-bottom: 20px;">Calculate Total</button>
          </div>
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Sender Mr/Mrs</label>
              <select name="sender_mr_mrs" class="form-control" required>
              	<option value="">Please Select</option>
              	<option value="Mr">Mr</option>
              	<option value="Mrs">Mrs</option>
              	<option value="Ms">Ms</option>
              </select>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Sender Name</label>
              <input type="text" name="sender_name" class="form-control" required>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Sender Phone</label>
              <input type="text" name="sender_phone" class="form-control" required>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Sender Email</label>
              <input type="text" name="sender_email" class="form-control" required>
            </div>
            <div style="clear: both; padding: 10px;"></div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Recipient Mr/Mrs</label>
              <select name="receiver_mr_mrs" class="form-control" required>
              	<option value="">Please Select</option>
              	<option value="Mr">Mr</option>
              	<option value="Mrs">Mrs</option>
              	<option value="Ms">Ms</option>
              </select>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Recipient's Name</label>
              <input type="text" name="receiver_name" class="form-control" required>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Recipient's Address</label>
              <input type="text" name="receiver_address" class="form-control" required>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Recipient's Phone</label>
              <input type="text" name="receiver_phone" class="form-control" required>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Recipient's Pincode</label>
              <input type="text" name="receiver_pincode" class="form-control" required>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Occasion</label>
              <select name="occasion" class="form-control">
              	<option value="" selected="selected">Select Occasion</option>
		        <option value="Birthday">Birthday</option>
		        <option value="Anniversary">Anniversary</option>
		        <option value="Congratulation">Congratulation</option>
		        <option value="Romantic">Romantic</option>
		        <option value="Get Well Soon">Get Well Soon</option>
		        <option value="Thank you">Thank you</option>
		        <option value="Sympathy">Sympathy</option>
		        <option value="Wedding">Wedding</option>
		        <option value="I am Sorry">I am Sorry</option>
              </select>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Message on Card</label>
              <input type="text" name="message_card" class="form-control">
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Special Instructions</label>
              <input type="text" name="special_instruction" class="form-control">
            </div>
            <div style="clear: both; padding: 10px"></div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Payment Method</label>
              <select class="form-control" name="payment_method" required>
                <option>Please Select</option>
                <option value="upi_bank">UPI/Bank</option>
                <option value="razorpay">Razorpay</option>
                <option value="payment_due">Payment Due</option>
              </select>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <label>Transaction ID</label>
              <input type="input" name="transaction_id" class="form-control">
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            	<button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<div class="bg_img"></div>
  <style type="text/css">
    .form-group + .form-group{
      border: 0;
    }
    .order-calendar-date {
        width: 100%;
        height: 100%;
    }
    .order-calendar-date .ui-datepicker-inline {
        width: 100%;
        height: 100%;
    }
    .order-calendar-date .ui-datepicker-header {
        background: no-repeat;
        border: 0;
        padding-top: 15px;
        padding-bottom: 15px;
        width: 220px;
        margin: auto;
        position: relative;
    }
    .order-calendar-date .ui-datepicker-title{
      text-align: center;
    }
    .ui-datepicker table {
        width: 100%;
        font-size: .9em;
        border-collapse: collapse;
        margin: 0 0 0.4em;
    }
    .ui-datepicker th {
        font-size: 20px;
        font-weight: normal;
        text-align: center;
        padding: 15px;
    }
    .ui-datepicker tr{
      text-align: center;
      padding: 15px;
    }
    .order-calendar-date .ui-state-default, .ui-widget-content .ui-state-default {
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
        display: inline-block;
    }
    .proTOP {
        width: 100%;
        height: 100%;
        position: fixed;
        left: 0px;
        top: 0px;
        background: rgba(0, 0, 0, 0.5);
        z-index: 99;
        visibility: visible;
    }
    .proContainer {
        max-width: 700px;
        width: 100%;
        margin: 0px auto;
        height: 100%;
        display: table;
    }
    .proMaster {
        display: table-cell;
        vertical-align: middle;
        width: 100%;
    }
    .pop_main {
        width: 100%;
        float: left;
        background: #fcfbfb;
        box-sizing: border-box;
        padding: 10px;
        position: relative;
    }
    .pop_main h2 {
        color: #303339;
        font-size: 28px;
        font-family: 'Lato', sans-serif;
        text-align: center;
        margin-top: 5px;
    }
    .occassions {
        width: 100%;
        position: relative;
        z-index: 9;
        background: #fff;
        clear: both;
    }
    .pop_main ul.tabs, ul.tabs li {
      padding: 0;
        list-style: none;
        width: 100%;
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
        direction: ltr;
        display: inline-table;
        margin: 0;
        float: left;
        height: 32px;
        overflow-y: hidden;
        white-space: nowrap;
        font-size: 14px;
        overflow-y: hidden;
    }

    .pop_main ul.tabs li {
        cursor: pointer;
        padding: 0;
        height: 35px;
        line-height: 31px;
        background-color: #22303d;
        color: #fff;
        position: relative;
        margin-right: 10px;
        border-radius: 20px;
        display: inline-block;
        margin-bottom: 10px;
        border: 2px solid #22303d !important;
        width: auto;
    }
    .pop_main ul.tabs li.active {
        background-color: #fff;
        color: #111111;
        border: 2px solid #f195b2;
        display: block;
    }
    .pop_main .tab_container {
        border: 0px solid #333;
        border-top: none;
        clear: both;
        float: left;
        width: 100%;
        background: #fff;
        overflow: auto;
    }
    .pop_main .tab_drawer_heading {
        display: none;
    }
    .pro_list_box {
        width: 100%;
        float: left;
        background: #fff;
        height: 370px;
    }
    .proMaster .pro_list_box {
        overflow: auto;
    }
    .pro_list_box ul {
        line-height: normal;
        text-align: center;
        margin: 0px;
        float: left;
        padding: 0px;
    }
    .pro_list_box ul li {
        width: 50%;
        padding: 5px;
        display: flex;
        float: left;
        box-sizing: border-box;
        border: 1px solid #efefef;
        margin-bottom: 15px;
        position: relative;
    }
    .pro_list_box ul li .pro_image {
        width: 50%;
    }
    .popup-price {
        width: 50%;
        text-align: left;
    }
    .js-add-button {
        text-align: right;
        position: absolute;
        right: 16px;
        bottom: 25px;
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
    .pro_list_box ul li input.checkbox {
        position: absolute;
        left: 20px;
        top: 10px;
    }
    .checkbox.product-addons {
        display: none;
    }
    .js-add-button label {
        float: none;
        font-weight: normal;
        margin: auto;
        font-size: 14px;
        vertical-align: super;
        padding: 10px;
        border: solid 2px #219652;
        cursor: pointer;
    }
    .js-add-button input {
        float: left;
        margin: -2px 4px 0 3px;
        vertical-align: middle;
        width: 35px;
        height: 35px;
        background: #fff;
        display: inline-block;
        border: 1px solid #ccc;
        padding-left: 5px;
    }
    .remove-addon {
        display: none;
        background: none !important;
    }
    .nothanks_continue {
        width: 100%;
        float: left;
        margin-top: 10px;
        text-align: right;
    }
    .nothanks_continue a:nth-of-type(2) {
        background: none;
        color: #000;
        border: 1px solid #333;
    }
    .proTOP .nav-tabs > li > a{
      line-height: initial;
      padding: 7px 21px;
      color: #ffffff;
      border:0 !important;
    }
    .proTOP .nav-tabs > li.active > a{
      color: #111111;
    }
    .proTOP .nav-tabs > li > a:hover{
      background:none;
    }
  </style>
  <script type="text/javascript"><!--
var cur_product_id = 0;
var cur_city_id = 0;
var product_row = 0;
function fetchDetails(){
  $('.fetchdetails').click(function(){
    var sku = $(this).parent().parent().find('.fetchSKu').val();
    var ab = $(this);
    $.ajax({
      url: 'index.php?route=sale/order/getOrderFromSku&token=<?php echo $token; ?>&sku=' +  sku,
      dataType: 'json',
      success: function(val) {
        if(val.product_id != undefined){
          var image = 'https://www.flavoursguru.com/image/'+val.image;
          ab.parent().parent().find('.product_id').val(val.product_id)
          ab.parent().parent().find('.pname').html(val.name);
          ab.parent().parent().find('.price').html(val.price);
          ab.parent().parent().find('.pri').val(val.price);
          ab.parent().parent().find('.mainprice').val(val.price);
          ab.parent().parent().find('.tax').val(val.tax_class_id);
          ab.parent().parent().find('.sku_image img').attr('src',image);
          var optionhtml = '<option>Please Select Weight</option>';
          for(var z in val['options']['product_option_value']){
            optionhtml += "<option value='"+val['options']['product_option_value'][z]['name']+"' price='"+val['options']['product_option_value'][z]['price']+"' product_option_id='"+val['options']['product_option_id']+"' product_option_value_id='"+val['options']['product_option_value'][z]['product_option_value_id']+"'>"+val['options']['product_option_value'][z]['name']+"</option>";
          }
          ab.parent().parent().find('.weight').html(optionhtml);
          $('.row-product').last().attr("rowproduct",val.product_id);
        } else {
          alert('Incorrect SKU! Please check & try again.')
        }
      }
    });
  })

  $('.weight').change(function(){
    var optionPri = $('option:selected', this).attr('price');
    var mainPrice = $(this).parent().parent().find('.mainprice').val();
    var newPrice = parseInt(optionPri) + parseInt(mainPrice);
    $(this).parent().parent().find('.pri').val(newPrice);
    $(this).parent().parent().find('.price').html(newPrice);

    $(this).parent().parent().find('.product_option_value_id').val($('option:selected', this).attr('product_option_value_id'));
    $(this).parent().parent().find('.product_option_id').val($('option:selected', this).attr('product_option_id'));
  })

  $('.pincodenew').on('input', function() {
    $('.citynametoshow').html('');
    $('.selectpincodeerr').hide();
    $('.show-date-time-selected').hide();
    $('.show-date-time-toselected').show();
    $("#cityDateShipping input[type=\'hidden\']").val('');
    var pininput = $(this);
    var pins = $(this).val();
    var ht = "<ul>";
    $('.pincodelist').empty();
    if(pins.length > 3){
      cur_product_id = $(this).parent().parent().find('.product_id').val();
      $.ajax({
          type: "POST",
          url: <?php echo '"'.HTTP_CATALOG.'index.php?route=product/product/getPincodesList"' ?>,
          data: {pins:pins},
          cache: false,
          success: function(data){
            var data = jQuery.parseJSON(data);
            for(var i in data){
              ht += "<li class='mainPin' mainPinCid='"+data[i].shipping_cities_id+"' holidays='"+data[i].holidays+"' mainPinCname='"+data[i].name+"' mainPinCode='"+data[i].pincode+"'>"+data[i].pincode+"</li>";
            }
            ht += "</ul>";
            if(data.length > 0){
              pininput.parent().find('.soorypincode').hide();
              pininput.parent().find('.pincodelist').html(ht);
              clickPincodeFromList();
            } else {
              pininput.parent().find('.soorypincode').show();
              pininput.parent().find('.pincodelist').empty();
            }
          }
      })
    }
  });
}



  /*$(".pincodenew").change(function(){
      
      
      
    });*/

  

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
      $(this).parent().parent().parent().find('.select_city').val(cityFromPincode);
      $(this).parent().parent().parent().find('.citynametoshow').html(cityFromPincode);
      $(this).parent().parent().parent().find('.pincodenew').val(cityFromPincodePin);
      $(this).parent().parent().parent().find('.pincodeN').val(cityFromPincodePin);
      $(this).parent().parent().parent().find('.pincodelist').empty();
      $("#newdelDate").addClass("animation-border");
      $("#errorMsgNew").hide();
      $(".pincodenew").removeClass("animation-border");

      $("#errorMsg").empty();
      cur_city_id = cityIdFromPincode;
      console.log("cur_city_id----->", cur_city_id)
      var nowDate = new Date();
      var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
      var tomorrow = new Date(today.getTime() + 24 * 60 * 60 * 1000);
       $.ajax({
        type: "POST",
        url: <?php echo '"'.HTTP_CATALOG.'index.php?route=product/product/checkTodayShipingType"' ?>,
        data: {proId:cur_product_id,cid:cur_city_id},
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
          jQuery('#citynew').removeClass('animation-border');
        }
      });

    })  
  }

  var unavailableDates = [];
  function disableDates(date) {
    if(unavailableDates.length > 0){
      var string = $.datepicker.formatDate('dd-mm-yy', date);
      return [unavailableDates.indexOf(string) == -1];
    } else {
      return [true];
    }
    
  }

function addonpopup(){
    $('.addonbutton').click(function(){
      var addoninput = $(this).next();
      $.ajax({
       type: "POST",
       url: <?= '"'.HTTP_CATALOG.'index.php?route=product/product/getAddons"' ?>,
       data: {proId:cur_product_id, cityId:cur_city_id},
       cache: false,
       success: function(data){
        $('.proTOP').show();
         $('.loadingbox').hide();
         $(".addonsTab").empty();
         $(".addonContainer").empty();
         var obj = JSON.parse(data);
         var showData = "";
         var showData1 = "";
         var j = 0;
         
         $.each(obj, function(key,value) {
          if(j == 0){
            var act_cls = "active";
           } else {
            var act_cls = "";
           }
          showData += '<li class="type-card-wrapper '+act_cls+'"><a href="#tab_'+j+'"  data-toggle="tab">'+key+'</a></li>';
           //showData += '<li class="slide-tab type-card-wrapper" rel="tab_'+j+'">'+key+'</li>';
           if(j == 0){
            var cls = "active in";
           } else {
            var cls = "";
           }
           showData1 += '<div id="tab_'+j+'" class="tab-pane fade '+cls+'"><div class="pro_list_box"><ul>';
           for(var i = 0; i < value.length; i++){
             showData1 += '<li><div class="pro_image"><img class="img_v" src="'+value[i].image+'" alt="Call"></div><div class="popup-price"><h3 class="addproname_'+value[i].product_id+'">'+value[i].name+'</h3><div class="pricebox addproprice_'+value[i].product_id+'">'+value[i].price+'</div></div><span class="js-add-button"> <input type="text" addonproductid="'+value[i].product_id+'" addonproductname="'+value[i].name+'" addonproductprice="'+value[i].pprice+'" addontaxclassid="'+value[i].tax_class_id+'" class="add-addon"> </span></li>';
           }
           showData1 += '</ul></div></div>';
           j++;
         })
         $(".addonsTab").html(showData);
         $(".addonContainer").html(showData1);
         //jQuery("body").addClass("addon-overflow");
         
         //imgClick();
         //addOnsTabs();
         $('.loadingbox').hide();
         $('.proTOP').show();
         $('.add-addon').focusout(function(){
            var addon_qty = $(this).val();
            if(addon_qty == ""){
              return;
            }
            var addon_price = $(this).attr("addonproductprice");
            var addon_productid = $(this).attr("addonproductid");
            var addon_name = $(this).attr("addonproductname");
            var addon_tax = $(this).attr("addontaxclassid");
            var addoninputval = addoninput.val();
            if(addoninputval == ""){
              var addjson = {};
            } else {
              var addjson = JSON.parse(addoninputval);
            }
            addjson[addon_productid] = {};
            addjson[addon_productid]["qty"] = addon_qty;
            addjson[addon_productid]["price"] = addon_price;
            addjson[addon_productid]["tax_class_id"] = addon_tax;
            addoninput.val(JSON.stringify(addjson));
            var ht = "";
            for(var i in addjson){
              if (addjson[i]["qty"] > 0) {
                ht += "Addon Name: "+$(".addproname_"+i).html()+"<br>";
                ht += "Addon Price: "+$(".addproprice_"+i).html()+"<br>";
                ht += "Addon Qty: "+addjson[i]["qty"]+"<br>";
                ht += "<br>";
              }
            }
            addoninput.parent().find(".addonitems").html(ht);
            console.log("addjson------>", addjson)
         })

         
       }// success ends
     });
     });
     $('.close_popup_addon').on('click', function(){
      $('.proTOP').hide();
     });
   }

$('#datetimeshipping').change(function(){
  $('#data-city-id').val(cur_city_id);
  var cid = cityIdFromPincode;
  $("#validateValue").val(cid);
  $("#entre_city").attr('cityId', cid);
  $("#cityN").val($('#citynew :selected').text());
  $("#shippingtype").empty();
   getShippingTypeForPro(cid);
   $('.delivery_date').val($(this).val());
 })
fetchDetails();
addonpopup();

$('.btnCalTotal').click(function(){
	var pfttl = 0;
	$( ".row-product" ).each(function( index ) {
    	var ppricefinal = $(this).find('.pri').val();
    	var pqtyfinal = $(this).find('.qty').val();
    	var pshipfinal = $(this).find('.selectedTypePrice1').val();
    	var paddonfinal = $(this).find('.addon-input').val();

    	var proPri = ((parseInt(ppricefinal) + parseInt(pshipfinal)) * parseInt(pqtyfinal));
    	if(paddonfinal != ""){
    		var addnfinal = JSON.parse(paddonfinal);
	    	for (var i in addnfinal){
	    		proPri = proPri + (addnfinal[i]['qty'] * addnfinal[i]['price']);
	    	}
    	}
    	$(this).find('.cntTtl').html(proPri);
    	pfttl = pfttl + proPri;
  	});

  	$('.sub_total').html(pfttl);
  	$('.sub_total1').val(pfttl);
  $(".totaltable").show();
  $(".btnAddProduct").hide();
  $('.discount').val(0);
  $('.discount').trigger('focusout');
})

$('.discount').focusout(function(){
	var dis = parseInt($(this).val());
  var sub_total = parseInt($('.sub_total1').val());
  var ttl = sub_total - dis;
  var ttax = 0; //((18 * parseInt(ttl)) / 100);

  $( ".row-product" ).each(function( index ) {
      var ppricefinal = $(this).find('.pri').val();
      var ppricetaxid = parseInt($(this).find('.tax').val());
      var pqtyfinal = $(this).find('.qty').val();
      var pshipfinal = $(this).find('.selectedTypePrice1').val();
      var paddonfinal = $(this).find('.addon-input').val();

      var proPri = ((parseInt(ppricefinal) + parseInt(pshipfinal)) * parseInt(pqtyfinal));

      var aa1 = (proPri / sub_total) * 100;
      var aa2 = (aa1 / 100) * dis;
      var aa3 = proPri - aa2;
      if(ppricetaxid == 9){
        ttax = ttax + ((18 * parseInt(aa3)) / 100);
      } 

      if(paddonfinal != ""){
        var addnfinal = JSON.parse(paddonfinal);
        for (var i in addnfinal){
          var proPri1 = (parseInt(addnfinal[i]['qty']) * parseInt(addnfinal[i]['price']));
          var aa11 = (proPri1 / sub_total) * 100;
          var aa21 = (aa11 / 100) * dis;
          var aa31 = proPri1 - aa21;
          if(ppricetaxid == 9){
            ttax = ttax + ((18 * parseInt(aa31)) / 100);
          }
        }
      }
    });


  $('.finaltotaltax').html(ttax);
  $('.finaltotal').html(ttl + ttax);
})

$('.btnAddProduct').click(function(){
	var total_qty=0;
  product_row++;
	$('.table-products tbody').append($('.table-products .row-product').last().clone());
	$('.row-product').last().find('select,input').val('');
	$('.row-product').last().find('.btnRemove').show();
	$('.row-product').last().find('.btnRemove').click(function(){
		$(this).parent().parent().remove();
	})
	$('.row-product').last().find('.price').html('');
  	$('.row-product').last().find('.pname').html('');
  	$('.row-product').last().find('.addonitems').html('');
  	$('.row-product').last().find('.selectedDate').html('');
  	$('.row-product').last().find('.selectedType').html('');
  	$('.row-product').last().find('.selectedTime').html('');

  	$('.row-product').last().find('.selectedDate1').val('');
  	$('.row-product').last().find('.selectedType1').val('');
  	$('.row-product').last().find('.selectedTime1').val('');
  	$('.row-product').last().find('.selectedTypePrice1').val('');

	$('.row-product').last().find('.image').html('');
	$('.row-product').last().find('.cntTtl').html('');
	$('.row-product').last().find('.cntQty').html('');
	$('.row-product').last().find('.sku_image a').attr('href','');
	$('.row-product').last().find('.sku_image img').attr('src','');
  fetchDetails();
  addonpopup();
})

function getShippingTypeForPro(cid){
  var delDate = $("#datetimeshipping").val();
  $( ".row-product" ).each(function( index ) {
    console.log("--->", $(this).attr("rowproduct"))
    console.log("1--->", cur_product_id)
    if($(this).attr("rowproduct") == cur_product_id){
      $(this).find('.selectedDate').html(delDate);
      $(this).find('.selectedDate1').val(delDate);
    }
  });
  $('.loadingbox').show();
  let cityName = $( "#citynew option:selected" ).text();
 $.ajax({
     type: "POST",
     url: <?= '"'.HTTP_CATALOG.'index.php?route=product/product/getShippingTypeForPro"' ?>,
     data: {proId:cur_product_id,cid:cur_city_id,delDate:delDate},
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
  var slvalnew = $(this).val();
  var price1 = $(this).attr('price');
   jQuery.ajax({
     type: "POST",
     url: <?= '"'.HTTP_CATALOG.'index.php?route=product/product/getDatesTimeForPro"' ?>,
       data: {shippingType:typeId},
       cache: false,
       dataType: 'json',
       success: function(data){
        $( ".row-product" ).each(function( index ) {
          if($(this).attr("rowproduct") == cur_product_id){
            $(this).find('.selectedType').html(slvalnew);
            $(this).find('.selectedType1').val(slvalnew);
            $(this).find('.selectedTypePrice1').val(price1);
          }
        });
        jQuery('#timeslotData').val(JSON.stringify(data.timeslot));
        if (typeId=='20') {
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

function GetFormattedDate() {
   var todayTime = new Date();
   var month = todayTime .getMonth() + 1;
   var day = todayTime .getDate();
   var year = todayTime .getFullYear();
   return day + "." + month + "." + year;
}

var dateToday = new Date();
$( function() {
  $( "#datetimeshipping" ).datepicker({
     minDate: dateToday,
     dayNamesMin: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
  });
});




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
      var datetimeshipping = $('.delivery_date').val();
      var shippingmethodtype = $('.shippingtype').val();
      
      $('.shippingmethod').text(shippingmethodtype);
      $('.timeslot').text(slot);
      $('#specifictime').val(slot);
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
      $( ".row-product" ).each(function( index ) {
        if($(this).attr("rowproduct") == cur_product_id){
          $(this).find('.selectedTime').html(slot);
          $(this).find('.selectedTime1').val(slot);
        }
      });
    })
   }

   $('.product-reveal-close, .first-back').on('click', function(){
    $('.select-info-popup').hide();
    $('.bg_img').hide();
   });
   $('.back-two').on('click', function(){
    jQuery('#shippingmethoddiv').animate({"left":"100%"});
    jQuery('.calendar-section').animate({"right":"0"});
   });
   $('.back-three').on('click', function(){
    jQuery('#timimg-section').animate({"left":"100%"});
    jQuery('#shippingmethoddiv').animate({"right":"0"});
   });
   
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
                   console.log("This is match=>"+matchTime+" This is database=>"+calculatedTime+" This is curr=>"+cur_time);
                   if (calculatedTime>matchTime) {
                      types += '<li class="timeslottable"><a data-shippingmethod="UGT_CALL_DEL-'+abc+'" class="timeslotdetails" data-ga-title="'+value.timeslot_from + ' - ' + value.timeslot_to+'" tabindex="0"><input type="radio"  value="'+value.timeslot_from + ' - ' + value.timeslot_to+'" class="input-group-field applycoupon shippingtime" name="shippingtimeslotnew" id="UGT_CALL_DEL-'+abc+'" tabindex="0"><label class="time-slot-lable" for="UGT_CALL_DEL-'+abc+'"><span class="rdo-span"></span><span class="timesloter">'+value.timeslot_from + ' - ' + value.timeslot_to+'</span></label></a></li>';
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


   
</script>


</div>

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
  .pincodelist{
    overflow-y: auto;
    max-height: 200px;
    position: absolute;
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
</style>

<style type="text/css">
                @media screen and (max-width: 767px){
                  .pro_list_box{
                      height: 360px !important;
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
                     top: 0px;
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
                      padding: 0 7%;
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
                      background-color: #f195b2;
                      color: #7cc3e1 !important;
                      box-shadow: 0 0 0 2px #f195b2;
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
                      background-color: #f195b2;
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
                background-color: #f195b2;
                color: #ffffff;
              }
              
              .order-calendar-date .ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-next {
                  position: absolute;
                  top: 20px;
                  width: 1.8em;
                  height: 1.8em;
              }
              .order-calendar-date .ui-datepicker .ui-datepicker-prev:hover, .ui-datepicker .ui-datepicker-next:hover{
                cursor: pointer;
                background:none;
                color: #1e91cf;
              }
              .ui-datepicker .ui-datepicker-next{
                right: 0;
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
                width: 10px;
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
                position: absolute;
                right: 16px;
                bottom: 25px;
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
                width: 35px;
                height: 35px;
                /*-moz-appearance: none;
                -webkit-appearance: none;
                appearance: none;*/
                background: #fff;
                display: inline-block;
                border: 1px solid #ccc;
                /*visibility: hidden;
                display: none;*/
                padding-left: 5px;
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
            border: 1px solid #ccc;
            height: 55px;
            padding: 5px 0 0 15px !important;
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
            margin-top: -32px;
          }
          .drop-arrow i{
            font-size: 18px;
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
              bottom: 100px;
            }
          }

               </style>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>

<?php echo $footer; ?> 


