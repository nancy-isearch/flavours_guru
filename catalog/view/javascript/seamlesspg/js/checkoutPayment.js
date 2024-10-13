/**
 * @author ashutosh.joshi
 */


var checkoutPayment={
	order_amount:'',
	cart_price:'',
	wlt_amt:0,
	//wltRewardPoints:parseInt($('.rewardspoints1').html()),
	gc_val:$('#gcval').val(),
	gc_appl:$('#isgcAppl').val(),
	selectedEmiCharges:0,
	shippingCharges:parseInt($('#summaryShipping').val().replace('`','')),
	codCharges:0	
};

(function() {
  jQuery(function() {
  	if(jQuery('#ccNumber,#ccNumberemi,#dcNumber').length > 0){
	    return jQuery('#ccNumber,#ccNumberemi,#dcNumber').validateCreditCard(function(result) {
	      var card=jQuery("#verticalTabs li.active").attr('id');	
	      console.log(card);
	      
	      if(card=='ccard' && jQuery('#ccNumber').val().length>0){
	      	jQuery('#ccNumber').val((cc_format(jQuery('#ccNumber').val())));
	      	var card_name=result.card_type.name;
	      	console.log(card_name);
	      	if(card_name=='visa' || card_name=='mastercard')
	      		jQuery('.cardname').val('CC');
	      	else if(card_name=='amex')
	      		jQuery('.cardname').val('AMEX');
	      } else if(card=='dcard' && jQuery('#dcNumber').val().length>0){
	      	jQuery('#dcNumber').val((cc_format(jQuery('#dcNumber').val())));
	      	var card_name=result.card_type.name;
	      	console.log(card_name+'rupay');
	      	if(card_name=='visa' || card_name=='visa_electron')
	      		jQuery('.cardname').val('VISA');
	      	else if(card_name=='mastercard')
	      		jQuery('.cardname').val('MAST');
	      	else if(card_name=='maestro')
	      		jQuery('.cardname').val('MAES');
	      	else if(card_name=='rupay')
	      		jQuery('.cardname').val('RUPAY');
	      }

	      $(".maestro-info").css("display","none");
	      if (!(result.card_type != null)) {
	        jQuery('.cards li').removeClass('off');
	        jQuery('#ccNumber,#ccNumberemi,#dcNumber').removeClass('valid');
			setcardMessage("cardMessageContainer","");
	        return;
	      }
	      jQuery('#ccNumber,#ccNumberemi,#dcNumber').removeClass('onError');
		  setcardMessage("cardMessageContainer",result.card_type.name);
		  initCardFeatures(result);
		  isCardBinValid(result);
	      jQuery('.cards li').addClass('off');
	      jQuery('.cards .' + result.card_type.name).removeClass('off');
	      if (result.length_valid && result.luhn_valid) {
	        return jQuery('#ccNumber,#ccNumberemi,#dcNumber').addClass('valid');
	      } else {
	        return jQuery('#ccNumber,#ccNumberemi,#dcNumber').removeClass('valid');
	      }
	    });
  		
  	}	
  });
}).call(this);


function cc_format(value) {
  var v = value.replace(/\s+/g, '').replace(/[^0-9]/gi, '')
  var matches = v.match(/\d{4,16}/g);
  var match = matches && matches[0] || ''
  var parts = []
  for (i=0, len=match.length; i<len; i+=4) {
    parts.push(match.substring(i, i+4))
  }
  if (parts.length) {
    return parts.join(' ')
  } else {
    return value
  }
}


jQuery(function(){

	// form label plugin 
	//jQuery("label").inFieldLabels();
	jQuery("#verticalTabs").msTabs({tabs:'li', selected:'active', effects:'fade', defaultTab:'nbanking'});

	formdisable();
	
	jQuery('#nbanking_content :input').removeAttr('disabled');

    
    jQuery('.addressbook li').click(function(){
		jQuery('.addressbook li').removeClass('active');
		jQuery('.addressbook li h2').html('Click to Select');
		jQuery(this).addClass('active');
		jQuery(this).find('h2').html('Selected Shipping Address');
	});
    
    /*jQuery('.togglesavecc, .togglesaveemi, .togglesavedc').click(function(){
    	jQuery('.'+jQuery(this).attr('rel')).removeClass('savecardactive');
    	jQuery(this).addClass('savecardactive');
    	jQuery('.'+jQuery(this).attr('rel')).next().hide();
    	jQuery('.'+jQuery(this).attr('rel')).next().find(':input').attr('disabled', 'disabled');
    	jQuery(this).next().show();
    	jQuery(this).next().find(':input').removeAttr('disabled');
    });*/
    
    resetSavedccList();
    //resetSaveddcList();
    //resetSavedemiList();
  
 	$("input[name='cardId']:radio").attr("checked", false);
	$('#ccard_content .qchkoutcardwarapper:not(.disabled) input[name=cardId]:eq(0)').attr("checked","checked");
	$('#ccard_content .qchkoutcardwarapper:not(.disabled) .qchkCVV:eq(0)').show();
	$('#ccard_content .qchkoutcardwarapper:not(.disabled):eq(0) .qchkemi, #ccard_content .qchkoutcardwarapper:not(.disabled):eq(0) .qchkemitable').show();
	$('#ccard_content .qchkoutcardwarapper:not(.disabled) .qchkCVV:eq(0) .entercvv').removeAttr('disabled');
	$('#ccard_content .qchkoutcardwarapper:not(.disabled):eq(0) .qchkemi :input').removeAttr('disabled'); 
    $(".disabled input").attr("disabled","disabled");
	
    jQuery("input[name='cardId']:radio").click(function () {
    	var wrapperid = jQuery(this).attr('rel');
    	savedcardformdisable(wrapperid);
    	jQuery("."+wrapperid+"  .qchkoutcardwarapper:not(.disabled) input[name='cardId']:radio").removeAttr('disabled');
    	if(jQuery(this).val()!= 'newccpay'){
    		jQuery(this).parents().eq(1).find(' :input').removeAttr('disabled');
    		jQuery(this).parents().eq(1).find('.qchkCVV, .qchkemi').show();
    		jQuery('.'+wrapperid+' .savedccpay').show();
    		jQuery('.'+wrapperid+' .savedccpay .payNowBu').removeAttr('disabled');
    		if(wrapperid == "creditCardemiDiv"){
    			//jQuery(this).parents().eq(1).find("input[name='selectemi']:first").click();
    			}
			jQuery(this).parents('.qchkoutcardwarapper');
			jQuery("."+wrapperid+" .qchkoutcardwarappernew .qchkoutchoosecard").removeClass("invisible");	
    		}
    	else{
			jQuery("."+wrapperid+" .qchkoutcardwarappernew .qchkoutchoosecard").addClass("invisible");
    		jQuery('.'+wrapperid+' .newccpay').show();
    		jQuery('.'+wrapperid+' .newccpay :input').removeAttr('disabled');
			if (wrapperid == "creditCardemiDiv") {
				//$(".newccpay input:radio[name=radioemi][value=EXT_HDFC_3_EMI]").trigger('click').attr("checked", true);
				$(".newccpay input:radio[name=radioemi]").attr("checked", false);
				$('.emiform').show();
				$(".emi_fee").hide();
				$("#emiCCBankSelect").val('').change();
			}
    	}
		jQuery("."+wrapperid+" .disabled input").attr("disabled","disabled").attr("checked",false);
    		
    	
    	
    	//jQuery(this).parents().eq(1).find('.qchkCVV, .qchkemi').show();
    	//jQuery(this).parents().eq(1).find('.qchkCVV :input').removeAttr('disabled');
    	//jQuery(this).parents().eq(1).find('.checkemi').removeAttr('disabled');
		
		jQuery('#ccNumber,#ccNumberemi,#dcNumber').val("");
		setAmexFeatures(this);
		
 	});
	//triggering the above functionality on page load
	setAmexFeatures($("input[name='cardId']:checked"));
	
   jQuery('.checkemi').click(function(){
		if(jQuery(this).is(':checked')){
			jQuery(this).parents().eq(0).find('.qchkemitable').show();
			jQuery(this).parents().eq(0).find('.qchkemitable :input').removeAttr('disabled');
		}else{
			jQuery(this).parents().eq(0).find('.qchkemitable').hide();
			jQuery(this).parents().eq(0).find('.qchkemitable :input').attr('disabled', 'disabled');	
		}
	});
	jQuery('#alladdresses').toggle(function(){
		jQuery(this).html('Hide Saved Addresses');
		jQuery('.moreaddresses').fadeIn()
	},function(){	
		jQuery(this).html('Show all addresses');
		jQuery('.moreaddresses').fadeOut()
	})

//$("#nbanking_content select, #nbanking_content input[type=radio]").change(function(){$("#selectNetBanking").val($(this).val());});
$("#nbanking_content input[type=radio][name=radionb]").change(function(){
	if($("#nbanking_content input[type=radio][name=radionb]").is(':checked')){
		$("#selectNetBanking").val($(this).val());
		$("#nbanking_content select.debitNet").val("").removeAttr("validate").removeClass("onError");	
		$("#netBankSelect_error").hide();
	}
});
$("#nbanking_content select.debitNet").change(function(){
	$("#nbanking_content input[type=radio][name=radionb]").attr("checked",false);
	$("#selectNetBanking").val($(this).val());	
	$("#nbanking_content select.debitNet").attr("validate","{true,blank,Please select your bank.}");	
});

	var loc = window.location;
	var successURL = loc.protocol + "//" + loc.host + "/control/paymentVerify";
	document.getElementById("successURL").value = successURL;
	
	// cvv help
	/*$('span.cvvhelp').hover(function(){
		var gettop = parseInt($(this).offset().top)-parseInt($(window).scrollTop());
		//$(this).closest('.form-field')[0].siblings(".form-field")[0].css('z-index','-1');
		$(this).closest('.form-field')[0].siblings(".form-field")[0].hide();
		$(this).find('.questionImage span.cvvhelp').css('position','fixed !important');
		$(this).find('.questionImage span.cvvhelp').css('top',gettop);
		$(this).find('.questionImage span.cvvhelp').css('left',parseInt($(this).offset().left));
		$(this).find('.questionImage span.cvvhelp').show();
		},function(){
			$(this).find('.questionImage span.cvvhelp').hide();
			//$(this).closest('.form-field')[0].siblings(".form-field")[0].css('z-index','1');
		}
	);*/
	$('.questionImage').hover(function(){
		$(this).closest('.form-field',[0]).siblings(".form-field",[0]).css('z-index','-1');
		//alert(121);
		var gettop = parseInt($(this).offset().top)-parseInt($(window).scrollTop());
		$(this).find('.cvvhelp').css('position','fixed !important');
		$(this).find('.cvvhelp').css('top',gettop);
		$(this).find('.cvvhelp').css('left',parseInt($(this).offset().left));
		$(this).find('.cvvhelp').show();		
		},function(){
			$(this).find('.cvvhelp').hide();
			$(this).find('.cvvhelp').css('top','0');
			$(this).find('.cvvhelp').css('left','0');
			$(this).closest('.form-field',[0]).siblings(".form-field",[0]).css('z-index','0');
		}
	);

//default selection of netbanking radio buttons.
$("#nbanking_content input[type=radio]:first").attr("checked","checked");
$("#selectNetBanking").val($("#nbanking_content input[type=radio]:first").val());
		$('ul.tabs li#ccardemi').click(function() {
			//$("input:radio[name=radioemi][value=EXT_HDFC_3_EMI]").trigger('click');
			$(".newccpay input:radio[name=radioemi]").attr("checked", false);
			$('.emiform').show();
			$(".emi_fee").hide();
		});
  	// billing address
  	//addBillingTemplate("ccard_content");
	$("#sameAsShipCB").trigger('change');


	$(".oneclickhelp a:not(.redirect)").click(function(e){e.preventDefault(); $(this).parent().find(".features").slideToggle();
		//$('html, body').animate({scrollTop: $(".features").offset().top}, 2000);
	});
	$(".features-inner a.close-link").click(function(e){e.preventDefault(); $(this).parents().eq(2).find(".features").slideToggle();
	//$('html, body').animate({scrollTop: $(".features").offset().top}, 2000);
	});
	checkoutCommon.init();
	$(".disabled input").attr("disabled","disabled");
	$('.FancytoolTip').simpletooltip();
	
		$("#orderlistShow").click(function(){
		var _this=this;
		$(".orderlist").slideToggle("slow",function(){
			($(_this).text()=="Show Cart Details")? $(_this).text("Hide Cart Details").removeClass('rc_collapse').addClass('rc_expand'):$(_this).text("Show Cart Details").removeClass('rc_expand').addClass('rc_collapse');
		});
	});
	
	// emi fee here is a dummy json 
	//var _emi_fee={'EXT_HDFC_3_EMI':'134', 'ICICI_3_EMI':'100', 'EXT_STANC_3_EMI':'125', 'EXT_HDFC_6_EMI':'150', 'ICICI_6_EMI':'140', 'EXT_STANC_6_EMI':'170'};
	//var codCharges ="100";
	var _emi_fee = eval(bankEmiCharges);
	checkoutPayment.codCharges=parseInt(codCharges);	
		/*$(".cardemioptions input:radio[name=radioemi]").click(function(){
			$('.emi_fee').remove();
			if(_emi_fee[$(this).val()]){
				$('<div class="emi_fee">*EMI Processing Fee of Rs. '+ _emi_fee[$(this).val()] +' inclusive.</div>').insertAfter($(this).parents("ul:eq(0)"));				
			}
		});*/
	
	
		/*$(".qchkemi input:radio[name=selectemi],.qchkemi input:radio[name=radioemi]").click(function(){
			resetEmiCharges();
			if(_emi_fee[$(this).val()]){
				$(".emichargeslabel,.emichargesvalue").show();
				checkoutPayment.selectedEmiCharges=parseInt(_emi_fee[$(this).val()], 10);
				$(".emichargesvalue").html("`"+numberWithComma(checkoutPayment.selectedEmiCharges));
				var _total_amount=parseInt($('#order_amount').val(), 10) + checkoutPayment.selectedEmiCharges; 
				$("#grandTotalPrice, span.payprice").text("`"+numberWithComma(_total_amount));
			}
		});*/
	
	$('.creditCardemiDiv .qchkoutcardwarappernew input:radio[name=cardId][value=newccpay]').click(function() {
		//$(".newccpay input:radio[name=radioemi][value=EXT_HDFC_3_EMI][rel=]").trigger('click').attr("checked",true);
		$(".newccpay input:radio[name=radioemi]").attr("checked", false);
		$('.emiform').show();
		$(".emi_fee").hide();
	});
	$(".msTabsPointerverticalTabs").click(function(){
		$(".maestro-info").css("display","none");
		resetCodCharges();
		switch($(this).attr('id')){
			case 'ccard':
				//removeBillingTemplate();
			 	$(".disabled input").attr("disabled","disabled");
				jQuery(".qchkoutcardwarappernew .qchkoutchoosecard").removeClass("invisible");
				//resetEmiCharges();
			break;
			case 'ccardemi':
				//removeBillingTemplate();
			 	$(".disabled input").attr("disabled","disabled");
				jQuery(".qchkoutcardwarappernew .qchkoutchoosecard").removeClass("invisible");
				if(jQuery(".creditCardemiDiv input[name='cardId']:radio").length < 1){
					$('.emiform :input').removeAttr('disabled'); $('.emiform').show();
					$("#emiCCBankSelect").val('').change();
				}
								
			break;
			case 'nbanking':
			//	resetEmiCharges();
			break;
			case 'dcard':
				//removeBillingTemplate();
			 	$(".disabled input").attr("disabled","disabled");
				jQuery(".qchkoutcardwarappernew .qchkoutchoosecard").removeClass("invisible");
				//resetEmiCharges();
			break;
			case 'cod':
				//resetEmiCharges();
				setCodCharges();
			break;
			case 'amexeze':
			//	resetEmiCharges();
			break;
			case 'ddcheque':
			//	resetEmiCharges();
			break;
		}
	});
	
	$("table.qchkemitable tr td:nth-child(2n)").addClass("even");
	$("table.qchkemitable tr th:nth-child(2n)").addClass("even");
	$("table.qchkemitable").find("th:first").addClass("first");
	
	$("#emiCCBankSelect").change(function(){
		$(".qchkemitable input[name=radioemi]:checked").attr("checked",false);		
		$(this).parents('.newccpay').find(".qchkemi,  .qchkemi table").hide();
		$(this).parents('.newccpay').find(".qchkemi table input").attr("disabled","disabled");
		var _bank_name=$("#emiCCBankSelect").val();
		$(this).parents('.newccpay').find(".qchkemi, .qchkemi #_emi_"+_bank_name).show();
		$(this).parents('.newccpay').find("#_emi_"+_bank_name+" th:not(.disabled) input").removeAttr("disabled");
		//$(".newccpay .qchkemi #_emi_"+_bank_name+" input:radio[name=selectemi]:first").click();
		$("div.emiform, .creditCardemiDiv .payBuRedPo, .oneclickhelp, .creditCardemiDiv .3d-auth").show();
        $(".emiform :input, .creditCardemiDiv .payBuRedPo :input").removeAttr('disabled');
		/*if(_bank_name=="kotak" || _bank_name=="axis" || _bank_name==""){
			$("div.emiform").hide();
        	$(".emiform :input").attr('disabled','disabled');
		}*/
		if(_bank_name==""){
			$("div.emiform").hide();
        	$(".emiform :input").attr('disabled','disabled');
			$(".creditCardemiDiv .payBuRedPo, .creditCardemiDiv .3d-auth").hide();
			$(".oneclickhelp").hide();
			}
	});
});

function redeemWallet(obj){
		if(evalForm(obj)){
			var aftredamt = checkoutPayment.wltRewardPoints - $('#wallet_amt').val();
			var orderAmt = checkoutPayment.cart_price - $('#wallet_amt').val();
			if(aftredamt<0){
				alert("Requested wallet amount should not be more than your wallet balance.");
				return false;
			}
			if(orderAmt<0){
				alert("Requested wallet amount should not be more than cart amount.");
				return false;
			}
			checkoutCommon.showOvereffect();
			$("errmsg").html("");
			$.ajax({
				type: "POST",	
				url:"/control/validateWalletJSON",
				data:{wallet_amt:$('#wallet_amt').val()},
				success:function(data){
					if(data.SUCCESS="success"){
						recalculatePrices(data);			
						$('.wallet_condition,.walletpoints_container').hide();						
						$('.wallet_redemption,.walletlabel, .walletvalue').show();
						$('#cod,#cod_content').hide();
						if($('#verticalTabs').find('#cod').hasClass('active')){
							$('#ccard').click();
						}
					}
					else if(data._ERROR_MESSAGE_  !=null || data._ERROR_MESSAGE_  !=undefined){
						$("errmsg").html(data._ERROR_MESSAGE_);
					}
					checkoutCommon.hideOvereffect();
					_gaq.push(['_trackEvent', 'Wallet', 'Redeem Now', 'Payment Page', $('#wallet_amt').val()]);
				},
				error:function(){
					checkoutPayment.wlt_amt = 0;
					$("errmsg").html("There was some error.");
					checkoutCommon.hideOvereffect();
				}
		  });
		}
		return false;
}
function recalculatePrices(data){
		var _amt_to_be_paid =data.AMT_TO_BE_PAID;
		if(checkoutPayment.selectedEmiCharges>0){
			_amt_to_be_paid =data.AMT_TO_BE_PAID + checkoutPayment.selectedEmiCharges;
			$(".emichargeslabel,.emichargesvalue").show();
		}
		$('.aft_red').html(data.WALLET_POINTS_REMAINING);
		$('#order_amount').val(_amt_to_be_paid);
		$("#grandTotalPrice, .payprice").html("`"+numberWithComma(_amt_to_be_paid));
		$('.walletvalue').html(data.WALLET_POINTS_REDEEMED);
		$('#wallet_amt').val('');
		resetEmiTable();
}

function removeComma(x) {
    return x.toString().replace(",", "");
}

function numberWithComma(n){
	var num = n.toString();
	var outnumstr = "";
	var cnt = 0;
	for(var i=num.length-1; i >= 0; i--){
		if(cnt==3){
			outnumstr=","+outnumstr;
			cnt=0;
		}
		outnumstr=num.charAt(i)+outnumstr;
		cnt++;
	}
	return outnumstr;
}

function resetWallet(){
	$.ajax({
		type: "POST",	
		url:"/control/resetWallet",
		success:function(data){
				if(data.SUCCESS="success"){
						recalculatePrices(data);				
						$('.wallet_condition,.walletpoints_container').show();
						$('.wallet_redemption,.walletlabel, .walletvalue').hide();
						$('#verticalTabs').find('#cod').show();
						if($('#verticalTabs').find('#cod').hasClass('active')){
								$('#cod_content').show();
						}
						resetEmiTable();
					}				
				
				
		},
		error:function(){
			$("errmsg").html("There was some error.");
		}
	});
}

function resetEmiCharges(){
	$(".emichargeslabel,.emichargesvalue").hide();
	$(".emichargesvalue").html('');
	var _total_amount=parseInt($('#order_amount').val(), 10); 
	$("#grandTotalPrice, span.payprice").text("`"+numberWithComma(_total_amount));
	checkoutPayment.selectedEmiCharges=0;
}

function resetEmiTable(){
		$('.qchkemi .qchkemitable tr').each(function(){
			$(this).find('td:nth-child(8)').html(parseInt($('#order_amount').val(), 10));
			//var _monthly_emi=parseInt($('#order_amount').val(), 10)/parseInt($(this).find('td:nth-child(2)').html())- parseInt($(this).find('td:nth-child(6)').html())
			//$(this).find('td:nth-child(4)').html(_monthly_emi.toFixed(2));				
		});	
}


function setCodCharges(){
	        resetCodCharges();
			if(checkoutPayment.codCharges != "" && checkoutPayment.codCharges != null){
				$(".codchargeslabel,.codchargesvalue").show();
				$(".codchargesvalue").html("`"+numberWithComma(checkoutPayment.codCharges));
				var _total_amount=parseInt($('#order_amount').val(), 10) + checkoutPayment.codCharges; 
				$("#grandTotalPrice, span.payprice").text("`"+numberWithComma(_total_amount));
			}
}
function resetCodCharges(){
	$(".codchargeslabel,.codchargesvalue").hide();
	$(".codchargesvalue").html('');
	var _total_amount=parseInt($('#order_amount').val(), 10); 
	$("#grandTotalPrice, span.payprice").text("`"+numberWithComma(_total_amount));
}

// checkSavedCardSwitch
function checkSavedCardSwitch(currentCardMode){
	switch(currentCardMode){
		case 'ccard':
			resetSavedccList();
			break;
		
		case 'dcard':
			resetSaveddcList();
			break;
		
		case 'ccardemi':
			resetSavedemiList();
			break;
			
		default:
			break;
	}
	
}
function resetSavedccList(){
	if(jQuery(".creditCardDiv input[name='cardId']:radio").length > 1)
	{
		jQuery(".creditCardDiv :input").attr('disabled', 'disabled');
		jQuery('.creditCardDiv .newccpay').hide();
		jQuery('.creditCardDiv .savedccpay').show();
		jQuery(".creditCardDiv .qchkoutcardwarapper:not(.disabled) input[name='cardId']:first").attr("checked","checked");
		jQuery(".creditCardDiv .qchkoutcardwarapper:not(.disabled):first .qchkCVV").show();
		jQuery(".creditCardDiv .qchkoutcardwarapper:not(.disabled):first :input, .creditCardDiv input[name='cardId']:radio, .creditCardDiv .savedccpay .payNowBu").removeAttr('disabled');
		
	}	
}

function resetSavedemiList(){
	if(jQuery(".creditCardemiDiv input[name='cardId']:radio").length > 1)
	{
		jQuery(".creditCardemiDiv :input").attr('disabled', 'disabled');
		jQuery('.creditCardemiDiv .newccpay').hide();
		jQuery('.creditCardemiDiv .savedccpay').show();
		jQuery(".creditCardemiDiv .qchkoutcardwarapper:not(.disabled):first input[name='cardId']:first").click();
		//jQuery(".creditCardemiDiv .qchkoutcardwarapper:not(.disabled):first input[name='selectemi']:first").click();
		jQuery(".creditCardemiDiv .qchkoutcardwarapper:not(.disabled):first .qchkCVV, .creditCardemiDiv .qchkoutcardwarapper:not(.disabled):first .qchkemi").show();
		jQuery(".creditCardemiDiv .qchkoutcardwarapper:not(.disabled):first :input, .creditCardemiDiv input[name='cardId']:radio, .creditCardemiDiv .savedccpay .payNowBu").removeAttr('disabled');
	}
	else
	{
		jQuery(".creditCardemiDiv .savedccpay").hide();
		jQuery(".creditCardemiDiv .savedccpay :input").attr('disabled', 'disabled');
	}	
}


function resetSaveddcList(){
	if(jQuery(".debitCardDiv input[name='cardId']:radio").length > 1)
	{
		jQuery(".debitCardDiv :input").attr('disabled', 'disabled');
		jQuery('.debitCardDiv .newccpay').hide();
		jQuery('.debitCardDiv .savedccpay').show();
		jQuery(".debitCardDiv .qchkoutcardwarapper:not(.disabled):first input[name='cardId']:first").attr("checked","checked");
		jQuery(".debitCardDiv .qchkoutcardwarapper:not(.disabled):first .qchkCVV").show();
		jQuery(".debitCardDiv .qchkoutcardwarapper:not(.disabled):first :input, .debitCardDiv input[name='cardId']:radio, .debitCardDiv .savedccpay .payNowBu").removeAttr('disabled');
		
	}
}


// disable saved card
function savedcardformdisable(wrapperid){
	$('.'+wrapperid+' .newccpay, .'+wrapperid+' .savedccpay, .'+wrapperid+' .qchkCVV, .'+wrapperid+' .qchkemi').hide();
	$('.'+wrapperid+' .checkout4Savecard').show();
	$('.'+wrapperid+' :input').attr('disabled', 'disabled');	
}


function formdisable(){
	jQuery('#ccard_content :input,#ccardemi_content :input, #nbanking_content :input, #dcard_content :input, #cod_content :input, #ddcheque_content :input,#amexeze_content :input').attr('disabled', 'disabled');
}

function submitForm(form, mode, value) {
	form.payment_mode.value=mode;
	jQuery('#overeffect').show().css('height', jQuery(document).height()+'px');
	jQuery('#updating').show();
    form.action="/payment/";
    form.submit();
} 


function payment(form, mode, value) {
	if(jQuery('#order_amount').val() <= 0){
		if(checkoutPayment.wlt_amt==0){
			submitForm(form, "GIFT_CARD", value);
		 	return;
		}
		if(checkoutPayment.gc_val >0 && checkoutPayment.gc_appl==true && checkoutPayment.wlt_amt!=0 ){
			submitForm(form, "GIFT_CARD", value);
		 	return;
		}
		if(checkoutPayment.gc_val==0 && checkoutPayment.gc_appl=="false" && checkoutPayment.wlt_amt!=0 ){
			submitForm(form, "WALLET", value);
		 	return;
		}
	}
	
	if(mode == "AMEX_EZE")
	{
		submitForm(form, "AMEX_EZE", value);
	 	return;
	}
	if(mode == "PAYTM")
	{
		submitForm(form, "PAYTM", value);
	 	return;
	}
	var formvalidate = evalForm(form);
	var validFlag=false;
	//alert(mode+" validate: "+formvalidate);
	
	if(formvalidate == 'true' || formvalidate == true)
	{
		if(mode == "EXT_COD")
		{
			 $('#cod_captcha').removeClass('onError');
			$("#cod_captcha_error").hide();
			var submitToUri = "/control/captchaValidate";
			/*jQuery.ajax({
				type: "POST",
				async: false,
				url: submitToUri,
				data: 'input='+jQuery('#cod_captcha').val()+'&captchaCode='+jQuery('#captchaValue').val(),
				success: function(html){
					if(html == "false")
					{
					//	alert('Wrong Captcha Value');
					    $('#cod_captcha').addClass('onError');
						$("#cod_captcha_error").addClass('errorMsg').html('Wrong Captcha Value').show();
						return;
					}
					else
					{
					 	submitForm(form, mode, value);

					}
				}
			});*/
			if(jQuery('#cod_captcha').val()==jQuery('#captchaValue').val()){
					submitForm(form, mode, value);
		     }else{
				    $('#cod_captcha').addClass('onError');
					$("#cod_captcha_error").addClass('errorMsg').html('Wrong Captcha Value').show();
					return;		    	 
		     }
		}
		else if(mode == "PAYMATE")
		{
			var submitToUri = "/control/paymateValidator";
			$.ajax({
				type: "POST",
				async: false,
				url: submitToUri,
				data: 'mobileNo='+$('#paymatemobile').val(),
				success: function(html){
					if(html != "true")
					{
						alert('You are not a registered Paymate user!!');
						return;
					}
					else
					{
					 	submitForm(form, mode, value);
					}
				}
			});
		}
		else if(mode == "CREDIT_CARD")
		{
			var ccNumber = form.ccNumber.value;
			form.cardNumber.value = ccNumber.encrypt();
			var ccCVV = form.ccCVV.value;
			form.cardCVV.value = ccCVV.encrypt();
			$('#ccNumber').remove();
			$('#ccCVV').remove();
			if(jQuery('#sameAsShipCB').is(':checked')){
				jQuery('#sameAsShip').attr('value','y');
			}
			var gcno = jQuery('#gcno').val();
			//keep this hack for future AMEX promotion
			if(checkoutPayment.isAmexGC && "AMEX" != jQuery("#cardType").val())
			{
				alert('This offer is valid only on Amex cards');
				return;
			}
			submitForm(form, mode, value);
		}
		else if(mode == "DEBIT_CARD")
		{
			var dcNumber = form.dcNumber.value;
			form.cardNumber.value = dcNumber.encrypt();
			var dcCVV = form.dcCVV.value;
			form.cardCVV.value = dcCVV.encrypt();
			$('#dcNumber').remove();
			$('#dcCVV').remove();
			submitForm(form, mode, value);
		}
		else if(mode == "MILES_AND_MORE")
		{
			var ccNumber = form.milesmorecard.value;
			form.cardNumber.value = ccNumber.encrypt();
			var ccCVV = form.milesmorepin.value;
			form.cardCVV.value = ccCVV.encrypt();
			submitForm(form, mode, value);
		}
		else if(mode == "NOKIA_MONEY")
		{			
			var ccNumber = form.nokiaMobileNo.value;
			form.cardNumber.value = ccNumber;			
			var ccCVV = form.nokiaMobilePin.value;
			form.cardCVV.value = ccCVV.encrypt();			
			submitForm(form, mode, value);
		}
		else if(mode.indexOf("_EMI") != -1)
		{
			var ccNumberemi = form.ccNumberemi.value;
			form.cardNumber.value = ccNumberemi.encrypt();
			var ccCVVemi = form.ccCVVemi.value;
			form.cardCVV.value = ccCVVemi.encrypt();
			$('#ccNumberemi').remove();
			$('#ccCVVemi').remove();
			submitForm(form, mode, value);
		}
		else
		{
	    	//alert("type:"+form.type.value+"------is_indian_card:"+form.is_indian_card.value+"-----Mode:"+form.payment_mode.value);
	    	submitForm(form, mode, value);
	   	}
	}
	else{
		return validFlag;
	}
}


function reloadCaptcha()
{	
	var submitToUri = "/control/reloadCaptcha";
	$.ajax({
    url: submitToUri,
	success: function(html){
	$("#captcha").html(html);
		//reloadCaptchaCode();
	}
	});
}

/*------------------------- Card identification for ICICI EMI option ---------------------------*/

function isValidAmexEmiCard(_card_num){
		if(_card_num.length>5){
		var _extracted_card_num=_card_num.substring(0,6);
		var _valid_arr=["37693"];
		for(n=0;n<_valid_arr.length;n++){
			if(_extracted_card_num.search(_valid_arr[n]) != -1){
				return true;
			}		
		}
	}
	return false;
	
}

function isValidIciciEmiCard(_card_num){
	if(_card_num.length>5){
		var _extracted_card_num=_card_num.substring(0,6);
		var _valid_arr=["524376","517653","517638","540282","517638","517654","517638","545207","517654","523951","517638","517654","517638","517653","517637","517653","517654","517638","51772E","517654","51772E","523951","51772E","517653","525996","523951","517654","517654","540282","517637","547467","523951","523951","517719","517653","517719","517653","447746","462986","462986","447747","402369","447747","447747","40766E","447747","447748","447748","462986","447746","462987","447746","447747","402368","402368","447758","407651","462987","447747","447747","447748","447748","447748","407652","407659","447747","407651","40766E","462986","447747","407659","470573","402368","447747","447747","447746","462987","42058E","447748","407659","407651","407659","402368","407652","447748","447747","447758","447747","407651","447748","447746","407651","444341","447746","447747","447747","447747","447746","407652","447747","447748","40766E","462986","447747","447748","447748","40766E","447747","407651","444341","447747","447747","447748","437551","524193","524193","552418","474846","405533","405533","461133"];
		for(n=0;n<_valid_arr.length;n++){
			if(_extracted_card_num.search(_valid_arr[n]) != -1){
				return true;
			}		
		}
	}
	return false;
}

function isValidStanCEmiCard(_card_num){
	if(_card_num.length>5){
		var _extracted_card_num=_card_num.substring(0,6);
		var _valid_arr=["402874", "412903", "412904", "412905", "419607", "429344", "454198", "456398", "457036", "462270", "462271", "462272", "462273", "466269", "466271", "523988", "523990", "540460", "540461", "540711", "543186", "544438", "547359", "549124", "549132", "553160", "554374", "554375", "554378", "554623", "558959"];
		for(n=0;n<_valid_arr.length;n++){
			if(_extracted_card_num.search(_valid_arr[n]) != -1){
				return true;
			}		
		}
	}
	return false;
}
function isValidHDFCEmiCard(_card_num){
	if(_card_num.length>5){
		var _extracted_card_num=_card_num.substring(0,6);
		var _valid_arr=["517652","434678","436306","552088","524368","405028","461786","418136","461787","517635","434677","524111","528945","552344","545226","437546","524216","545964","552260","552274","485498","485499","552385","489377","533744","524931","559300","522852","552394","489376","556042", "558818", "436520", "556620", "467741", "553162", "467742", "524877", "404276", "488994", "532961", "532973", "457262", "553583", "558983", "360825", "360826", "360827", "457704", "524181"];
		for(n=0;n<_valid_arr.length;n++){
			if(_extracted_card_num.search(_valid_arr[n]) != -1){
				return true;
			}		
		}
	}
	return false;
}

function isValidCitiEmiCard(_card_num){
	if(_card_num.length>5){
		var _extracted_card_num=_card_num.substring(0,6);
		var _valid_arr=["517652","434678","436306","552088","524368","405028","461786","418136","461787","517635","434677","524111","528945","552344","545226","437546","524216","545964","552260","552274","485498","485499","552385","489377","533744","524931","559300","522852","552394","489376"];
		for(n=0;n<_valid_arr.length;n++){
			if(_extracted_card_num.search(_valid_arr[n]) != -1){
				return true;
			}		
		}
	}
	return false;
}

function ifEmiAvailable(){	
	if(!$("input[name=radioemi]:checked").attr("disabled")){
		var value = $("input[name=radioemi]:checked").val();
		if(value == 'ICICI_3_EMI' || value == 'ICICI_6_EMI' || value == 'ICICI_9_EMI' || value == 'ICICI_12_EMI')
		{
			return isValidIciciEmiCard($('#ccNumberemi').val());
		}
		else if(value == 'EXT_HDFC_3_EMI' || value == 'EXT_HDFC_6_EMI' || value == 'EXT_HDFC_9_EMI' || value == 'EXT_HDFC_12_EMI')
		{
			return isValidHDFCEmiCard($('#ccNumberemi').val());
		}
		else if($("input[name=radioemi]:checked").val() == 'STANC_3_EMI' || $("input[name=radioemi]:checked").val() == 'STANC_6_EMI')
		{
			return isValidStanCEmiCard($('#ccNumberemi').val());
		}
		else if($("input[name=radioemi]:checked").val() == 'CITI_3_EMI' || $("input[name=radioemi]:checked").val() == 'CITI_6_EMI')
		{
			return isValidCitiEmiCard($('#ccNumberemi').val());
		}
		if(value == 'AMEX_3_EMI' || value == 'AMEX_6_EMI' || value == 'AMEX_9_EMI' || value == 'AMEX_12_EMI')
		{
			return isValidAmexEmiCard($('#ccNumberemi').val());
		}
		
	}
}


/*------------ set  billing address text description based on credit/debit card type  ------------*/
function setBillingIntroText(_card_type){
	$("#billingIntroText").html("");
	var _text;
	switch(_card_type){
	case "VISA":
		_text="You are requested to provide the address matching with your card statement in order to process your transaction favorably.";
		break;
	case "AMEX":
		_text="American Express uses Address Verification System(AVS) as an additional layer of authentication to avoid unauthorized usage on your card. Hence,AMEX card users are requested to provide billing address and pin code matching with address on their card statement.<strong>Please note that mismatch in Billing address with that in the bank records will lead to transaction FAILURE</strong>. ";
		break;
	case "MC":
		_text="You are requested to provide the address matching with your card statement in order to process your transaction favorably.";
		break;	
	default:
		_text="You are requested to provide the address matching with your card statement in order to process your transaction favorably.";
		break;
	
	}
	$("#billingIntroText").html(_text);
}


/*------------ get  credit/debit card type  ------------*/
//Logic involves identifying the card type based on its first digit
function getCardType(_val){	
	var _first_digit=_val.substr(0,1);
	var _card_type;
	switch(_first_digit){
	case '4':
		_card_type="VISA"; 
		break;
	case '5':
		if(isMaestroCard(_val))
			_card_type="MAEST";
		else
			_card_type="MC";
		break;
	case '6':
		if(isMaestroCard(_val))
			_card_type="MAEST";
		else
			_card_type="";
		break;
	case '3':
		_card_type="AMEX";
		break;
	default:
		_card_type="";
		break;
	}
	setBillingIntroText(_card_type);
	setCVVvalidateCode(_card_type);
	return _card_type;	
}

function setCVVvalidateCode(_card_type)
{
	if("MAEST" == _card_type)
		$('#dcselectMonth, #dcselectYear, #dcCVV').removeAttr('validate');
	else
	{
		$('#dcselectMonth').attr('validate','{true,blank,Please choose Month}');
		$('#dcselectYear').attr('validate','{true,blank,Please choose Year,chkexp,Invalid Expiry Date}');
		$('#dcCVV').attr('validate','{true,blank,Card number required,customCardNo,dcCVV}');
	}
}
function isMaestroCard(_val)
{
	//var bin = ["502260","504433","504434","504435","504437","504645","504681","504753","504775","504809","504817","504834","504848","504884","504973","504993","508125","508126","508159","508192","508227","600206","603123","603741","603845","622018"];
	var bin =["502964","504433","504435","504437","504441","504445","504465","504493","504645","504753","504774","504775","504809","504817","504834","504883","504884","504958","504973","504993","508000","508125","508126","508159","508192","508227","508588","588599","600206","601794","603845","606362","606989","622018","603123","603741","504848","504681","504434","502260"]
	for(n=0;n<bin.length;n++){
		if(_val.match("^"+bin[n]) == bin[n]){
			return true;
		}		
	}
	return false;  
}

function expressPayment(form) {
	value = null;
	if(jQuery('#order_amount').val() <= 0)
	{
	 	form.payment_mode.value="GIFT_CARD";
	 	jQuery('#overeffect').show().css('height', jQuery(document).height()+'px');
		jQuery('#updating').show();
		submitExpressForm(form, "DN", value);
	 	return;
 	}
	var formvalidate = evalForm(form);
	var validFlag=false;
	var refId = $('input[name=cardId]:checked:visible').attr('value');
	var modeSelector = "div#"+refId;
	var mode = $(modeSelector).attr("title");
	mode = $.trim(mode);	
	if(formvalidate == 'true' || formvalidate == true){
		if((mode == "CREDIT_CARD") ||(mode == "cc") ||(mode == "ax") ){
			$('input[name=cref]').val(refId);			
			var ccCVV = $('input.entercvv:visible').val();
			var cardCVV = ccCVV.encrypt();
			//keep this hack for future AMEX promotion
			if(checkoutPayment.isAmexGC && mode != "ax")
			{
				alert('This offer is valid only on Amex cards');
				return;
			}
			$('input[name=payment_mode]').val("CREDIT_CARD");
			validFlag = true;
		}else if((mode == "DEBIT_CARD") ||(mode == "dc") ){
			$('input[name=cref]').val(refId);			
			var ccCVV = $('input.entercvv:visible').val();
			var cardCVV = ccCVV.encrypt();
			$('input[name=payment_mode]').val("DEBIT_CARD");
			validFlag = true;
		}else if(mode.indexOf("_EMI") != -1)
		{
			refId = refId.replace("_EMI","");
			$('input[name=cref]').val(refId);			
			var ccCVV = $('input.entercvv:visible').val();
			var cardCVV = ccCVV.encrypt();
			var hermesMode = $('input[name=selectemi]:checked').attr('value');
			$('input[name=payment_mode]').val(hermesMode);
			validFlag = true;
		}
		if(validFlag = true)
		{
			$('input[name=cardCVV]').val(cardCVV);
			//Vimal Can Add amex chech here
		 	jQuery('#overeffect').show().css('height', jQuery(document).height()+'px');
			jQuery('#updating').show();
			var currentCtype = $('input.entercvv:visible').siblings('.cType').val();			
			$('input[name=cardType]').val(currentCtype);
			$('input.entercvv').remove();
			$('[name=cardId]').remove();
			submitExpressForm(form, "DN", null);
		}
	}else{
		return validFlag;
	}
	
}
function submitExpressForm(form, mode, value) {
    if (mode == "DN") {
    	// done action; checkout
        form.action="/payment/";
        form.submit();
    }
} 

function setcardMessage(containerId,cardName){
  $("#"+containerId).html("");
  switch(cardName){
  case 'amex':
  	 $("#"+containerId).html("We accept only Safekey enabled American Express credit cards. Amex cards issued outside India, Singapore and UK will not be acceptable due to security reasons.");
	 $("#ccard_content .creditCardDiv div.note").html("<strong>NOTE:</strong>  After clicking \"PAY NOW\" you will be directed to your bank's website for AMEX Safekey authentication.");
  break;
  default:
    $("#"+containerId).html("");
	$("#ccard_content .creditCardDiv div.note").html("<strong>NOTE:</strong> After clicking Pay Now, you will be redirected to your bank's website for 3D authentication to verify yourself.");
  break;
  }
}

function setAmexFeatures(obj){
		$("#cardMessageContainer").html("");
		var _isAmex=jQuery(obj).parents().eq(1).find(".qchkoutcardtype span").hasClass("amex");
		if(_isAmex){
			setcardMessage("cardMessageContainer","amex");
				jQuery(obj).parents().eq(1).find(".qchkoutcardinfo input.entercvv").attr("maxlength","4");
			}else{
				jQuery(obj).parents().eq(1).find(".qchkoutcardinfo input.entercvv").attr("maxlength","3");	
			}
}

function initCardFeatures(result){
			//  Dynamically change the CVV maxlength on detecting the card type 
			var _length = 4; // lets keep the default length at the max			
			if(result.card_type.name != undefined || result.card_type.name != null ){
				switch(result.card_type.name){
					case 'visa':
					    _length = 3;				
						break;
					case 'mastercard':
					    _length = 3;
						break;
					case 'amex':
						  _length = 4;
					case 'maestro':
					      $(".maestro-info").css("display","block");
					  break;	  
					default:	
						 _length = 4;
						break;	
				}
			}
			$(".ccCVV").attr("maxlength",_length);
			$(".ccCVV").attr("value","");
    	       			
			
}

function isCardBinValid(result){
	if(result.length_valid && result.luhn_valid){
		var _id="";
		var _card_num="";
		jQuery('#ccNumber,#ccNumberemi,#dcNumber').each(function(idx,obj){
			if($(obj).is(':disabled')==false){
				_id = $(obj).attr("id");
				if($(obj).val() !== ' '){
					_card_num= $(obj).val();	
				}
				
			}
		});		
		$.ajax({
			type: "GET",	
			url:"/control/getCardBinInfoJSON",
			data:{card_bin:_card_num.substring(0,6)},
			success:function(data){
				if(data.STATUS =="success"){
					if((typeof data.IS_INTERNATIONAL !="undefined" && data.IS_INTERNATIONAL=="Y") || (typeof data.IS_PAY_ENABLED !="undefined" && data.IS_PAY_ENABLED=="N")){
						$("#"+_id+"_error").html("We are sorry! Your card is either issued outside India or Bank doesn\'t support it").show();
						$("#"+_id).val("").addClass("onError");
						return false;
					}else{
						$("#"+_id+"_error").hide();
					}
				}else{
					return true;
				}
			},
			error:function(data){
				return true;
			}
	  });
	}

	return true;
}