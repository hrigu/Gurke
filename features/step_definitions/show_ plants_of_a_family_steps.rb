def scan_to_a s
  res = []
  res = s.scan(/\w+/)
  res
end

Given /^a "([^"]*)" with the "([^"]*)"$/ do |family_name, plant_names|
  family = Factory.create(:family, name: family_name)
  (scan_to_a(plant_names)).each do |plant_name|
    Factory.create(:plant, name: plant_name, family: family)
  end
end


Then /^the listed plants are "([^"]*)"$/ do |plant_names|
  page_should_contain scan_to_a plant_names
end
