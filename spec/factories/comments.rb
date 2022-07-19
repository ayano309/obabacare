FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.characters(number: 100) }
    emotion { Comment.emotions.keys.sample }
    is_important { false }
    association :user
    association :vital
  end
end
  
