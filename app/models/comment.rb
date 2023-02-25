class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :deplo 

  validates :comment_content, length: { minimum: 1, maximum: 140 }
end
