class Comments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :deplos, on_delete: :cascade
  end
end
