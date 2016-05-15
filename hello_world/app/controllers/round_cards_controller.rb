#t.string   "card_id"
#t.string   "game_user_id"
#t.string   "round_id"
class RoundCardsController < ApplicationController
	
	def create 
		ActiveRecord::Base.transaction do 
			r_card = RoundCard.new
			game_card = GameCard.find params[:game_card_id]
			r_card.card_id = game_card.card_id
			r_card.game_user_id = params[:game_user_id]
			r_card.round_id = params[:round_id]
      		r_card.save
			game_card.destroy
		end

	    GamesHelper.update_state params[:game_id], current_user.id

		render nothing: true
		
	end

end
