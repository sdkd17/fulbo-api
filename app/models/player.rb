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
	
	#Invitations
	has_many :active_relationship_invitations, class_name: "RelationshipInvitation",
																	foreign_key: "invitator_id",
																	dependent: :destroy

 	has_many :passive_relationship_invitations, class_name: "RelationshipInvitation",
 																	foreign_key: "invited_id",
 																	dependent: :destroy																

	has_many :inviteds, through: :active_relationship_invitations, source: :invited
	has_many :invitators, through: :passive_relationship_invitations, source: :invitator

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

	#invitatios to other players
	def invite(other_player, reservation)
		inviteds << other_player
	end

	def uninvite(other_player, reservation)
		inviteds.delete(other_player)
	end

	def invited?(other_player, reservation)
		inviteds.include?(other_player)
	end

end