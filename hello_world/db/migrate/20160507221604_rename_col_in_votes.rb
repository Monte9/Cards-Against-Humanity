class RenameColInVotes < ActiveRecord::Migration
  def change
  	rename_column :votes, :game_card_id, :round_card_id
  end
end
