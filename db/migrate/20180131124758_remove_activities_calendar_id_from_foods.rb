class RemoveActivitiesCalendarIdFromFoods < ActiveRecord::Migration
  def change
    remove_index :foods, :activities_calendar_id
    remove_column :foods, :activities_calendar_id, :integer
  end
end
