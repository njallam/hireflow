FactoryBot.define do
  factory :job do
    position { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    salary { Faker::Number.number(5) }
    business
  end
end
