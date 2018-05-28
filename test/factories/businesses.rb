FactoryBot.define do
  factory :business do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
