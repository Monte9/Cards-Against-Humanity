	#t.integer  "game_user_id"
    #t.integer  "game_card_id"
    #t.integer  "round_id"
    #t.datetime "created_at", null: false
    #t.datetime "updated_at", null: false

class Vote < ActiveRecord::Base
	after_create :all_votes_in?
	
	belongs_to :game_user
	belongs_to :round
	belongs_to :game_card

	

	private 
		def all_votes_in?
			self.round.vote_count == self.round.player_count
		end



end
