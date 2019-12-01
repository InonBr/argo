# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

File.open('./slang.txt').each_line do |line|
  next unless line.include?(':')

  new_word = line.split(':')
  p new_word
end

abc = ['A', 'B', 'C']

words = []

abc.each do |letter|
  url = "https://www.urbandictionary.com/popular.php?character=#{abc}"
end

word = ['yolo','up in the air', 'crunch time']
#category = ['']
#url = "https://www.urbandictionary.com/category.php?category=#{category}"

# word.each do |w|
# url = "http://api.urbandictionary.com/v0/define?term=#{word}"
# # puts url
# user_serialized = open(url).read
# # puts 'user serialized'
# # puts user_serialized
# user = JSON.parse(user_serialized)

#  user['list'].map do |s|
#  [s['definition'],s['word'] ]
#  Word.create()
# end


# puts 'user'
# puts user
# puts user['list'][0]["definition"]
#puts "#{user['name']} - #{user['bio']}"
# end

