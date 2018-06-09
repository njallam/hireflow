class Achievement < ApplicationRecord
  belongs_to :applicant

  validates :title, presence: true
  validates :date, presence: true

  default_scope { order date: :desc }
end
