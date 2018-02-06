class UsersController < ApplicationController
  def change_goals
    current_user.update_attributes(food_goal: params[:food_goal], exercise_goal: params[:exercise_goal])

    flash[:notice] = "Calorie goals were changed"
    redirect_to calendar_path
  end
end