class Deplos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :deplos, :users, on_delete: :cascade #アカウントを削除した際に投稿も削除できるように設定
  end
end
