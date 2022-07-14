# == Schema Information
#
# Table name: profiles
#
#  id             :integer          not null, primary key
#  birthday       :date
#  blood_type     :integer
#  gender         :integer
#  important_term :text
#  weight         :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  belongs_to :user
  
  enum gender: { male: 0, female: 1}
  enum blood_type: { A: 0, B: 1, O: 2, AB: 3 }
  
  
  
  #年齢
  def age
    return '不明' unless birthday.present?
    years = Time.zone.now.year - birthday.year
    days = Time.zone.now.yday - birthday.yday

    if days < 0
      "#{years - 1}歳"
    else
      "#{years}歳"
    end
  end
end
