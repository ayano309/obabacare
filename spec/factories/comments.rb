# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  content      :text             not null
#  emotion      :integer          not null
#  is_important :boolean          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#  vital_id     :integer          not null
#
# Indexes
#
#  index_comments_on_user_id   (user_id)
#  index_comments_on_vital_id  (vital_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.characters(number: 100) }
    emotion { Comment.emotions.keys.sample }
    is_important { false }
    association :vital
    association :user
  end
end
  
