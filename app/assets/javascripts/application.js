// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
// ユーザー編集機能のプレビュー機能
$(function(){
	$('#mypage-image').on('change', function(e) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$(".mypage-img").attr('src', e.target.result);
		}
		reader.readAsDataURL(e.target.files[0]);
	});
});

$(function(){
	$('#profile-image').on('change', function(e) {
		var reader = new FileReader();
		reader.onload = function (e) {
		$(".profile-img").attr('src', e.target.result);
		}
		reader.readAsDataURL(e.target.files[0]);
	});
});
// 棚新規画像のプレビュー
$(function(){
	$('#new-shelf-image').on('change', function(e) {
		var reader = new FileReader();
		reader.onload = function (e) {
		$(".new-shelf-img").attr('src', e.target.result);
		}
		reader.readAsDataURL(e.target.files[0]);
	});
});
// 棚編集画像のプレビュー
$(function(){
	$('#edit-shelf-image').on('change', function(e) {
		var reader = new FileReader();
		reader.onload = function (e) {
		$(".edit-shelf-img").attr('src', e.target.result);
		}
		reader.readAsDataURL(e.target.files[0]);
	});
});
// グループ新規作成画面のプレビュー
$(function(){
	$('#new-group-image').on('change', function(e) {
		var reader = new FileReader();
		reader.onload = function (e) {
		$(".new-group-img").attr('src', e.target.result);
		}
		reader.readAsDataURL(e.target.files[0]);
	});
});