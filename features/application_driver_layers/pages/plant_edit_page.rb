class PlantEditPage < BasePage

  def edit_name(new_name)
    fill_in "Name", :with => new_name
    click_button "Update Plant"
    next_page(:PlantPage)
  end

  def change_family(new_family_name)
    select new_family_name, :from => "plant[family_id]"
    click_button    "Update Plant"
    next_page(:PlantPage)
  end
end
