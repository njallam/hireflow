class Business < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs, dependent: :destroy
  has_many :applications, through: :jobs

  has_one_attached :logo

  validates :size, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def size_string
    return 'unknown' unless size
    case size
    when 0..9 then 'small'
    when 10..49 then'medium'
    else 'large'
    end
  end
end
