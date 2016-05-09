#t.integer  "game_id"
#t.integer  "user_id"
#t.float    "score"
class GameUser < ActiveRecord::Base
	belongs_to :user, :class_name=>"User", :foreign_key=>"user_id"
	belongs_to :game, :class_name=>"Game", :foreign_key=>"game_id"
	has_many :rounds, through: :game
	after_create :request_game_start


	def username 
		unless self.user_id.nil?
			user = User.find_by id: self.user_id
			user.username unless user.nil?
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
end
