class Game < ActiveRecord::Base

	has_many :game_users
	has_many :rounds
	

	before_create :create_first_game_user
	

	def open?
		return self.game_users.all.size < 6 
	end

	def num_game_users
		self.game_users.all.size
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

	scope :open_games, lambda { where(num_game_users < 6)}
end
