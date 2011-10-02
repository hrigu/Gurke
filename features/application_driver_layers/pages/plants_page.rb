class PlantsPage < BasePage

  def move_to_new_page
    click_link "New Plant"
    next_page(:PlantNewPage)
  end

  def move_to_detail_page(plant_name)
    click_link plant_name
    next_page(:PlantPage)
  end
end
