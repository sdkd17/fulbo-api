require 'rails_helper'

RSpec.describe Local, type: :model do
  context "creacion de un local" do
  	it "creates a local and an owner" do
  		#creates the user
  		owner = User.create!({nickname: "@coso123", email: "sdkd17@gmail.com", name: "Sergio Klein",
  															 phones: ["091641733", "43425211"], type: "Owner", description: ""})

			#creates the local for the user
			local = Local.create!({name: "Cordon F5", address: "Minas 1719", phones:[], email: "sdkd17@gmail.com", 
																opens: Time.new(2019,01,01,15), closes:Time.new(2019,01,01,22), owner_id: owner.id})

			#
			expect(local).to eq owner.locals.first
  	end
  end
end
