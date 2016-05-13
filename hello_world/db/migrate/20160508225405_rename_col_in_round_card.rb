class RenameColInRoundCard < ActiveRecord::Migration
  def change
  	rename_column :round_cards, :game_card_id, :card_id
  end
end
