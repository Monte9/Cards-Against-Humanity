class ChatController < ApplicationController
  
skip_before_filter  :verify_authenticity_token

  def message

	gameId = params[:gameID]
  	
  	message = params[:message]
  	user = current_user.email
  	timestamp = Time.now().to_s(:time)

  	game = "game_#{gameId}"
  	
  	Pusher.trigger( game, 'message_sent', {
      message: message,
      user: user,
      timestamp: timestamp
    })
  end
end
