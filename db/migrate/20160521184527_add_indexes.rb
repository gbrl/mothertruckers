class AddIndexes < ActiveRecord::Migration
  def change
    add_index :trucks, :slug
    add_index :trucks, :name
    add_index :favourites, :truck_id
    add_index :favourites, :user_id
    add_index :notes, :truck_id
    add_index :stops, :truck_id
    add_index :notes, :user_id
    add_index :users, :email
  end
end