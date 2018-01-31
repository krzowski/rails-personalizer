class CreateDailyActivities < ActiveRecord::Migration
  def change
    create_table :daily_activities do |t|
      t.references :activities_calendar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
