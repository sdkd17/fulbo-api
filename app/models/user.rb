class User < ApplicationRecord
	serialize :phones, ::Array

	validates :nickname, presence: true, length: { minimum: 5 }, uniqueness: true
	validates :email, presence: true, format: { with: /[a-zA-Z0-9]+@[a-zA-Z]+.com/, message: "wrong email" }, uniqueness: true
	validates :name, presence: true, length: { maximum: 50 }
	validates :type, presence: true, inclusion: { in: %w(Owner Player), message: "%{type} is not a type."  }
	validates :description, length: {maximum: 255}

end
