class FamilyNewPage < BasePage

  def create_new family, energy, family_field_state
    fill_in "Name", :with => family
    fill_in "Energy", :with => energy
    fill_in "family_field_state", :with => family_field_state
    click_button "Create Family"
    FamilyPage.new(@world, response)
  end
end
