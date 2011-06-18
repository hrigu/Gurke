require 'test_helper'
class AbilityTest < ActiveSupport::TestCase
  test "an admin can destroy plants and families" do
    ability = Ability.new( accounts(:admin))
    assert ability.can?(:destroy, plants(:Zwiebel)), "admin cannot destroy a plant, but should"
    assert ability.can?(:destroy, families(:liliengewaechse)), "admin cannot destroy a family, but should"
  end

  test "a normal user cannot destroy plants and families" do
    ability = Ability.new(accounts(:gardener))
    assert ability.cannot?(:destroy, plants(:Zwiebel)), "user can destroy a plant, but should not"
    assert ability.cannot?(:destroy, families(:liliengewaechse)), "admin can destroy a family, but should not"
  end

  test "a user can manage his own garden " do
    user_with_garden = accounts(:gardener)
    garden = user_with_garden.gardens.first
    user_with_garden.gardens << garden
    user_with_garden.save
    ability = Ability.new(user_with_garden)
    assert ability.can?(:read, garden)
    assert ability.can?(:destroy, garden)
  end

  test "a user can read but not edit a garden that is not his own" do
    main_user = accounts(:admin)
    other_user = accounts(:gardener)
#    other_user.id = 12
    other_user.save!
    other_garden = Garden.new
    other_garden.account = other_user
    other_garden.save
    ability = Ability.new(main_user)
        assert ability.can?(:read, other_user.gardens.first)
        assert ability.cannot?(:edit, other_user.gardens.first)

  end
end
