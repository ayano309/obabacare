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
  #排便機能
  has_many :defecations, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_one :profile, dependent: :destroy,  class_name: 'Profile'
  #既往歴
  has_many :medical_histories, dependent: :destroy
  
  EMAIL_REGEX =  /\A\S+@\S+\.\S+\z/.freeze

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: { case_sensitive: true },
  format: { with: EMAIL_REGEX, message: 'は正しいメールアドレスを入力してください' }, length: { maximum: 256 }


  delegate :birthday,:weight,:age,:gender, to: :profile, allow_nil: true
  
  #排便記録
  def defecation_by?(vital)
    defecations.exists?(vital_id: vital.id)
  end
  
  #ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
  #プロフィール
  def prepare_profile
    profile || build_profile
  end
  
  
  #ユーザーから送信されたpasswordが一致するかどうかを確認し、
  #一致する場合のみパスワードを暗号化してデータベースに保存するメソッド
  def update_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    result = update(params, *options)
    clean_up_passwords
    result
  end
end
