module WebratDriver
  include ApplicationHelper

  
  def create_new_family(family_name, energy_name, type_name)
    families_page = @current_page.move_to_families_page
    new_family_page = families_page.move_to_new_family_page
    @current_page = new_family_page.create_new(family_name, energy_name, type_name)
  end

  def page_should_contain(text_array)
    content = @current_page.content
    text_array.each do |text|
      content.should contain text
    end
  end

  def signup(name, pwd, email)
    home_page = HomePage.new(self).visit_me
    login_page = home_page.move_to_login_page
    signup_page = login_page.move_to_signup_page
    home_page = signup_page.signup(name, email, pwd)
    home_page.content
  end

  def login(user_name_or_pwd, pwd)
    home = visit_the_site
    login = home.move_to_login_page
    home = login.login(home, user_name_or_pwd, pwd)
    @current_page = home
  end

  def visit_the_site
    HomePage.new(self).visit_me
  end

  #precondition:logged_in
  def move_to_family_page(family_name)
    families_page = @current_page.move_to_families_page
    family_page = families_page.move_to_family_page(family_name)
    family_page.content.should contain(family_name)
    @current_page = family_page
    @current_page.content

  end

  def create_new_plant(plant_name, family_name)
    plants_page = @current_page.move_to_plants_page
    plants_new_page = plants_page.move_to_new_plant_page
    plant_page = plants_new_page.create_new(plant_name, family_name)
    @current_page = plant_page
    @current_page.content
  end

  def move_to_plant_page(name)
    @current_page ||= visit_the_site
    plants_page = @current_page.move_to_plants_page
    plant_page = plants_page.move_to_plant_page(name)
    @current_page = plant_page
    @current_page.content

  end


  def rename_plant(new_name)
    plant_edit_page = @current_page.move_to_edit_page
    plant_page = plant_edit_page.edit_name(new_name)
    @current_page = plant_page
    @current_page.content
  end

  def rename_family(new_name)
    family_edit_page = @current_page.move_to_edit_page
    family_page = family_edit_page.edit_name(new_name)
    @current_page = family_page
    @current_page.content
  end

  def show_family_details(the_name)
    visit families_path
    click_link the_name
  end

  def show_plant_details(the_name)
    visit plants_path
    click the_name
  end

  def assign_to_other_family(plant_name, new_family_name)
    show_plant_details(plant_name)
    click_edit  plant_name
    select new_family_name
    click_button
  end

  def create_new_bed(garden_name, bed_name, field_state)
    visit gardens_path
    click_link garden_name
    click_link "Neues Beet"
    fill_in "bed_name", :with => bed_name
    select field_state, :from => "bed[field_state]"
    click_button "bed_submit"
  end

  def find_bed(bed_name)
    visit new_bed_path
    fill_in "bed_name", :with => bed_name

    select bed_field_state, :from => "bed[field_state]"
    click_button "bed_submit"
  end

  def show_bed_details(garden_name, bed_name)
    visit gardens_path
    click_link garden_name
    click bed_name
  end

  def edit_bed_details(garden_name, bed_name)
    visit gardens_path
    click_link garden_name
    click bed_name
    click_link "Edit"
  end


  def add_plants_to_bed(garden_name, bed_name, plant_names)
    plant_names.each do |plant_name|
      show_bed_details(garden_name, bed_name)
      click_link "Edit"
      select plant_name
      click_button "bed_submit"
      response.should contain plant_name
    end

  end

  private

  #go to edit page
  def click_edit(the_name)
    response.should contain the_name
    click_link_within "div[id*=\""+to_html_tag(the_name)+"\"]", "Edit"
  end

  def click_show(the_name)
    click_link_within "div[id*=\""+to_html_tag(the_name)+"\"]", "Show"
  end

  def click(the_name)
    click_link_within "div[id*=\""+to_html_tag(the_name)+"\"]", the_name
  end




end
