class WinningCombo < ActiveRecord::Base
	 has_one :card, :foreign_key => "black_card_id", 
      :class_name => "Card"

   has_one :card, :foreign_key => "white_card_id", :class_name => "Card"
end
