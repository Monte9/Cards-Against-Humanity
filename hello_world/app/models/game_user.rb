#t.integer  "game_id"
#t.integer  "user_id"
#t.float    "score"
class GameUser < ActiveRecord::Base
	belongs_to :user, :class_name=>"User", :foreign_key=>"user_id"
	belongs_to :game, :class_name=>"Game", :foreign_key=>"game_id"
	has_many :rounds, through: :game


	def username 
		unless self.user_id.nil?
			user = User.find_by id: self.user_id
			user.username unless user.nil?
		end
	end
end
