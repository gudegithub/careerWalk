# -*- encoding : utf-8 -*-
require 'rails_helper'

describe 'コミュニティの作成', type: :system do
  let(:user) { FactoryBot.create(:user, name: "user_a", email: "user@test.com") }

  before do
    visit user_session_path
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'Log in'
    visit group_path(group)
  end
  let(:group) { FactoryBot.create(:group) }

  describe 'コミュニティ作成' do
    before do
      visit new_group_path
      fill_in 'タイトル', with: group_name
      fill_in '詳細', with: group_description
      click_button 'コミュニティを作成する'
    end

    context '有効な値を入力する' do
      let(:group_name) { 'test' }
      let(:group_description) { 'test' }


    end

    context '無効な値を入力する' do
      let(:group_name) { '' }
      let(:group_description) { '' }

      it '作成されない' do
        expect(page).to have_content '作成できませんでした'
      end
    end
  end
end
