FactoryBot.define do
  factory :memo do
    title { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.characters(number: 300) }
    category  { Memo.categories.keys.sample }
    association :user
  end
end