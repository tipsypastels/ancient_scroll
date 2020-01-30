class CreateLocks < ActiveRecord::Migration[6.0]
  def change
    create_table :locks do |t|
      t.integer :lockable_id
      t.string :lockable_type

      t.timestamps
    end
  end
end
