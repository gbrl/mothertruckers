class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.integer :truck_id
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
