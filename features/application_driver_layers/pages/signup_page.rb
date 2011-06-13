require File.dirname(__FILE__)+ "/base_page"

class SignupPage < BasePage

  def signup(name, email, pwd)
    fill_in "account_username", :with => name
    fill_in "account_email", :with => email
    fill_in "account_password", :with => pwd
    fill_in "account_password_confirmation", :with => pwd
    click_button "account_submit"
    next_page(:HomePage)
  end

end
