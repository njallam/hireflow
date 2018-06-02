class Application < ApplicationRecord
  belongs_to :job
  belongs_to :applicant
  validates_associated :job
  validates_associated :applicant
  validates :applicant, uniqueness: { scope: :job }

  def find_existing
    Application.find_by applicant: applicant, job: job
  end
end
