class DeploRecords < ActiveRecord::Migration[6.0]
  def change
    drop_table :deplo_records
  end
end
