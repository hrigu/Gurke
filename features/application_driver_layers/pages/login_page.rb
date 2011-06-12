require File.dirname(__FILE__)+ "/base_page"

class LoginPage < BasePage

  def login(last_page, user_name_or_pwd, pwd)
    visit login_path
    fill_in "login", :with => user_name_or_pwd
    fill_in "password", :with => pwd
    click_button "Log in"
    last_page.content = response
    last_page
  end

  def move_to_signup_page
    click_link "Sign up!"
    SignupPage.new(@world, response)
  end

end
