require 'test_helper'

module ReusableContainers
  class MiscControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

  end
end
