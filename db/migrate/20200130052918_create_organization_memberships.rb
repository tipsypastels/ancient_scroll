class CreateOrganizationMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_memberships do |t|
      t.integer :organization_id
      t.integer :character_id
      t.boolean :former, default: false
      t.string :role

      t.timestamps
    end
  end
end
