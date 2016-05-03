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
      	$('#chat').append('<span class="user">' + data.user + ' @ </span><span class="timestamp"> ' + data.timestamp + ' </span> <br /><span class="message" style="color:red; float: right">' + data.message + '</span><br />')
    });



    var count=30;

	var counter=setInterval(timer, 1000); //1000 will  run it every 1 second

	function timer() {
	  count=count-1;
	  if (count <= 0) {
	     clearInterval(counter);
	     return;
	  }
	  $('#timer').html('00:' + count);
	}
	timer();

});


