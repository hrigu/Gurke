def scan_to_a s
  res = []
  res = s.scan(/\w+/)
  res
end

#see the login step in login_steps.rb

Given /^A bed with name "([^"]*)" and field "([^"]*)"$/ do |name, field|
  @bed = Factory.create(:bed, name: name, field_state: field, garden: @garden)
end

And /^The given "([^"]*)"$/ do |plant_names|
  family = Factory.create(:family, field_state: @bed.field_state)
  (scan_to_a plant_names).each do |plant_name|
    Factory.create(:plant, name: plant_name, family: family)
  end
end

When /^I ask Gurke for a plant to seed there$/ do
  move_to_add_plants_page(@garden.name, @bed.name)
end

Then /^Gurke suggests plants "([^"]*)"$/ do |expected_plant_names|
  page_should_contain(scan_to_a(expected_plant_names))
end
