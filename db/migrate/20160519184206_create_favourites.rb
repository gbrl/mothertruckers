class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :truck_id
      t.integer :user_id
    end
  end
end
