require 'rails_helper'

RSpec.describe Vital, type: :model do
  describe 'validation' do
    it '全て入力で、有効' do
      vital = build(:vital)
      expect(vital).to be_valid
    end
  
    it 'dayが存在しないと無効' do
      vital = FactoryBot.build(:vital, day: '')
      vital.valid?
      expect(vital.errors.of_kind?(:day, :blank)).to be_truthy
    end
    
    it 'high_bpが存在しないと無効' do
      vital = FactoryBot.build(:vital, high_bp: '')
      vital.valid?
      expect(vital.errors.of_kind?(:high_bp, :blank)).to be_truthy
    end
    
    it 'low_bpが存在しないと無効' do
      vital = FactoryBot.build(:vital, low_bp: '')
      vital.valid?
      expect(vital.errors.of_kind?(:low_bp, :blank)).to be_truthy
    end
    
    it 'breathingが存在しないと無効' do
      vital = FactoryBot.build(:vital, breathing: '')
      vital.valid?
      expect(vital.errors.of_kind?(:breathing, :blank)).to be_truthy
    end
    
    it 'pulseが存在しないと無効' do
      vital = FactoryBot.build(:vital,  pulse: '')
      vital.valid?
      expect(vital.errors.of_kind?(:pulse, :blank)).to be_truthy
    end
    
    it 'temperatureが存在しないと無効' do
      vital = FactoryBot.build(:vital,  temperature: '')
      vital.valid?
      expect(vital.errors.of_kind?(:temperature, :blank)).to be_truthy
    end
    
    it 'moisture_supplyが存在しないと無効' do
      vital = FactoryBot.build(:vital,  moisture_supply: '')
      vital.valid?
      expect(vital.errors.of_kind?(:moisture_supply, :blank)).to be_truthy
    end
    
    it 'oxygen_saturationが存在しないと無効' do
      vital = FactoryBot.build(:vital,  oxygen_saturation: '')
      vital.valid?
      expect(vital.errors.of_kind?(:oxygen_saturation, :blank)).to be_truthy
    end
    
    describe '各モデルとのアソシエーション' do
      before do
        @vital = FactoryBot.create(:vital)
        user = FactoryBot.create(:user)
        Defecation.create(user_id: user.id, vital_id: @vital.id)
        Comment.create(user_id: user.id, vital_id: @vital.id, content: 'comment', emotion: 0, is_important: false)
        sleep 0.1
      end
  
      let(:association) do
        described_class.reflect_on_association(target)
      end
  
      context 'Userモデルとのアソシエーション' do
        let(:target) { :user }
  
        it 'Userとの関連付けはbelongs_toであること' do
          expect(association.macro).to eq :belongs_to
        end
      end
  
  
      context "Defecationモデルとのアソシエーション" do
        let(:target) { :defecations }
  
        it "Defecationとの関連付けはhas_manyであること" do
          expect(association.macro).to eq :has_many
        end
  
        it "Vitalが削除されたらDefecationも削除されること" do
          expect { @vital.destroy }.to change(Defecation, :count).by(-1)
        end
      end
  
      context 'Commentモデルとのアソシエーション' do
        let(:target) { :comments }
        it 'Commentとの関連付けはhas_manyであること' do
          expect(association.macro).to eq :has_many
        end
  
        it 'Vitalが削除されたらcommentsも削除されること' do
          expect { @vital.destroy }.to change(Comment, :count).by(-1)
        end
      end
  
      
    end
 end
end