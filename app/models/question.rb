class Question
  include Mongoid::Document
  
  field :original_word,  type: String
  field :answers,        type: Array
  field :correct_answer, type: String

  embedded_in :quiz

  def self.create_random(quiz, user)
    schema = self.question_schemas.sample

    correct_word = Word.where(:user => user).send("with_#{schema[:from]}").send("with_#{schema[:to]}").sample
    wrong_words = Word.where(:user => user).ne(id: correct_word.id).send("with_#{schema[:to]}").sample(3)

    correct_answer = correct_word.send("#{schema[:to]}")
    answers = wrong_words.map { |ww| ww.send("#{schema[:to]}") } + [correct_answer]

    self.create(
      original_word: correct_word.send("#{schema[:from]}"),
      correct_answer: correct_answer,
      answers: answers.shuffle,
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
