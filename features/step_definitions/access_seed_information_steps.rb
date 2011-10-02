

Then /^the details page shows "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" and average "([^"]*)"$/ do |plant_name, family_name, seed_from ,seed_to, maturation_time, variation |
  page_should_contain [plant_name, family_name, seed_from, seed_to, maturation_time, variation]
end
