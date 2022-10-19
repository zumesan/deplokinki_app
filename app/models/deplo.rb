class Deplo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  has_many :deplo_records
  has_many :users, through: :deplo_records
  has_many_attached :images

  validates :deplo_title, :deplo_info, :municipality, presence: true
  validates :deplo_title, length: { minimum: 1, maximum: 40 }
  validates :deplo_info, length: { minimum: 1, maximum: 140 }
  validates :images, length: { maximum: 5 }
  validates :category_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:6, message: "is invalid" }
  validates :prefecture_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:7, message: "is invalid" }

  def self.search(search)
    return Deplo.all unless search
    Deplo.where(['deplo_title LIKE ? || deplo_info LIKE ? || municipality LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
  end

end
