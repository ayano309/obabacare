# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # deviseのログイン機能とバリデーション機能だけが有効
  devise :database_authenticatable, :rememberable, :validatable
  
  def self.guest
    find_or_create_by!(name: 'guestadmin', email: 'admin-guest@example.com') do |admin|
      admin.password = SecureRandom.urlsafe_base64
      admin.name = 'guestadmin'
    end
  end
end
