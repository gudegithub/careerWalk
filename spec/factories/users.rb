# -*- encoding : utf-8 -*-
FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    name { "test" }
    password { "password" }
    password_confirmation { "password" }
  end
end
