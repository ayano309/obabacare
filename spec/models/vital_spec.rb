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
 end
end