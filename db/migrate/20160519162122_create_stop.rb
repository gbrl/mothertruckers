class CreateStop < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :truck_id
      t.string :name
      t.datetime :from
      t.datetime :to
      t.float :latitude
      t.float :longitude
    end
  end
end
