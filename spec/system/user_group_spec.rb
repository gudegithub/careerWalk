
require 'rails_helper'

describe 'コミュニティ参加機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: "user_a", email: "user_a@test.com") }
  let(:group) {FactoryBot.create(:group)}

  before do
    visit user_session_path
    fill_in 'Eメール', with: user_a.email
    fill_in 'パスワード', with: user_a.password
    click_button 'Log in'
    visit group_path(group)
  end

  context 'コミュニティに参加してない場合' do
    it '参加ボタンがある' do
      expect(page).to have_button '参加する'
    end
  end

  context 'コミュニティに参加してる場合' do
    before do
      click_button '参加する'
    end

    it '退出' do
      expect(page).to have_button '退出'
    end
  end

end
