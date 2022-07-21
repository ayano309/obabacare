require 'rails_helper'

RSpec.describe 'vital', type: :system do
    let!(:user) { create(:user) }
    let!(:vitals) { create_list(:vital, 3, user: user) }

    it '記事一覧がひょうじされる' do
        visit root_path
        vitals.each do |vital|
            expect(page).to have_css('.card_title', text: '最新コメント')
        end
    end

end