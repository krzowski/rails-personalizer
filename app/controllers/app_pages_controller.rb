class AppPagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
    unless current_user
      flash[:notice] = notice if notice
      redirect_to new_user_session_path
    end
    todays_activity = current_user.daily_activities.find_by(date: Date.today)
    @food_goal = current_user.food_goal
    @food_current = todays_activity.food_calories 
    @current_food_progress = @food_goal - @food_current
    @exercise_goal = current_user.exercise_goal
    @exercise_current = todays_activity.exercise_calories
  end

  def checklist
  end
end
