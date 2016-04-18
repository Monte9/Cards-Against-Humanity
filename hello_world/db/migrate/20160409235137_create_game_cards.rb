class CreateGameCards < ActiveRecord::Migration
  def change
    create_table :game_cards do |t|
      t.integer :game_id
      t.integer :card_id

      t.timestamps null: false
    end
  end
end
