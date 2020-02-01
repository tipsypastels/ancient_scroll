class AddSlugToCharacters < ActiveRecord::Migration[6.0]
  def change
    %i|characters items locations organizations provinces regions sheets trainer_classes|.each { |t|
      add_slug t
    }
  end
  
  def add_slug(table)
    add_column table, :slug, :string
    add_index table, :slug, unique: true
  end
end
