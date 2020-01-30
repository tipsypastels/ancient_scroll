class AddAgeToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :age, :integer
  end
end
