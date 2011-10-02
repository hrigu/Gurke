Given /^I am logged in as user$/ do
  # ignored
end

When /^I open the homepage$/ do
  @gurke = gurke_mock
  @gurke.visit_site
end

Then /^I see a link to the "([^"]*)" that goes to "([^"]*)"$/  do |link_name, link_target|
  page_should_contain link_name
  #directly access to the page method. page is a method from capybara which is included to the "world"
  page.should have_selector("a[href*=\"#{link_target}\"]")
end
