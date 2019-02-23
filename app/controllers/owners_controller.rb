class OwnersController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_json_error :not_found, :owner_not_found
  end

  def index
    @owners = Owner.all

    render json: @owners, status: :ok
  end

  def show
    @owner = Owner.find(params[:id])
    render json: @owner , status: :ok
  end

end
