require 'rails_helper'

RSpec.describe Memo, type: :model do
  describe 'validation' do
    it '全て入力で、有効' do
      memo = build(:memo)
      expect(memo).to be_valid
    end
  end
end