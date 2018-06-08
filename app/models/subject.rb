class Subject < ApplicationRecord
  belongs_to :education

  validates :title, presence: true
end
