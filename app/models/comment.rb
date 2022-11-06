class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :deplo

  validates :comment_content, presence: true
end
