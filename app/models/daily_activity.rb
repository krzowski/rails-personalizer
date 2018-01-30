class DailyActivity < ActiveRecord::Base
  belongs_to :activities_calendar
  has_many :activities
end
