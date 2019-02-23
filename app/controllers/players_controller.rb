class PlayersController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound do |e|
    render_json_error :not_found, :player_not_found
  end

  def index
    @players = Player.all

    render json: @players, status: :ok
  end

  def show
    @player = Player.find(params[:id])
    render json: @player , status: :ok
  end
end
