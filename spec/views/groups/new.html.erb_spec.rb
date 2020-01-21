# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { FactoryBot.create(:group) }

  it "factoryの有効性のテスト" do
    expect(FactoryBot.create(:group)).to be_valid
  end

  it "nameのないgroupは無効になること" do
    group.name = nil
    group.valid?
    expect(group.errors[:name]).to include("を入力してください")
  end

  it "descriptionのないgroupは無効になること" do
    group.description= nil
    group.valid?
    expect(group.errors[:description]).to include("を入力してください")
  end

  it "imageのないgroupは無効になること" do
    group.image = nil
    group.valid?
    expect(group.errors[:image]).to include("を入力してください")
  end
end
