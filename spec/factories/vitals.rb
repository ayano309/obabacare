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