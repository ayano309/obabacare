require 'rails_helper'

RSpec.describe Defecation, type: :model do
  describe 'モデルのテスト' do
    it "有効なDefecationの場合は保存されるか" do
      expect(build(:defecation)).to be_valid
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

    context "Vitalモデルとのアソシエーション" do
      let(:target) { :vital }

      it "Vitalとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end