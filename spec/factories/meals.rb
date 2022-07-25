# == Schema Information
#
# Table name: meals
#
#  id            :integer          not null, primary key
#  meal_quantity :integer
#  time_period   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer          not null
#  vital_id      :integer          not null
#
# Indexes
#
#  index_meals_on_user_id   (user_id)
#  index_meals_on_vital_id  (vital_id)
#
FactoryBot.define do
  factory :meal do
    time_period { 0 }
    meal_quantity { 2 }
    association :user
    association :vital
  end
end
