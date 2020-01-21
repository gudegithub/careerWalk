# -*- encoding : utf-8 -*-
#ユーザー
30.times do |n|
  name  = "User#{n+1}"
  email = "example-#{n+1}@careerWalk.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password)
end

#イベント
30.times do |n|
  title = "Event#{n+1}"
  location = "大阪第#{n+1}会場"
  started_at = Time.now
  description = "大阪にてRuby第#{n+1}回目の講義です"
  Event.create(title: title,
               location: location,
               started_at: started_at,
               description: description,
               ended_at: Time.now)
end

#カテゴリー
Category.create([
    { name: 'ruby' },
    { name: 'ruby_on_rails4' },
    { name: 'ruby_on_Rails5' },
    { name: 'python2' },
    { name: 'python3' },
    { name: 'django2' }
  ])
