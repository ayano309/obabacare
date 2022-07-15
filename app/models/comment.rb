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
#  vital_id     :integer          not null
#
# Indexes
#
#  index_comments_on_vital_id  (vital_id)
#
class Comment < ApplicationRecord
  belongs_to :vital

  validates :content, presence: true
  
  validates :is_important, inclusion: {in: [true, false]}
  validates :emotion, presence: true
  
  #感情記録
  #expressionless= 無表情
  enum emotion: { happy: 0, anger: 1, sad: 2, fun:3, expressionless: 4, other: 5}
  
  
  def comment_created_at
    I18n.l(self.created_at, format: :time)
  end
end
