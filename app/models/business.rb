class Business < ApplicationRecord
  has_many :recruiters, dependent: :nullify
end
