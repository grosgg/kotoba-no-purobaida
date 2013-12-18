class Word
  include Mongoid::Document  
  include Mongoid::Search

  field :english, type: String
  field :french, type: String
  field :hiragana, type: String
  field :katakana, type: String
  field :kanji, type: String
  field :tags, type: Array, default: []
  belongs_to :user

  validates_presence_of :english
  validates :hiragana, format: { with: /\p{Hiragana}/, message: 'Only!' }, allow_blank: true
  validates :katakana, format: { with: /\p{Katakana}/, message: 'Only!' }, allow_blank: true

  paginates_per 10
  search_in :english, :french

  scope :with_english, where(
    :english.ne => '', :english.exists => true
  )
  scope :with_french, where(
    :french.ne => '', :french.exists => true
  )
  scope :with_kanji, where(
    :kanji.ne => '', :kanji.exists => true
  )
  scope :with_hiragana, where(
    :hiragana.ne => '', :hiragana.exists => true
  )
  scope :with_katakana, where(
    :katakana.ne => '', :katakana.exists => true
  )
  scope :without_kanji, any_of(
    {:kanji.exists => false},
    {:kanji => ''}
  )

  def tags_list=(arg)
    self.tags = arg.split(',').map { |v| v.strip }
  end

  def tags_list
    self.tags.join(', ')
  end
end
