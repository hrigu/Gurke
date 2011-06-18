require 'test_helper'

class GardensControllerTest < ActionController::TestCase


  setup do
    #turn out ability
#    @ability = Object.new
#    @ability.extend(CanCan::Ability)
#    @ability.can :manage, :all
#    @controller.stubs(:current_ability).returns(@ability)

    @gardener = accounts(:gardener)
    @other_gardener = accounts(:admin)
    session[:account_id] = @gardener.id # log in user however you like, alternatively stub `current_user` method
  end

  test "gardener should get index of his gardens" do
    get :index
    assert_response :success
    gardens = assigns(:gardens)
    assert_equal(1, gardens.size)
    assert_equal gardens.first.account, @gardener
    assert_not_nil gardens
  end

  test "gardener should see his garden" do
    get :show, :id => @gardener.gardens.first.id
    assert_response :success
    garden = assigns(:garden)
    assert_not_nil garden
    assert_equal garden.account, @gardener
  end

  test "gardener should see his garden" do
    get :show, :id => @gardener.gardens.first.id
    assert_response :success
    garden = assigns(:garden)
    assert_not_nil garden
    assert_equal garden.account, @gardener
  end

  test "gardener should see other garden" do
    get :show, :id => @other_gardener.gardens.first.id
    assert_response :success
    garden = assigns(:garden)
    #assert_equal(1, garden
    puts garden.name
    assert_not_nil garden
    assert_equal garden.account, @other_gardener
  end


end
