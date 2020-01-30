class RemoveSlugFromCharacters < ActiveRecord::Migration[6.0]
  def change

    remove_column :characters, :slug, :string
    remove_column :items, :slug, :string
    remove_column :locations, :slug, :string
    remove_column :regions, :slug, :string
  end
end
