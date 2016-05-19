class AddSlugsToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :slug, :string
  end
end
