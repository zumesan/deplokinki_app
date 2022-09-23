class AddCategoryIdToDeplos < ActiveRecord::Migration[6.0]
  def change
    add_column :deplos, :category_id, :integer
  end
end
