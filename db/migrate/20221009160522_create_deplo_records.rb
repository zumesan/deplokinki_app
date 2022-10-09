class CreateDeploRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :deplo_records do |t|
      t.references :deplo, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
