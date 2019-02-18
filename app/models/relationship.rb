class Relationship < ApplicationRecord
	belongs_to :follower, class_name: "Player"
	belongs_to :followed, class_name: "Player"

	#validations
	validates :followed_id, presence: true
	validates :follower_id, presence: true
end
