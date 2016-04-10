class CreateWinningCombos < ActiveRecord::Migration
  def change
    create_table :winning_combos do |t|
      #black card
      t.integer :card_id
      #white card
      t.integer :card_id

      t.timestamps null: false
    end
  end
end
