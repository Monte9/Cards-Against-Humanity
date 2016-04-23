class CreateWinningCombos < ActiveRecord::Migration
  def change
    create_table :winning_combos do |t|
      #black card
      t.integer :black_card_id
      #white card
      t.integer :white_card_id
      t.timestamps null: false
    end
  end
end
