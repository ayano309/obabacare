class CreateDefecations < ActiveRecord::Migration[6.1]
  def change
    create_table :defecations do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
