class Card < ActiveRecord::Base
	has_and_belongs_to_many :winning_combos, class_name: "Card",
												join_table: "Winning_combos",
												association_foreign_key: ""
end



class Word < ActiveRecord::Base 
  has_and_belongs_to_many :synonyms, class_name: "Word", 
                                     join_table: "word_synonyms",
                                     association_foreign_key: "synonym_id"
end
