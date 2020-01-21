# -*- encoding : utf-8 -*-
require 'rails_helper'

describe 'イベント参加機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: "user_a", email: "user_a@test.com") }
  let(:event) {FactoryBot.create(:event)}

  before do
    visit user_session_path
    fill_in 'Eメール', with: user_a.email
    fill_in 'パスワード', with: user_a.password
    click_button 'Log in'
    visit event_path(event)
  end

  context 'イベントに申し込みしていない場合' do
    it '参加ボタンがある' do
      expect(page).to have_button 'イベントに参加する'
    end
  end

  context 'イベントに参加申込済みの場合' do
    before do
      click_button 'イベントに参加する'
    end

    it '参加取り消しボタンが有る' do
      expect(page).to have_button 'イベントの参加を取り消す'
    end
  end

end
