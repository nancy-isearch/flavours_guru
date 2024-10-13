jQuery(document).ready(function(){jQuery(".dotmenu").click(function(){jQuery(".mob_t-link").toggleClass("show");});if($(window).width()>=769){var senseSpeed=5;var previousScroll=0;$(window).scroll(function(event){var scroller=$(this).scrollTop();if(scroller==0){$(".topfilterrow").removeClass('filter-fixup');$(".topfilterrow").removeClass('filter-fixdown');}else if(scroller-senseSpeed>previousScroll){$("nav#top").filter(':not(:animated)').slideUp();$("header").filter(':not(:animated)').slideUp();$(".topfilterrow").addClass('filter-fixdown');$(".topfilterrow").removeClass('filter-fixup');}else if(scroller+senseSpeed<previousScroll){$("nav#top").filter(':not(:animated)').slideDown();$("header").filter(':not(:animated)').slideDown();$(".topfilterrow").addClass('filter-fixup');$(".topfilterrow").removeClass('filter-fixdown');}previousScroll=scroller;});}if($(window).width()<768){var senseSpeed=5;var previousScroll=0;$(window).scroll(function(event){var scroller=$(this).scrollTop();if(scroller==0){$(".topfilterrow").removeClass('filter-fixup');$(".topfilterrow").removeClass('filter-fixdown');}else if(scroller-senseSpeed>previousScroll){/*$(".logobox").filter(':not(:animated)').slideUp();*//*$(".cart").filter(':not(:animated)').slideUp();*/$(".topfilterrow").addClass('filter-fixdown');$(".topfilterrow").removeClass('filter-fixup');jQuery(".mob_t-link").removeClass("show");}else if(scroller+senseSpeed<previousScroll){$(".logobox").filter(':not(:animated)').slideDown();$(".cart").filter(':not(:animated)').slideDown();$(".topfilterrow").addClass('filter-fixup');$(".topfilterrow").removeClass('filter-fixdown');}previousScroll=scroller;});}var elementHeights=jQuery('.giftBlocks > .col-sm-2 span a').map(function(){return jQuery(this).height();}).get();var maxHeight=Math.max.apply(null,elementHeights);jQuery('.giftBlocks > .col-sm-2 span a').height(maxHeight);if(jQuery(window).width()<768){var el="";jQuery(".dropdown-menu ul.list-unstyled > li > a").click(function(){el=jQuery(this).attr('class');jQuery("ul.list-unstyled > li > ul").hide();jQuery("ul.list-unstyled > li > a").removeAttr('class');if(el=='active'){jQuery(this).removeClass('active');jQuery(this).next().hide();}else{jQuery(this).addClass('active');jQuery(this).next().show();}return false;})}else
jQuery(".dropdown-menu ul.list-unstyled > li > a").removeAttr('href');jQuery(".readmore-upper").click(function(){jQuery('.footer-text').toggleClass("show");jQuery('.hFcontent span.text').toggleClass("show");jQuery('.readmore-less').toggleClass("show");jQuery('.readmore-upper').toggleClass("show");});jQuery(".readmore-less").click(function(){jQuery('.footer-text').toggleClass("show");jQuery('.hFcontent span.text').toggleClass("show");jQuery('.readmore-less').toggleClass("show");jQuery('.readmore-upper').toggleClass("show");});jQuery(".menu-overlay").click(function(){jQuery(".btn-navbar").trigger("click");})
//jQuery(".btn-navbar").click(function(){jQuery(".menu-overlay").toggleClass("show");})
jQuery('.btn-navbar').click(function(){
	jQuery(".menu-overlay").addClass("show");
    jQuery('body').css("overflow", "hidden");
    jQuery('.navbar-collapse.navbar-ex1-collapse.collapse').animate({'left': '0'},200);
    jQuery('.navbar-collapse.navbar-ex1-collapse.collapse').addClass('in');
});
jQuery('.menu-overlay').on('touchstart click', function(event){
	jQuery(this).removeClass('show');
    jQuery('body').css("overflow", "auto");
    jQuery('.navbar-collapse.navbar-ex1-collapse.collapse').removeClass('in');
    jQuery('.navbar-collapse.navbar-ex1-collapse.collapse').animate({'left': '-70%'},200);
});
jQuery(".hFilter").click(function(){jQuery(".filterBox").toggleClass("show");jQuery(".hFilter").toggleClass("show");})
$('.navbar a.dropdown-toggle').on('click',function(e){var $el=$(this);var $parent=$(this).offsetParent(".dropdown-menu");$(this).parent("li").toggleClass('open');if(!$parent.parent().hasClass('nav')){$el.next().css({"top":$el[0].offsetTop,"left":$parent.outerWidth()-4});}$('.nav li.open').not($(this).parents("li")).removeClass("open");return false;});$('.pass_show').click(function(){$('#input-password').toggleClass("show");$('.pass_show').toggleClass("show");if($("#input-password").hasClass('show')){$("#input-password").attr("type","text");}else{$("#input-password").attr("type","password");}});$("#menu .dropdown").mousedown(function(){if($(window).width()>768){$('#menu .dropdown-menu').removeAttr('style');}})
jQuery('div#offerBanner span').on('click',function(){if(localStorage.showoffers!=='1'){jQuery("div#offerBanner").removeClass("showoffers");localStorage.showoffers='1';jQuery("body").removeClass("offermsg");$('.topfilterrow').removeClass('show');}});if(localStorage.showoffers=='1'){}else{jQuery("body").addClass("offermsg");jQuery("div#offerBanner").addClass("showoffers");}})
jQuery(document).ready(function(){if($('#offerBanner').hasClass('showoffers')){$('.topfilterrow').addClass('show');}else{}});setInterval(function() {
    $( ".blink_text" ).toggleClass("no-bg");
}, 1000);
//popup select date time
 $(document).ready(function() {
 	$('.product-reveal-close').click(function (){
 		$('.select-info-popup').fadeOut('100');
 		$('.bg_img').fadeOut('100');
 	});

 	jQuery('.calendar-section .ui-datepicker-calendar a.ui-state-default').click(function(){
 		jQuery('.calendar-section').animate({"right":"100%"});
 		jQuery('#shippingmethoddiv').animate({"left":"0"});
 	});

 	jQuery('.backtocalendar-1').click(function(){
 		jQuery('#shippingmethoddiv').animate({"left":"100%"});
 		jQuery('.calendar-section').animate({"right":"0"});
 	});

	jQuery('.select_delivery').click(function(){
 		jQuery('#shippingmethoddiv').animate({"right":"100%"});
 		jQuery('#timimg-section').animate({"left":"0"});
	});

 	jQuery('.backtocalendar-2').click(function(){
 		jQuery('#shippingmethoddiv').animate({"left":"0"});
 		jQuery('#timimg-section').animate({"left":"100%"});
 		jQuery('#time_slot_msg').animate({"left":"100%"});
 	});
 	jQuery('.view-all-cat-tab').click(function(){
 		jQuery(this).parent().toggleClass('expand-tab');
 		//jQuery('.cat-disable-tab-split').hide();
 		//jQuery('.name-row').css({"height":"auto","overflow":"initial","max-height":"initial"});
 	});

 	var name_item = 0;
	var name_item = $('.name-row').children().length;
	if(name_item >= 3){
	  jQuery('.view-all-cat-tab').show();
	}else{
	  $('.view-all-cat-tab').hide();
	}

	var screenwidth = $(window).width();
    if(screenwidth < 767){
		setTimeout(function() {
			jQuery(window).scroll(function(){
			  jQuery('.row.toolbar').css({'bottom':'0'});
			});
		},30);
	}
});