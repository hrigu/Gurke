
#precondition: @account is set
Given /^his garden "([^"]*)"$/ do |garden_name|
   @garden = Factory.create(:garden, :name => garden_name, :account => @account)
end
