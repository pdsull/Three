/* Run the Nice Custom Cufon Fonts */
Cufon.replace('#dropmenu', { hover: true, fontFamily: 'Museo' });
Cufon.replace('#heading h1', { textShadow: '1px 1px #513981', fontFamily: 'PT Sans' });
Cufon.replace('.homepage-longbox h3', { fontFamily: 'PT Sans' });
Cufon.replace('.homepage-icons h3', { fontFamily: 'Museo' });
Cufon.replace('.homepage-icons h4', { hover: true, fontFamily: 'Museo' });
Cufon.replace('.homepage-carouselbox h3', { fontFamily: 'PT Sans' });
Cufon.replace('.quote-bar .quoteleft', { fontFamily: 'Museo' });
Cufon.replace('.quote-bar .quoteright', { hover: true, fontFamily: 'PT Sans' });
Cufon.replace('#slideshownav', { textShadow: '1px 1px #432e6d', hover: true, fontFamily: 'PT Sans' });
Cufon.replace('.main h1, .main h2, .main h3, #sidebar h1, #sidebar h2, #sidebar h3', { hover: true, fontFamily: 'PT Sans' });
Cufon.replace('#footer-link-columns h3', { textShadow: '1px 1px #432e6d', hover: true, fontFamily: 'PT Sans' });
Cufon.replace('.page-subtitle', { hover: true, fontFamily: 'Museo' });
Cufon.replace('.price, .thead', { fontFamily: 'Museo' });
Cufon.replace('.accordion .accToggler', {  hover: true, fontFamily: 'Museo' });
Cufon.replace('.homepage-carouselbox .viewmore', {  hover: true, fontFamily: 'Museo' });
Cufon.replace('.fadebox h2', {  hover: true, fontFamily: 'PT Sans' });
Cufon.replace('ul.imagelist-half .text h4', {  hover: true, fontFamily: 'Museo' });
Cufon.replace('ul.imagelist li h4', {  hover: true, fontFamily: 'Museo' });
Cufon.replace('.btn-home-more, .btn-home-check, a.btn-small-blue, a.btn-small-grey, a.btn-big-blue, a.btn-big-lila, .form-button-right', {  hover: true, fontFamily: 'Museo' });

/* Start Home Carousel, Portfolio Image Hover Effect, Pretty Photo, Text Overflow */
jQuery(document).ready(function() {
  /* the carousel */
  $('#portfolio-carousel').infiniteCarousel();
  /* portfolio image effect */
  $("img.a").hover(
  function() {  $(this).stop().animate({"opacity": "0.4"}, "slow");  },
  function() {  $(this).stop().animate({"opacity": "1"}, "slow");  });
  $("img.pthumb").hover(
  function() {  $(this).stop().animate({"opacity": "0.4"}, "slow");  },
  function() {  $(this).stop().animate({"opacity": "1"}, "slow");  });
  /* pretty photo responds on rel='prettyPhoto' */
  $("a[rel^='prettyPhoto']").prettyPhoto();
  /* truncate some text make it look nice*/
  $('.portfolio-item .text h4 a').textOverflow({"lines":1, "ellipsis":"...",  "titleAttr":true});
  $('.portfolio-item .text p').textOverflow({"lines":2, "ellipsis":"...", "titleAttr":true});
  $('.portfolio-carousel-item .text h4').textOverflow({"lines":1, "ellipsis":"..."});
  $('.portfolio-carousel-item .text p').textOverflow({"lines":2, "ellipsis":"..."});
});


/* Start Main Homepage Slideshot with Fade Effect, textnav, and control arrows */
jQuery(document).ready(function() {
     $('#slideshow').cycle({
    	        fx:     'fade',
    	        speed:  500,
    	        timeout: 6000,
    	        pager:  '#slideshownav',
                next:   '#slideshownext',
                prev:   '#slideshowprev',
                cleartype:1,
                cleartypeNoBg:1,
    	        pagerAnchorBuilder: function(idx, slide) {
    	            // return sel string for existing anchor
    	            return '#slideshownav li:eq(' + (idx) + ') a';
    	        }
        });
      $('li a').click(function() {   $('#slideshow').cycle('pause');   $('#button_pause').fadeOut(300); $('#button_play').fadeIn(200);   });
      $('.slide').click(function() {   $('#slideshow').cycle('pause'); 	$('#button_pause').fadeOut(300); $('#button_play').fadeIn(200);    });
	  $('#pauseButton').click(function() {  $('#slideshow').cycle('pause'); $('#button_pause').fadeOut(300); $('#button_play').fadeIn(200);  });
	  $('#resumeButton').click(function() {  $('#slideshow').cycle('resume'); $('#button_pause').fadeIn(200); $('#button_play').fadeOut(200);  });
});


/* Start Main Menu */
jQuery(document).ready(function() {
jQuery("#dropmenu ul").css({display: "none"}); // Opera Fix
jQuery("#dropmenu li").hover(function(){
        jQuery(this).find('ul:first').css({visibility: "visible",display: "none"}).fadeIn(168);
        },function(){
        jQuery(this).find('ul:first').css({visibility: "hidden"});
        });
});

/* Start FAQ Accordion */
jQuery(document).ready(function() {
    $('.accordion .accContent').hide().end()
		   .find('.accToggler').click(function() {
	         this.className = this.className == 'accToggler' ? 'accTogglerOpen' : 'accToggler';
	         $(this).next().slideToggle();
	       });

			$('.accordion').find('.accToggler:first').removeClass("accTogglerOpen").addClass("accToggler");

	       $('.accordion p.close').click(function() {
	         $(this).parent().slideUp()
	         .prev().removeClass('accTogglerOpen').addClass('accToggler');
	  });
});

/* rollovers on images named with _off and _on */
jQuery(document).ready(function() {
		// Preload all rollovers
		$("#heading img").each(function() {
			// Set the original src
			rollsrc = $(this).attr("src");
			rollON = rollsrc.replace('_off', '_on');
			newImg = new Image(); // create new image obj
			$(newImg).attr("src", rollON); // set new obj's src
		});
		// Navigation rollovers
		$("#heading a").mouseover(function(){
			imgsrc = $(this).children("img").attr("src");

			if (typeof(imgsrc) != 'undefined') {
			imgsrcON = imgsrc.replace('_off', '_on');
			$(this).children("img").attr("src", imgsrcON);
			}
		});
		// Handle mouseout
		$("#heading a").mouseout(function(){
			if (typeof(imgsrc) != 'undefined') {
			$(this).children("img").attr("src", imgsrc);
			}
		});

});

/* external links target blank */
jQuery(document).ready(function() {
	    $('a[rel*=external]').click( function() {
	        window.open(this.href);
	        return false;
	    });
});


function hide(id){
    if (document.getElementById){
    obj = document.getElementById(id);
    obj.style.display = "none";
    }
    }

function show(id){
    if (document.getElementById){
    obj = document.getElementById(id);
    obj.style.display = "";
    }
    }
