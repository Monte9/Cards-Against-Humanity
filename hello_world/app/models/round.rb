    #t.integer  "game_id"
    #t.integer  "card_id" --its the black card id
    #t.datetime "created_at", null: false
    #t.datetime "updated_at", null: false
class Round < ActiveRecord::Base
	belongs_to :game
	has_many :cards
	has_many :votes
	has_many :game_users, through: :game

	def all_votes_in?
		votes.count == game_users.count
	end
end
