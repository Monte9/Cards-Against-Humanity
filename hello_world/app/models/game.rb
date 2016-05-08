
 	#t.integer  "dealer_id"
    #t.integer  "round_id"
class Game < ActiveRecord::Base

	has_many :game_users
	has_many :rounds
	

	after_create :create_first_game_user, :create_round

	def self.start g_id
		round = Round.create(game_id: g_id)
		GameBlackCard.generate_deque g_id
		GameCard.generate_deque g_id
		#on the creation of round a black card is dealt using  a callback
		Round.create(game_id: g_id)
		GameCard.assign g_id
	end
	
	def setup
		
	end
	
	def open?
		return self.game_users.all.size < 6 
	end

	

	def should_end?
		self.game_users.count < 3
	end

	def create_first_game_user
		GameUser.create(:game_id => id, :user_id => current_user.id)
	end

	def get_game_user_ids
		GameUser.where game_id: self.id
	end

	def get_game_user_names
		game_users = get_game_user_ids
		game_users.collect {|gu|gu.username}
	end

	def add_game_user user_id
		GameUser.create(user_id: user_id, game_id: id)	
	end

	
end
