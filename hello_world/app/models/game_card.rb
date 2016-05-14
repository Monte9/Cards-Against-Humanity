    #GameCard is what the users have
    #t.integer  "game_id"
    #t.integer  "game_user_id
    #t.integer  "card_id"
class GameCard < ActiveRecord::Base
	belongs_to :game 
	belongs_to :round 
	belongs_to :card

	def self.generate_deque game_id
		cards = Card.where("is_black=?", false)
		ActiveRecord::Base.transaction do
  			cards.each { |card|
  					GameCard.create(card_id: card.id, game_id: game_id, game_user_id: -1)	
  			}
		end
	end

	def self.assign game_id, player_id 
		ActiveRecord::Base.transaction do
  			game_card = GameCard.limit(1).
  						where("game_user_id =? AND game_id = ?", -1, game_id)
			raise RuntimeError if ( game_card.nil? || game_card.empty?) 
			game_card.game_user_id = player_id
			game_card.save
		end
		
	end

	

end

