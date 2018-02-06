class AppPagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
    unless current_user
      flash[:notice] = notice if notice
      redirect_to new_user_session_path
    else
      todays_activity = current_user.daily_activities.find_by(date: Date.today)
      @food_goal = current_user.food_goal
      @exercise_goal = current_user.exercise_goal

      if todays_activity
        @food_current = todays_activity.food_calories 
        @current_food_progress = @food_goal - @food_current
        @exercise_current = todays_activity.exercise_calories
      else
        @food_current = @exercise_current = 0
        @current_food_progress = @food_goal
      end
    end
  end

  def calendar
    @food = Food.new
    @exercise = Exercise.new
  end

  def day
    @days_activity = current_user.daily_activities.find_by(date: params[:date])
    unless @days_activity
      @days_activity = current_user.daily_activities.create(date: params[:date])
    end
    @foods = @days_activity.foods
    @exercises = @days_activity.exercises

    respond_to do |format|
      format.js { render 'day', layout: false }
    end
  end
end
