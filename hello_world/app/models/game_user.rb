#t.integer  "game_id"
#t.integer  "user_id"
#t.float    "score"
#t.datetime "created_at", null: false
#t.datetime "updated_at", null: false
class GameUser < ActiveRecord::Base

def join
	@game_user = GameUser.new(game_user_params)
	@game_user.user_id = current_user.id 
	@gmae_user.score = 0
	@game.save
	
	render :json => @game_users.all
end

private
	def game_user_params
		params.require(:game_user).permit(:game_id)
	end



end
