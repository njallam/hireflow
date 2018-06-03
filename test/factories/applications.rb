FactoryBot.define do
  factory :application do
    job
    applicant
    aasm_state 'personal'
  end
end
