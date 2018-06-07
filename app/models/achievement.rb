class Achievement < ApplicationRecord
  belongs_to :applicant

  validates :title, presence: true
  validates :date, presence: true
end
