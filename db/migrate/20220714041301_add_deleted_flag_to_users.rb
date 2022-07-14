class AddDeletedFlagToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :deleted_flg, :boolean, default: false, null: false
  end
end
