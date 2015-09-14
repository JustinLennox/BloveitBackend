json.array!(@date_stories) do |date_story|
  json.extract! date_story, :id, :storyText, :approved, :user
  json.url date_story_url(date_story, format: :json)
end
