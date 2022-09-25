class CreateDeplos < ActiveRecord::Migration[6.0]
  def change
    create_table :deplos do |t|
      t.string     :deplo_title,    null: false
      t.text       :deplo_info,     null: false
      t.string     :municipality,   null: false
      t.references :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
