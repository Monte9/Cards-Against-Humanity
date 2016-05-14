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
  				puts 'generating_deque'
  					GameCard.create(card_id: card.id, game_id: game_id, game_user_id: -1)	
  			}
		end
	end

	def self.assign game_id, player_id 
		ActiveRecord::Base.transaction do
  			game_cards = GameCard.limit(10).where("game_user_id =? AND game_id = ?", -1, game_id)
			game_cards.each { |card|
				card.update(game_user_id: player_id)
			}	
		end
	end

	

end

