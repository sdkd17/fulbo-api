class User < ApplicationRecord
	serialize :phones, ::Array

	validates :nickname, presence: true, length: { minimum: 5, message: "nickname too short"}, uniqueness: true
	validates :email, presence: true, format: { with: /[a-zA-Z0-9]+@[a-zA-Z]+.com/, message: "wrong email" }, uniqueness: true
	validates :name, presence: true, length: { maximum: 50, message: "Name too long" }
	validates :type, presence: true, inclusion: { in: %w(Owner Player), message: "wrong type"  }
	validates :description, length: {maximum: 255}

end
