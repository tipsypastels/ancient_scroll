class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :slug
      t.integer :gender
      t.string :alignment
      t.string :trainer_class
      t.string :specialty
      t.string :hometown

      t.timestamps
    end
    add_index :characters, :slug, unique: true
  end
end
