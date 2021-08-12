FactoryBot.define do
  factory :message do
    text {Faker::Lorem.sentences}
  end
end
