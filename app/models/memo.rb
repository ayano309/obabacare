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
    advice: 0,
    medicine: 1,
    care_supplies: 2,
    others: 3
  }
  #誰の投稿か
  include IsWhoPosts
  #ページネーション
  extend PageList
  scope :on_memos, -> (user,page) {
    by_user(user).
    display_list(page)
  }

  #カテゴリー検索
  scope :seach_category, -> (name){where(category: name)}
  
  #メモ検索
  scope :search_information, -> (keyword) { 
    where("title LIKE :keyword OR content LIKE :keyword ", keyword: "%#{keyword}%")
  }
end
