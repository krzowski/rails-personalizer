class FoodsController < ApplicationController
  def create
    activities_list = current_user.daily_activities.find_by(date: params[:date])
    unless activities_list
      activities_list = current_user.daily_activities.create(date: params[:date])
    end

    food = activities_list.foods.new(food_params)
    if food.save
      flash[:notice] = "food was added to the list"
    else
      flash[:alert] = "food didnt save"
    end
    redirect_to calendar_path
  end

  def destroy
  end

  private
    def food_params
      params.require(:food).permit(:name, :calories)
    end
end