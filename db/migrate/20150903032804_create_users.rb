class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fbAccessToken
      t.text :favorites
      t.text :bloved_venues
      t.string :name
      t.string :blove_points
      t.timestamps null: false
    end
  end
end
