class ChangeCardIdToGameCardIdInRounds < ActiveRecord::Migration
  def change
  	rename_column :rounds, :card_id, :game_card_id 
  end

end
