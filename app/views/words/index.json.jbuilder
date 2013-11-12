json.array!(@words) do |word|
  json.extract! word, :english, :french, :hiragana, :katakana, :kanji, :tags
  json.url word_url(word, format: :json)
end
