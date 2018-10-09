class API::V1::VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :destroy, :update]

  def index
    vehicles = Vehicle.all
    render json: vehicles
  end

  def show
    render json: @vehicle
  end

  def create
    vehicle = Vehicle.new(vehicle_params)
    if vehicle.save
      render json: vehicle
    else
      render json: { error: vehicle.errors }, status: :bad_request
    end
  end

  def update
    if @vehicle.update(update_params)
      render json: @vehicle
    else
      render json: { error: @vehicle.errors }, status: :bad_request
    end
  end

  def destroy
    @vehicle.destroy
    head :no_content
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:plate, :branch, :category, :person_id)
  end

  def update_params
    params.require(:vehicle).permit(:plate, :branch, :category)
  end
end
