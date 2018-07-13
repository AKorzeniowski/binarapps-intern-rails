$(document).ready( (function() {
	$('.new_author')
	.on('ajax:send', function() {
		$('.loader').show();
	})
	.on('ajax:complete', function () {
		$('.loader').hide()
	})

}));