class ActivitiesCalendar < ActiveRecord::Base
  belongs_to :user
  has_many :daily_activities
end
