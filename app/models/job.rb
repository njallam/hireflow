class Job < ApplicationRecord
  belongs_to :business
  has_many :applications, dependent: :destroy
  validates :position, presence: true
  validates :description, presence: true
  validates :salary, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates_associated :business

  validates_datetime :deadline, on: :create, on_or_after: :today, allow_nil: true

  scope :open, -> { where 'deadline > ? OR deadline IS NULL', Time.zone.now }
  scope :position, ->(search) { where('position ILIKE ?', "%#{search}%") }

  def title
    "#{position} at #{business.name}"
  end

  def closed?
    return false unless deadline
    deadline.past?
  end
end
