class Question
  include Mongoid::Document
  
  field :label,          type: String
  field :original_word,  type: String
  field :wrong_answers,  type: Array
  field :correct_answer, type: String

  embedded_in :quiz

  def self.create_random(quiz)
    schema = self.question_schemas.sample
    label = "#{schema[:from]} -> #{schema[:to]}"

    correct_word = Word.send("with_#{schema[:from]}").send("with_#{schema[:to]}").sample
    wrong_words = Word.ne(id: correct_word.id).send("with_#{schema[:to]}").sample(3)

    self.create(
      label: label,
      original_word: correct_word.send("#{schema[:from]}"),
      wrong_answers: wrong_words.map { |ww| ww.send("#{schema[:to]}") },
      correct_answer: correct_word.send("#{schema[:to]}"),
      quiz: quiz
    )
  end

  def self.question_schemas
    [
      {from: :english,  to: :hiragana},
      {from: :english,  to: :katakana},
      {from: :english,  to: :kanji},
      {from: :hiragana, to: :english},
      {from: :hiragana, to: :kanji},
      {from: :katakana, to: :english},
      {from: :kanji,    to: :english},
      {from: :kanji,    to: :hiragana}
    ]
  end
end
