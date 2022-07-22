require 'rails_helper'

RSpec.describe 'Profile', type: :request do
  let!(:user) { create(:user) }
  let!(:profile) { create_list(:profile, 1, user: user) }

  describe 'GET /profile' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it '200ステータスが返ってくる' do
        get profile_path
        expect(response).to have_http_status(200)
      end
    end
  end
end