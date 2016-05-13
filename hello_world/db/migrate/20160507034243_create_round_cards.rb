class CreateRoundCards < ActiveRecord::Migration
  def change
    create_table :round_cards do |t|
      t.string :game_card_id
      t.string :game_user_id
      t.string :round_id
      t.timestamps null: false
    end
  end
end
