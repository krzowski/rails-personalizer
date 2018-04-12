class DailyActivity < ActiveRecord::Base
  belongs_to :user
  has_many :exercises, dependent: :destroy
  has_many :foods, dependent: :destroy

  def exercise_calories
    self.exercises.sum(:calories)
  end

  def food_calories
    self.foods.sum(:calories)
  end
end
