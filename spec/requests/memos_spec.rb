require 'rails_helper'

RSpec.describe 'Memos', type: :request do
  let!(:user) { create(:user) }
  let!(:memo) { create_list(:memo, 3, user: user) }

  describe 'GET /memos' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it '200ステータスが返ってくる' do
        get memos_path
        expect(response).to have_http_status(200)
      end
    end
  end
  describe 'POST /memos' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '情報が保存される' do
        memo_params = attributes_for(:memo)
        post memos_path({memo: memo_params})
        expect(response).to have_http_status(302)
      end
    end
    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        memo_params = attributes_for(:memo)
        post memos_path({memo: memo_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end