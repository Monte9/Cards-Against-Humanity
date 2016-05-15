	#game_user_id,
	#round_id,
	#round_card_id
    #In case where more than one white card is played,
    #we will make sure that the vote is always casted for only 
    #one of the cards played by the game_user. 
class Vote < ActiveRecord::Base
	belongs_to :game_user
	belongs_to :round
	belongs_to :round_card

	#after_commit :update_state

	def update_state
		GamesHelper.update_state round.game_id, current_user.id
	end
end
