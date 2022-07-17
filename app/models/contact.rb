# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  category   :integer          not null
#  email      :string           not null
#  message    :text             not null
#  name       :string           not null
#  phone      :string           not null
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :message, presence: true
  validates :category, presence: true
  validates :status, presence: true
  
  #サイトについて、要望、その他
  enum category: {
    site: 0,
    demand: 1,
    others: 2
  }

  enum status: {
    unsupported: 0,
    closed: 1
  }
  #ページネーション
  extend PageList
  
  include SetOrder
  
  #vitalの降順でページネーション
  scope :on_contacts, -> (page) {
    set_order(created_at: :desc).
    display_list(page)
  }
  
  #新規お問い合わせ
  scope :new_contacts, ->(page){
    where(created_at: Time.zone.today.all_month).
    on_contacts(page)
  }
end
