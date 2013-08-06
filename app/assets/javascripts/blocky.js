$.getScript('http://www.portalapp.com/bootstrap/js/bootstrap-carousel.js',function(){
	$('.carousel').carousel();
});

$('#myCarousel').on('slid',function(){
  $('.blocky').animate({marginLeft:"+=16%"},100).animate({marginLeft:"-=20%"},300).animate({marginLeft:"+=4%"},600);
})