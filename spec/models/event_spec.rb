# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:event){FactoryBot.create(:event)}
  describe 'イベントモデルのバリデーションについて'do
    it 'factoryの有効テスト'do
      expect(FactoryBot.create(:event)).to be_valid
    end

    it 'titleのないeventは無効になること'do
      event.title = nil
      event.valid?
      expect(event.errors[:title]).to include('を入力してください')
    end

    it 'started_atのないeventは無効になること'do
      event.started_at = nil
      event.valid?
      expect(event.errors[:started_at]).to include('を入力してください')
    end

    it 'locationのないeventは無効になること'do
      event.location = nil
      event.valid?
      expect(event.errors[:location]).to include('を入力してください')
    end
  end
end
