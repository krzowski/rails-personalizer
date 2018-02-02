class AddFoodGoalToUser < ActiveRecord::Migration
  def change
    add_column :users, :food_goal, :integer, :default => 0
  end
end
