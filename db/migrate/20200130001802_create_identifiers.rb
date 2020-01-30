class CreateIdentifiers < ActiveRecord::Migration[6.0]
  def change
    create_table :identifiers do |t|
      t.integer :identifiable_id
      t.string :identifiable_type
      t.string :slug

      t.timestamps
    end
    add_index :identifiers, :slug, unique: true
  end
end
