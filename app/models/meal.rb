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
class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :vital
  
  validates :time_period, presence: true
  validates :meal_quantity, presence: true
  
  enum time_period: { breakfast: 0, lunch: 1, dinner: 2 }
  enum meal_quantity: { one_third: 0, half: 1, complete_eating: 2}
  
  scope :breakfast, -> { where(time_period: 'breakfast') }
  scope :lunch, -> { where(time_period: 'lunch') }
  scope :dinner, -> { where(time_period: 'dinner') }
end
