class Deplos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :deplos, :users, on_delete: :cascade
  end
end
