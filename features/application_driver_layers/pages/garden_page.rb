class GardenPage < BasePage

  def move_to_new_page
    click_link "Neues Beet"
    next_page(:BedNewPage)
  end

  def move_to_detail_page bed_name
    click_link bed_name
    next_page(:BedPage)
  end

  def visit_me garden
    visit_garden_path garden
    next_page(:HomePage)
  end


end
