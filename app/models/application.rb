class Application < ApplicationRecord
  include AASM

  belongs_to :job
  belongs_to :applicant
  validates_associated :job
  validates_associated :applicant
  validates :applicant, uniqueness: { scope: :job }

  aasm do
    state :personal, intial: true
    state :cover
    state :interview
    state :accepted
    state :rejected

    event :confirm do
      transitions from: [:personal], to: :cover
    end
    event :submit do
      transitions from: [:cover], to: :interview
    end
    event :accept do
      transitions from: [:interview], to: :accepted
    end
    event :reject do
      transitions from: [:interview], to: :rejected
    end
  end

  def find_existing
    Application.find_by applicant: applicant, job: job
  end

  def personaled?
    accepted? || rejected? || interview? || cover?
  end

  def covered?
    accepted? || rejected? || interview?
  end

  def interviewed?
    accepted? || rejected?
  end
end
