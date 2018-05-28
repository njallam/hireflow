FactoryBot.define do
  factory :applicant do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
