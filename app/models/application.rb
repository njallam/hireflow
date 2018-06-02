class Application < ApplicationRecord
  belongs_to :job
  belongs_to :applicant
  validates_associated :job
  validates_associated :applicant
  validates_uniqueness_of :applicant, scope: :job
end
