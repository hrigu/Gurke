class FamiliesPage < BasePage

  def move_to_new_family_page
    click_link "new"
    next_page(:FamilyNewPage)
  end

  def move_to_family_page(family_name)
    click_link family_name
    next_page(:FamilyPage)
  end
end
