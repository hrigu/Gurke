Given /^the plant "([^"]*)" is already known$/ do |original_name|
  @original_plant_name = original_name
  move_to_plant_page original_name
  page_should_contain [original_name]
end

When /^I rename the plant to "([^"]*)"$/ do |new_name|
  @new_name = new_name
  rename_plant(@new_name)
end

Then /^the plant is available under the new name$/ do
  page_should_contain([@new_name])
  move_to_plant_page(@new_name)
  page_should_contain([@new_name])
end

When /^I change the family from "([^"]*)" to "([^"]*)"$/ do |original_family_name, new_family_name|
  @original_family_name = original_family_name
  @new_family_name = new_family_name
  assign_to_other_family(@original_plant_name, @new_family_name)
end

Then /^the family of the plant is changed$/ do
  page_should_contain([@new_family_name])
end

Then /^the family contains the newly changed plant$/ do
  move_to_family_page(@new_family_name)
  page_should_contain([@original_plant_name])
end

Then /^the old family does not contains the newly changed plant anymore$/ do
  move_to_family_page(@original_family_name)
  page_should_not_contain([@original_plant_name])
#  puts gurke_mock.visited_pages.inspect
end

