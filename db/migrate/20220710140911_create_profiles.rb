class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.integer :gender
      t.integer :blood_type
      t.date :birthday
      t.float :weight
      t.text :important_term
      t.timestamps
    end
  end
end
