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
end
