class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.text :name
      t.integer :calories
      t.references :daily_activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
