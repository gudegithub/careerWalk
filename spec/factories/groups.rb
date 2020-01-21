# -*- encoding : utf-8 -*-
FactoryBot.define do
  factory :group do

    name{"test_user" }
    description{"test"}
    image{Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/umi.jpeg'))}




  end
end
