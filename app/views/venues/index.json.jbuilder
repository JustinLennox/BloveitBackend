json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :date_type, :mood, :price_rating, :neighborhood, :polaroid_description, :blove_count, :specials, :food_drink, :why_blove, :price_for_two, :hours, :details_table, :date_experience, :keep_in_mind
  json.url venue_url(venue, format: :json)
end
