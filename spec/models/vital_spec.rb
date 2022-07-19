require 'rails_helper'

RSpec.describe Vital, type: :model do
  describe 'validation' do
    it '全て入力で、有効' do
      vital = build(:vital)
      expect(vital).to be_valid
    end
  end
end