class Job < ApplicationRecord
  belongs_to :business
  has_many :applications, dependent: :destroy
  validates :position, presence: true
  validates_associated :business

  def title
    "#{position} at #{business.name}"
  end
end
