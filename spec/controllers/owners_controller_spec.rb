require 'rails_helper'

RSpec.describe OwnersController, type: :controller do

   describe "GET #index" do
    let!(:owner)   { create(:owner, nickname: "owner", email: "owner@email.com") }
    let!(:owner_1) { create(:owner, nickname: "owner_1", email: "owner1@email.com") }
    let!(:owner_2) { create(:owner, nickname: "owner_2", email: "owner2@email.com") }
    let!(:owner_3) { create(:owner, nickname: "owner_3", email: "owner3@email.com") }
    

    it "returns http success" do
      get :index
      
      expect(response).to have_http_status(:success)
    end

    it "return a list of owners" do
      get :index
      expected = ([owner, owner_1, owner_2, owner_3]).to_json
      expect(response).to have_http_status(:success)
      expect(response.body).to eq expected 
    end
  end

  describe "GET #show" do
    let!(:owner) { create(:owner) }
    let!(:local) { create(:local, owner: owner)}
    let!(:five) {create(:five, local: local)}

    it "returns http success" do
      get :show, params: {id: owner.id}
      expect(response).to have_http_status(:success)
      # puts response.body
      expect(response.body).to eq owner.to_json
    end

    it "returns error if the owner not exist" do
      get :show, params: {id: 500}
      expect(response). to have_http_status(404)
    end

  end

end
