class DailyActivity < ActiveRecord::Base
  belongs_to :activities_calendar
  has_many :exercises
  has_many :foods
end
