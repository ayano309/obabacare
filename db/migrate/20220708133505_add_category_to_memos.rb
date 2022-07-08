class AddCategoryToMemos < ActiveRecord::Migration[6.1]
  def change
    add_column :memos, :category, :integer
  end
end
