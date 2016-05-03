#t.integer  "game_id"
#t.integer  "user_id"
#t.float    "score"
class GameUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
end
