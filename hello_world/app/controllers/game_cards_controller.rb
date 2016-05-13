 #t.integer  "game_id"
    #t.integer  "card_id"
    #t.datetime "created_at",   null: false
    #t.datetime "updated_at",   null: false
    #t.integer  "game_user_id"



class GameCardsController < ApplicationController
	#arg: GameID and list of the cards to be played
	#add played game_cards to round cards
	#remove played cards from game_cards
	def play 
		game_user = GameUser.find params[:game_user_id]
		cards = params[:cards]
		round = Round.where("game_id=?",game_user.game.id).order("created_at").last
		ActiveRecord::Base.transaction do
  			cards.each {|gcard_id|
  				rc = RoundCard.new
  				rc.round_id =  round.id, 
  				card_id =  GameCard.find gcard_id.card_id
  				rc.game_user_id = game_user.id
  				rc.save
  				GameCard.where(:id => cards).destroy_all
  			}
		end
	end
	
end
