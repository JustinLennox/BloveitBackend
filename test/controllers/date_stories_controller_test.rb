require 'test_helper'

class DateStoriesControllerTest < ActionController::TestCase
  setup do
    @date_story = date_stories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_stories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_story" do
    assert_difference('DateStory.count') do
      post :create, date_story: { string: @date_story.string }
    end

    assert_redirected_to date_story_path(assigns(:date_story))
  end

  test "should show date_story" do
    get :show, id: @date_story
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @date_story
    assert_response :success
  end

  test "should update date_story" do
    patch :update, id: @date_story, date_story: { string: @date_story.string }
    assert_redirected_to date_story_path(assigns(:date_story))
  end

  test "should destroy date_story" do
    assert_difference('DateStory.count', -1) do
      delete :destroy, id: @date_story
    end

    assert_redirected_to date_stories_path
  end
end
