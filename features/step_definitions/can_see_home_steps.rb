Given /^a browser$/ do
  #nothing to do
end


When /^I visit gurke$/ do
  #gurke_mock is a method in the  capybara_driver.
  @gurke = gurke_mock
  @gurke.visit_site
end

Then /^I see the home page$/ do
  page_should_contain "Gurke Home"
end
