class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :name
      t.integer :calories
      t.string :type
      t.references :activities_calendar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
