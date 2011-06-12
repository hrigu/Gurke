class PlantEditPage < BasePage

  def edit_name(new_name)
    fill_in "Name", :with => new_name
    click_button
    PlantPage.new(@world, response)
  end
end
