class AddFoodGoalToUser < ActiveRecord::Migration
  def change
    add_column :users, :food_goal, :integer
  end
end
