class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :date_type
      t.string :mood
      t.string :price_rating
      t.string :neighborhood
      t.string :address
      t.string :polaroid_description
      t.string :blove_count
      t.string :specials
      t.string :food_drink
      t.string :why_blove_heading_1
      t.string :why_blove_description_1
      t.string :why_blove_heading_2
      t.string :why_blove_description_2
      t.string :why_blove_heading_3
      t.string :why_blove_description_3
      t.string :price_for_two
      t.string :monday_hours
      t.string :tuesday_hours
      t.string :wednesday_hours
      t.string :thursday_hours
      t.string :friday_hours
      t.string :saturday_hours
      t.string :sunday_hours
      t.string :details_table
      t.string :date_experience
      t.string :keep_in_mind
      t.string :crowd
      t.string :dress_code
      t.string :parking
      t.string :reservations
      t.string :atmosphere
      t.string :keep_in_mind
      t.attachment :polaroid_image
      t.attachment :thumbnail_image
      t.attachment :venue_image_1
      t.attachment :venue_image_2
      t.attachment :venue_image_3
      t.attachment :venue_image_4
      t.attachment :venue_image_5


      t.timestamps null: false
    end
  end
  def up
    add_attachment :users, :avatar
  end

  def down
    remove_attachment :users, :avatar
  end

end
