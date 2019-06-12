class CourtsController < ApplicationController
  
  rescue_from ActionController::ParameterMissing do |e|
    render_json_error :bad_request, :bad_parameters
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_json_error :not_found, :court_not_found
  end 

  def index
    if params[:local_id]

      @courts = Local.find(params[:local_id]).courts
    else
      @courts = Court.all
    end
    
    render json: @courts, status: :ok 
  end

  def show
    
    @court = Court.find(show_params)
    render json: @court, status: :ok

  end

  def create
    
    court = Court.new(create_params)
    if !court.save
      render_json_validation_error court
      return
    end

    render json: court, status: :created
  end

  def update
    court = Court.find(params[:id])
    if !court.update(update_params)
      render_json_validation_error court
      return
    end

    render json: court , status: :ok
  end

  def destroy
    court = Court.find(params[:id])
    court.destroy
    render json: court , status: :ok
  end

  private

    def show_params
      params.require(:court).permit(:local_id, :number)
    end

    def create_params
      # puts params
      params.require(:court).permit(:number, :size, :indoor, :local_id, :type)
    end

    def update_params
      params.permit(:number, :size)
    end
end
