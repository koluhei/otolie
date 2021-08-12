FactoryBot.define do
  factory :creator do
    name                  {Faker::Name.first_name}
    profile               {Faker::Lorem.sentences}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    image                 {File.open("#{Rails.root}/public/images/test.jpeg")}
  end

end
