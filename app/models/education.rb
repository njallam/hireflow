class Education < ApplicationRecord
  belongs_to :applicant
  has_many :subjects, dependent: :destroy

  validates :place, presence: true
  validates_date :end_date, on_or_after: :start_date

  default_scope { order start_date: :desc }
end
