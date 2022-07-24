# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  category   :integer
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_memos_on_user_id  (user_id)
#
FactoryBot.define do
  factory :memo do
    title { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.characters(number: 300) }
    category  { Memo.categories.keys.sample }
    association :user
  end
end
