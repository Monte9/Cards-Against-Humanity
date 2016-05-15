 	#t.integer  "dealer_id"
    #t.integer  "round_id"
class Game < ActiveRecord::Base

	has_many :game_users
	has_many :rounds
	has_many :game_black_cards
	#this happens after a new game is created
	def setup current_user_id
		cu_id = current_user_id
		GameCard.generate_deque id
		GameBlackCard.generate_deque id
		#on the creation of round a black card is dealt using  a callback
		round = Round.create(game_id: id)

		#on the creation of a GameUser  white cards will be assigned.
		GameUser.create(game_id: id, user_id: current_user_id)
	end


	def current_round
		Round.where("game_id = ?", id).order("created_at").last
	end
	
	def open?
		return self.game_users.all.size <  HelloWorld::Application.config.MAX_PLAYERS
	end

	def player_count
		return game_users.count
	end
	
	def should_end?
		dur_after_creation = (Time.now) - self.created_at
		if(dur_after_creation > Rails.application.config.MAX_GAME_INACTIVE_DURATION)
			return false
		end 
		return self.game_users.count < HelloWorld::Application.config.PLAYER_THRESOLD
	end

	def should_start?
		self.game_users.count >= HelloWorld::Application.config.PLAYER_THRESOLD
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
