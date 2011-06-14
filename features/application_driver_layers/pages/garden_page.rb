class GardenPage < BasePage

  def move_to_new_bed_page
     click_link "Neues Beet"
     next_page(:BedNewPage)
  end
end
