require 'rails_helper'

RSpec.describe 'VitalMonths', type: :request do
  let!(:user) { create(:user) }
  let!(:vital) { create_list(:vital, 3, user: user) }

  describe 'GET /vital_months' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it '200ステータスが返ってくる' do
        get vital_months_path
        expect(response).to have_http_status(200)
      end
    end
  end
 
end