json.array!(@quizzes) do |quiz|
  json.id      quiz._id.to_s
  json.url     quiz_url(quiz, format: :json)
end
