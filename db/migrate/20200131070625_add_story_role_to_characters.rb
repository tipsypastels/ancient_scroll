class AddStoryRoleToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :story_role, :integer
  end
end
