class CreateCharacterPresences < ActiveRecord::Migration[6.0]
  def change
    drop_table :presences

    create_table :character_presences do |t|
      t.integer :character_id
      t.integer :location_id
      t.string :context

      t.timestamps
    end

    create_table :item_presences do |t|
      t.integer :item_id
      t.integer :location_id
      t.string :context

      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.string :slug
    end
    add_index :items, :slug, unique: true
  end
end
