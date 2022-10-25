class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :deplo, null: false, foreign_key: true
      t.text :comment_content

      t.timestamps
    end
  end
end
