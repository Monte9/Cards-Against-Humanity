class RemoveUserIdFromCards < ActiveRecord::Migration
  def up
  	remove_column :cards, :user_id
  end

  def down
  	add_column :cards, :user_id, :integer
  end
end
