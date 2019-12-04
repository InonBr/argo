# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "kill users!"
User.destroy_all
puts "finished with user killing!"

puts "create users"
user_inon = User.new(username: 'the_awesome_squirrel', email: 'inon@gmail.com', password: '123456')
user_inon.save
puts "finished createing users"

puts "Destroy all languages and words"
Word.destroy_all
Language.destroy_all
puts "finished estroying all languages and words"

german = Language.create!(name: "German", flag_url: 'https://image.flaticon.com/icons/svg/555/555613.svg')
english = Language.create!(name: "English", flag_url: 'https://image.flaticon.com/icons/svg/555/555526.svg')
italian = Language.create!(name: "Italian", flag_url: 'https://image.flaticon.com/icons/svg/555/555668.svg')

inon_learns_german = UserLanguage.new(user: user_inon, language: german, active: true)
inon_learns_german.save!
require 'json'
require 'open-uri'

File.open('./lib/assets/slangs/slang.txt').each_line do |line|
  next unless line.include?(':')

  new_words = line.split(':')
  word = Word.new(original: new_words[0], translation: new_words[1], language: english)
  word.save!

#  user_wordslist.each do |word, definition|
#  userwords.create( word: word, definition: definition )
#end

end

File.open('./lib/assets/slangs/german_slang.txt').each_line do |line|
  next unless line.include?(':')

  new_word = line.split(':')
  word = Word.create(original: new_word[0], translation: new_word[1], language: german)
  p word.original
end

puts "Creating user words for Inon where knew=true --- for quiz"
Word.all.sample(10).each do |word|
  UserWord.create(word: word, user: user_inon, knew: true)
end

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

