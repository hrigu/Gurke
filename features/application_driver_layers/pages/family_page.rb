class FamilyPage < BasePage
  def move_to_edit_page
    click_link "Edit"
    next_page(:FamilyEditPage)
  end
  
  def move_to_list_page
    click_link "Back"
    next_page(:FamiliesPage)
  end

end
