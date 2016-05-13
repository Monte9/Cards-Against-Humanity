   	#t.integer  "game_id"
    #t.integer  "game_card_id" --Black card.
class Round < ActiveRecord::Base

	belongs_to :game
	has_many :game_black_cards
	has_many :round_cards
	has_many :votes
	has_many :game_users, through: :game

	after_commit :request_black_cards
	before_destroy :update_score

	def request_black_cards
		GameBlackCard.assign_to_round game.id, id
	end



	def get_vote_tally 
		tally = Hash.new 
   		round_cards.find_each do |card|
   			tally[card.id] = card.votes.count
   		end
   		return tally 
   	end


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
		tally = get_vote_tally
		result = tally.max_by{|k,v| v}
		@winner_card = RoundCard.find result[0] unless result.nil?
		@round_winner ||= GameUser.find @winner_card.game_user_id unless result.nil?

	end




	def update_score
		@winner_game_user.add_to_score 10
	end

	


	def num_cards_left
		gu_id = game_users[0].id
		GameCard.where("game_id = ? AND game_user_id = ?", game_id,gu_id ).count
	end

end
