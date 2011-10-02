class BedNewPage < BasePage

  def create_new(bed_name, field_state)
    fill_in "bed_name", :with => bed_name
    select field_state, :from => "bed[field_state]"
    click_button "Create Bed"
    next_page(:GardenPage)
  end

end
