class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :truck_id
      t.integer :user_id
      t.string :content
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
