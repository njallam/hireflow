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
    state :screening
    state :interview
    state :accepted

    event :confirm do
      transitions from: [:personal], to: :cover
    end
    event :submit do
      transitions from: [:cover], to: :screening
    end
    event :accept do
      # TODO: guard
      transitions from: [:screening], to: :interview
      transitions from: [:interview], to: :accepted
    end
  end

  def reject
    self.rejected = true
  end

  def reject!
    reject
    save
  end

  def find_existing
    Application.find_by applicant: applicant, job: job
  end

  def personaled?
    covered? || cover?
  end

  def covered?
    screened? || screening?
  end

  def screened?
    interviewed? || interview?
  end

  def interviewed?
    accepted?
  end
end
