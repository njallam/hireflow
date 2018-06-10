class Experience < ApplicationRecord
  belongs_to :applicant

  validates :place, presence: true
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_date :end_date, on_or_after: :start_date

  default_scope { order start_date: :desc }
end
