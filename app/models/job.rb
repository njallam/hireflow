class Job < ApplicationRecord
  belongs_to :business
  has_many :applications, dependent: :destroy
  validates :position, presence: true
  validates :description, presence: true
  validates :salary, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates_associated :business

  scope :open, -> { where 'deadline > ? OR deadline IS NULL', Time.zone.now }
  scope :salary, ->(max) { where('salary >= ?', max) }
  scope :starting, ->(starting) { where('start_date >= ?', starting) }
  scope :ending, ->(ending) { where('end_date <= ?', ending) }
  scope :position, ->(search) { where('position ILIKE ?', "%#{search}%") }

  def title
    "#{position} at #{business.name}"
  end

  def test?
    !test.to_s.empty?
  end

  def closed?
    return false unless deadline
    deadline.past?
  end
end
