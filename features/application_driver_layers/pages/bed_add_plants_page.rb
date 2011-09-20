class BedAddPlantsPage < BasePage

  def add_plant(plant_name)
    select plant_name
    click_button "bed_submit"
    next_page(:BedAddPlantsPage)
  end

  def move_to_bed_page
    click_link "zurück"
    next_page(:BedPage)
  end

end
