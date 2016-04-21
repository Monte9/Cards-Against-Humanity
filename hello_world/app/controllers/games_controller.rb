class GamesController < ApplicationController
def create
	@game = Game.new
	@game.user_id = params[:id]
	@game.save
	render :json => @game
end


def join
	@game = Game.find(params[:game_id])
	@game.user_id = params[:id]
	@game.save
	@games = Game.all
	render :json => @games
end


def index
	#TODO : this can't be all the games 

	
	
	
 @games = Game.all 
 render	:json => @games
end



end
