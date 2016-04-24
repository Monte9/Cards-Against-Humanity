class Round < ActiveRecord::Base
	belongs_to :game
	has_many :cards
	has_many :votes
	has_many :game_users
end
