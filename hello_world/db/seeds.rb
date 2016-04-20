# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'
file = File.read('data/base_set.json')

cards = JSON.parse(file)

white_cards = cards['whiteCards']
white_cards.each{|data| 
	Card.create(text: data, is_black: false, pick_count: 0)
}

black_cards = cards['blackCards']
black_cards.each{|data| 
	Card.create(text: data["text"], is_black: true, pick_count: data["pick"])
}

