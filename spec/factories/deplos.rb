FactoryBot.define do
  factory :deplo do
    deplo_title           {Faker::Name.name} #ランダムな名前を生成
    deplo_info            {Faker::Lorem.sentence} #ランダムな文章を生成
    municipality          {Faker::Address.city} #ランダムな市区町村を生成
    category_id           {Faker::Number.between(from: 1, to: 6)} #ランダムな数字を生成
    prefecture_id         {Faker::Number.between(from: 1, to: 7)}
    association :user #このモデルが所属する親モデル名

    after(:build) do |message|
      message.images.attach(io: File.open('public/images/IMG_0251.jpeg'), filename: 'IMG_0251.jpeg')
    end
  end
end
