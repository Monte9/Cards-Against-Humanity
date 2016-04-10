class GameCard < ActiveRecord::Base
	belongs_to :games
	has_many :cards
end
