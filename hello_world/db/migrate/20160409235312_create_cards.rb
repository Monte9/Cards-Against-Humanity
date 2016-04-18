class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :text
      t.boolean :is_black
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
