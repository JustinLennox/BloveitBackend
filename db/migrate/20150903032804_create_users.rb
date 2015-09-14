class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fbAccessToken
      t.text :favorites
      t.string :name
      t.timestamps null: false
    end
  end
end
