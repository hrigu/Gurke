
def scan_to_a s
  res = []
  res = s.scan(/\w+/)
  res
end

Then /^The plant name is "([^"]*)"$/ do |plant_name|
  text = page.should have_css( "#plant_#{to_html_tag plant_name}" )
  puts text
  page.should have_content plant_name
end

Then /^The family name is "([^"]*)"$/ do |family_name|
  page.should have_content family_name
end

Then /^the energy need is "([^"]*)"$/ do |energy|
  page.should have_content energy
end