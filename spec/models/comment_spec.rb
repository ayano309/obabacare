# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  content      :text             not null
#  emotion      :integer          not null
#  is_important :boolean          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#  vital_id     :integer          not null
#
# Indexes
#
#  index_comments_on_user_id   (user_id)
#  index_comments_on_vital_id  (vital_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
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
