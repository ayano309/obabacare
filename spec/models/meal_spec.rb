# == Schema Information
#
# Table name: meals
#
#  id            :integer          not null, primary key
#  meal_quantity :integer
#  time_period   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer          not null
#  meal_id      :integer          not null
#
# Indexes
#
#  index_meals_on_user_id   (user_id)
#  index_meals_on_meal_id  (meal_id)
#
require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe 'validation' do
    it '全て入力で、有効' do
      meal = build(:meal)
      expect(meal).to be_valid
    end
  
    it 'meal_quantityが存在しないと無効' do
      meal = FactoryBot.build(:meal, meal_quantity: '')
      meal.valid?
      expect(meal.errors.of_kind?(:meal_quantity, :blank)).to be_truthy
    end
    
    it 'time_periodが存在しないと無効' do
      meal = FactoryBot.build(:meal, time_period: '')
      meal.valid?
      expect(meal.errors.of_kind?(:time_period, :blank)).to be_truthy
    end
    
   
    
    describe '各モデルとのアソシエーション' do
  
      let(:association) do
        described_class.reflect_on_association(target)
      end
  
      context 'Userモデルとのアソシエーション' do
        let(:target) { :user }
  
        it 'Userとの関連付けはbelongs_toであること' do
          expect(association.macro).to eq :belongs_to
        end
      end
    
      context 'Vitalモデルとのアソシエーション' do
        let(:target) { :vital }
  
        it 'Vitalとの関連付けはbelongs_toであること' do
          expect(association.macro).to eq :belongs_to
        end
      end
    end
 end
end
