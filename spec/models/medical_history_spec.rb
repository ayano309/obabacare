require 'rails_helper'

RSpec.describe MedicalHistory, type: :model do
  describe 'validation' do
    it '全て入力で、有効' do
      medical_history = build(:medical_history)
      expect(medical_history).to be_valid
    end
  end
end