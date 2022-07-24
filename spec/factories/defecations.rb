# == Schema Information
#
# Table name: defecations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  vital_id   :integer          not null
#
# Indexes
#
#  index_defecations_on_user_id   (user_id)
#  index_defecations_on_vital_id  (vital_id)
#
FactoryBot.define do
  factory :defecation do
    association :user
    association :vital
  end
end
