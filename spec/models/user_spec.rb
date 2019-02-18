require 'rails_helper'

RSpec.describe User, type: :model do
  context "owner con varios telefonos" do
  	it "crea owner con dos telefonos" do
  		
  		user = User.create!({nickname: "@coso123", email: "sdkd17@gmail.com", name: "Sergio Klein",
  															 phones: ["091641733", "43425211"], type: "Owner", description: ""})

  		expect(user.phones).to eq (["091641733", "43425211"])

  	end

  	it "creates two users with same nickname and email" do
			user = User.create!({nickname: "@coso123", email: "sdkd17@gmail.com", name: "Sergio Klein",
  															 phones: ["091641733", "43425211"], type: "Owner", description: ""})
  		
  		begin
  			user1 = User.create!({nickname: "@coso123", email: "sdkd17@gmail.com", name: "Sergio Klein",
  															 phones: ["091641733", "43425211"], type: "Owner", description: ""})
  		rescue	StandardError => e 
  			puts e
  		end	

  		expect(User.all).to eq([user])
		end  		
  end

  context "followers and following" do
    it "creates players that follow each other and test if they are followers" do
      u1 = User.create!({nickname: "@coso123", email: "sdkd17@gmail.com", name: "Sergio Klein", phones: ["091641733"], type: "Player", description: ""})
      u2 = User.create!({nickname: "@anteto", email: "giannis@gmail.com", name: "Giannis Antetokounmpo", phones: ["091641733"], type: "Player", description: ""})

      u1.follow(u2)
      u2.follow(u1)

      expect([u1,u2]).to eq([u2.followers.first,u1.followers.first])

    end

    it "creates players that follow each other and test if they are following" do
      u1 = User.create!({nickname: "@coso123", email: "sdkd17@gmail.com", name: "Sergio Klein", phones: ["091641733"], type: "Player", description: ""})
      u2 = User.create!({nickname: "@anteto", email: "giannis@gmail.com", name: "Giannis Antetokounmpo", phones: ["091641733"], type: "Player", description: ""})

      u1.follow(u2)
      u2.follow(u1)

      expect([u1,u2]).to eq([u2.following.first,u1.following.first])

    end


  end

end
