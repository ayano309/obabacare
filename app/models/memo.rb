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
class Memo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :title , presence: true
  validates :content , presence: true
  
  enum category: {
    reserved: 0,
    item: 1,
    shop: 2,
    others: 3
  }
  
  #ページネーション
  extend PageList
  scope :memo_by_user, -> (user) { where(user_id: user) }
  scope :on_memos, -> (user,page) {
    memo_by_user(user).
    display_list(page)
  }
end
