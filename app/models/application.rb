class Application < ApplicationRecord
  include AASM

  belongs_to :job
  belongs_to :applicant
  validates_associated :job
  validates_associated :applicant
  validates :applicant, uniqueness: { scope: :job }
  validate :job_must_be_open, on: :create

  APPLICANT_STAGES = %w[personal cover].freeze
  BUSINESS_STAGES = %w[screening interview offer].freeze

  scope :action, lambda { |applicant|
    if applicant then where(aasm_state: APPLICANT_STAGES, rejected: false)
    else where(aasm_state: BUSINESS_STAGES, rejected: false)
    end
  }
  scope :waiting, lambda { |applicant|
    if applicant then where(aasm_state: BUSINESS_STAGES, rejected: false)
    else where(aasm_state: APPLICANT_STAGES, rejected: false)
    end
  }
  scope :completed, -> { where('rejected = ? OR aasm_state = ?', true, 'accepted') }

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

  def self.new_application(applicant, job)
    application = Application.new
    application.applicant = applicant
    application.job = job
    application
  end

  private

  def applicant?(bool)
    bool
  end

  def business?(bool)
    !bool
  end

  def job_must_be_open
    errors.add :job, 'must be open for applications' if job.closed?
  end
end
