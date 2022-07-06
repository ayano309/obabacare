class CreateVitals < ActiveRecord::Migration[6.1]
  def change
    create_table :vitals do |t|
      t.references :user, null: false
      t.float :temperature,null: false
      t.integer :high_bp,null: false
      t.integer :low_bp, null: false
      t.integer :pulse, null: false
      t.integer :breathing, null: false
      t.integer :moisture_supply, null: false
      t.integer :oxygen_saturation, null: false
      t.datetime :day, null: false
      t.timestamps
    end
  end
end
