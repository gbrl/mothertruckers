class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :website
      t.string :cuisine
      t.datetime :creation_date
      t.string :image
      t.string :image_small
      t.string :image_large
      t.boolean :no_longer_in_business
      t.datetime :open_time
      t.datetime :close_time
      t.float :latitude
      t.float :longitude
      t.string :intersection
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
