require "test_helper"

class VehicleBrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_brand = vehicle_brands(:one)
  end

  test "should get index" do
    get vehicle_brands_url, as: :json
    assert_response :success
  end

  test "should create vehicle_brand" do
    assert_difference('VehicleBrand.count') do
      post vehicle_brands_url, params: { vehicle_brand: { name: @vehicle_brand.name } }, as: :json
    end

    assert_response 201
  end

  test "should show vehicle_brand" do
    get vehicle_brand_url(@vehicle_brand), as: :json
    assert_response :success
  end

  test "should update vehicle_brand" do
    patch vehicle_brand_url(@vehicle_brand), params: { vehicle_brand: { name: @vehicle_brand.name } }, as: :json
    assert_response 200
  end

  test "should destroy vehicle_brand" do
    assert_difference('VehicleBrand.count', -1) do
      delete vehicle_brand_url(@vehicle_brand), as: :json
    end

    assert_response 204
  end
end
