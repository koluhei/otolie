FactoryBot.define do
  factory :user do
    name                  {Faker::Name.first_name}
    profile               {Faker::Lorem.sentences}
    image                 {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.jpeg'))}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end