class Word
  include Mongoid::Document
  field :english, type: String
  field :french, type: String
  field :hiragana, type: String
  field :katakana, type: String
  field :kanji, type: String
  field :tags, type: Array, default: []

  def tags_list=(arg)
    self.tags = arg.split(',').map { |v| v.strip }
  end

  def tags_list
    self.tags.join(', ')
  end
end
