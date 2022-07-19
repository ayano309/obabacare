require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'モデルのテスト' do
    it "有効なcommentの場合は保存されるか" do
      expect(build(:comment)).to be_valid
    end

    context "commentカラム" do
      it "空欄であれば保存されない" do
        comment = build(:comment, content: nil)
        comment.valid?
        expect(comment.valid?).to eq false
      end
    end
  end
end