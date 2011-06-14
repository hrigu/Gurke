class BedEditPage < BasePage

  def add_plant(plant_name)
    select plant_name
    click_button "bed_submit"
    next_page(:GardenPage)
  end
end
