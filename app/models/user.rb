# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :vitals, dependent: :destroy
  has_many :defecations, dependent: :destroy
  has_many :memos, dependent: :destroy
  
  EMAIL_REGEX =  /\A\S+@\S+\.\S+\z/.freeze

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: { case_sensitive: true },
  format: { with: EMAIL_REGEX, message: 'は正しいメールアドレスを入力してください' }, length: { maximum: 256 }

  #排便記録
  def defecation_by?(vital)
    defecations.exists?(vital_id: vital.id)
  end
end
