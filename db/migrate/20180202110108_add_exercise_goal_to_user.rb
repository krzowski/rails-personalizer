class AddExerciseGoalToUser < ActiveRecord::Migration
  def change
    add_column :users, :exercise_goal, :integer
  end
end
