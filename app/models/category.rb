class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'イベント' },
    { id: 2, name: 'グルメ' },
    { id: 3, name: '観光・景色' },
    { id: 4, name: 'スポーツ・レジャー' },
    { id: 5, name: 'エンタメ' },
    { id: 6, name: 'その他' },
  ]
  end