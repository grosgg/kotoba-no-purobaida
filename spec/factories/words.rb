FactoryGirl.define do
  factory :word do
    english 'peach'
    french 'pêche'
    hiragana 'もも'
    katakana 'モモ'
    kanji '桃'
  end

  factory :kanji_word, class: Word do
    english 'car'
    french 'voiture'
    kanji '車'
  end

  factory :hiragana_word, class: Word do
    english 'pear'
    french 'poire'
    hiragana 'なし'
  end

  factory :katakana_word, class: Word do
    english 'coffee'
    french 'café'
    katakana 'コーヒー'
  end
end