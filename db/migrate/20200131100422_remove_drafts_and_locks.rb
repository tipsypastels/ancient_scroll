class RemoveDraftsAndLocks < ActiveRecord::Migration[6.0]
  def change
    drop_table :drafts
    drop_table :locks
  end
end
