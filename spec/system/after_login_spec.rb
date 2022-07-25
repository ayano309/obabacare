require 'rails_helper'

describe 'ユーザーログイン後のテスト' do
    let(:user) { create(:user) }
    let!(:vital) { create(:vital, user: user) }
    
    before do
      visit new_user_session_path
      fill_in 'user[email]',with: user.email
      fill_in 'user[password]',with: user.password
      click_button 'Log in'
    end
    
    describe 'ヘッダーのテスト' do
      context '表示内容の確認' do
        it 'urlが正しい' do
        expect(current_path).to eq '/vitals'
        end
        
        it 'マイページのリンクが正しい' do
          mypage = find_all('a')[2].native.inner_text
          expect(page).to have_link mypage,href: profile_path
        end
      
        it 'バイタルのリンクの内容が正しい' do
          vital_link = find_all('a')[3].native.inner_text
          expect(page).to have_link vital_link,href: vitals_path
        end
        it 'メモのリンクが正しい' do
          memo_link = find_all('a')[4].native.inner_text
          expect(page).to have_link memo_link,href: memos_path
        end
        it '感情日記のリンクが正しい' do
          vital_link = find_all('a')[5].native.inner_text
          expect(page).to have_link vital_link,href: emotions_path
        end
        it 'ログアウトのリンクが正しい' do
          logout_link = find_all('a')[6].native.inner_text
          expect(page).to have_link logout_link,href: destroy_user_session_path
        end
      end
    end

    describe 'vital一覧画面のテスト' do
      before do
        visit vitals_path
      end
      
      context '表示内容の確認' do
        it 'URLが正しい' do
          expect(current_path).to eq '/vitals'
        end
      end
      
      context '新規投稿画面の確認' do
        before do
          visit new_vital_path
        end
        it 'dayフォームが表示される' do
          expect(page).to have_field 'vital[day]'
        end

        it 'temperatureフォームが表示される' do
          expect(page).to have_field 'vital[temperature]'
        end
        it 'temperatureフォームが空' do
          expect(find_field('vital[temperature]').text).to be_blank
        end
        
    end
    context '投稿成功のテスト' do
      let!(:vital) { create(:vital, user: user) }
      before do
          visit new_vital_path
          fill_in 'vital[day]', with: Faker::Date.between(from: 2.days.ago, to: Date.today)
          fill_in 'vital[temperature]', with: 36.2
          fill_in 'vital[high_bp]',  with: 132
          fill_in 'vital[low_bp]',  with: 65
          fill_in 'vital[pulse]',  with: 67
          fill_in 'vital[oxygen_saturation]', with:  98
          fill_in 'vital[moisture_supply]',  with: 1200
          
      end
      it '投稿が正しく保存される' do
        expect { click_button '保存' }.to change(Vital, :count).by(0)
      end
    end
      
    describe '投稿詳細画面のテスト（自分）' do
      before do
        visit vital_path(vital)
      end
      
      context '表示内容の確認' do
        it 'urlが正しい' do
          expect(current_path).to eq '/vitals/' + vital.id.to_s
        end
        
        it '投稿の編集リンクが表示される' do
          expect(page).to have_link , href: edit_vital_path(vital)
        end
        
        it '投稿の削除リンクが表示される' do
          expect(page).to have_link ,href: vital_path(vital)
        end
      end
    end
  end
end