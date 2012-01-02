# encoding: utf-8
require "#{File.dirname(__FILE__)}/plants_reader"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name:  'Chicago' }, { name:  'Copenhagen' }])
#   Mayor.create(name:  'Daley', :city => cities.first)


#admin = Account.create(username: "admin", email: "admin@gurke.ch", password: "secret", password_confirmation: "secret", admin: true)
#puts "admin done"


pr = PlantsReader.new
pr.read_from_file
pr.families.each do |family|
  begin
    success = Family.create!(name: family[:name], energy: family[:energy], field_state: FieldState.find(family[:field_state]).id)
  rescue Exception=>e
    puts "didn't worked'"
  end
end

pr.plants.each do |entry|
  begin
    success =  Plant.create!(name: entry[:name], family: Family.find_by_name(entry[:family]), seed_from_month: entry[:seed_from_month], seed_from_day: entry[:seed_from_day], seed_to_month: entry[:seed_to_month], seed_to_day: entry[:seed_to_day])
  rescue Exception => e
    puts "didn't worked'"
  end
end





