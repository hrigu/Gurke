
  include PlantsHelper

When /^I ask for the harvest time of a "([^"]*)" planted in "([^"]*)"$/ do |plant, seed_time|
  ruebli
  buschbohne
  @plant = plant
  @seed_time_month =seed_time.split(/\s+/).last
  @seed_time_days = seed_time.split(/\s+/).first
  show_plant_details(plant)
end

When /^the "([^"]*)" has an average maturity time of "([^"]*)"$/ do |plant, maturity_time_in_month|
  show_plant_details(@plant)
  page.should have_content maturity_time_in_month
end

When /^a variation of "([^"]*)"/ do |variation|
  show_plant_details(@plant)
  page.should have_content variation
end

Then /^the estimated harvest time is "([^"]*)"$/ do |harvest_time|
  show_plant_details @plant
  select @seed_time_days
  select @seed_time_month
  
  click_button "Berechnen"
  page.should have_content harvest_time
end

When /^I want to calculate the harvest time for a "([^"]*)"$/ do |plant|
  ruebli
   @plant = plant
end

Then /^only the months "([^"]*)" can be selected but not e\.g\. "([^"]*)"$/ do |included_month, excluded_month|
  show_plant_details @plant
  included_month.split(/\s+/).each do |incl|
    page.should have_content incl
  end
  excluded_month.split(/\s+/).each do |excl|
    page.should have_no_content excl
  end
end

Then /^the selected seed time stays at "([^"]*)"$/ do |seed_time|
  expected_seed_day = seed_time.split(/\s+/).first
  expected_seed_month = seed_time.split(/\s+/).last

  actual_seed_day = find('#harvest_time_calculation_seed_day option[selected]').text
  actual_seed_day.should == (expected_seed_day)

  actual_seed_month = find('#harvest_time_calculation_seed_month option[selected]').text
  actual_seed_month.should == (expected_seed_month)


end

