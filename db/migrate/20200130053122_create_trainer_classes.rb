class CreateTrainerClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :trainer_classes do |t|
      t.string :name
      t.string :specialty

      t.timestamps
    end
  end
end
