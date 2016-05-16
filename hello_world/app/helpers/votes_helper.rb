module VotesHelper
	def self.has_voted game_id, round_id

		round = Game.find(game_id).current_round
		round.votes.select {|vote| 
			round.game_users.count{|user| user.user_id == vote.game_user_id} > 0
		}.map {|vote| 
			vote.game_user_id
		}
	end
end
