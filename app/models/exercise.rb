class Exercise < ActiveRecord::Base
  belongs_to :daily_activity
  validates :name, presence: true
  validates :calories, presence: true
end
