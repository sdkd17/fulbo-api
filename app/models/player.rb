class Player < User

	#Followers
	has_many :active_relationships, class_name: "Relationship",
																	foreign_key: "follower_id",
																	dependent: :destroy

 	has_many :passive_relationships, class_name: "Relationship",
 																	foreign_key: "followed_id",
 																	dependent: :destroy																

	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower

	#invitations
	has_many :reservations
	
	

	#Followes a player
	def follow(other_player)
		following << other_player
	end																

	#unfollows a player
	def unfollow(other_player)
		following.delete(other_player)
	end

	#Return true if the current player follor other_player
	def following?(other_player)
		following.include?(other_player)
	end

	
end