class CreateDateStories < ActiveRecord::Migration
  def change
    create_table :date_stories do |t|
      t.string :storyText
      t.string :approved
      t.belongs_to :user
      t.belongs_to :venue
      t.string :venue_id
      t.string :user_fbAccessToken
      t.string :did_enjoy
      t.string :would_recommend
      t.string :date_type
      t.string :food
      t.string :drinks
      t.string :zervice
      t.string :decor
      t.string :vibe
      t.timestamps null: false
    end
  end
end
