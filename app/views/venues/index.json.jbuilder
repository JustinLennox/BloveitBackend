json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :dinner, :drinks, :coffee, :dessert, :mood, :price_rating, :neighborhood, :address, :polaroid_description, :blove_count, :monday_special, :tuesday_special, :wednesday_special, :thursday_special, :friday_special, :saturday_special, :sunday_special, :food_drink, :why_blove_heading_1, :why_blove_heading_2, :why_blove_heading_3, :why_blove_description_1, :why_blove_description_2,:why_blove_description_3, :price_for_two, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :details_table, :date_experience, :keep_in_mind, :date_stories,
  :crowd, :dress_code, :parking, :reservations, :atmosphere, :keep_in_mind, :polaroid_image, :thumbnail_image,
  :venue_image_1, :venue_image_2, :venue_image_3, :venue_image_4, :venue_image_5

  json.url venue_url(venue, format: :json)
end
