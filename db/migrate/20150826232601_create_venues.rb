class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :neighborhood
      t.string :date_type
      t.string :mood
      t.string :polaroid_description
      t.string :specials
      t.string :food_drink
      t.string :why_blove
      t.string :price_for_two
      t.string :hours
      t.string :details_table
      t.string :date_experience
      t.string :keep_in_mind

      t.timestamps null: false
    end
  end
end
