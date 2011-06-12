When /^I create a "([^"]*)" "([^"]*)"$/ do |energy, family|
  @energy = energy
  create_new_family(family, energy)
end


When /^I create a a family "([^"]*)" that is "([^"]*)" and of type "([^"]*)"$/ do |family_name, energy_name, type_name|
  @family_name, @energy_name, @type_name = family_name, energy_name, type_name
  create_new_family(@family_name, @energy_name, @type_name)
end

Then /^the newly created family should be created$/ do
  page_should_contain([@family_name, @energy_name, @type_name])
end


Given /^a family called "([^"]*)"$/ do |old_family_name|
  @old_family_name = old_family_name
  Factory.create(:family, :name => old_family_name)

  move_to_family_page(old_family_name)
  page_should_contain(["admin", old_family_name])
end

When /^I change the name to "([^"]*)"$/ do |new_family_name|
  @new_family_name = new_family_name
  rename_family new_family_name
end

Then /^the family exists with the new name$/ do
  page_should_contain(["admin", @new_family_name])
end
