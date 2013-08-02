$(document).ready(function(){
	$('#show_story_edit_button').click(function(){
		$('#show_story_edit_button').addClass('hidden');
		$('#story_edit').removeClass('hidden');
	});

	$('div#gallery img').click(function(){

		if( $(this).hasClass('active') ){
			var html = $('<div/>').append($(this).clone()).html();
			var display="<div id='show_image' style='height:"+$(window).height()+"px; width:"+$(window).width()+"px; top:"+$(document).scrollTop()+"px'>";
			display += "<a href='javascript:void(0)' onclick='show_image_previous()'> Previous </a> <div id='full_screen_image'>"+html+"</div>";
			display +="<a href='javascript:void(0)' onclick='show_image_next()'> Next </a>";
			display +="<a href='javascript:void(0)' onclick='show_image_close()'> X </a> </div>";
			$('body').append(display);
			return;
		} else {
		change_active($(this));
		}
	});



	


	
});

function show_image_previous(){

		if( $('div#gallery img.active').prev().length > 0)
		var current=$('div#gallery img.active').prev();
		else
			var current=$('div#gallery').children(":last");
		current.removeClass('hidden');
		change_active(current);
		var html = $('<div/>').append(current.clone()).html();
		console.log("html: "+html);
		$('#full_screen_image').html(html);

}

function show_image_next(){

		if( $('div#gallery img.active').next().length > 0)
		var current=$('div#gallery img.active').next();
		else
			var current=$('div#gallery').children(":first");
		current.removeClass('hidden');

		change_active(current);
		var html = $('<div/>').append(current.clone()).html();
		$('#full_screen_image').html(html);

}

function change_active(current){

		current.nextAll().slice(1).each(function()
		{
			$(this).addClass('hidden');

		});

		current.nextAll().slice(0, 1).each(function()
		{
			$(this).removeClass('hidden');

		});

		current.prevAll().slice(1).each(function()
		{
			$(this).addClass('hidden');

		});
		

		current.prevAll().slice(0, 1).each(function()
		{
			$(this).removeClass('hidden');

		});

		$('div#gallery img').each(function(){
			$(this).removeClass('active');
		});

		current.addClass('active');
}

function show_image_close(){
	console.log('gasi');
		$('div#show_image').remove();
}