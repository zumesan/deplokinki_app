class Deplo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :users
  belongs_to :category



end
