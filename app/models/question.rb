class Question
  include Mongoid::Document
  
  field :label,          type: String
  field :wrong_answers,  type: Array
  field :correct_answer, type: String

  embedded_in :quiz

  def self.create_random(quiz)
    schema = self.question_schemas.sample
    label = "#{schema[0]} -> #{schema[1]}"

    correct_word = Word.send("with_#{schema[0]}").send("with_#{schema[1]}").sample
    wrong_words = Word.ne(id: correct_word.id).send("with_#{schema[1]}").sample(3)

    self.create(
      label: label,
      wrong_answers: wrong_words.map { |ww| ww.send("#{schema[1]}") },
      correct_answer: correct_word.send("#{schema[1]}"),
      quiz: quiz
    )
  end

  def self.question_schemas
    [
      [:english,  :hiragana],
      [:english,  :katakana],
      [:english,  :kanji],
      [:hiragana, :english],
      [:hiragana, :kanji],
      [:katakana, :english],
      [:kanji,    :english],
      [:kanji,    :hiragana]
    ]
  end
end
