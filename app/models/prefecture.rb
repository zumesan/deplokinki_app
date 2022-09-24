class Prefecture < ActiveHash::Base
  self.data = [
    { id: 1, name: '三重県' },
    { id: 2, name: '滋賀県' },
    { id: 3, name: '京都府' },
    { id: 4, name: '大阪府' },
    { id: 5, name: '兵庫県' },
    { id: 6, name: '奈良県' },
    { id: 7, name: '和歌山県' }
  ]

  include ActiveHash::Associations
  has_many :deplos
  end