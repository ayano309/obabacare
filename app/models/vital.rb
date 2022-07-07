# == Schema Information
#
# Table name: vitals
#
#  id                :integer          not null, primary key
#  breathing         :integer          not null
#  day               :datetime         not null
#  high_bp           :integer          not null
#  low_bp            :integer          not null
#  moisture_supply   :integer          not null
#  oxygen_saturation :integer          not null
#  pulse             :integer          not null
#  temperature       :float            not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer          not null
#
# Indexes
#
#  index_vitals_on_user_id  (user_id)
#
class Vital < ApplicationRecord
  belongs_to :user
  has_many :defecations, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :day , presence: true
  validates :breathing , presence: true
  validates :high_bp , presence: true
  validates :low_bp , presence: true
  validates :pulse , presence: true
  validates :temperature , presence: true
  validates :moisture_supply , presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :oxygen_saturation, presence: true, numericality: { greater_than_or_equal_to: 9 }

  #vital投稿日、投稿時間
  def vital_created_at
    I18n.l(self.day, format: :short)
  end
  
  #水分
  def moisture_quantity
   (self.moisture_supply/200).floor
  end
  
  #ページネーション
  extend PageList
  
  #vitalの降順
  scope :vitals_by_user, -> (user) { where(user_id: user) }
  scope :vitals_order, -> { order(day: :desc) }

  scope :on_vitals, -> (user,page) {
    vitals_by_user(user).
    vitals_order.
    display_list(page)
  }
end
