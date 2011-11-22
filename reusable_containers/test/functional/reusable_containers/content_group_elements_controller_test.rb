require 'test_helper'

module ReusableContainers
  class ContentGroupElementsControllerTest < ActionController::TestCase
    setup do
      @content_group_element = content_group_elements(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:content_group_elements)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create content_group_element" do
      assert_difference('ContentGroupElement.count') do
        post :create, :content_group_element => @content_group_element.attributes
      end

      assert_redirected_to content_group_element_path(assigns(:content_group_element))
    end

    test "should show content_group_element" do
      get :show, :id => @content_group_element.to_param
      assert_response :success
    end

    test "should get edit" do
      get :edit, :id => @content_group_element.to_param
      assert_response :success
    end

    test "should update content_group_element" do
      put :update, :id => @content_group_element.to_param, :content_group_element => @content_group_element.attributes
      assert_redirected_to content_group_element_path(assigns(:content_group_element))
    end

    test "should destroy content_group_element" do
      assert_difference('ContentGroupElement.count', -1) do
        delete :destroy, :id => @content_group_element.to_param
      end

      assert_redirected_to content_group_elements_path
    end
  end
end
