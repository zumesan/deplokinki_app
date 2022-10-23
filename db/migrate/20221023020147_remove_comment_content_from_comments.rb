class RemoveCommentContentFromComments < ActiveRecord::Migration[6.0]
  def up
    remove_column :comments, :comment_content
  end

  def down
    add_column :comments, :comment_content, :text
  end
end
