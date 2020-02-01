class DropTableIdentifiers < ActiveRecord::Migration[6.0]
  def change
    drop_table :identifiers
  end
end
