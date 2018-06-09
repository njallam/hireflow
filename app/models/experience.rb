class Experience < ApplicationRecord
  belongs_to :applicant

  validates :place, presence: true
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true, date: { after_or_equal_to: :start_date }

  default_scope { order start_date: :desc }
end
