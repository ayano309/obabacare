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
require 'rails_helper'

RSpec.describe MedicalHistory, type: :model do
  describe 'validation' do
    it '全て入力で、有効' do
      medical_history = build(:medical_history)
      expect(medical_history).to be_valid
    end
    
    it 'disease_nameが存在しない場合無効であること' do
      medical_history = FactoryBot.build(:medical_history, disease_name: '')
      medical_history.valid?
      expect(medical_history.errors.of_kind?(:disease_name, :blank)).to be_truthy
    end
    
    
    it 'when_onsetが存在しない場合無効であること' do
      medical_history = FactoryBot.build(:medical_history, when_onset: '')
      medical_history.valid?
      expect(medical_history.errors.of_kind?(:when_onset, :blank)).to be_truthy
    end
  end
  
  describe "各モデルとのアソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Userモデルとのアソシエーション" do
      let(:target) { :user }

      it "Userとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
