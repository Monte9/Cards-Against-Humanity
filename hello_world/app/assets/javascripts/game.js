$(document).ready(function() {
	console.log('Loaded DOM');
	$('#sendChat').click(function() {
		var value = $('#chatbox').val();
		if( !value) {
			console.log("You f'ed up");
		} else {
			console.log(value);

			var URI = '/chat/message';
			var payload = {message: value, gameID: '1'};

			$.post(URI, payload, function() {
				$('#chatbox').val("");
				console.log("Made post request");
			});
		}
	});

    var pusher = new Pusher('0453f37d99fca4cb4e22', {
      encrypted: true
    });

    var channel = pusher.subscribe('game_1');
    channel.bind('message_sent', function(data) {
      	$('#chat').append('<span class="user">' + data.user + '&nbsp;&nbsp;&nbsp;&nbsp;</span> <span class="message" style="color:red;">' + data.message + '</span><span class="timestamp" style="float: right;"> ' + data.timestamp + ' </span><br />')
    });
});


