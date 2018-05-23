FactoryBot.define do
  factory :recruiter do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
