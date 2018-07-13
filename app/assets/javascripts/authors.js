$(document).ready( (function() {
	$('h1').css('color', 'red');

	$('.new_author')
	.on('ajax:send', function() {
		$('.new_author').append('<img class="loader" src="https://loading.io/spinners/rolling/lg.curve-bars-loading-indicator.gif">');
	})
	.on('ajax:complete', function () {
		$('.loader').remove();
	})

}));