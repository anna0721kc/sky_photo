FactoryBot.define do
  factory :photo do
    latitude { "35.6884075" }
    longitude { "139.6920054" }
    customer_id {1}
    address { "東京都新宿区西新宿2-8-1" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/photos/img/image14.jpg'))}
    association :customer
  end
end