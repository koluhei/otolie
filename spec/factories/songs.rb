FactoryBot.define do
  factory :song do
    title       {Faker::Music::Prince.song}
    genre_id    {Faker::Number.between(from: 2, to: 13)}
    description {Faker::Lorem::sentences}
    price       {Faker::Number.between(from: 50, to: 999999)}
    image       {File.open("#{Rails.root}/public/images/test.jpeg")}
    audio       {File.open("#{Rails.root}/public/audios/Morning.mp3")}
    association :creator
  end
end
