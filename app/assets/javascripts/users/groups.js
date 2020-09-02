// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', function() {
	// フレンドページタブメニューに関するCSS
	$('#group_tab_contents .group_show__tab[id != "group_shelves"]').hide();

	$('#group_tab_menu a').on('click', function(event) {
		$("#group_tab_contents .group_show__tab").hide();
		$("#group_tab_menu .active").removeClass("active");
		$(this).addClass("active");
		$(`#${$(this).data('target')}`).show();
		event.preventDefault();
	});
});
