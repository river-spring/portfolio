// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', function() {
	// フレンドページタブメニューに関するCSS
	$('#friend_tab_contents .friend__tab[id != "frinds_list"]').hide();

	$('#friend__tab_menu a').on('click', function(event) {
		$("#friend_tab_contents .friend__tab").hide();
		$("#friend__tab_menu .active").removeClass("active");
		$(this).addClass("active");
		$(`#${$(this).data('target')}`).show();
		event.preventDefault();
	});
	$(function(){
		$('.friend_btn').hover(function(){
			$('this').text('取消');
			$('this').css({'background-color': '#d9534f'});
		});
	});
});

