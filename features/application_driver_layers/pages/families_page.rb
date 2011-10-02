class FamiliesPage < BasePage

  def move_to_new_page
    click_link "New Family"
    next_page(:FamilyNewPage)
  end

  def move_to_detail_page(family_name)
    click_link family_name
    next_page(:FamilyPage)
  end
end
