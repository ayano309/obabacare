FactoryBot.define do
  factory :profile do
    weight { 46.2 }
    blood_type { Profile.blood_types.keys.sample }
    gender { Profile.genders.keys.sample }
    important_term { Faker::Lorem.characters(number: 50) }
    birthday { Faker::Date.birthday(min_age: 60, max_age: 105) }
  end
end