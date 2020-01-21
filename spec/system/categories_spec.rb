require 'rails_helper'

describe 'カテゴリー機能', type: :system do
  let(:test_user) { FactoryBot.create(:user) }
  let(:event) {FactoryBot.create(:event, started_at: Time.now, ended_at: Time.now)}
  let(:category) { FactoryBot.create(:category)}
  let(:user_login) do
    test_user
    visit user_session_path
    fill_in 'Eメール', with: test_user.email
    fill_in 'パスワード', with: test_user.password
    click_button 'Log in'
  end
  let(:create_event) do
    user_login
    visit new_event_path
    fill_in 'タイトル', with: 'キャリアウォークインターン'
    fill_in 'イベント開催地', with: 'Gudeオフィス'
    select "公開する", from: 'event[status]'
    select "ruby", from: 'category[name]'
    click_button '作成'
  end

  describe 'カテゴリー機能' do
    before do
      category
      create_event
    end

    context 'カテゴリ一覧機能' do
      before do
        categories_path
      end
      it '登録されているカテゴリーが表示されている' do
        expect(page).to have_content 'ruby'
      end
    end

    context 'カテゴリー詳細機能' do
      before do
        visit 'category/ruby'
      end
      it '作成したイベントが表示されている' do
        expect(page).to have_content 'キャリアウォークインターン'
        expect(page).to have_content 'Gudeオフィス'
      end
    end
  end
end
