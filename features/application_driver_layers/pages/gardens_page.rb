class GardensPage < BasePage

  def move_to_new_page
    click_link "new"
    next_page(:GardenNewPage)
  end

  def move_to_detail_page(garden_name)
    click_link garden_name
    next_page(:GardenPage)
  end

end
