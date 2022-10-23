class Comment < ApplicationRecord
  belongs_to :user #Comment.userで,コメントの所有者を取得できる。
  belongs_to :deplo #Comment.deploで、そのコメントがされた投稿を取得できる。
end
