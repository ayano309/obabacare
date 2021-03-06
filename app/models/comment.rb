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
class Comment < ApplicationRecord
  belongs_to :vital
  belongs_to :user

  validates :content, presence: true

  validates :is_important, inclusion: {in: [true, false]}
  validates :emotion, presence: true

  #感情記録
  #expressionless= 無表情
  enum emotion: { happy: 0, anger: 1, sad: 2, fun:3, expressionless: 4, other: 5}

  #誰の投稿か
  include IsWhoPosts

  def comment_created_at
    I18n.l(self.created_at, format: :time)
  end

  #感情記録カレンダー
  def start_time
    vital.day
  end
  scope :comment_month, ->{ where(created_at: Time.zone.today.all_month) }

  #重要コメントのステータス
  extend SwitchFlg

  #重要コメント一覧
  scope :important_comment, ->{ where(is_important: true) }
  #重要コメントの数
  scope :important_comment_count, ->{ 
    important_comment.
    comment_month
  }
end
