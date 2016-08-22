require 'test_helper'

class AaronsControllerTest < ActionController::TestCase
  setup do
    @aaron = aarons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aarons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aaron" do
    assert_difference('Aaron.count') do
      post :create, aaron: { content: @aaron.content, title: @aaron.title }
    end

    assert_redirected_to aaron_path(assigns(:aaron))
  end

  test "should show aaron" do
    get :show, id: @aaron
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aaron
    assert_response :success
  end

  test "should update aaron" do
    patch :update, id: @aaron, aaron: { content: @aaron.content, title: @aaron.title }
    assert_redirected_to aaron_path(assigns(:aaron))
  end

  test "should destroy aaron" do
    assert_difference('Aaron.count', -1) do
      delete :destroy, id: @aaron
    end

    assert_redirected_to aarons_path
  end
end
