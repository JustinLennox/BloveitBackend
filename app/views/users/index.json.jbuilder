json.array!(@users) do |user|
  json.extract! user, :name, :id, :favorites, :fbAccessToken
  json.url user_url(user, format: :json)
end
