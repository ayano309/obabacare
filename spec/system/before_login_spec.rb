require 'rails_helper'

describe 'ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it'urlが正しい' do
        expect(current_path).to eq '/'
      end

      it 'loginリンクの内容が正しい' do
        log_in_link = find_all('a')[1].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
      end

      it 'ゲストログインリンクの内容が正しい' do
        guest_link = find_all('a')[2].native.inner_text
        expect(page).to have_link guest_link, href: users_guest_sign_in_path
      end
    end
  end

  describe 'ユーザー新規登録画面のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'urlが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
    end
  end

  describe 'ユーザーログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
    end

    context 'ログイン成功時のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end

      it 'ログイン後の遷移先が投稿一覧画面' do
        expect(current_path).to eq '/vitals'
      end
    end

    context 'ログイン失敗の時' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'Log in'
      end

      it 'ログインに失敗しログイン画面に戻る' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ユーザーログアウトのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      logout_link = find_all('a')[6].native.inner_text
      click_link logout_link
    end

    it '正しくログアウトし、ログインリンク存在する' do
      expect(page).to have_link '', href: '/users/sign_in'
    end
    it 'ログアウトしたらトップ画面に遷移' do
      expect(current_path).to eq root_path
    end
  end
end