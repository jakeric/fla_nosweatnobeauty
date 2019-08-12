class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.date :datum
      t.references :user, foreign_key: true
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
