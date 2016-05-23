class AddTimestampsToStops < ActiveRecord::Migration
  def change
    add_column :stops, :created_at, :datetime
    add_column :stops, :updated_at, :datetime
  end
end