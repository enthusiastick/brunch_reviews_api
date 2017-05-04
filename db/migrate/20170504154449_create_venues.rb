class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.integer :creator_id, null: false
      t.text :description
      t.string :hours
      t.string :location
      t.string :name, null: false

      t.timestamps
    end
    add_index :venues, :name, unique: true
  end
end
