json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :date_type, :mood, :price_rating, :neighborhood, :address, :polaroid_description, :blove_count, :polaroid_image, :monday_special, :tuesday_special, :wednesday_special, :thursday_special, :friday_special, :saturday_special, :sunday_special
  json.url venue_url(venue, format: :json)
end