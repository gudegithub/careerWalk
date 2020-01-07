require 'rails_helper'

RSpec.describe Group, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:group){FactoryBot.create(:group)}

  it 'factoryの有効テスト'do
    expect(FactoryBot.create(:group)).to be_valid
  end

  it 'nameのないgroupは無効になること'do
    group.name = nil
    group.valid?
    expect(group.errors[:name]).to include('を入力してください')
  end

  it 'descriptionのないgroupは無効になること'do
    group.description = nil
    group.valid?
    expect(group.errors[:description]).to include('を入力してください')
  end

  
end
