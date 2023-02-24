FactoryBot.define do
  factory :comment do
    comment_content     {Faker::Lorem.sentence} #ランダムな文章を生成
  end
end
