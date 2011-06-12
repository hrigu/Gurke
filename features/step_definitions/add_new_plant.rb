
Given /^the family "([^"]*)" exisits$/ do |family_name|
  family = move_to_family_page(family_name)
end

When /^I create a plant "([^"]*)" with family "([^"]*)"$/ do |plant_name, family_name|
  @response = create_new_plant(plant_name, family_name)
end

Then /^the newly created plant "([^"]*)" is available for use$/ do |plant_name|
   page_should_contain([plant_name])
end

Then /^belongs to the family "([^"]*)"$/ do |family|
   page_should_contain([family])
end
