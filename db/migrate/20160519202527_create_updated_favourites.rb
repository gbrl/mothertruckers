class CreateUpdatedFavourites < ActiveRecord::Migration
  def change
    create_table :favourites, :force => true do |t|
      t.integer :truck_id
      t.integer :user_id
    end
  end
end
