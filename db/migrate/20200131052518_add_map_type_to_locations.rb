class AddMapTypeToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :map_type, :integer
  end
end
