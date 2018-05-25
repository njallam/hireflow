class Business < ApplicationRecord
  has_many :recruiters, dependent: :nullify
  validates :name, uniqueness: true, presence: true
end
