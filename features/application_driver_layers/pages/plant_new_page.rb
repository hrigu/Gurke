class PlantNewPage < BasePage

  def create_new plant_name, family_name
    fill_in "Name", :with => plant_name
    fill_in "plant_seed_from_month", :with => "4"
    fill_in "plant_seed_to_month", :with  => "7"
    #otherwise Kernel#select is called
    @world.select family_name, :from => "plant[family_id]"
    click_button "Create Plant"
    PlantPage.new(@world, response)
  end
end
