// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
	$('#production-search').on('click', function() {
		var genre = document.getElementById("genre").value
		var title = document.getElementById("production_title").value
		var key = "98babf597b331814d96f11cc150609dd"
		$.ajax({
			url: "https://api.themoviedb.org/3/search/" + genre + "?api_key=" + key +"&language=ja-JA&query=" + title + "&page=1&include_adult=false",
			dataType : 'jsonp',
		}).done(function (data){
			// 通信成功
			var results = data.results
			$.each(results, function(property, value) {
				$('#poster_img').attr("src","https://image.tmdb.org/t/p/w154" + data.results[0].poster_path);
				$('#title').text(data.results[0].title);
				$('#release_date').text(data.results[0].release_date);
			});
		}).fail(function(data){
			// 通信失敗
			alert('通信に失敗しました。');
		});
	});
});