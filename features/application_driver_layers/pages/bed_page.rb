class BedPage < BasePage
  def move_to_edit_page
    click_link "Edit"
    next_page(:BedEditPage)
  end

  def move_to_garden_page
    click_link "zurück zum Garten"
    next_page(:GardenPage)
  end

end
