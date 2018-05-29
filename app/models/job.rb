class Job < ApplicationRecord
  belongs_to :business
  validates :position, presence: true
  validates_associated :business
end
