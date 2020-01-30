class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :region_id
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :locations, :slug, unique: true
  end
end
