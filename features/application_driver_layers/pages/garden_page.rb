class GardenPage < BasePage

  def move_to_new_bed_page
    click_link "Neues Beet"
    next_page(:BedNewPage)
  end

  def move_to_bed_page bed_name
    click_link bed_name
    next_page(:BedPage)
  end
end
