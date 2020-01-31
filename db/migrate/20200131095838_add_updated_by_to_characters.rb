class AddUpdatedByToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :updated_by, :integer
    add_column :items, :updated_by, :integer
    add_column :locations, :updated_by, :integer
    add_column :organizations, :updated_by, :integer
    add_column :pages, :updated_by, :integer
    add_column :regions, :updated_by, :integer
    add_column :trainer_classes, :updated_by, :integer
  end
end
