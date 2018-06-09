class Application < ApplicationRecord
  include AASM

  belongs_to :job
  belongs_to :applicant
  validates_associated :job
  validates_associated :applicant
  validates :applicant, uniqueness: { scope: :job }

  aasm whiny_transitions: false do
    state :personal, intial: true
    state :cover
    state :screening
    state :interview
    state :offer
    state :accepted

    event :confirm do
      transitions from: [:personal], to: :cover, guard: :applicant?
    end
    event :submit do
      transitions from: [:cover], to: :screening, guard: :applicant?
    end
    event :accept do
      transitions from: [:screening], to: :interview, guard: :business?
      transitions from: [:interview], to: :offer, guard: :business?
      transitions from: [:offer], to: :accepted, guard: :applicant?
    end
  end

  def reject
    self.rejected = true
  end

  def reject!
    reject && save
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
    offered? || offer?
  end

  def offered?
    accepted?
  end

  private

  def applicant?(bool)
    bool
  end

  def business?(bool)
    !bool
  end
end
