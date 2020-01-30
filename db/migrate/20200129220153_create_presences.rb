class CreatePresences < ActiveRecord::Migration[6.0]
  def change
    create_table :presences do |t|
      t.integer :character_id
      t.integer :location_id
      t.string :context

      t.timestamps
    end
  end
end
