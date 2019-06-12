require 'rails_helper'

RSpec.describe Local, type: :model do
  context " when creating locals, " do
  	it "the Owner has the local" do
  		#creates the user
  		owner = User.create!({nickname: "@coso123", email: "sdkd17@gmail.com", name: "Sergio Klein",
  															 phones: ["091641733", "43425211"], type: "Owner", description: ""})

			#creates the local for the owner
			local = Local.create!({name: "Cordon F5", address: "Minas 1719", phones:[], email: "sdkd17@gmail.com", 
																opens: Time.new(2019,01,01,15), closes:Time.new(2019,01,01,22), owner_id: owner.id})

			#
			expect(local).to eq owner.locals.first
  	end
  end

  context "when creating a local, " do
    let!(:player)     { create(:player) }
    let!(:owner)      { create(:owner) }
    let(:local)       { build(:local, owner_id: player.id)}
    let(:local1)      { build(:local, owner_id: owner.id)}
    let(:local_short) { build(:local, name:"nam" )}
    let!(:local_name) { create(:local, owner_id: owner.id, name:"local_name")}
    let(:local_name2) { build(:local, owner_id: owner.id, name:"local_name")}
    # let(:local3)      { build(:local, owner_id: owner.id, name: "name_2")}

    it "fails if name is too short" do
      local_short.valid?
      expect(local_short.errors[:name]).to eq ["name too short"]
    end

    it "fails if user is a player" do
      expect {local.save!}.to raise_error {ActiveRecord::RecordInvalid}
    end

    it "success if user is an owner" do
      expect(local1.valid?).to be true
    end

    it "fails if already exists another local with the same name" do
      local_name2.valid?
      # pp local_name2.errors
      expect(local_name2.errors[:name]).to eq ["has already been taken"]
    end
  end
end
