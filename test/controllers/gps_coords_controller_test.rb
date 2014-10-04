require 'test_helper'

class GpsCoordsControllerTest < ActionController::TestCase
  setup do
    @gps_coord = gps_coords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gps_coords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gps_coord" do
    assert_difference('GpsCoord.count') do
      post :create, gps_coord: { altitude: @gps_coord.altitude, latitude: @gps_coord.latitude, longitude: @gps_coord.longitude, when: @gps_coord.when }
    end

    assert_redirected_to gps_coord_path(assigns(:gps_coord))
  end

  test "should show gps_coord" do
    get :show, id: @gps_coord
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gps_coord
    assert_response :success
  end

  test "should update gps_coord" do
    patch :update, id: @gps_coord, gps_coord: { altitude: @gps_coord.altitude, latitude: @gps_coord.latitude, longitude: @gps_coord.longitude, when: @gps_coord.when }
    assert_redirected_to gps_coord_path(assigns(:gps_coord))
  end

  test "should destroy gps_coord" do
    assert_difference('GpsCoord.count', -1) do
      delete :destroy, id: @gps_coord
    end

    assert_redirected_to gps_coords_path
  end
end
