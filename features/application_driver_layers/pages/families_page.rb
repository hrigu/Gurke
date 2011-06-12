class FamiliesPage < BasePage

  def move_to_new_family_page
    click_link "new"
    FamilyNewPage.new(@world, response)
  end

  def move_to_family_page(family_name)
    click_link family_name
    FamilyPage.new(@world, response)
  end
end
