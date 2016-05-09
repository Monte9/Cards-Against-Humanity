   	#t.integer  "game_id"
    #t.integer  "game_card_id" --Black card.
class Round < ActiveRecord::Base

	belongs_to :game
	has_one :game_black_card
	has_many :round_cards
	has_many :votes
	has_many :game_users, through: :game

	after_create :request_black_card
	before_destroy :update_score

	def all_votes_in?
		votes.count == game_users.count
	end



	def all_cards_in?
		pick_count  = game_black_card.pick_count
		num_players = game_users.count
		card_count = round_cards.count
		return num_players*pick_count == card_count
	end



	
	def get_winner
		tally = Hash.new
		round_cards.each {|card|
			tally[card.game_card_id]  = 0
		}
		puts tally
		votes = Vote.where("round_id = ?", id)
		votes.each{ |vote|
			tally[vote.game_card_id.to_s] +=1 
			puts vote.game_card_id			
		}
		puts tally

		result = tally.max_by{|k,v| v}
		puts result	
		@winner_game_user ||= (round_cards.find_by_game_card_id result[0].to_i).game_user_id
		puts @winnner_game_user
		@votes ||=  result[1]
	end




	def update_score
		@winner_game_user.add_to_score 10
	end

	

	def request_black_card
		black_cards  = GameBlackCard.where("game_id = ? AND round_id = ?", game_id, -1)
		black_cards.each do |black_card|
			if black_card.card.pick_count < num_cards_left
				blk_card = black_card
				break
			end
		end
		black_card.update(round_id: id)
	end

	def num_cards_left
		gu_id = game_users[0].id
		GameCard.where("game_id = ? AND game_user_id = ?", game_id,gu_id ).count
	end

end
