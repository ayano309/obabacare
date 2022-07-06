class CreateDefecations < ActiveRecord::Migration[6.1]
  def change
    create_table :defecations do |t|

      t.timestamps
    end
  end
end
