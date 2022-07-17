class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.text :message, null: false
      t.integer :category, null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
