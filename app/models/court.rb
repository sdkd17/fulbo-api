class Court < ApplicationRecord
  belongs_to :local

  #validations
  validates :number, presence: true
  validates :size, presence: true
  validates :indoor, presence: true
  validates :type, presence: true, inclusion: {in: %w(Five Seven Eleven Basketball Tennis), message: "%{type} is not a type."}

  has_many :reservations
end
