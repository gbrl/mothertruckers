class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :website
      t.string :cuisine
      t.string :image
      t.string :image_small
      t.string :image_large
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
