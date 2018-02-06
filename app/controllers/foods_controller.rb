class FoodsController < ApplicationController
  def create
    activities_list = current_user.daily_activities.find_by(date: params[:date])
    unless activities_list
      activities_list = current_user.daily_activities.create(date: params[:date])
    end

    food = activities_list.foods.new(food_params)
    if food.save
      flash[:notice] = "Food was added to the list"
    else
      flash[:alert] = "Something went wrong. Food isn't added"
    end
    redirect_to calendar_path(start_date: params[:date])
  end

  def destroy
    food = current_user.foods.find(params[:id])
    food.destroy

    render nothing: true
  end

  private
    def food_params
      params.require(:food).permit(:name, :calories)
    end
end