class AddIntrinsicRoleToPage < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :intrinsic_role, :string
  end
end
