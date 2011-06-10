module WebratDriver
  include ApplicationHelper

  
  def create_new_family(family, energy)
    visit new_family_path
    fill_in "Name", :with => family
    fill_in "Energy", :with => energy
    click_button "Create Family"
  end

  def signup(name, pwd, email)
    visit signup_path
    fill_in "account_username", :with => name
    fill_in "account_email", :with => email
    fill_in "account_password", :with => pwd
    fill_in "account_password_confirmation", :with => pwd
    click_button "account_submit"
    response
  end

  def login(user_name_or_pwd, pwd)
    visit login_path
    fill_in "login", :with => user_name_or_pwd
    fill_in "password", :with => pwd
    click_button "Log in"
    response
  end
  def find_family(family_name)
    visit families_path
    response
  end
  def create_new_plant(plant_name, family_name)
    visit new_plant_path
    fill_in "Name", :with => plant_name
    fill_in "plant_seed_from_month", :with => "4"
    fill_in "plant_seed_to_month", :with  => "7"
    select family_name, :from => "plant[family_id]"
    click_button "Create Plant"
  end

  def find_plant(name)
    visit plants_path
    response
  end


  def rename_plant(original_name, new_name)
    show_plant_details(original_name)
    click_edit  original_name
    fill_in "Name", :with => new_name
    click_button
  end

  def rename_family(original_name, new_name)
    visit families_path
    click_edit  original_name
    fill_in "Name", :with => new_name
    click_button
  end

  def show_family_details(the_name)
    visit families_path
    click_show the_name
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
