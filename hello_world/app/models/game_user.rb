#t.integer  "game_id"
#t.integer  "user_id"
#t.float    "score"
class GameUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	has_many :rounds, through: :game

	def username 
		unless self.user_id.nil?
			user.username
		end
	end
	
	def add_to_score amt
		self.update(score: score+=amt)
	end

	def request_game_start
		num_game_user = GameUser.where("game_id = ?", game_id).count
		if num_game_user >= Rails.application.config.PLAYER_THRESOLD
			game.start g_id
		end
	end

	def hand 
		game_cards = GameCard.where("game_user_id = ?", id)
		cards_h = Hash.new
		game_cards.each { |g_card|
			cards_h['id'] = [g_card.card.text]
		}
	end
end
