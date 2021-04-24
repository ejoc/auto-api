class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy]

  # GET /vehicles
  def index
    @vehicles = Vehicle.joins(model: :brand).select(:id, 'vehicle_models.name AS vehicle_model_name', 'vehicle_brands.name AS brand_name', :year, :mileage, :price)
    if query_params[:model_name].present?
      @vehicles = @vehicles.where("vehicle_models.name LIKE ?", "%#{query_params[:model_name]}%")
    end
    if query_params[:brand_name].present?
      @vehicles = @vehicles.where("vehicle_brands.name LIKE ?", "%#{query_params[:brand_name]}%")
    end
    if query_params[:year].present?
      @vehicles = @vehicles.where("year > ?", query_params[:year].to_i)
    end
    if query_params[:mileage].present?
      @vehicles = @vehicles.where("mileage < ?", query_params[:mileage].to_i)
    end
    if query_params[:price].present?
      @vehicles = @vehicles.where("price < ?", query_params[:price].to_i)
    end
    all_vehicles = @vehicles.map do |i|
      h = i.attributes
      h[:model_name] = h.delete 'vehicle_model_name'
      h
    end
    render json: all_vehicles
  end

  # GET /vehicles/1
  def show
    render json: @vehicle
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)
    model = VehicleModel.find_by(name: params[:model])
    @vehicle.model = model 

    if @vehicle.save
      render json: @vehicle, status: :created, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:year, :mileage, :price)
    end

    def query_params
      params.permit(:model_name, :brand_name, :year, :mileage, :price)
    end
end
