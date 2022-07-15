class AddColumnToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :is_important, :boolean, null: false
    add_column :comments, :emotion, :integer, null: false
    add_reference :comments, :user, null: false, foreign_key: true
  end
end
