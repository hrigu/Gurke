class BedPage < BasePage
  def move_to_edit_page
    click_link "Edit"
    next_page(:BedEditPage)
  end

end
