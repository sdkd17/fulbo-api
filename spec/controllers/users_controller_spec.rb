require 'rails_helper'
require 'pp'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    let!(:player)   { create(:player, nickname: "player", email: "player@email.com") }
    let!(:player_1) { create(:player, nickname: "player_1", email: "player1@email.com") }
    let!(:player_2) { create(:player, nickname: "player_2", email: "player2@email.com") }
    let!(:player_3) { create(:player, nickname: "player_3", email: "player3@email.com") }
    

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "return a list of users" do
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

    it "returns error if the user not exist" do
      get :show, params: {id: 500}
      expect(response). to have_http_status(404)
    end
  end

  describe "POST #create" do
    let!(:player) { create(:player) }

    it "returns http bad request with no parameters" do
      post :create
      expect(response).to have_http_status(:bad_request)
    end

    it "returns http bad request with invalid parameters" do
      #no nickname
      post :create, params: {user: {email: "new@email.com", name: "new player", phones:["099123456"], type: "Player"}}
      expect(response).to have_http_status(:bad_request)
      #no email
      post :create, params: {user: {nickname: "new_player", name: "new player", phones:["099123456"], type: "Player"}}
      expect(response).to have_http_status(:bad_request)
      #no name
      post :create, params: {user: {nickname: "new_player", email: "new@email.com", phones:["099123456"], type: "Player"}}
      expect(response).to have_http_status(:bad_request)
      #no type
      post :create, params: {user: {nickname: "new_player", email: "new@email.com", phones:["099123456"]}}
      expect(response).to have_http_status(:bad_request)
    end

    it "return http bad request if the nickname already exists" do
      #
      post :create, params: { user: {nickname: player.nickname, email: "sdkd17@gmail.com", name: "new player", phones:["099123456"], type: "Player"}}
      expect(response).to have_http_status(:bad_request)
      
      #returns an error
      expect(response.body).to include "already been taken"
    end

    it "return http bad request if the email already exists" do
      post :create, params: { user: {nickname: "@sdkd17", email: player.email, name: "new player", phones:["099123456"], type: "Player"}}
      expect(response).to have_http_status(:bad_request)
      #return an error
      expect(response.body).to include "already been taken"
    end

    it "creates a user with valid params" do
      post :create, params: { user: {nickname: "new_player", email: "new@email.com", name: "new player", phones:["099123456"], type: "Player"}}
      # puts response.body
      expect(response).to have_http_status(:created)

      get :index
      expect(response.body).to include("new_player")
    end
  end

  describe "POST #update" do
    let!(:player) { create(:player) }
    it "returns http success and updates the data" do
      post :update, params: {id: player.id, name: "player_update"}
      expect(response).to have_http_status(:success)
      
      get :index
      expect(response.body).to include("player_update")
    end
  end

  describe "DELETE #destroy" do
    let!(:player) { create(:player) }
    it "returns http success and deletes de user" do
      delete :destroy, params: {id: player.id}
      expect(response).to have_http_status(:success)
      expect(response.body).to eq player.to_json

    end
  end

end
