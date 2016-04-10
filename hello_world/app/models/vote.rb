class Vote < ActiveRecord::Base
	has_many :users
	has_many :cards
	has_many :rounds
end
