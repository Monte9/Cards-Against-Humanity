	#t.string   "card_id"  card/cards game_user have played for a particlular round
	#t.string   "game_user_id"
	#t.string   "round_id"
	#game card becomes a round card once a user plays that card. 
class RoundCard < ActiveRecord::Base
	belongs_to :card 
	belongs_to :round
	belongs_to :game_user
	has_many :votes
end	
