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