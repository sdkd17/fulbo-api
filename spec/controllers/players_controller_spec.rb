require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

   describe "GET #index" do
    let!(:player)   { create(:player, nickname: "player", email: "player@email.com") }
    let!(:player_1) { create(:player, nickname: "player_1", email: "player1@email.com") }
    let!(:player_2) { create(:player, nickname: "player_2", email: "player2@email.com") }
    let!(:player_3) { create(:player, nickname: "player_3", email: "player3@email.com") }
    

    it "returns http success" do
      get :index
      # puts response.body
      expect(response).to have_http_status(:success)
    end

    it "return a list of players" do
      get :index
      expected = ([player, player_1, player_2, player_3]).to_json
      expect(response).to have_http_status(:success)
      expect(response.body).to eq expected 
    end
  end

  describe "GET #show" do
    let!(:player) { create(:player) }
    it "returns http success" do
      get :show, params: {id: player.id}
      expect(response).to have_http_status(:success)
      expect(response.body).to eq player.to_json
    end

    it "returns error if the player not exist" do
      get :show, params: {id: 500}
      expect(response). to have_http_status(404)
    end
  end

end
