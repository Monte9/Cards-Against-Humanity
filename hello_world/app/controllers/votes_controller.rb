 	#t.integer  "round_id"
    #t.integer  "round_card_id"
    #t.integer  "game_user_id"

class VotesController < ApplicationController
	def create
		ActiveRecord::Base.transaction do
	  		round = Round.find params[:round_id]
			vote = Vote.new
			vote.round_id = params[:round_id]
			vote.round_card_id = params[:round_card_id]
			vote.game_user_id = params[:game_user_id]
			vote.save	
		end
		GamesHelper.update_state params[:game_id], current_user.id
		#after this commit we have a callback to update_game_state
		#check vote.rb
		render nothing: true
	end

end
