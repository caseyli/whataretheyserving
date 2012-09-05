require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: { city: @location.city, name: @location.name, phone: @location.phone, postal_zip: @location.postal_zip, prov_state: @location.prov_state, street2: @location.street2, street_1: @location.street_1, url: @location.url }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  test "should update location" do
    put :update, id: @location, location: { city: @location.city, name: @location.name, phone: @location.phone, postal_zip: @location.postal_zip, prov_state: @location.prov_state, street2: @location.street2, street_1: @location.street_1, url: @location.url }
    assert_redirected_to location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location
    end

    assert_redirected_to locations_path
  end
end
