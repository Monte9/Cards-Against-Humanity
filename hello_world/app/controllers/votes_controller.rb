 	#t.integer  "round_id"
    #t.integer  "round_card_id"
    #t.integer  "game_user_id"

class VotesController < ApplicationController
	def create
		@vote = Vote.new
		@vote.round_id = params[:round_id]
		@vote.round_card_id = params[:round_card_id]
		@vote.game_user_id = current_user.id
		#redirect_to resolve_round
		gs = GamesHelper.generateState params[:game_id], current_user.id
  		render :json => gs
	end

end
