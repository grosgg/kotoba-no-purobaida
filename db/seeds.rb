# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rails.logger.info 'DEFAULT USERS'
jeremy = User.create! :name => 'Jeremy', :email => 'marin.jeremy@gmail.com', :password => 'password', :password_confirmation => 'password'
Rails.logger.info 'user: ' << jeremy.name
sabu = User.create! :name => 'Sabu', :email => 'sabu@sabu.fr', :password => 'password', :password_confirmation => 'password'
Rails.logger.info 'user: ' << sabu.name

Rails.logger.info 'DEFAULT WORDS'
word = Word.create! :english => 'white', :french => 'blanc', :kanji => '白い', :tags => ['easy', 'colors'], :user => jeremy
Rails.logger.info 'word: ' << word.english
word = Word.create! :english => 'coffee', :french => 'café', :katakana => 'コーヒー', :tags => ['easy', 'drinks'], :user => jeremy
Rails.logger.info 'word: ' << word.english
word = Word.create! :english => 'beer', :french => 'bière', :katakana => 'ビール', :tags => ['easy', 'drinks'], :user => jeremy
Rails.logger.info 'word: ' << word.english
word = Word.create! :english => 'kitchen', :french => 'cuisine', :hiragana => 'だいどころ', :tags => ['easy', 'rooms'], :user => jeremy
Rails.logger.info 'word: ' << word.english
word = Word.create! :english => 'who', :french => 'qui', :hiragana => 'だれ', :tags => ['grammar'], :user => jeremy
Rails.logger.info 'word: ' << word.english
word = Word.create! :english => 'apple', :french => 'pomme', :kanji => '林檎', :tags => ['easy', 'fruits'], :user => sabu
Rails.logger.info 'word: ' << word.english

Rails.logger.info 'DEFAULT TAGS'
tag = Tag.create! :name => 'easy', :count => 4, :user => jeremy
Rails.logger.info 'tag: ' << tag.name
tag = Tag.create! :name => 'drinks', :count => 2, :user => jeremy
Rails.logger.info 'tag: ' << tag.name
tag = Tag.create! :name => 'colors', :count => 1, :user => jeremy
Rails.logger.info 'tag: ' << tag.name
tag = Tag.create! :name => 'rooms', :count => 1, :user => jeremy
Rails.logger.info 'tag: ' << tag.name
tag = Tag.create! :name => 'grammar', :count => 1, :user => jeremy
Rails.logger.info 'tag: ' << tag.name
tag = Tag.create! :name => 'easy', :count => 1, :user => sabu
Rails.logger.info 'tag: ' << tag.name
tag = Tag.create! :name => 'fruits', :count => 1, :user => sabu
Rails.logger.info 'tag: ' << tag.name