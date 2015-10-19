class CreateBetaCodes < ActiveRecord::Migration
  def change
    create_table :beta_codes do |t|
      t.string :code
      t.int :user_count

      t.timestamps null: false
    end
  end
end
