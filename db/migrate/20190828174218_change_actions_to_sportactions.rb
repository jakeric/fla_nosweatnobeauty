class ChangeActionsToSportactions < ActiveRecord::Migration[5.2]
  def change
    rename_table :actions, :sportactions
  end
end
