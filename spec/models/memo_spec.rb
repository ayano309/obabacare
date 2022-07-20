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
end