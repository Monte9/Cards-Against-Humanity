def StateGenerator
	
	def  initialize
		
	end
	
	def generate game_id
		game = Game.find game_id
		puts game
	end
end

