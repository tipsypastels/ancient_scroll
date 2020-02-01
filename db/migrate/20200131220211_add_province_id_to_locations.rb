class AddProvinceIdToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :province_id, :integer
  end
end
