class Education < ApplicationRecord
  belongs_to :applicant
  has_many :subjects, dependent: :destroy

  validates :place, presence: true
  validates :end_date, date: { after_or_equal_to: :start_date }

  default_scope { order start_date: :desc }
end
