class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :feedback_text
      t.string :user_fbAccessToken
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
