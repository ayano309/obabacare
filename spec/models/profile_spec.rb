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
require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'バリデーション' do
    it 'user_idがない場合、無効である' do
      profile = FactoryBot.build(:profile, user_id: nil)
      profile.valid?
      expect(profile.errors.of_kind?(:user, :blank)).to be_truthy
    end
  end

  it 'userを削除すると、userと紐づくprofileも削除される' do
    user = FactoryBot.create(:user)
    FactoryBot.create(:profile, user_id: user.id)
    expect { user.destroy }.to change { Profile.count }.by(-1)
  end

  describe '各モデルとのアソシエーション' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userモデルとのアソシエーション' do
      let(:target) { :user }

      it 'Userとの関連付けはbelongs_toであること' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
