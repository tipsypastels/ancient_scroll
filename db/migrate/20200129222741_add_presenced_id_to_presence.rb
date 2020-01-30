class AddPresencedIdToPresence < ActiveRecord::Migration[6.0]
  def change
    add_column :presences, :presenced_id, :integer
    add_column :presences, :presenced_type, :string
    remove_column :presences, :character_id
  end
end
