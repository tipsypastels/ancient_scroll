class RemoveHometownFromCharacters < ActiveRecord::Migration[6.0]
  def change

    remove_column :characters, :hometown, :string
    remove_column :characters, :trainer_class, :string
  end
end
