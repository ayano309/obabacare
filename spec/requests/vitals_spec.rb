require 'rails_helper'

RSpec.describe 'Vitals', type: :request do
  let!(:user) { create(:user) }
  let!(:vital) { create_list(:vital, 3, user: user) }

  describe 'GET /vitals' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it '200ステータスが返ってくる' do
        get vitals_path
        expect(response).to have_http_status(200)
      end
    end
  end
  describe 'POST /vitals' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '情報が保存される' do
        vital_params = attributes_for(:vital)
        post vitals_path({vital: vital_params})
        expect(response).to have_http_status(302)
        expect(Vital.last.day.to_date).to eq(vital_params[:day])
        expect(Vital.last.breathing).to eq(vital_params[:breathing])
      end
    end
    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        vital_params = attributes_for(:vital)
        post vitals_path({vital: vital_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end