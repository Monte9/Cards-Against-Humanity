class GameUsersController < ApplicationController
  
  def create
  	@game_user = GameUser.new
  	@game_user.user_id = current_user.id
  	@game_user.game_id = params[:game_id]
  end

  def delete
  	@game_user = GameUser.where("user_id = ? AND game_id = ?", current_user.id, 
  		params[:game_id])
  	@game_user.destroy
  end

  def update
  	
  end
end
