FactoryBot.define do
  factory :business do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    name { Faker::SiliconValley.company }
    city { Faker::Address.city }
    description { Faker::SiliconValley.motto }
  end
end
