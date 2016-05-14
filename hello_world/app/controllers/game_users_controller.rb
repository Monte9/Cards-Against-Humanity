  class GameUsersController < ApplicationController
  
  def create
  	game_user = GameUser.new
  	game_user.user_id = current_user.id
  	game_user.game_id = params[:game_id]
    game_user.score = 0
    game_user.save
    GameCard.assign params[:game_id], current_user.id
    @game_state = GamesHelper.generateState params[:game_id], current_user.id
    render :json => @game_state 
  end

  def delete
  	@game_user = GameUser.where("user_id = ? AND game_id = ?", current_user.id, 
  		params[:game_id])
  	@game_user.destroy
  end

  def update
  	
  end
end
