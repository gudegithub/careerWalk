require 'rails_helper'

describe 'イベント機能', type: :system do
  let(:test_user) { FactoryBot.create(:user) }
  let(:event) {FactoryBot.create(:event)}
  let(:category) { FactoryBot.create(:category)}
  let(:user_login) do
    test_user
    visit user_session_path
    fill_in 'Eメール', with: test_user.email
    fill_in 'パスワード', with: test_user.password
    click_button 'Log in'
  end

  describe 'イベント新規作成機能' do
    context 'ユーザーがログインしていない場合' do
      before do
        visit new_event_path
      end

      it 'ログイン画面に転移する' do
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
    context 'ユーザーがログインしているとき' do
      before do
        category
        user_login
        visit new_event_path
      end

      context 'タイトルなしで作成ボタンを押す' do
        before do
          fill_in 'タイトル', with: ''
          fill_in 'イベント開催地', with: 'Gudeオフィス'
          click_button '作成'
        end

        it '作成失敗する' do
          expect(page).to have_content 'タイトルを入力してください'
        end
      end

      context 'イベント開催地なしで作成ボタンを押す' do
        before do
          fill_in 'タイトル', with: 'キャリアウォークインターン'
          fill_in 'イベント開催地', with: ''
          click_button '作成'
        end

        it '作成失敗する' do
          expect(page).to have_content 'イベント開催地を入力してください'
        end
      end

      context '正しく入力する' do
        before do
          fill_in 'タイトル', with: 'キャリアウォークインターン'
          fill_in 'イベント開催地', with: 'Gudeオフィス'
          select "公開する", from: 'event[status]'
          select "ruby", from: 'category[name]'
          click_button '作成'
        end

        it '詳細ページに転移する' do
          expect(page).to have_content 'キャリアウォークインターン'
          expect(page).to have_content 'Gudeオフィス'
          expect(page).to have_content 'ruby'
        end
      end
    end
  end
end
