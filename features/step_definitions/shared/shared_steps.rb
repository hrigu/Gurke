#precondition: @account is set
Given /^his garden "([^"]*)"$/ do |garden_name|
  @garden = Factory.create(:garden, :name => garden_name, :account => @account)
end

Given /^the plant with name "([^"]*)" and family "([^"]*)"$/ do |original_name, family_name|
  family = Factory.create(:family, name: family_name)
  plant = Factory.create(:plant, name: original_name, family: family)
  @original_plant_name = original_name
  move_to_plant_page original_name
  page_should_contain original_name
end

Given /^the plant with name "([^"]*)" and family with name "([^"]*)" and energy_need "([^"]*)"$/ do |plant_name, family_name, energy_need|
  family = Factory.create(:family, name: family_name, energy: energy_need)
  Factory.create(:plant, name: plant_name, family: family)
end

When(/^I go to the "(.*)" page for "(.*)"$/) do |page_name, object|
  case page_name
    when "plant"
      move_to_plant_page object
    when "family"
      move_to_family_page object
    else
      puts "page name #{page_name} not known"
  end
end
