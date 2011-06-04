#Given the gardener "fritz" is logged in
Given /^the gardener "([^"]*)" is logged in$/ do |name|
  account = Factory.create(:account, :username => name, :password => "gruen")
  login(account.username, account.password)
  response.should have_selector("div[id=\"logged_in_as_#{account.username}\"]")
end
