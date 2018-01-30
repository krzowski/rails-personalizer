class Activity < ActiveRecord::Base
  belongs_to :daily_activity
  validates :name, presence: true
  validates :calories, presence: true
  validates :type, inclusion: { in: %w(eaten burned),
    message: "%{value} is not a valid type" }
end
