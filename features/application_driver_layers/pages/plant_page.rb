class PlantPage < BasePage

  def move_to_edit_page
    click_link "Edit"
    next_page(:PlantEditPage)
  end
  
end
