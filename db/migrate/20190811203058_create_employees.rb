class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :employeename
      t.string :department

      t.timestamps
    end
  end
end
