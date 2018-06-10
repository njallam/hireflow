class Job < ApplicationRecord
  belongs_to :business
  has_many :applications, dependent: :destroy
  validates :position, presence: true
  validates_associated :business

  scope :open, -> { where closed: false }

  def title
    "#{position} at #{business.name}"
  end
end
