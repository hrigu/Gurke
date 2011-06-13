require File.dirname(__FILE__)+ "/base_page"

class LoginPage < BasePage

  def login(user_name_or_email, pwd)
    visit login_path
    fill_in "login", :with => user_name_or_email
    fill_in "password", :with => pwd
    click_button "Log in"
    next_page_symbol = @app.last_page ? @app.last_page.class.name.to_s : :HomePage
    next_page(next_page_symbol)
  end

  def move_to_signup_page
    click_link "Sign up!"
    next_page(:SignupPage)
  end

end
