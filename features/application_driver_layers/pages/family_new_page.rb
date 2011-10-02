class FamilyNewPage < BasePage

  def create_new family, energy, family_field_state
    fill_in "Name", :with => family
    select energy, :from => "family_energy"
    select family_field_state, :from => "family_field_state"
    click_button "Create Family"
    next_page(:FamilyPage)
  end
end
