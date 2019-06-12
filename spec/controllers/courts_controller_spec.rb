require 'rails_helper'

RSpec.describe CourtsController, type: :controller do

  describe "GET #index" do
    let!(:owner) { create(:owner) }
    let!(:local) { create(:local, owner: owner )}
    let!(:local_2) { create(:local, owner: owner )}
    let!(:court_1) {create(:five, local: local )}
    let!(:court_2) {create(:five, local: local )}
    let!(:court_3) {create(:five, local: local_2 )}
    
    it "returns http success" do
      get :index, params: {local_id: local.id}
      expected = [court_1, court_2].to_json
      puts response.body
      expect(response).to have_http_status(:success)
      expect(response.body).to eq expected
    end
  end

  describe "GET #show" do
    let!(:owner) { create(:owner) }
    let!(:local) { create(:local, owner: owner )}
    let!(:court_1) {create(:five, local: local )}

    it "returns http success" do
      get :show, params: {local_id: local.id, number: court_1.number}
      expected = [court_1].to_json
      expect(response).to have_http_status(:success)
      expect(response.body).to eq expected
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
