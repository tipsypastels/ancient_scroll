class AddPopulationToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :population, :integer
  end
end
