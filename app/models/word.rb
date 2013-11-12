class Word
  include Mongoid::Document
  field :english, type: String
  field :french, type: String
  field :hiragana, type: String
  field :katakana, type: String
  field :kanji, type: String
  field :tags, type: String
end
