Given /^I am a new gardener with name "([^"]*)", password "([^"]*)", and email "([^"]*)"$/ do |name, pwd, email|
  @name, @pwd, @email = name, pwd, email
end


When /^I sign up$/ do
  @response = signup(@name, @pwd, @email)
end

Then /^I have an account on gurke$/ do
  @response.should have_selector("div[id=\"logged_in_as_#{@name}\"]")
  @response.should have_selector('div[id="flash_notice"]')
end


Given /^an exiting gardener with name "([^"]*)", password "([^"]*)", and email "([^"]*)"$/ do |name, pwd, email|
  @account = Factory.create(:account, :username => name, :password => pwd, :email => email)
end

When /^fritz logs in with his password$/ do
  login(@account.username, @account.password)
end

When /^fritz logs in with his email$/ do
  login(@account.email, @account.password)
end


Then /^he is logged in$/ do
  response.should have_selector("div[id=\"logged_in_as_#{@account.username}\"]")
end

When /^fritz tries to log in with password "([^"]*)"$/ do |pwd|
  login(@account.username, pwd)
end

Then /^he isn't' logged in$/ do
  response.should have_selector("div[id=\"not_logged_in\"]")
end


