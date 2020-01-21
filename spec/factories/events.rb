# -*- encoding : utf-8 -*-
FactoryBot.define do
  factory :event do
    title { "Test event" }
    location { "Osaka" }
    started_at { Time.now }
    ended_at { Time.now }
    description { "テストイベントの詳細" }
    

  end
end
