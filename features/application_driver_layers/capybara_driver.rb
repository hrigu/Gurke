module CapybaraDriver
  include ApplicationHelper


  def page_should_contain text
    if text.instance_of? Array then
      text.each do |t|
        #page is a capybara method. The content of the current page Capybara::Session
        page.should have_content t
      end
    else
      page.should have_content text
    end
  end


  def page_should_not_contain(text_array)
    text_array.each do |text|
      page.should have_no_content text
    end
  end

  def create_new_family(family_name, energy_name, type_name)
    families_page = gurke_mock.current_page.move_to_families_page
    new_family_page = families_page.move_to_new_page
    new_family_page.create_new(family_name, energy_name, type_name)
  end

  def signup(name, pwd, email)
    home_page = gurke_mock.visit_site
    login_page = home_page.move_to_login_page
    signup_page = login_page.move_to_signup_page
    home_page = signup_page.signup(name, email, pwd)
  end

  def login(user_name_or_pwd, pwd)
    home = gurke_mock.visit_site
    login = home.move_to_login_page
    home = login.login(user_name_or_pwd, pwd)
  end


  #precondition:logged_in
  def move_to_family_page(family_name)
    families_page = gurke_mock.current_page.move_to_families_page
    family_page = families_page.move_to_detail_page(family_name)
    page.should have_content(family_name)
  end

  def create_new_plant(plant_name, family_name)
    plants_page = gurke_mock.current_page.move_to_plants_page
    plants_new_page = plants_page.move_to_new_page
    plants_new_page.create_new(plant_name, family_name)
  end

  def move_to_plant_page(name)
    gurke_mock.visit_site
    plants_page = gurke_mock.current_page.move_to_plants_page
    plants_page.move_to_detail_page(name)
  end


  def rename_plant(new_name)
    plant_edit_page = gurke_mock.current_page.move_to_edit_page
    plant_page = plant_edit_page.edit_name(new_name)
    page
  end

  def rename_family(new_name)
    family_edit_page = gurke_mock.current_page.move_to_edit_page
    family_edit_page.edit_name(new_name)
  end

  def show_plant_details(the_name)
    gurke_mock.current_page.move_to_plants_page.move_to_detail_page(the_name)
  end

  def assign_to_other_family(plant_name, new_family_name)
    plant_edit_page = gurke_mock.current_page.move_to_edit_page
    plant_edit_page.change_family(new_family_name)
  end

  def create_new_bed(garden_name, bed_name, field_state)
    gardens_page = gurke_mock.current_page.move_to_gardens_page
    garden_page = gardens_page.move_to_detail_page(garden_name)
    bed_new_page = garden_page.move_to_new_page
    garden_page = bed_new_page.create_new(bed_name, field_state)
  end

  def show_bed_details(garden_name, bed_name)
    gardens_page = gurke_mock.current_page.move_to_gardens_page
    garden_page = gardens_page.move_to_detail_page(garden_name)
    garden_page.move_to_detail_page bed_name
  end

  def move_to_add_plants_page(garden_name, bed_name)
    bed_page = show_bed_details(garden_name, bed_name)
    bed_page.move_to_add_plants_page
  end


  def add_plants_to_bed(garden_name, bed_name, plant_names)
    gardens_page = gurke_mock.current_page.move_to_gardens_page
    garden_page = gardens_page.move_to_detail_page(garden_name)
    bed_page = garden_page.move_to_detail_page(bed_name)
    bed_add_plant_page = bed_page.move_to_add_plants_page
    plant_names.each do |plant_name|
      bed_add_plant_page = bed_add_plant_page.add_plant(plant_name)
    end
    bed_page = bed_add_plant_page.move_to_bed_page
    plant_names.each do |plant_name|
      page.should have_content plant_name
    end
  end

  private

  #go to edit page
  def click_edit(the_name)
    page.should have_content the_name
    click_link_within "div[id*=\""+to_html_tag(the_name)+"\"]", "Edit"
  end

  def click_show(the_name)
    click_link_within "div[id*=\""+to_html_tag(the_name)+"\"]", "Show"
  end

  def click(the_name)
    click_link_within "div[id*=\""+to_html_tag(the_name)+"\"]", the_name
  end

  def gurke_mock
    if @gurke_mock.nil?
      @gurke_mock = App.new(self)
      @gurke_mock.visit_site
    end
    @gurke_mock
  end

end
