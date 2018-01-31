class RenameActivitiesTableToFoodsTable < ActiveRecord::Migration
  def change
    rename_table :activities, :foods
  end
end
