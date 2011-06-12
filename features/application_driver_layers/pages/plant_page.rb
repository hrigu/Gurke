class PlantPage < BasePage

  def move_to_edit_page
    click_link "Edit"
    PlantEditPage.new(@world, response)
  end
  
end
