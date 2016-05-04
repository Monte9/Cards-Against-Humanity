class AddColumnPickCountToCard < ActiveRecord::Migration
  def up
  	add_column :cards, :pick_count, :integer
  end
  
  def down
  	remove_column :cards, :pick_count
  end


end
