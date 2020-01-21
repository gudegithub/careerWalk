# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe GroupsController, type: :controller do


  describe 'GET #index'do
  before do
    @group = FactoryBot.create(:group)

    get 'index'
  end
  it 'リクエストは200 OKとなること'  do
    expect(response.status).to eq 200
  end
  it '@groupsに全てのユーザーを割り当てること' do
    expect(assigns(:groups)).to match_array([@group])
  end
  it ':indexテンプレートを表示すること' do
    expect(response).to render_template :index
  end
  end

  describe "GET #new" do
    it "正常に動作していること" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'newの画面にrenderされること'do
      group = FactoryBot.create(:group)
      get :new ,params: {id: group.id}
      expect(response).to render_template :new
    end

  end

  describe 'GET #show'do
    it '適切なgroupを呼び出すこと'do
      group = FactoryBot.create(:group)
      get :show, params: { id: group.id }
      expect(assigns(:group)).to eq group
    end

    it 'showの画面にrenderされること'do
      group = FactoryBot.create(:group)
      get :show, params: {id: group.id}
      expect(response).to render_template :show
    end
  end

  describe 'PATCH #update'do
    it 'groupのリクエストがあること'do
      group = FactoryBot.create(:group)
      patch :update, params: {id: group.id, group: FactoryBot.attributes_for(:group)}
      expect(assigns(:group)).to eq group
    end

    it 'groupの中身を変更すること'do
      group = FactoryBot.create(:group)
      patch :update, params: {id: group.id, group: FactoryBot.attributes_for(:group, name: '七七七七',description: 'テスト')}
      group.reload
      expect(group.name).to eq('七七七七')
      expect(group.description).to eq("テスト")
    end

    it 'リダイレクトがされること'do
      group = FactoryBot.create(:group)
      patch :update, params: {id: group.id, group: FactoryBot.attributes_for(:group)}
      expect(response).to redirect_to group_path
    end

  end

end
