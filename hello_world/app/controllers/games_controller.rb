	#FOR REFRENCE: ATTRIBUTES OF THIS MODEL
	#t.integer  "dealer_id"
    #t.integer  "round_id"
    #t.datetime "created_at", null: false
    #t.datetime "updated_at", null: false
    #t.integer  "user_id"

#create_table "games", force: :cascade do |t|
    #t.integer  "dealer_id"
    #t.integer  "round_id"
    #t.datetime "created_at", null: false
    #t.datetime "updated_at", null: false
  #end
class GamesController < ApplicationController


#this create should be called with game_cards create.
#def create
	#@game = Game.new
	#@game.save
	#render :json => @game
#end

def index offsetV=0
#TODO : this can't be all the games
games = Game.last(20).select do |game| game.open? end
#@games = Game.last(10).where(open?).reverse
 #@games = Game.limit(20).offset(offsetV) 
 #render	:json => @games
 @games_players = Hash.new 
 games.each do |game|
    players = game.get_game_user_names
    @games_players["game.id"] = players
  end
 render 'index'
end


def create
  @game = Game.new(params[:user])
  	if @game.save
  		respond_to do |format|
  			format.js{render :layout => false}
  			format.html{render "application"}
  		end
  	end
end


def delete
	Game.delete(params[:id])
	#render 'index'	
end







end
