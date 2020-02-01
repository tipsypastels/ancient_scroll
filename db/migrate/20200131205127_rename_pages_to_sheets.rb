class RenamePagesToSheets < ActiveRecord::Migration[6.0]
  def change
    rename_table :pages, :sheets
  end
end
