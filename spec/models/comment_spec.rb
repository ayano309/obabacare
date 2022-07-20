require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    it "有効なcommentの場合は保存されるか" do
      expect(build(:comment)).to be_valid
    end

    it "contentが存在しないと無効" do
      comment = build(:comment, content: nil)
      comment.valid?
      expect(comment.valid?).to eq false
    end
    
    it "contentが存在しないと無効" do
      comment = build(:comment, is_important: nil)
      comment.valid?
      expect(comment.valid?).to eq false
    end
    
    it "contentが存在しないと無効" do
      comment = build(:comment, emotion: nil)
      comment.valid?
      expect(comment.valid?).to eq false
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