class AddHometownIdToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :hometown_id, :integer
    add_column :characters, :trainer_class_id, :integer
  end
end
