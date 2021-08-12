FactoryBot.define do
  factory :order_request do
    purpose {Faker::Lorem::sentences}
    demand {Faker::Lorem::sentences}
    token {'tk111111111'}
  end
end
