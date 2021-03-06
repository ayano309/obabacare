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
#  status     :integer          default("unsupported"), not null
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

  #未対応のお問い合わせ
  scope :contact_status, ->{ where(status: 0) }
  #新規お問い合わせ(未対応、１ヶ月間)
  scope :new_contacts, ->(page){
    where(created_at: Time.zone.today.all_month).
    contact_status.
    on_contacts(page)
  }
end
