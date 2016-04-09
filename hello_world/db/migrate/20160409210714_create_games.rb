class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :dealer_id
      t.integer :round_id

      t.timestamps null: false
    end
  end
end
