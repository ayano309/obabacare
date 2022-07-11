# == Schema Information
#
# Table name: medical_histories
#
#  id           :integer          not null, primary key
#  disease_name :string           not null
#  in_treatment :boolean          not null
#  when_onset   :date             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_medical_histories_on_user_id  (user_id)
#
class MedicalHistory < ApplicationRecord
end
