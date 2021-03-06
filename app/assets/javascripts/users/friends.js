// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', function() {
	// フレンドページタブメニューに関するアクション
	$('#friend_tab_contents .friend__tab[id != "friends_list"]').hide();

	$('#friend__tab_menu a').on('click', function(event) {
		$("#friend_tab_contents .friend__tab").hide();
		$("#friend__tab_menu .active").removeClass("active");
		$(this).addClass("active");
		$(`#${$(this).data('target')}`).show();
		event.preventDefault();
	});
	// フレンド取消ボタンに関するアクション
	$(function(){
		$('.friend_btn').mouseover(function(){
			$(this).text('取り消し');
			$(this).css({'background-color': '#d9534f','border-color': '#d9534f', 'transition': '.3s'});
		});
		$('.friend_btn').mouseout(function(){
			$(this).text('フレンド');
			$(this).css({'background-color': '#5bc0db','border-color': '#5bc0db', 'transition': '.3s'});
		});
	});
});

