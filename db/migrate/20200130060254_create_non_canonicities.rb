class CreateNonCanonicities < ActiveRecord::Migration[6.0]
  def change
    create_table :non_canonicities do |t|
      t.string :reason
      t.integer :object_id
      t.string :object_type

      t.timestamps
    end
  end
end
