require 'test_helper'




class AbilityTest < ActiveSupport::TestCase
  test "an admin can destroy plants and families" do
    ability = Ability.new(user(true))
    assert ability.can?(:destroy, Plant.new), "admin cannot destroy a plant, but should"
    assert ability.can?(:destroy, Family.new), "admin cannot destroy a family, but should"
  end

  test "a normal user cannot destroy plants and families" do
    ability = Ability.new(user)
    assert ability.cannot?(:destroy, Plant.new), "user can destroy a plant, but should not"
    assert ability.cannot?(:destroy, Family.new), "admin can destroy a family, but should not"
  end

  test "a user can manage his own garden " do
    user_with_garden = user
    garden = Garden.new(:name =>  "Vrenelisgaerteli", :place => "Glarnerland") do |g|
      g.account = user_with_garden
    end
    garden.save
    user_with_garden.gardens << garden
    user_with_garden.save
    ability = Ability.new(user_with_garden)
    assert ability.can?(:read, garden)
    assert ability.can?(:destroy, garden)
  end

  test "a user can read but not edit a garden that is not his own" do
    ability = Ability.new(user)
        assert ability.can?(:read, Garden.new)
        assert ability.cannot?(:edit, Garden.new)

  end
  private
  def user(admin = false)
    user = Account.new(:username => "fritz") do |u|
      u.password = "secret"
      u.email = "fritz@gurke.ch"
      u.admin = admin
    end
    user.save

    assert_equal "fritz", user.username
    assert_equal "secret", user.password
    assert_equal "fritz@gurke.ch", user.email
    assert_equal  admin, user.admin, "user is not admin"
    user
  end
end
