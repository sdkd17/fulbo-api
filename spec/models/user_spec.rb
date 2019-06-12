require 'rails_helper'
require 'pp'

RSpec.describe User, type: :model do
  context "when it is not valid because" do
    let(:user)       { build(:player, phones: ["091641733", "43425211"])}
    let(:user_short) { build(:player, nickname: "@ac")}
    let(:user_email) { build(:player, email: "asdc")}
  	let(:user_type)  { build(:player, type: "Admin")}

    it "has two phones" do
      expect(user.valid?).to be true
  		expect(user.phones).to eq (["091641733", "43425211"])
  	end

    it "has a short nickname" do
      user_short.valid?
      expect(user_short.errors[:nickname]).to eq ["nickname too short"]
    end

    it "has an invalid emal" do
      user_email.valid?
      expect(user_email.errors[:email]).to eq ["wrong email"]
    end

    it "has an invalid type" do
      user_type.valid?
      expect(user_type.errors[:type]).to eq ["wrong type"]
    end
  end

  context "when it is not valid because" do
    let!(:player)  { create(:player, nickname: "@cosocoso", email: "coso@coso.com") }
    let(:player1) { build(:player, nickname: "@cosocoso") }
    let(:player2) { build(:player, email: "coso@coso.com") }
  	
    it "there are two users with same nickname" do
      player1.valid?
      # pp player1.errors
      expect(player1.errors[:nickname]).to eq ["has already been taken"]
		end  		

    it "there are two users with same email" do
      player2.valid?
      expect(player2.errors[:email]).to eq ["has already been taken"]
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
