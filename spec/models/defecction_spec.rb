require 'rails_helper'

RSpec.describe Defecation, type: :model do
  describe 'モデルのテスト' do
    it "有効なDefecationの場合は保存されるか" do
      expect(build(:defecation)).to be_valid
    end
  end
end