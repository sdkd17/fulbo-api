class LocalsController < ApplicationController

  rescue_from ActionController::ParameterMissing do |e|
    render_json_error :bad_request, :bad_parameters
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_json_error :not_found, :local_not_found
  end

  def index
    @locals = Local.all

    render json: @locals, status: :ok
  end

  def show
    @local = Local.find(params[:id])
    render json: @local , status: :ok
  end

  def create

    local = Local.new(create_params)
    if !local.save
      render_json_validation_error local
      return
    end

    render json: local , status: :created
  end

  def update
    local = Local.find(params[:id])
    if !local.update(update_params)
      render_json_validation_error local
      return
    end

    render json: local , status: :ok
  end

  def destroy
    local = Local.find(params[:id])
    local.destroy
    render json: local , status: :ok
  end

  private

    def create_params
      # puts params
      params.require(:local).permit(:email, :name, :phones, :address, :opens, :closes, :owner_id)
    end

    def update_params
      params.permit(:email, :name, :phones, :address, :opens, :closes,)
    end

end
