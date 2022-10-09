class Deplo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  has_many :deplo_records
  has_many :users, through: :deplo_records
  has_one_attached :image

  validates :deplo_title, :deplo_info, :municipality, presence: true
  
  validates :category_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:6, message: "is invalid" }
  validates :prefecture_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:7, message: "is invalid" }

end
