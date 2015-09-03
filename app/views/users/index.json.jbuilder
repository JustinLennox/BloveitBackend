json.array!(@users) do |user|
  json.extract! user, :id, :fbAccessToken
  json.url user_url(user, format: :json)
end
