class PlantsPage < BasePage

  def move_to_new_plant_page
    click_link "new"
    PlantNewPage.new(@world, response)
  end

  def move_to_plant_page(plant_name)
    click_link plant_name
    PlantPage.new(@world, response)
  end
end
