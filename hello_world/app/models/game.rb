class Game < ActiveRecord::Base
	has_many :game_users
	has_many :rounds
end
