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
 @games = Game.limit(20).offset(offsetV) 
 #render	:json => @games
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
