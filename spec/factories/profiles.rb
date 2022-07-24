# == Schema Information
#
# Table name: profiles
#
#  id             :integer          not null, primary key
#  birthday       :date
#  blood_type     :integer
#  gender         :integer
#  important_term :text
#  weight         :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
FactoryBot.define do
  factory :profile do
    weight { 46.2 }
    blood_type { Profile.blood_types.keys.sample }
    gender { Profile.genders.keys.sample }
    important_term { Faker::Lorem.characters(number: 50) }
    birthday { Faker::Date.birthday(min_age: 60, max_age: 105) }
  end
end
