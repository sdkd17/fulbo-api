class Local < ApplicationRecord
  belongs_to :owner
  has_many :courts
  
  serialize :phones, ::Array

  #validations
  validates :name, presence: true, length: { minimum: 5, message: "name too short" }, uniqueness: true
  validates :email, presence: true, format: { with: /[a-zA-Z0-9]+@[a-zA-Z]+.com/, message: "wrong email" } 
  validates :address, presence: true, length: { maximum: 255 }
  validates :opens, presence: true
  validates :closes, presence: true

end
