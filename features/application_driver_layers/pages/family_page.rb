class FamilyPage < BasePage
  def move_to_edit_page
    click_link "Edit"
    FamilyEditPage.new(@world, response)
  end
  
  def move_to_families_page
    click_link "Back"
    FamiliesPage.new(@world, response)
  end

end
