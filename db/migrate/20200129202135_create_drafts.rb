class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :drafts do |t|
      t.integer :draftable_id
      t.string :draftable_type

      t.timestamps
    end
  end
end
