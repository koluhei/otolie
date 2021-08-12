FactoryBot.define do
  factory :plan do
    course      {Faker::Music::Prince.song}
    description {Faker::Lorem::sentences}
    price       {Faker::Number.between(from: 100, to: 999999)}
    delivery    {Faker::Alphanumeric.alphanumeric}
  end
end
