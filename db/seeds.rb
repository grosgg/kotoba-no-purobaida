# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'DEFAULT USERS'
user = User.create! :name => 'Jeremy', :email => 'marin.jeremy@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'user: ' << user.name

puts 'DEFAULT WORDS'
word = Word.create! :english => 'white', :french => 'blanc', :kanji => '白い', :tags => ['easy', 'colors']
puts 'word: ' << word.english
word = Word.create! :english => 'coffee', :french => 'café', :katakana => 'コーヒー', :tags => ['easy', 'drinks']
puts 'word: ' << word.english
word = Word.create! :english => 'beer', :french => 'bière', :katakana => 'ビール', :tags => ['easy', 'drinks']
puts 'word: ' << word.english
word = Word.create! :english => 'kitchen', :french => 'cuisine', :hiragana => 'だいどころ', :tags => ['easy', 'rooms']
puts 'word: ' << word.english
word = Word.create! :english => 'who', :french => 'qui', :hiragana => 'だれ', :tags => ['grammar']
puts 'word: ' << word.english

puts 'DEFAULT TAGS'
tag = Tag.create! :name => 'easy', :count => 4
puts 'tag: ' << tag.name
tag = Tag.create! :name => 'drinks', :count => 2
puts 'tag: ' << tag.name
tag = Tag.create! :name => 'colors', :count => 1
puts 'tag: ' << tag.name
tag = Tag.create! :name => 'rooms', :count => 1
puts 'tag: ' << tag.name
tag = Tag.create! :name => 'grammar', :count => 1
puts 'tag: ' << tag.name