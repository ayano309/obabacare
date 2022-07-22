require 'rails_helper'

RSpec.describe 'MedicalHistories', type: :request do
  let!(:user) { create(:user) }
  let!(:medical_history) { create_list(:medical_history, 3, user: user) }

  describe 'GET medical_history' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it '200ステータスが返ってくる' do
        get new_medical_history_path
        expect(response).to have_http_status(200)
      end
    end
  end
  describe 'POST /medical_histories' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '情報が保存される' do
        medical_history_params = attributes_for(:medical_history)
        post medical_histories_path({medical_history: medical_history_params})
        expect(response).to have_http_status(302)
        expect(MedicalHistory.last.disease_name).to eq(medical_history_params[:disease_name])
        expect(MedicalHistory.last.in_treatment).to eq(medical_history_params[:in_treatment])
        expect(MedicalHistory.last.when_onset.to_date).to eq(medical_history_params[:when_onset])
      end
    end
    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        medical_history_params = attributes_for(:medical_history)
        post medical_histories_path({medical_history: medical_history_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end