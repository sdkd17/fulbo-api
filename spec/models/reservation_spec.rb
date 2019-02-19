require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context "create a reservation" do  	

		let!(:owner){ create(:owner) } 
		let!(:player){ create(:player) } 
		let!(:player_coso){ create(:player, nickname: "@coso123", email: "coso123@gmail.com") } 
  	let!(:local){ create(:local) }
  	let!(:court){ create(:five) }


  	it "the player has the reservation" do

  		#create the reservation
  		r = Reservation.create!({player_id: player.id, court_id: court.id, date: DateTime.new(2019,02, 19, 20)})
  		
  		expect(r).to eq(player.reservations.first)
  	end

  	it "not allow two reservations on the same court and date by diferent players" do
  		r = Reservation.create!({player_id: player.id, court_id: court.id, date: DateTime.new(2019,02, 19, 20)})
			# r_1 = Reservation.create!({player_id: player_coso.id, court_id: court.id, date: DateTime.new(2019,02, 19, 20)})
  		
  		expect{Reservation.create!({player_id: player_coso.id, court_id: court.id, date: DateTime.new(2019,02, 19, 20)})}.to raise_error{ActiveRecord::RecordInvalid}
  		
  	end

  end
end
