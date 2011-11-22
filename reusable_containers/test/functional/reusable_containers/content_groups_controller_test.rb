require 'test_helper'

module ReusableContainers
  class ContentGroupsControllerTest < ActionController::TestCase
    setup do
      @content_group = content_groups(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:content_groups)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create content_group" do
      assert_difference('ContentGroup.count') do
        post :create, :content_group => @content_group.attributes
      end

      assert_redirected_to content_group_path(assigns(:content_group))
    end

    test "should show content_group" do
      get :show, :id => @content_group.to_param
      assert_response :success
    end

    test "should get edit" do
      get :edit, :id => @content_group.to_param
      assert_response :success
    end

    test "should update content_group" do
      put :update, :id => @content_group.to_param, :content_group => @content_group.attributes
      assert_redirected_to content_group_path(assigns(:content_group))
    end

    test "should destroy content_group" do
      assert_difference('ContentGroup.count', -1) do
        delete :destroy, :id => @content_group.to_param
      end

      assert_redirected_to content_groups_path
    end
  end
end
