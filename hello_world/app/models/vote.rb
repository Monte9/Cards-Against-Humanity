	#t.integer  "game_user_id"
    #t.integer  "game_card_id"
    #t.integer  "round_id"
    #t.datetime "created_at", null: false
    #t.datetime "updated_at", null: false

class Vote < ActiveRecord::Base
	belongs_to :game_users
	belongs_to :round
	belongs_to :game_card
end
