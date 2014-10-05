require 'test_helper'

class GoogleKmlsControllerTest < ActionController::TestCase
  setup do
    @google_kml = google_kmls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:google_kmls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create google_kml" do
    assert_difference('GoogleKml.count') do
      post :create, google_kml: {  }
    end

    assert_redirected_to google_kml_path(assigns(:google_kml))
  end

  test "should show google_kml" do
    get :show, id: @google_kml
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @google_kml
    assert_response :success
  end

  test "should update google_kml" do
    patch :update, id: @google_kml, google_kml: {  }
    assert_redirected_to google_kml_path(assigns(:google_kml))
  end

  test "should destroy google_kml" do
    assert_difference('GoogleKml.count', -1) do
      delete :destroy, id: @google_kml
    end

    assert_redirected_to google_kmls_path
  end
end
