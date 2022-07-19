FactoryBot.define do
  factory :medical_history do
    disease_name { Faker::Lorem.characters(number: 10) }
    when_onset {Faker::Date.between(from: 2.days.ago, to: Date.today)}
    in_treatment  { false }
    association :user
  end
end