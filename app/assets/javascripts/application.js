// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on('click', '.play-game', function() {
	$('.opponents').show();

});
$(document).on('click', '.menu-trigger', function(e) {
	e.preventDefault();
	$('.main-menu').toggle();

});



// $(document).on('click', '.menu-trigger', function() {
// 		$('.main-menu').toggle();
// 	});
// 	$(document).on('click', '.play-game', function() {
// 		e.preventDefault(); 
// 		$('.opponents').toggle();
// 	});




	// $('.menu-trigger').click(function() {
	// 	$('.main-menu').toggle();
	// });
	// $('.play-game').click(function(e) {
	// 	e.preventDefault(); 
	// 	$('.opponents').toggle();
	// });
//document.ready