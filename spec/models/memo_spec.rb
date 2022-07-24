# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  category   :integer
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_memos_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Memo, type: :model do
  describe 'validation' do
    it '全て入力で、有効' do
      memo = build(:memo)
      expect(memo).to be_valid
    end
    
    it 'titleが存在しない場合無効であること' do
      memo = FactoryBot.build(:memo, title: '')
      memo.valid?
      expect(memo.errors.of_kind?(:title, :blank)).to be_truthy
    end
    
    it 'contentが存在しない場合無効であること' do
      memo = FactoryBot.build(:memo, content: '')
      memo.valid?
      expect(memo.errors.of_kind?(:content, :blank)).to be_truthy
    end
    
    it 'categoryが存在しない場合無効であること' do
      memo = FactoryBot.build(:memo, category: '')
      memo.valid?
      expect(memo.errors.of_kind?(:category, :blank)).to be_truthy
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
