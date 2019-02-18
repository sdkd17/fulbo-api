require 'rails_helper'

RSpec.describe Court, type: :model do
  
  context "create courts for a local of an owner" do
  	it "create courts" do

  		#create user
  		owner = User.create!({nickname: "@coso123", email: "sdkd17@gmail.com", name: "Sergio Klein",
  															 phones: ["091641733", "43425211"], type: "Owner", description: ""})

  		#create a local for the owner
  		local = Local.create!({name: "Cordon F5", address: "Minas 1719", phones:[], email: "sdkd17@gmail.com", 
																opens: Time.new(2019,01,01,15), closes:Time.new(2019,01,01,22), owner_id: owner.id})

  		#create a court for the local
  		court = Court.create!({number: 1, size: "20mx50m", indoor: true, local_id: local.id, type: "Five"})

  		expect(court).to eq(owner.locals.first.courts.first)
  	end
  end
end
