# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  deleted_flg            :boolean          default(FALSE), not null
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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'userモデルのテスト' do
    
    it '有効なユーザーモデル作成' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
    #nameについて
    it 'ユーザー名がない場合、無効' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end
    
    
    it 'ユーザー名が21文字以上、無効' do
      user = build(:user, name: 'a' * 21)
      user.valid?
      expect(user.errors[:name]).to include('は20文字以内で入力してください')
    end
    
    #eamilについて
    it 'メールアドレスがない場合、無効である' do
      user = FactoryBot.build(:user, email: '')
      user.valid?
      expect(user.errors.of_kind?(:email, :blank)).to be_truthy
    end

    it 'メールアドレスが不正な場合、無効である' do
      user = FactoryBot.build(:user, email: 'test.test.com')
      user.valid?
      expect(user.errors.of_kind?(:email, :invalid)).to be_truthy
    end

    it 'メールアドレスが256文字以上、無効' do
      user = build(:user, email: 'a' * 253 << '@com')
      user.valid?
      expect(user.errors[:email]).to include('は256文字以内で入力してください')
    end
    
    it '同じアドレスは無効である' do
      user_1 = FactoryBot.create(:user, email: 'sample@sample.com')
      user_2 = FactoryBot.build(:user, email: 'sample@sample.com')
      user_2.valid?
  
      expect(user_2.errors.of_kind?(:email, :taken)).to be_truthy
    end
    
    #パスワードについて
    it 'パスワードがない場合、無効である' do
      user = FactoryBot.build(:user, password: '')
      user.valid?
      expect(user.errors.of_kind?(:password, :blank)).to be_truthy
    end
    
    it 'パスワードが短すぎ場合、無効である' do
      user = FactoryBot.build(:user, password: 'a')
      user.valid?
      expect(user.errors.of_kind?(:password, :too_short)).to be_truthy
    end
    
    describe '各モデルとのアソシエーション' do
      let(:association) do
        described_class.reflect_on_association(target)
      end
        let(:user) { create(:user) }
  
      context 'Profile' do
        let(:target) { :profile }
        it { expect(association.macro).to eq :has_one }
        it { expect(association.class_name).to eq 'Profile' }
        it 'Userが削除されたらProfileも削除されること' do
          create(:profile, user_id:user.id)
          expect { user.destroy }.to change(Profile, :count).by(-1)
        end
      end
      
      
    end
  end
end