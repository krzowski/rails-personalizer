class UsersController < ApplicationController
  def change_goals
    if true
      current_user.update_attributes(food_goal, exercise_goal)
    end
  end
end