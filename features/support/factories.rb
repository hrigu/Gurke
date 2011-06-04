Factory.define :account do |f|
  puts "class is #{f.class}"
  f.username "fritz"
  f.password "secret"
  f.password_confirmation { |u| u.password }
  f.email "foo@example.com"
end
