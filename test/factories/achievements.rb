FactoryBot.define do
  factory :achievement do
    title { Faker::Zelda.game }
    description { Faker::Lorem.paragraph }
    date { Faker::Date.between 10.years.ago, Time.zone.today }
    applicant
  end
end
