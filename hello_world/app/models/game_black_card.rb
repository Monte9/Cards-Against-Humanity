	#t.integer "game_id"
    #t.integer "card_id"
    #t.integer "round_id" 

class GameBlackCard < ActiveRecord::Base
	belongs_to :card
	belongs_to :round

	def self.generate_deque g_id 
		cards = Card.where("is_black=?", true)
		ActiveRecord::Base.transaction do
  			cards.each { |card|
  				GameBlackCard.create(game_id: g_id, card_id: card.id,round_id: -1)
  			}
		end
	end



	def self.assign_to_round game_id, rnd_id
		round = Round.find rnd_id
		black_cards  = GameBlackCard.where("game_id = ? AND round_id = ?", game_id, -1)
		blk_card = nil
		if round.game_users[1].nil?
			blk_card = GameBlackCard.take
		else 
			black_cards.find_each do |black_card|
				if black_card.card.pick_count < round.num_cards_left
					blk_card = black_card
					break
				end
			end
		end 
		blk_card.update(round_id: rnd_id+1)
		blk_card.save
	end

end
