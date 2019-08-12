class AddEmployeeToActions < ActiveRecord::Migration[5.2]
  def change
    add_reference :actions, :employee, foreign_key: true
  end
end
