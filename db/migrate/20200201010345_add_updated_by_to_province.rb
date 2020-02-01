class AddUpdatedByToProvince < ActiveRecord::Migration[6.0]
  def change
    add_column :provinces, :updated_by, :integer
  end
end
