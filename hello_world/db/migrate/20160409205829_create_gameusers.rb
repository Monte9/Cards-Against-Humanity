class CreateGameusers < ActiveRecord::Migration
  def change
    create_table :gameusers do |t|
      t.integer :game_id
      t.integer :user_id
      t.float :score

      t.timestamps null: false
    end
  end
end
