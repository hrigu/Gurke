def scan_to_a s
  res = []
  res = s.scan(/\w+/)
  res
end

#see the login step in login_steps.rb

Given /^A bed with name "([^"]*)" and field "([^"]*)"$/ do |name, field|
  @name = name
  create_new_bed(@garden.name, name, field)
end


When /^I ask Gurke for a plant to seed there$/ do
  edit_bed_details(@garden.name, @name)
end

Then /^Gurke suggests plants "([^"]*)"$/ do |expected_plant_names|
  page_should_contain(scan_to_a(expected_plant_names))
end
