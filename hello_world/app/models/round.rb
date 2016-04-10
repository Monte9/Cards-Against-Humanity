class Round < ActiveRecord::Base
	belongs_to :games
	has_many :cards
	has_many :users
end
