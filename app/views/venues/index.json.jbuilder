json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :neighborhood, :date_type, :mood, :polaroid_description, :specials, :food_drink, :why_blove, :price_for_two, :hours, :details_table, :date_experience, :keep_in_mind
  json.url venue_url(venue, format: :json)
end
