    #t.integer  "dealer_id"
    #t.integer  "round_id"
    require 'json'
class GamesController < ApplicationController

def index offsetV=0
  #This is currently a little hacky because 
  #we get the last 20 games and then check which ones are open.
  @games = Game.last(20).select do |game| game.open? end
  @games.reverse!
  @records = Hash.new 
  @games.each do |game|
    players = game.get_game_user_names
    @records[game.id] = players
  end
 render 'index'
end


def new 
  if current_user.nil?
    puts current_user.nil?
    redirect_to :controller => 'users', :action => 'sign_in'  
    return
  end 
  @game = Game.create
  @game.setup current_user.id
  redirect_to :action => "show", :id=> @game.id
  #gs = GamesHelper.generateState game.id, current_user.id
end

def show
  @game = Game.find params[:id]
  render 'start'
end


def delete
  Game.delete(params[:game_id])
end

end
