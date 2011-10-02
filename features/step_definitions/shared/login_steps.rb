#Given the gardener "fritz" is logged in
Given /^the gardener "([^"]*)" is logged in$/ do |name|
  @account = Factory.create(:account, :username => name, :password => "gruen")
  login(@account.username, @account.password)
  page.should have_selector("div[id=\"logged_in_as_#{@account.username}\"]")
end

Given /^I am logged in as admin user$/ do
  @account = Factory.create(:account, username: "admin", password: "secret", admin: true)
  login(@account.username, @account.password)
  page.should have_selector("div[id=\"logged_in_as_#{@account.username}\"]")
end
