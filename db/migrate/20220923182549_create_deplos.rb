class CreateDeplos < ActiveRecord::Migration[6.0]
  def change
    create_table :deplos do |t|

      t.timestamps
    end
  end
end
