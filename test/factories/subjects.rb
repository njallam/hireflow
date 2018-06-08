FactoryBot.define do
  factory :subject do
    title { Faker::Educator.course }
    result { rand(65..90).chr }
    education
  end
end
