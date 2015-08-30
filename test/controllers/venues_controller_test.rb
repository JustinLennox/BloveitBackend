require 'test_helper'

class VenuesControllerTest < ActionController::TestCase
  setup do
    @venue = venues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venue" do
    assert_difference('Venue.count') do
      post :create, venue: { date_experience: @venue.date_experience, details_table: @venue.details_table, food_drink: @venue.food_drink, hours: @venue.hours, keep_in_mind: @venue.keep_in_mind, mood: @venue.mood, name: @venue.name, neighborhood: @venue.neighborhood, polaroid_description: @venue.polaroid_description, price_for_two: @venue.price_for_two, specials: @venue.specials, type: @venue.type, why_blove: @venue.why_blove }
    end

    assert_redirected_to venue_path(assigns(:venue))
  end

  test "should show venue" do
    get :show, id: @venue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @venue
    assert_response :success
  end

  test "should update venue" do
    patch :update, id: @venue, venue: { date_experience: @venue.date_experience, details_table: @venue.details_table, food_drink: @venue.food_drink, hours: @venue.hours, keep_in_mind: @venue.keep_in_mind, mood: @venue.mood, name: @venue.name, neighborhood: @venue.neighborhood, polaroid_description: @venue.polaroid_description, price_for_two: @venue.price_for_two, specials: @venue.specials, type: @venue.type, why_blove: @venue.why_blove }
    assert_redirected_to venue_path(assigns(:venue))
  end

  test "should destroy venue" do
    assert_difference('Venue.count', -1) do
      delete :destroy, id: @venue
    end

    assert_redirected_to venues_path
  end
end
