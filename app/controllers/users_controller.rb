class UsersController < ApplicationController


  rescue_from ActionController::ParameterMissing do |e|
    render_json_error :bad_request, :bad_parameters
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_json_error :not_found, :user_not_found
  end

  def index
    @users = User.all

    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user , status: :ok
  end

  def create

    user = User.new(create_params)
    if !user.save
      render_json_validation_error user
      return
    end

    render json: user , status: :created
  end

  def update
    user = User.find(params[:id])
    if !user.update(update_params)
      render_json_validation_error user
      return
    end

    render json: user , status: :ok
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user , status: :ok
  end

  private

    def create_params
      # puts params
      params.require(:user).permit(:nickname, :email, :name, :phones, :type, :description)
    end

    def update_params
      params.permit(:nickname, :email, :name, :phones, :description)
    end

end
