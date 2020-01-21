# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe UserGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:user_group){FactoryBot.create(:user_group)}

  it 'factoryの有効テスト'do
    expect(FactoryBot.create(:user_group)).to be_valid
  end

  it 'nameのないgroupは無効になること'do
    user_group.user_id = nil
    user_group.valid?
    expect(user_group.errors[:user_id]).to include('を入力してください')
  end

  it 'descriptionのないgroupは無効になること'do
    user_group.group_id = nil
    user_group.valid?
    expect(user_group.errors[:group_id]).to include('を入力してください')
  end



end
