    #GameCard is what the users have
    #t.integer  "game_id"
    #t.integer  "game_user_id
    #t.integer  "card_id"
class GameCard < ActiveRecord::Base
	belongs_to :game 
	belongs_to :round 
	belongs_to :round_card
	belongs_to :card
	has_one :vote

	def self.generate_deque g_id
		cards = Card.all
		ActiveRecord::Base.transaction do
  			cards.each { |card|
  				GameCard.create(card_id: card.id, game_id: g_id, game_user_id: -1)
  			}
		end
	end

	def self.assign gu_id, game_id, 
		game_card = GameCard.limit(1).where("game_user_id =? AND game_id = ?", -1, game_id)
		raise error if game_card.nil?
		game_card.game_user_id = gu_id
		game_card.save
	end

end

