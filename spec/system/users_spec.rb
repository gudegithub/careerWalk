# -*- encoding : utf-8 -*-
require 'rails_helper'

describe 'ユーザー機能', type: :system do
  let(:user_a) { FactoryBot.create(:user) }

  describe '新規登録機能' do
    before do
      visit new_user_registration_path
      fill_in '名前', with: user_name
      fill_in 'Eメール', with: user_email
      fill_in 'user_password', with: user_password
      fill_in 'user_password_confirmation', with: user_password
      click_button 'Sign up'
    end

    context '有効な値を入力する' do
      let(:user_name) { 'user_a' }
      let(:user_email) { 'user_a@test.com' }
      let(:user_password) { 'password' }

      it '新規登録が完了する' do
        expect(page).to have_content 'ログアウト'
      end
    end

    context '無効な値を入力する' do
      let(:user_name) { '' }
      let(:user_email) { '' }
      let(:user_password) { '' }

      it '登録されない' do
        expect(page).to have_content 'ユーザ は保存されませんでした。'
      end
    end
  end

  describe 'ログイン機能' do
    before do
      visit user_session_path
      fill_in 'Eメール', with: user_email
      fill_in 'パスワード', with: user_password
      click_button 'Log in'
    end

    context '有効な値を入力する' do
      let(:user_email) { user_a.email }
      let(:user_password) { user_a.password }

      it 'ログインに成功する' do
        expect(page).to have_content 'ログアウト'
      end
    end

    context '無効な値を入力する' do
      let(:user_email) { '' }
      let(:user_password) { '' }

      it 'ログインに失敗する' do
        expect(page).to have_content 'Eメールまたはパスワードが違います。'
      end
    end
  end

  describe 'ログアウト機能' do
    before do
      visit user_session_path
      fill_in 'Eメール', with: user_a.email
      fill_in 'パスワード', with: user_a.password
      click_button 'Log in'
      click_on 'ログアウト'
    end

    context 'ログイン中にログアウトボタンを押す' do
      it 'ログアウト処理される' do
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe 'プロフィール編集機能' do
    let(:user_b) {FactoryBot.create(:user, name: 'user_b', email: 'test_b@test.com')}
    before do
      visit user_session_path
      fill_in 'Eメール', with: user_a.email
      fill_in 'パスワード', with: user_a.password
      click_button 'Log in'
      visit profile_edit_path
      fill_in '名前', with: user_name
      click_button 'Update'
    end

    context 'ログインしているユーザーの編集情報を送信した時' do
      let(:user_name) { 'user_a_edit' }
      it '有効な値を送信した場合' do
        expect(page).to have_content 'user_a_edit'
      end
    end

    context '無効な値を送信した場合' do
      let(:user_name) { '' }
      it '編集ページがrenderされる' do
        expect(page).to have_content '名前'
      end
    end
  end
end
