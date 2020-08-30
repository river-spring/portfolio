// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
// フレンドページタブメニューに関するCSS

$(document).on('turbolinks:load', function() {
	$('#friend_tab_contents .friend__tab[id != "frinds_list"]').hide();

	$('#friend__tab_menu a').on('click', function(event) {
		$("#friend_tab_contents .friend__tab").hide();
		$("#friend__tab_menu .active").removeClass("active");
		$(this).addClass("active");
		//console.log(`#${$(this).data('target')}`)
		$(`#${$(this).data('target')}`).show();
		event.preventDefault();
	});
});
