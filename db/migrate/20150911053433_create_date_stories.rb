class CreateDateStories < ActiveRecord::Migration
  def change
    create_table :date_stories do |t|
      t.string :storyText
      t.boolean :approved
      t.belongs_to :user
      t.belongs_to :venue
      t.timestamps null: false
    end
  end
end
