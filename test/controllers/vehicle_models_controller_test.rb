require "test_helper"

class VehicleModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_model = vehicle_models(:one)
  end

  test "should get index" do
    get vehicle_models_url, as: :json
    assert_response :success
  end

  test "should create vehicle_model" do
    assert_difference('VehicleModel.count') do
      post vehicle_models_url, params: { vehicle_model: { name: @vehicle_model.name, vehicle_brand_id: @vehicle_model.vehicle_brand_id } }, as: :json
    end

    assert_response 201
  end

  test "should show vehicle_model" do
    get vehicle_model_url(@vehicle_model), as: :json
    assert_response :success
  end

  test "should update vehicle_model" do
    patch vehicle_model_url(@vehicle_model), params: { vehicle_model: { name: @vehicle_model.name, vehicle_brand_id: @vehicle_model.vehicle_brand_id } }, as: :json
    assert_response 200
  end

  test "should destroy vehicle_model" do
    assert_difference('VehicleModel.count', -1) do
      delete vehicle_model_url(@vehicle_model), as: :json
    end

    assert_response 204
  end
end
