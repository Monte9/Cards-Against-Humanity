   	#t.integer  "game_id"
    #t.integer  "game_card_id" --Black card.
class Round < ActiveRecord::Base

	belongs_to :game
	has_many :round_cards
	has_many :votes
	has_many :game_users, through: :game

	after_create :request_black_card

	def all_votes_in?
		votes.count == game_users.count
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

	def request_black_card
		game_card_id = GameCard.where("")
	end

end
