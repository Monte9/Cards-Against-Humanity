class Game < ActiveRecord::Base
	has_many :gameusers
	has_many :rounds
end
