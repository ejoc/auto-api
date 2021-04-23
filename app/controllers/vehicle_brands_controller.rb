class VehicleBrandsController < ApplicationController
  before_action :set_vehicle_brand, only: [:show, :update, :destroy]

  # GET /vehicle_brands
  def index
    @vehicle_brands = VehicleBrand.all

    render json: @vehicle_brands
  end

  # GET /vehicle_brands/1
  def show
    render json: @vehicle_brand
  end

  # POST /vehicle_brands
  def create
    @vehicle_brand = VehicleBrand.new(vehicle_brand_params)

    if @vehicle_brand.save
      render json: @vehicle_brand, status: :created, location: @vehicle_brand
    else
      render json: @vehicle_brand.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicle_brands/1
  def update
    if @vehicle_brand.update(vehicle_brand_params)
      render json: @vehicle_brand
    else
      render json: @vehicle_brand.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicle_brands/1
  def destroy
    @vehicle_brand.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_brand
      @vehicle_brand = VehicleBrand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_brand_params
      params.require(:vehicle_brand).permit(:name)
    end
end
