class CreateGameBlackCards < ActiveRecord::Migration
  def change
    create_table :game_black_cards do |t|
    	t.integer :game_id
    	t.integer :card_id
    	t.integer :round_id
    end
  end
end
