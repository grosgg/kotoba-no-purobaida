json.id                @quiz._id.to_s
json.url               quiz_url(@quiz, format: :json)
json.questions_count   @quiz.questions_count

json.questions @quiz.questions do |question|
  json.partial! 'question', question: question
end