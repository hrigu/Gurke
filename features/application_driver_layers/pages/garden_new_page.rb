class GardenNewPage < BasePage

  def create_new garden_name, location
    next_page(:GardenPage)
  end

end
