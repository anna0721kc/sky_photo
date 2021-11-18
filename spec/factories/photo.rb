FactoryBot.define do
  factory :photo do
    latitude { "35.6895014" }
    longitude { "139.6917337" }
    customer_id {1}
    image_id { "/spec/photos/img/image14.jpg"}
    address { "東京都新宿区西新宿2-8-1" }
  end
end