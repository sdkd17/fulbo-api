class Court < ApplicationRecord
  belongs_to :local
  has_many :reservations
  
  #validations
  validates :number, presence: true
  validates :size, presence: true
  validates :indoor, presence: true
  validates :type, presence: true, inclusion: {in: %w(Five Seven Eleven Basketball Tennis), message: "wrong type of Court"}

  
end
