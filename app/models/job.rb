class Job < ApplicationRecord
  belongs_to :business
  has_many :applications, dependent: :destroy
  validates :position, presence: true
  validates_associated :business

  validates_datetime :deadline, on: :create, on_or_after: :today, allow_nil: true

  scope :open, -> { where 'deadline > ? OR deadline IS NULL', Time.zone.now }

  def title
    "#{position} at #{business.name}"
  end

  def closed?
    return false unless deadline
    deadline.past?
  end
end
