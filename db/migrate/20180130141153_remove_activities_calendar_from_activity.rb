class RemoveActivitiesCalendarFromActivity < ActiveRecord::Migration
  def change
    remove_reference :activities, :activities_calendars, index: true, foreign_key: true
    add_reference :activities, :daily_activity, index: true, foreign_key: true
  end
end
