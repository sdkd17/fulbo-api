require 'rails_helper'

RSpec.describe User, type: :model do
  context "usuario con varios telefonos" do
  	it "crea usuario con dos telefonos" do
  		user = User.create!({nickname: "@coso123", email: "sdkd17@gmail.com", phones: ["091641733", "43425211"], type: "Owner", description: ""})
  		expect(user.phones).to eq (["091641733", "43425211"])

  	end
  end

end
