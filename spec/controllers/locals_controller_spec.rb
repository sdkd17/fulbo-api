require 'rails_helper'
# require 'pp'


RSpec.describe LocalsController, type: :controller do

  describe "GET #index" do
    let!(:owner)   { create(:owner) }
    let!(:local)   { create(:local, name: "local", address: "address 123",phones: ["123456789"],email: "local1@email.com", opens: Date.new(2019, 01, 01, 15),closes: Date.new(2019, 01, 01, 22) )}
    let!(:local_1) { create(:local, name: "local_1", address: "address 123",phones: ["123456789"],email: "local1@email.com", opens: Date.new(2019, 01, 01, 15),closes: Date.new(2019, 01, 01, 22) )}
    let!(:local_2) { create(:local, name: "local_2", address: "address 123",phones: ["123456789"],email: "local1@email.com", opens: Date.new(2019, 01, 01, 15),closes: Date.new(2019, 01, 01, 22) )} 
    let!(:local_3) { create(:local, name: "local_3", address: "address 123",phones: ["123456789"],email: "local1@email.com", opens: Date.new(2019, 01, 01, 15),closes: Date.new(2019, 01, 01, 22) )} 

    it "returns http success" do
      # pp Owner.all
      get :index
      expect(response).to have_http_status(:success)
    end

    it "return a list of locals" do
      get :index
      expected = ([local, local_1, local_2, local_3]).to_json

      expect(response).to have_http_status(:success)
      expect(response.body).to eq expected 


    end
  end

  describe "GET #show" do
    let!(:local) { create(:local) }
    it "returns http success" do
      get :show, params: {id: local.id}
      expect(response).to have_http_status(:success)
      expect(response.body).to eq local.to_json
    end

    it "returns error if the local does not exist" do
      get :show, params: {id: 500}
      expect(response). to have_http_status(404)
    end
  end

  describe "POST #create" do
    let!(:owner) { create(:owner) }
    let!(:local) { create(:local) }
    

    it "returns http bad request with no parameters" do
      post :create
      expect(response).to have_http_status(:bad_request)
    end

    it "returns http bad request with invalid name" do
      
      #no name
      post :create, params: {local: {
        name: "",
        address: "address 123",
        phones: ["123456789"],
        email: "local1@email.com",
        opens: Date.new(2019, 01, 01, 15),
        closes: Date.new(2019, 01, 01, 22),
        owner_id: Owner.all.first.id
      }}
      expect(response).to have_http_status(:bad_request)
     end
     
     it "returns http bad request if the name already exists" do
       
      post :create, params: {local: {
        name: local.name,
        address: "address 123",
        phones: ["123456789"],
        email: "local1@email.com",
        opens: Date.new(2019, 01, 01, 15),
        closes: Date.new(2019, 01, 01, 22),
        owner_id: Owner.all.first.id
      }}
      expect(response).to have_http_status(:bad_request)
     end

     it "returns http bad request with no address" do
       
      post :create, params: {local: {
        name: "local_1",
        phones: ["123456789"],
        email: "local1@email.com",
        opens: Date.new(2019, 01, 01, 15),
        closes: Date.new(2019, 01, 01, 22),
        owner_id: Owner.all.first.id
      }}
      expect(response).to have_http_status(:bad_request)
     end

     it "returns http bad request with no email" do
       
      post :create, params: {local: {
        name: "local_1",
        address: "address 123",
        phones: ["123456789"],
        opens: Date.new(2019, 01, 01, 15),
        closes: Date.new(2019, 01, 01, 22),
        owner_id: Owner.all.first.id
      }}
      expect(response).to have_http_status(:bad_request)
     end

     it "returns http bad request with no opnes" do
       
      post :create, params: {local: {
        name: "local_1",
        email: "local1@email.com",
        address: "address 123",
        phones: ["123456789"],
        closes: Date.new(2019, 01, 01, 22),
        owner_id: Owner.all.first.id
      }}
      expect(response).to have_http_status(:bad_request)
     end

     it "returns http bad request with no closes" do
       
      post :create, params: {local: {
        name: "local_1",
        address: "address 123",
        email: "local1@email.com",
        phones: ["123456789"],
        opens: Date.new(2019, 01, 01, 15),
        owner_id: Owner.all.first.id
      }}
      expect(response).to have_http_status(:bad_request)
     end

     it "returns http bad request with no owner" do
       
      post :create, params: {local: {
        name: "local_1",
        address: "address 123",
        email: "local1@email.com",
        phones: ["123456789"],
        opens: Date.new(2019, 01, 01, 15),
        
      }}
      expect(response).to have_http_status(:bad_request)
     end

    it "creates a local with valid params" do
      
      post :create, params: {local: {
        name: "local_3",
        address: "address 123",
        phones: ["123456789"],
        email: "local3@email.com",
        opens: Date.new(2019, 01, 01, 15),
        closes: Date.new(2019, 01, 01, 22),
        owner_id: Owner.all.first.id
      }}
      # puts response.body
      expect(response).to have_http_status(:created)

      get :index
      expect(response.body).to include("local_3")
    end
  end

  # describe "POST #update" do
  #   let!(:player) { create(:player) }
  #   it "returns http success and updates the data" do
  #     post :update, params: {id: player.id, name: "player_update"}
  #     expect(response).to have_http_status(:success)
      
  #     get :index
  #     expect(response.body).to include("player_update")
  #   end
  # end

  # describe "DELETE #destroy" do
  #   let!(:player) { create(:player) }
  #   it "returns http success and deletes de user" do
  #     delete :destroy, params: {id: player.id}
  #     expect(response).to have_http_status(:success)
  #     expect(response.body).to eq player.to_json

  #   end
  # end

end
