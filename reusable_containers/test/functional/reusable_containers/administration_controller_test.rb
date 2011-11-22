require 'test_helper'

module ReusableContainers
  class AdministrationControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

  end
end
