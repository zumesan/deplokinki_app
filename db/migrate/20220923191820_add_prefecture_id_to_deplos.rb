class AddPrefectureIdToDeplos < ActiveRecord::Migration[6.0]
  def change
    add_column :deplos, :prefecture_id, :integer
  end
end
