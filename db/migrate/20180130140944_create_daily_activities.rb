class CreateDailyActivities < ActiveRecord::Migration
  def change
    create_table :daily_activities do |t|
      t.references :user, index: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
