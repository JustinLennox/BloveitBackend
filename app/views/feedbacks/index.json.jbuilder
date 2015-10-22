json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :feedback_text
  json.url feedback_url(feedback, format: :json)
end
