Factory.define :account do |f|
  f.username "fritz"
  f.password "secret"
  f.password_confirmation { |u| u.password }
  f.email "foo@example.com"
end

Factory.define :garden do |f|
  f.name "Rosengarten"
  f.place "Kuhweide"
  f.account @account
end

Factory.define :bed do |f|
  f.name "Sonnenplätzli"
  f.garden @garden
end
