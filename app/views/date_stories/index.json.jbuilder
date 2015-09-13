json.array!(@date_stories) do |date_story|
  json.extract! date_story, :id, :storyText, :approved
  json.url date_story_url(date_story, format: :json)
end
