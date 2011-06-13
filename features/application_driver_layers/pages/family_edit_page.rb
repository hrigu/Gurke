class FamilyEditPage < BasePage

  def edit_name(new_name)
    fill_in "Name", :with => new_name
    click_button
    next_page(:FamilyPage)
  end
end
