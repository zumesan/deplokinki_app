class Deplo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :users
  belongs_to :category
  belongs_to :prefecture



end
