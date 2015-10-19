json.array!(@beta_codes) do |beta_code|
  json.extract! beta_code, :id, :code, :user_max, :user_count
  json.url beta_code_url(beta_code, format: :json)
end
