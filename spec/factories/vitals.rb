# == Schema Information
#
# Table name: vitals
#
#  id                :integer          not null, primary key
#  breathing         :integer          not null
#  day               :datetime         not null
#  high_bp           :integer          not null
#  low_bp            :integer          not null
#  moisture_supply   :integer          not null
#  oxygen_saturation :integer          not null
#  pulse             :integer          not null
#  temperature       :float            not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer          not null
#
# Indexes
#
#  index_vitals_on_user_id  (user_id)
#
FactoryBot.define do
  factory :vital do
    day {Faker::Date.between(from: 2.days.ago, to: Date.today)}
    breathing { 15 }
    high_bp { 135 }
    low_bp { 70 }
    pulse {68}
    temperature {36.3}
    moisture_supply {1200}
    oxygen_saturation {99}
    association :user
  end
end
