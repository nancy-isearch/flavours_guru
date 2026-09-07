jQuery(document).ready(function(){
	
	
	jQuery(".dotmenu").click(function(){                // mobile view header my acount , track order curency show
	jQuery(".mob_t-link").toggleClass("show");
	
	});
	

	
   
   if ($(window).width() >= 769){      // js for arrow downor up
    
       var senseSpeed = 5;                          
       var previousScroll = 0;
       $(window).scroll(function(event){
       var scroller = $(this).scrollTop();
       if (scroller-senseSpeed > previousScroll){
       $("nav#top").filter(':not(:animated)').slideUp();
       $("header").filter(':not(:animated)').slideUp();
       } else if (scroller+senseSpeed < previousScroll) {
       $("nav#top").filter(':not(:animated)').slideDown();
       $("header").filter(':not(:animated)').slideDown();	  
       }
       previousScroll = scroller;
       });
   }
	
	
	 if ($(window).width() <= 768){      // js for arrow downor up for mobile
    
       var senseSpeed = 5;                          
       var previousScroll = 0;
       $(window).scroll(function(event){
       var scroller = $(this).scrollTop();
         if (scroller-senseSpeed > previousScroll){
            $(".logobox").filter(':not(:animated)').slideUp();
            $(".cart").filter(':not(:animated)').slideUp();
             } 
		  else if (scroller+senseSpeed < previousScroll) {
             $(".logobox").filter(':not(:animated)').slideDown();
             $(".cart").filter(':not(:animated)').slideDown();	  
          }
           previousScroll = scroller;
          });
   }
	
	

	// max height of  blocks after slider
	var elementHeights = jQuery('.giftBlocks > .col-sm-2 span a').map(function() {
	return jQuery(this).height();
	}).get();
	var maxHeight = Math.max.apply(null, elementHeights);
	jQuery('.giftBlocks > .col-sm-2 span a').height(maxHeight);

	if(jQuery(window).width()<768){
		var el="";
		jQuery(".dropdown-menu ul.list-unstyled > li > a").click(function(){
			el=jQuery(this).attr('class');

			jQuery("ul.list-unstyled > li > ul").hide();
			jQuery("ul.list-unstyled > li > a").removeAttr('class');

			if(el=='active'){
				jQuery(this).removeClass('active');
				jQuery(this).next().hide();
			} else {
				jQuery(this).addClass('active');
				jQuery(this).next().show();	
			}
			
			return false;
		})
	} else 
		jQuery(".dropdown-menu ul.list-unstyled > li > a").removeAttr('href');



	jQuery(".readmore-upper").click(function(){
	    jQuery('.footer-text').toggleClass("show");
        jQuery('.hFcontent span.text').toggleClass("show");
        jQuery('.readmore-less').toggleClass("show");		
        jQuery('.readmore-upper').toggleClass("show");			
	});
	
	jQuery(".readmore-less").click(function(){
	    jQuery('.footer-text').toggleClass("show");
        jQuery('.hFcontent span.text').toggleClass("show");
        jQuery('.readmore-less').toggleClass("show");		
        jQuery('.readmore-upper').toggleClass("show");			
	});
	

	jQuery(".menu-overlay").click(function(){
		jQuery(".btn-navbar").trigger("click");
	})

	jQuery(".btn-navbar").click(function(){
	jQuery(".menu-overlay").toggleClass("show");
	
	})
	
	jQuery(".hFilter").click(function(){
	jQuery(".filterBox").toggleClass("show");
	jQuery(".hFilter").toggleClass("show");	
	
	})
	
	
	
	
      $('.navbar a.dropdown-toggle').on('click', function(e) {
        var $el = $(this);
        var $parent = $(this).offsetParent(".dropdown-menu");
        $(this).parent("li").toggleClass('open');

        if(!$parent.parent().hasClass('nav')) {
            $el.next().css({"top": $el[0].offsetTop, "left": $parent.outerWidth() - 4});
        }

        $('.nav li.open').not($(this).parents("li")).removeClass("open");

        return false;
    
});



      $('.pass_show').click(function(){                     // sign up page password field attr change
		$('#input-password').toggleClass("show") ;
		$('.pass_show').toggleClass("show") ;	
	   
	    if($("#input-password").hasClass('show')){
  
      $("#input-password").attr("type","text");
 
       }
     else {
   
      $("#input-password").attr("type","password");
 
       }
	   
	   });


    $("#menu .dropdown").mousedown(function(){
    	if($(window).width()>768){
    		$('#menu .dropdown-menu').removeAttr('style');
    	}
    })




})