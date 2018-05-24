FactoryBot.define do
  factory :recruiter do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
