class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.integer :time_period
      t.integer :meal_quantity
      t.references :user, null: false
      t.references :vital, null: false
      t.timestamps
    end
  end
end
