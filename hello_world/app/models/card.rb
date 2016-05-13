class Card < ActiveRecord::Base
	has_many :game_cards
	has_many :game_black_cards
	has_many :round_cards
end