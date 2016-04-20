# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'
file = File.read('/Users/user/Cards-Against-Humanity/hello_world/data/base_set.json')

cards = JSON.parse(file)
black_cards = cards['blackCards']
puts black_cards[1].class
white_cards = cards['whiteCards']
puts white_cards[1].class