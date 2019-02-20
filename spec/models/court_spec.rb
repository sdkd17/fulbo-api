require 'rails_helper'

RSpec.describe Court, type: :model do
  
  let!(:owner)        { create(:owner)}
  let!(:local)        { create(:local)}
  let!(:five)         { create(:five)}
  let!(:five_2)       { create(:five, number: 2)}

  context "create courts for a local of an owner" do
  	it "create courts" do
  		expect(five).to eq(owner.locals.first.courts.first)
  	end
  end

  context "when number already exists" do
    let(:five_number)   { build(:five)}

    it "fails" do
      # five_number.save
      expect {five_number.save}.to raise_error {ActiveRecord::RecordNotUnique}
    end
  end

  context "when creating" do
    let(:five_type)     { build(:five, type: "waterpolo")}

    it "fails because of type" do
      five_type.valid?
      expect(five_type.errors[:type]).to eq ["wrong type of Court"]
    end
  end

end
