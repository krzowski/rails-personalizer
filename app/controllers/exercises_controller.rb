class ExercisesController < ApplicationController
  def create
    activities_list = current_user.daily_activities.find_by(date: params[:date])
    unless activities_list
      activities_list = current_user.daily_activities.create(date: params[:date])
    end

    exercise = activities_list.foods.new(exercise_params)
    if exercise.save
      flash[:notice] = "Activity was added to the list"
    else
      flash[:alert] = "Something went wrong. Exercise isn't added"
    end
    redirect_to calendar_path
  end

  def destroy
  end


  private
    def exercise_params
      params.require(:exercise).permit(:name, :calories)
    end
end