class Quiz
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :score,           type: Integer, default: 0
  field :tags,            type: Array
  field :questions_count, type: Integer, default: 10

  embeds_many :questions

  def generate_questions
    while questions.count < questions_count
      questions << Question.create_random(self)
    end
  end

end
