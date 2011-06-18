require 'test_helper'

class FamiliesControllerTest < ActionController::TestCase


  test "should get index" do
    get :index
    assert_response :success
    families = assigns(:families)
#    puts families.inspect
    assert_not_nil families
  end



end
